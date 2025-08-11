if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus["\r\x14"])
{
   _global.dofus["\r\x14"] = new Object();
}
if(!dofus["\r\x14"].gapi)
{
   _global.dofus["\r\x14"].gapi = new Object();
}
if(!dofus["\r\x14"].gapi.ui)
{
   _global.dofus["\r\x14"].gapi.ui = new Object();
}
_global.dofus["\r\x14"].gapi.ui.PanelInfoPlayer = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.PanelInfoPlayer.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.PanelInfoPlayer.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.PanelInfoPlayer.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._btnCancel.addEventListener("click",this);
   this._btnUp.addEventListener("click",this);
   this._btnUp.addEventListener("over",this);
   this._btnUp.addEventListener("out",this);
   this.api.kernel.OptionsManager.addEventListener("optionChanged",this);
   this._btnTitle.addEventListener("click",this);
   this._btnTitle.addEventListener("over",this);
   this._btnTitle.addEventListener("out",this);
   this._btnReset.addEventListener("click",this);
   this._btnOrnamentos.addEventListener("click",this);
   this._btnNoPrestige.addEventListener("click",this);
   this._btnHidePrestige.addEventListener("click",this);
};
_loc1.out = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnUp:
         this.gapi.showTooltip(this.api.lang.getText("UPGRADE_PRESTIGE"),_root._xmouse + 8,_root._ymouse - 8,{bYLimit:false,bXLimit:true});
         break;
      case this._btnTitle:
         this.gapi.showTooltip(this.api.lang.getText("PRESTIGE_TITLE"),_root._xmouse + 8,_root._ymouse - 8,{bYLimit:false,bXLimit:true});
   }
};
_loc1.initTexts = function()
{
   this._bg.title = this.api.lang.getText("PRESTIGE_TITRE");
   this._btnUp.label = this.api.lang.getText("BOUTON_UPGRADE");
   this._btnTitle.label = this.api.lang.getText("BOUTON_TITRE");
   this._lblReset.text = this.api.lang.getText("HIDEMY_RESET");
   this._lblOrnamentos.text = this.api.lang.getText("SHOW_RESETS");
   this._lbHidePrestige.text = this.api.lang.getText("HIDEMY_PRESTIGE");
   this._lblNoPrestige.text = this.api.lang.getText("SHOW_PRESTIGE");
   this._lblTPinfoValue.text = this.timePlayer;
   this._lblFWinfoValue.text = this.fightWin;
   this._lblFLinfoValue.text = this.fightLose;
   this._lblAbonoValue.text = this.abonoTime;
   this._lblTitleStats.text = this.api.lang.getText("TITLE_INFO_PLAYER");
   this._lblOSinfoValue.text = this.ogGastadas;
   this._lblTPinfo.text = this.api.lang.getText("TIME_PLAYED");
   this._lblFWinfo.text = this.api.lang.getText("FIGHT_W");
   this._lblFLinfo.text = this.api.lang.getText("FIGHT_L");
   this._lblOSinfo.text = this.api.lang.getText("OG_SPEND");
   this._lblBonusKamas.text = this.api.lang.getText("KK_BONUS");
   this._lblBonusXp.text = this.api.lang.getText("XP_BONUS");
   this._lblBonusDrop.text = this.api.lang.getText("DROP_BONUS");
   this._lblBonusXpJob.text = this.api.lang.getText("XP_JOB_BONUS");
   this._lblAbono.text = this.api.lang.getText("ABONO_INFO");
   this._lblBonusXpJobValue.text = this.xpJobBonus != "0" ? this.xpJobBonus : this.api.lang.getText("DESABLE");
   this._lblBonusDropValue.text = this.dropBonus != "0" ? this.dropBonus : this.api.lang.getText("DESABLE");
   this._lblBonusKamasValue.text = this.kamasBonus != "0" ? this.kamasBonus : this.api.lang.getText("DESABLE");
   this._lblBonusXpValue.text = this.xpBonus != "0" ? this.xpBonus : this.api.lang.getText("DESABLE");
   this._lblBonusXpJobValue.styleName = this.xpJobBonus != "0" ? "GreenCenterSmallLabel" : "RedCenterSmallLabel";
   this._lblBonusDropValue.styleName = this.dropBonus != "0" ? "GreenCenterSmallLabel" : "RedCenterSmallLabel";
   this._lblBonusKamasValue.styleName = this.kamasBonus != "0" ? "GreenCenterSmallLabel" : "RedCenterSmallLabel";
   this._lblBonusXpValue.styleName = this.xpBonus != "0" ? "GreenCenterSmallLabel" : "RedCenterSmallLabel";
};
_loc1.initData = function()
{
   var _loc2_ = this.api.kernel.OptionsManager;
   this._btnUp.enabled = this.api.datacenter.Player.Level >= 200;
   this._pb2._width = 2;
   this._lblinfos.text = this.api.lang.getText("PRESTIGE_INFOS");
   this._lbllevel.text = this.api.lang.getText("LEVEL") + this.api.datacenter.Player.Level;
   this._btnOrnamentos.selected = _loc2_.getOption("noResets");
   this._btnReset.selected = _loc2_.getOption("hideReset");
   this._btnNoPrestige.selected = _loc2_.getOption("noPrestige");
   this._btnHidePrestige.selected = _loc2_.getOption("hidePrestige");
   this.initPlayer();
};
_loc1.updateInfos = function()
{
   this._btnTitle.enabled = this.prestigio >= 1;
   this._lblprestige.text = this.api.datacenter.Player.Name;
   this._pb1._height = Math.ceil(16.7 * this.alineacion);
};
_loc1.setSpriteAccessories = function(_loc3_)
{
   var _loc9_;
   var _loc6_;
   var _loc2_;
   var _loc4_;
   var _loc5_;
   var _loc7_;
   var _loc3_;
   var _loc8_;
   if(_loc3_.length != 0)
   {
      _loc9_ = new Array();
      _loc6_ = _loc3_.split(",");
      _loc2_ = 0;
      while(_loc2_ < _loc6_.length)
      {
         if(_loc6_[_loc2_].indexOf("~") != -1)
         {
            _loc4_ = _loc6_[_loc2_].split("~");
            _loc5_ = _global.parseInt(_loc4_[0],16);
            _loc7_ = _global.parseInt(_loc4_[1]);
            _loc3_ = _global.parseInt(_loc4_[2]) - 1;
            if(_loc3_ < 0)
            {
               _loc3_ = 0;
            }
         }
         else
         {
            _loc5_ = _global.parseInt(_loc6_[_loc2_],16);
            _loc7_;
            _loc3_;
         }
         if(!_global.isNaN(_loc5_))
         {
            _loc8_ = new dofus.datacenter["\x11"](_loc5_,_loc7_,_loc3_);
            _loc9_[_loc2_] = _loc8_;
         }
         _loc2_ += 1;
      }
      return _loc9_;
   }
};
_loc1.initPlayer = function()
{
   var _loc9_ = this.api.datacenter.Player.data;
   var _loc8_ = this.playerInfo.split("|")[0];
   var _loc7_ = this.playerInfo.split("|")[1];
   var _loc6_ = this.playerInfo.split("|")[2];
   this._oColors = {color1:_loc8_,color2:_loc7_,color3:_loc6_};
   this._svCharacter.zoom = 300;
   this._svCharacter.spriteAnims = ["StaticR"];
   this._svCharacter.refreshDelay = 50;
   this._svCharacter.useSingleLoader = true;
   var _loc5_ = this.playerInfo.split("|")[3];
   var _loc3_ = this.playerInfo.split("|")[4];
   this._csColors.breed = _loc5_;
   this._csColors.sex = _loc3_;
   this._csColors.colors = [_loc8_,_loc7_,_loc6_];
   var _loc10_ = _loc5_ + "" + _loc3_;
   var _loc4_ = new ank.battlefield.datacenter["\x1e\x0e\x10"](undefined,ank.battlefield.mc["\x1e\x0e\x10"],_global.palmad.dofus.Constants.CLIPS_PERSOS_PATH + _loc10_ + ".swf",undefined,5);
   _loc4_.accessories = this.setSpriteAccessories(this.playerInfo.split("|")[5]);
   this._svCharacter.enableBlur = true;
   this._svCharacter.refreshAccessories = !var2;
   this._svCharacter.sourceSpriteData = _loc9_;
   this._svCharacter.spriteData = _loc4_;
   this._svCharacter.setColors(this._oColors);
   this.updateInfos();
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnOrnamentos:
         this.api.kernel.OptionsManager.setOption("noResets",oEvent.target.selected);
         break;
      case this._btnNoPrestige:
         this.api.kernel.OptionsManager.setOption("noPrestige",oEvent.target.selected);
         break;
      case this._btnHidePrestige:
         this.api.kernel.OptionsManager.setOption("hidePrestige",oEvent.target.selected);
         break;
      case this._btnReset:
         this.api.kernel.OptionsManager.setOption("hideReset",oEvent.target.selected);
         break;
      case this._btnUp:
         this.api.network.send("ww");
         this.gapi.unloadUIComponent("PanelInfoPlayer");
         break;
      case this._btnTitle:
         this.api.network.send("Zt");
         this.gapi.unloadUIComponent("PanelInfoPlayer");
         break;
      case this._btnCancel:
         this.gapi.unloadUIComponent("PanelInfoPlayer");
   }
};
_loc1.optionChanged = function(_loc2_)
{
   switch(_loc2_.key)
   {
      case "noPrestige":
         this._btnNoPrestige.selected = _loc2_.value;
         break;
      case "hidePrestige":
         this._btnHidePrestige.selected = _loc2_.value;
         break;
      case "hideReset":
         this._btnReset.selected = _loc2_.value;
         break;
      case "noResets":
         this._btnOrnamentos.selected = _loc2_.value;
   }
};
_loc1.valid = function(noConfirm)
{
   if(!noConfirm)
   {
      this.api.kernel.showMessage(this.api.lang.getText("INFOS_CONFIRMATION"),this.api.lang.getText("PRESTIGE_CONFIRM"),"CAUTION_YESNO",{name:"Confirm",listener:this});
      return undefined;
   }
   switch(this._oEvent.target)
   {
      case this._btnUp:
         this.api.network.send("XPU");
         break;
      case this._btnTitle:
         this.api.network.send("XPT");
   }
   this.gapi.unloadUIComponent("PanelInfoPlayer");
};
_loc1.yes = function(oEvent)
{
   var _loc0_;
   if((_loc0_ = oEvent.target._name) === "AskYesNoConfirm")
   {
      this.valid(true);
   }
};
_loc1.__set__prestige = function(sData)
{
   var _loc2_ = sData.split("|");
   this.timePlayer = _loc2_[0];
   this.fightWin = _loc2_[1];
   this.fightLose = _loc2_[2];
   this.ogGastadas = _loc2_[3];
   this.xpBonus = _loc2_[4];
   this.kamasBonus = _loc2_[5];
   this.dropBonus = _loc2_[6];
   this.xpJobBonus = _loc2_[7];
   this.abonoTime = _loc2_[8];
};
_loc1.addProperty("prestige",function()
{
}
,_loc1.__set__prestige);
_loc1.__set__player = function(sData)
{
   this.playerInfo = sData;
};
_loc1.addProperty("player",function()
{
}
,_loc1.__set__player);
_loc1.playerInfo = "";
_loc1.fightWin = 0;
_loc1.fightLose = 0;
_loc1.ogGastadas = 0;
_loc1.xpBonus = "0";
_loc1.kamasBonus = "0";
_loc1.dropBonus = "0";
_loc1.xpJobBonus = "0";
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.PanelInfoPlayer.CLASS_NAME = "PanelInfoPlayer";
Object.registerClass("UI_PanelInfoPlayer",dofus["\r\x14"].gapi.ui.PanelInfoPlayer);
