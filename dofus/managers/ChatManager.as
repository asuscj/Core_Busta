#initclip 66
var _loc1 = dofus["\x0b\b"].ChatManager.prototype;
_global.dofus["\x0b\b"].ChatManager.TYPE_ABO = 10;
_global.dofus["\x0b\b"].ChatManager.TYPE_ALL = 11;
_global.dofus["\x0b\b"].ChatManager.TYPE_UNKNOWN = 12;
_loc1._aVisibleTypes = [true,true,true,true,true,true,true,true,true,true,true,true,true];
_loc1.addToBlacklist = function(sName, nClass)
{
   if(sName != this.api.datacenter.Player.Name && !this.isBlacklisted(sName))
   {
      this._aBlacklist.push({sName:sName,nClass:nClass});
      this.api.network.send("BYO+" + sName);
   }
};
_loc1.removeToBlacklist = function(sName)
{
   for(_loc3_ in this._aBlacklist)
   {
      if(sName == this._aBlacklist[_loc3_].sName || sName == "*" + this._aBlacklist[_loc3_].sName)
      {
         this._aBlacklist[_loc3_] = undefined;
         this.api.ui.getUIComponent("Friends").updateIgnoreList();
         this.api.kernel.showMessage(undefined,this.api.lang.getText("TEMPORARY_NOMORE_BLACKLISTED",[sName]),"INFO_CHAT");
         this.api.network.send("BYO-" + sName);
         return undefined;
      }
   }
};
_loc1.__get__visibleTypes = function()
{
   return this._aVisibleTypes;
};
_loc1.setTypeVisible = function(nType, bVisible)
{
   if(nType == dofus["\x0b\b"].ChatManager.TYPE_ABO)
   {
      bVisible = true;
   }
   this._aVisibleTypes[nType] = bVisible;
   this.api.electron.retroChatRefresh(this._aVisibleTypes);
   this.refresh(true);
};
_loc1.updateRigth = function()
{
   if(this.api.datacenter.Player.isAuthorized && !this.api.datacenter.Basics.aks_current_server.isTestServer())
   {
      dofus["\x0b\b"].ChatManager.MAX_VISIBLE *= dofus["\x0b\b"].ChatManager.ADMIN_BUFFER_MULTIPLICATOR;
      dofus["\x0b\b"].ChatManager.MAX_ALL_LENGTH *= dofus["\x0b\b"].ChatManager.ADMIN_BUFFER_MULTIPLICATOR;
      dofus["\x0b\b"].ChatManager.MAX_ITEM_BUFFER_LENGTH *= dofus["\x0b\b"].ChatManager.ADMIN_BUFFER_MULTIPLICATOR;
   }
};
_loc1.initialize = function(_loc3_)
{
   super.initialize(_loc3_);
   this._feMessagesBuffer = new dofus.datacenter.FightEventsMessagesBuffer(_loc3_);
   this._aItemsBuffer = new Array();
   this._aRawMessages = new Array();
   this._nItemsBufferIDs = 0;
   this._aBlacklist = new Array();
   this.updateRigth();
   this.clear();
   this.api.electron.retroChatRefresh(this._aVisibleTypes,this.api.kernel.OptionsManager.getOption("TimestampInChat"));
};
_loc1.parseInlineItems = function(sMessage, aItems)
{
   var _loc2_ = -2;
   var _loc5_;
   var _loc10_;
   var _loc13_;
   var _loc11_;
   var _loc9_;
   var _loc3_;
   var _loc8_;
   var _loc4_;
   var _loc6_;
   while(true)
   {
      _loc2_ += 2;
      if(_loc2_ >= aItems.length)
      {
         break;
      }
      _loc5_ = aItems[_loc2_].split(";");
      _loc10_ = Number(_loc5_[0]);
      _loc13_ = Number(_loc5_[1]);
      _loc11_ = aItems[_loc2_ + 1];
      _loc9_ = new dofus.datacenter["\f\f"](_loc13_,_loc10_,1,1,_loc11_,-1);
      _loc3_ = "°" + _loc2_ / 2;
      _loc8_ = this.getLinkItem(_loc9_);
      _loc4_ = sMessage.indexOf(_loc3_);
      if(_loc4_ != -1)
      {
         _loc6_ = sMessage.split("");
         _loc6_.splice(_loc4_,_loc3_.length,_loc8_);
         sMessage = _loc6_.join("");
      }
   }
   return sMessage;
};
_loc1.refresh = function(bForceRefresh)
{
   var _loc7_ = this._aMessages.length;
   var _loc3_ = new String();
   var _loc6_ = 0;
   if(_loc7_ == 0 && !bForceRefresh)
   {
      return undefined;
   }
   var _loc4_ = _loc7_;
   var _loc2_;
   var _loc5_;
   while(true)
   {
      _loc4_ -= 1;
      if(!(_loc6_ < dofus["\x0b\b"].ChatManager.MAX_VISIBLE && _loc4_ >= 0))
      {
         break;
      }
      _loc2_ = this._aMessages[_loc4_];
      if(this._aVisibleTypes[_loc2_.type] == true)
      {
         _loc6_ += 1;
         if(!_loc2_.htmlSyntaxChecked)
         {
            _loc5_ = dofus["\x0b\b"].ChatManager.safeHtml(_loc2_.text);
            _loc2_.lf = !_loc5_.v || _loc2_.lf;
            _loc2_.text = _loc5_.t;
            _loc2_.htmlSyntaxChecked = true;
         }
         if(this.api.kernel.OptionsManager.getOption("TimestampInChat"))
         {
            _loc3_ = (_loc2_.lf ? "<br/>" : "") + _loc2_.textStyleLeft + _loc2_.timestamp + _loc2_.text + _loc2_.textStyleRight + _loc3_;
         }
         else
         {
            _loc3_ = (_loc2_.lf ? "<br/>" : "") + _loc2_.textStyleLeft + _loc2_.text + _loc2_.textStyleRight + _loc3_;
         }
      }
   }
   this.api.ui.getUIComponent("Banner").setChatText(_loc3_);
};
_global.dofus["\x0b\b"].ChatManager.safeHtml = function(s)
{
   var _loc16_ = true;
   var _loc17_ = new Array();
   var _loc10_ = new Array();
   var _loc1_ = s;
   var _loc9_ = 0;
   var _loc7_ = 0;
   var _loc13_ = "";
   var _loc4_;
   var _loc6_;
   var _loc2_;
   var _loc5_;
   var _loc8_;
   var _loc3_;
   while(_loc1_.indexOf("<") > -1)
   {
      _loc4_ = _loc1_.indexOf("<");
      if(_loc1_.indexOf(">",_loc4_) == -1)
      {
         _loc1_ = _loc1_.split("<").join("&lt;").split(">").join("&gt;");
         break;
      }
      _loc6_ = _loc1_.indexOf(">",_loc4_) + 1;
      _loc2_ = _loc1_.substring(_loc4_,_loc6_);
      _loc5_ = _loc2_.indexOf("/") == 1;
      _loc8_ = _loc2_.indexOf("/") == _loc2_.length - 2;
      _loc3_ = _loc5_ ? _loc2_.substring(2,_loc2_.length - 1) : _loc2_.substring(1,_loc2_.length - 1);
      _loc3_ = _loc3_.substring(0,_loc3_.indexOf(" ") > -1 ? _loc3_.indexOf(" ") : _loc3_.length);
      _loc7_;
      _loc10_[_loc7_++] = {c:_loc5_,b:_loc3_};
      if(_loc8_)
      {
         _loc7_;
         _loc10_[_loc7_++] = {c:!_loc5_,b:_loc3_};
      }
      _loc13_ += _loc1_.substring(0,_loc6_);
      _loc1_ = _loc1_.substring(_loc6_);
      _loc9_ += 1;
   }
   _loc13_ += _loc1_;
   return {v:true,t:_loc13_};
};
_loc1.addText = function(sText, sColor, bSound, sUniqId)
{
   if(bSound == undefined)
   {
      bSound = true;
   }
   var _loc7_ = "";
   var _loc4_ = false;
   var _loc2_;
   var _loc3_;
   switch(sColor)
   {
      case dofus.Constants.MSG_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_MESSAGES;
         _loc4_ = true;
         _loc3_ = true;
         break;
      case dofus.Constants.EMOTE_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_MESSAGES;
         _loc4_ = true;
         _loc3_ = true;
         break;
      case dofus.Constants.GAME_HUNT_CHAT:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_ERRORS;
         this.api.electron.makeNotification(_loc2_);
         if(_loc5_ == "START_CONFIRMATION" && _loc4_)
         {
            this.api.sounds.events.onStartHunt();
         }
         break;
      case dofus.Constants.THINK_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_MESSAGES;
         _loc4_ = true;
         _loc3_ = true;
         break;
      case dofus.Constants.KOLISEO_CHAT_COLOR:
      case dofus.Constants.GROUP_CHAT_COLOR:
      case dofus.Constants.MSGCHUCHOTE_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_WISP;
         _loc4_ = true;
         _loc3_ = true;
         if(bSound)
         {
            this.api.sounds.events.onChatWisper();
         }
         break;
      case dofus.Constants.ABO_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_ABO;
         _loc4_ = true;
         _loc3_ = true;
         break;
      case dofus.Constants.INFO_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_INFOS;
         this._nMessageCounterInfo++;
         _loc3_ = false;
         break;
      case dofus.Constants.ERROR_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_ERRORS;
         _loc3_ = true;
         if(bSound)
         {
            if(this._bFirstErrorCatched)
            {
               this.api.sounds.events.onError();
               break;
            }
            this._bFirstErrorCatched = true;
         }
         break;
      case dofus.Constants.GUILD_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_GUILD;
         _loc4_ = true;
         _loc3_ = true;
         if(bSound && this.api.kernel.OptionsManager.getOption("GuildMessageSound"))
         {
            this.api.sounds.events.onChatWisper();
         }
         break;
      case dofus.Constants.PVP_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_PVP;
         _loc4_ = true;
         _loc3_ = true;
         break;
      case dofus.Constants.TRADE_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_TRADE;
         _loc4_ = true;
         _loc3_ = true;
         break;
      case dofus.Constants.RECRUITMENT_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_RECRUITMENT;
         _loc4_ = true;
         _loc3_ = true;
         break;
      case dofus.Constants.MEETIC_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_MEETIC;
         _loc4_ = true;
         _loc3_ = true;
         break;
      case dofus.Constants.ADMIN_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_ADMIN;
         _loc3_ = true;
         break;
      case dofus.Constants.ALL_CHAT_COLOR:
         bSound = false;
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_ALL;
         _loc3_ = true;
         break;
      default:
         bSound = false;
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_UNKNOWN;
         _loc4_ = true;
         _loc3_ = true;
   }
   if(this._nFileOutput > 0)
   {
      this.api.electron.chatLog(_loc2_);
      if(this._nFileOutput == 2)
      {
         return undefined;
      }
   }
   if(_loc4_)
   {
      sText = this.addLinkWarning(sText);
      sText = this.applyInputCensorship(sText.substring(0,sText.length - 4)) + sText.substring(sText.length - 4);
   }
   if(_loc3_ && this.api.kernel.NightManager.time.length)
   {
      _loc7_ = "[" + this.api.kernel.NightManager.time + "] ";
   }
   this.api.electron.chatPrint(sText,sColor,sUniqId,_loc2_,_loc7_);
   if(this._nFileOutput > 0)
   {
      this.api.electron.chatLog(_loc12_);
      if(this._nFileOutput == 2)
      {
         return undefined;
      }
   }
   if(this.api.electron.isShowingWidescreenPanel && this.api.electron.getWidescreenPanelId() == dofus["\x0f\b"].WIDESCREEN_PANEL_CHAT)
   {
      return undefined;
   }
   this._aMessages.push({textStyleLeft:"<font color=\"#" + sColor + "\"><br />",text:sText,textStyleRight:"</font>",type:_loc2_,uniqId:sUniqId,timestamp:_loc7_,lf:false});
   if(this._aMessages.length > dofus["\x0b\b"].ChatManager.MAX_ALL_LENGTH)
   {
      this._aMessages.shift();
   }
   this.refresh();
};
_loc1.refresh = function(_loc2_)
{
   var _loc7_ = this._aMessages.length;
   var _loc4_ = new String();
   var _loc5_ = 0;
   if(_loc7_ == 0 && !_loc2_)
   {
      return undefined;
   }
   var _loc3_ = _loc7_ - 1;
   var _loc6_;
   while(_loc5_ < dofus["\x0b\b"].ChatManager.MAX_VISIBLE && _loc3_ >= 0)
   {
      _loc2_ = this._aMessages[_loc3_];
      if(this._aVisibleTypes[_loc2_.type] == true)
      {
         _loc5_ += 1;
         if(!_loc2_.htmlSyntaxChecked)
         {
            _loc6_ = dofus["\x0b\b"].ChatManager.safeHtml(_loc2_.text);
            _loc2_.lf = _loc2_.lf;
            _loc2_.text = _loc6_.t;
            _loc2_.htmlSyntaxChecked = true;
         }
         if(this.api.kernel.OptionsManager.getOption("TimestampInChat"))
         {
            _loc4_ = (!_loc2_.lf ? "" : "\n") + _loc2_.textStyleLeft + _loc2_.timestamp + _loc2_.text + _loc2_.textStyleRight + _loc4_;
         }
         else
         {
            _loc4_ = (!_loc2_.lf ? "" : "\n") + _loc2_.textStyleLeft + _loc2_.text + _loc2_.textStyleRight + _loc4_;
         }
      }
      _loc3_ -= 1;
   }
   this.api.ui.getUIComponent("Banner").setChatText(_loc4_);
};
_loc1.__get__feMessagesBuffer = function()
{
   return this._feMessagesBuffer;
};
_loc1.addProperty("visibleTypes",_loc1.__get__visibleTypes,function()
{
}
);
_loc1.addProperty("feMessagesBuffer",_loc1.__get__feMessagesBuffer,function()
{
}
);
#endinitclip
