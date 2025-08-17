#initclip 6
var _loc1 = dofus["\r\x14"].gapi.controls.MouseShortcuts.prototype;
_loc1.initTexts = function()
{
   this._btnTabSpells.label = this.api.lang.getText("BANNER_TAB_SPELLS");
   this._btnTabSets.label = "SET";
   this._btnTabItems.label = this.api.lang.getText("BANNER_TAB_ITEMS");
};
_loc1.addListeners = function()
{
   this._btnTabSpells.addEventListener("click",this);
   this._btnTabItems.addEventListener("click",this);
   this._btnTabSpells.addEventListener("over",this);
   this._btnTabItems.addEventListener("over",this);
   this._btnTabSpells.addEventListener("out",this);
   this._btnTabItems.addEventListener("out",this);
   this._btnTabSets.addEventListener("click",this);
   this._btnTabSets.addEventListener("over",this);
   this._btnTabSets.addEventListener("out",this);
   var _loc3_ = 1;
   var _loc2_;
   while(_loc3_ < dofus["\r\x14"].gapi.controls.MouseShortcuts.MAX_CONTAINER)
   {
      _loc2_ = this["_ctr" + _loc3_];
      _loc2_.addEventListener("click",this);
      _loc2_.addEventListener("dblClick",this);
      _loc2_.addEventListener("over",this);
      _loc2_.addEventListener("out",this);
      _loc2_.addEventListener("drag",this);
      _loc2_.addEventListener("drop",this);
      _loc2_.addEventListener("onContentLoaded",this);
      _loc2_.params = {position:_loc3_};
      _loc3_ += 1;
   }
   this._ctrCC.addEventListener("click",this);
   this._ctrCC.addEventListener("over",this);
   this._ctrCC.addEventListener("out",this);
   this.api.kernel.KeyManager.addShortcutsListener("onShortcut",this);
   this.api.datacenter.Player.Spells.addEventListener("modelChanged",this);
   this.api.datacenter.Player.Inventory.addEventListener("modelChanged",this);
   this.api.datacenter.Player.SetsRapidos.addEventListener("modelChanged",this);
};
_loc1.getCurrentTab = function()
{
   return this._sCurrentTab;
};
_loc1.updateSets = function()
{
   var _loc6_ = new Array();
   var _loc3_ = 0;
   while(_loc3_ < dofus["\r\x14"].gapi.controls.MouseShortcuts.MAX_CONTAINER)
   {
      _loc6_[_loc3_] = true;
      _loc3_ += 1;
   }
   var _loc8_ = this.api.datacenter.Player.SetsRapidos;
   var _loc4_;
   var _loc5_;
   var _loc7_;
   var _loc9_ = 0;
   while(_loc9_ < _loc8_.length)
   {
      _loc4_ = _loc8_[_loc9_];
      _loc5_ = _loc4_.ID;
      _loc7_ = this["_ctr" + _loc5_];
      _loc7_.contentData = _loc4_;
      _loc6_[_loc5_] = false;
      _loc9_++;
   }
   var _loc2_ = 0;
   while(_loc2_ < dofus["\r\x14"].gapi.controls.MouseShortcuts.MAX_CONTAINER)
   {
      if(_loc6_[_loc2_])
      {
         this["_ctr" + _loc2_].contentData = undefined;
      }
      _loc2_ += 1;
   }
};
_loc1.updateCurrentTabInformations = function()
{
   switch(this._sCurrentTab)
   {
      case "Spells":
         this.updateSpells();
         this._ctrCC._visible = !this.api.datacenter.Player.isMutant;
         break;
      case "Items":
         this.updateItems();
         this._ctrCC._visible = false;
         break;
      case "Sets":
         this.updateSets();
         this._ctrCC._visible = false;
   }
};
_loc1.click = function(oEvent)
{
   var _loc4_;
   var _loc5_;
   var _loc3_;
   switch(oEvent.target._name)
   {
      case "_btnTabSets":
         this.setCurrentTab("Sets");
         break;
      case "_btnTabSpells":
         this.api.sounds.events.onBannerSpellItemButtonClick();
         this.setCurrentTab("Spells");
         break;
      case "_btnTabItems":
         this.api.sounds.events.onBannerSpellItemButtonClick();
         this.setCurrentTab("Items");
         break;
      case "_ctrCC":
         if(this._ctrCC._visible)
         {
            if(this.api.kernel.TutorialManager.isTutorialMode)
            {
               this.api.kernel.TutorialManager.onWaitingCase({code:"CC_CONTAINER_SELECT"});
               break;
            }
            this.api.kernel.GameManager.switchToSpellLaunch(this.api.datacenter.Player.Spells[0],false);
         }
         break;
      default:
         switch(this._sCurrentTab)
         {
            case "Spells":
               this.api.sounds.events.onBannerSpellSelect();
               if(this.api.kernel.TutorialManager.isTutorialMode)
               {
                  this.api.kernel.TutorialManager.onWaitingCase({code:"SPELL_CONTAINER_SELECT",params:[Number(oEvent.target._name.substr(4))]});
                  break;
               }
               if(this.gapi.getUIComponent("Spells") != undefined)
               {
                  return undefined;
               }
               _loc4_ = oEvent.target.contentData;
               if(_loc4_ == undefined)
               {
                  return undefined;
               }
               this.api.kernel.GameManager.switchToSpellLaunch(_loc4_,true);
               break;
            case "Items":
               if(this.api.kernel.TutorialManager.isTutorialMode)
               {
                  this.api.kernel.TutorialManager.onWaitingCase({code:"OBJECT_CONTAINER_SELECT",params:[Number(oEvent.target._name.substr(4))]});
                  break;
               }
               if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY) && oEvent.target.contentData != undefined)
               {
                  this.api.kernel.GameManager.insertItemInChat(oEvent.target.contentData);
                  return undefined;
               }
               _loc5_ = this.gapi.getUIComponent("Inventory");
               if(_loc5_ != undefined)
               {
                  _loc5_.showItemInfos(oEvent.target.contentData);
                  break;
               }
               _loc3_ = oEvent.target.contentData;
               if(_loc3_ == undefined)
               {
                  return undefined;
               }
               if(this.api.datacenter.Player.canUseObject)
               {
                  if(_loc3_.canTarget)
                  {
                     this.api.kernel.GameManager.switchToItemTarget(_loc3_);
                     break;
                  }
                  if(_loc3_.canUse && oEvent.keyBoard)
                  {
                     this.api.network.Items.use(_loc3_.ID);
                  }
               }
               break;
         }
   }
};
_loc1.dblClick = function(oEvent)
{
   var _loc0_;
   var _loc4_;
   var _loc21_;
   var _loc3_;
   var _loc11_;
   var _loc9_;
   var _loc7_;
   var _loc8_;
   var _loc10_;
   var _loc6_;
   switch(this._sCurrentTab)
   {
      case "Spells":
         if((_loc0_ = oEvent.target._name) !== "_ctrCC")
         {
            _loc4_ = oEvent.target.contentData;
         }
         else
         {
            _loc4_ = this.api.datacenter.Player.Spells[0];
         }
         if(_loc4_ == undefined)
         {
            return undefined;
         }
         if(Key.isDown(16))
         {
            _loc21_ = oEvent.target.params.position;
            this.api.network.send("SN" + _loc4_.ID + "|" + 0,false);
            this.addToQueue({object:this,method:this.setSpellStateOnAllContainers});
            return undefined;
         }
         this.gapi.loadUIAutoHideComponent("SpellInfos","SpellInfos",{spell:_loc4_},{bStayIfPresent:true});
         break;
      case "Items":
         _loc3_ = oEvent.target.contentData;
         if(_loc3_ != undefined)
         {
            if(!_loc3_.canUse || !this.api.datacenter.Player.canUseObject)
            {
               return undefined;
            }
            if(Key.isDown(17))
            {
               _loc4_ = this.api.ui;
               _loc11_ = "POPUP_QUANTITY_BATCH_USE_ITEM_DESCRIPTION";
               _loc9_ = _loc3_.name;
               _loc7_ = [function(_loc2_, _loc3, _loc4_)
               {
                  return String(_loc4_);
               },_loc9_];
               _loc8_ = _loc3_.Quantity;
               _loc10_ = _loc4_.loadUIComponent("PopupQuantityWithDescription","PopupQuantityWithDescription",{descriptionLangKey:_loc11_,descriptionLangKeyParams:_loc7_,value:1,max:_loc8_,params:{type:"batchUseItem",item:_loc3_}},{bForceLoad:true});
               _loc6_ = new Object();
               _loc6_.validate = function(var2)
               {
                  var _loc2_ = var2.params.item.ID;
                  _global.API.network.send("OT" + _loc2_ + "|" + var2.value);
               };
               _loc10_.addEventListener("validate",_loc6_);
            }
            else
            {
               this.api.network.Items.use(_loc3_.ID);
            }
         }
         break;
      case "Sets":
         _loc3_ = oEvent.target.contentData;
         if(_loc3_ != undefined)
         {
            this.api.network.send("ZSU" + _loc3_.ID);
            break;
         }
   }
};
_loc1.over = function(oEvent)
{
   if(!this.gapi.isCursorHidden())
   {
      return undefined;
   }
   var _loc0_;
   var _loc6_;
   var _loc3_;
   var _loc4_;
   var _loc7_;
   var _loc8_;
   if((_loc0_ = oEvent.target._name) !== "_ctrCC")
   {
      switch(this._sCurrentTab)
      {
         case "Spells":
            _loc6_ = oEvent.target.contentData;
            if(_loc6_ != undefined)
            {
               this.gapi.showTooltip(_loc6_.name + " (" + _loc6_.apCost + " " + this.api.lang.getText("AP") + (_loc6_.actualCriticalHit <= 0 ? "" : ", " + this.api.lang.getText("ACTUAL_CRITICAL_CHANCE") + ": 1/" + _loc6_.actualCriticalHit) + ")",oEvent.target,-20,{bXLimit:true,bYLimit:false});
            }
            break;
         case "Items":
            _loc3_ = oEvent.target.contentData;
            if(_loc3_ != undefined)
            {
               _loc4_ = _loc3_.name;
               if(this.gapi.getUIComponent("Inventory") == undefined)
               {
                  if(_loc3_.canUse && _loc3_.canTarget)
                  {
                     _loc4_ += "\n" + this.api.lang.getText("HELP_SHORTCUT_DBLCLICK_CLICK");
                  }
                  else
                  {
                     if(_loc3_.canUse)
                     {
                        _loc4_ += "\n" + this.api.lang.getText("HELP_SHORTCUT_DBLCLICK");
                     }
                     if(_loc3_.canTarget)
                     {
                        _loc4_ += "\n" + this.api.lang.getText("HELP_SHORTCUT_CLICK");
                     }
                  }
               }
               this.gapi.showTooltip(_loc4_,oEvent.target,-30,{bXLimit:true,bYLimit:false});
            }
            break;
         case "Sets":
            _loc3_ = oEvent.target.contentData;
            if(_loc3_ != undefined)
            {
               this.gapi.showTooltip(_loc3_.name,oEvent.target,-30,{bXLimit:true,bYLimit:false});
               break;
            }
      }
   }
   else
   {
      _loc7_ = this.api.datacenter.Player.Spells[0];
      _loc8_ = this.api.kernel.GameManager.getCriticalHitChance(this.api.datacenter.Player.weaponItem.criticalHit);
      this.gapi.showTooltip(_loc7_.name + "\n" + _loc7_.descriptionVisibleEffects + " (" + _loc7_.apCost + " " + this.api.lang.getText("AP") + (_global.isNaN(_loc8_) ? "" : ", " + this.api.lang.getText("ACTUAL_CRITICAL_CHANCE") + ": 1/" + _loc8_) + ")",oEvent.target,-30,{bXLimit:true,bYLimit:false});
   }
};
_loc1.modelChanged = function(oEvent)
{
   switch(oEvent.eventName)
   {
      case "updateOne":
      case "updateAll":
   }
   if(oEvent.target == this.api.datacenter.Player.Spells)
   {
      if(this._sCurrentTab == "Spells")
      {
         this.updateSpells();
      }
   }
   else if(this._sCurrentTab == "Items")
   {
      this.updateItems();
   }
   else if(this._sCurrentTab == "Sets")
   {
      this.updateSets();
   }
};
#endinitclip