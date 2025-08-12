#initclip 7
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
_global.dofus["\r\x14"].gapi.ui.PanelPrestige = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.PanelPrestige.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.PanelPrestige.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.PanelPrestige.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._btnLevelUp.addEventListener("click",this);
   this._btnCancel.addEventListener("click",this);
   this._btnUp.addEventListener("click",this);
   this._btnUp.addEventListener("over",this);
   this._btnUp.addEventListener("out",this);
   this._btnTitle.addEventListener("click",this);
   this._btnTitle.addEventListener("over",this);
   this._btnTitle.addEventListener("out",this);
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
         this.gapi.showTooltip(this.api.lang.getText("PRESTIGE_MONTER"),_root._xmouse + 8,_root._ymouse - 8,{bYLimit:false,bXLimit:true});
         break;
      case this._btnTitle:
         this.gapi.showTooltip(this.api.lang.getText("PRESTIGE_TITLE"),_root._xmouse + 8,_root._ymouse - 8,{bYLimit:false,bXLimit:true});
   }
};
_loc1.initTexts = function()
{
   this._bg.title = this.api.lang.getText("PRESTIGE_TITRE");
   this._btnUp.label = this.api.lang.getText("BOUTON_MONTER");
   this._btnTitle.label = this.api.lang.getText("BOUTON_TITRE");
   this._btnLevelUp.label = this.api.lang.getText("NEXT_WORD");
   this._btnLevelUp.text = this.api.lang.getText("NEXT_WORD");
};
_loc1.initData = function()
{
   this._btnUp.enabled = this.api.datacenter.Player.Level >= 200;
   this._ctrAlignment.contentPath = this.api.datacenter.Player.alignment.iconFile;
   this._lblinfos.text = this.api.lang.getText("PRESTIGE_INFOS");
   this._lblName.text = this.playerInfo.split("|")[6];
   this._lblprestige.text = "Prestigio " + this.playerInfo.split("|")[7];
   this._lblMVP.text = "M V P";
   this.updateInfos();
   this.initPlayer();
};
_loc1.updateInfos = function()
{
   this._btnLevelUp.enabled = this.playerInfo.split("|")[9] >= 10;
   this._pb1._height = Math.ceil(this.playerInfo.split("|")[8] / 17500 * 167);
   if(this._pb1._height > 167)
   {
      this._pb1._height = 167;
   }
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
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnLevelUp:
         this.api.network.send("XpU");
         break;
      case this._btnCancel:
         this.gapi.unloadUIComponent("PanelPrestige");
   }
};
_loc1.yes = function(oEvent)
{
   var _loc0_;
   if((_loc0_ = oEvent.target._name) === "AskYesNoConfirm")
   {
      this.valid(true);
   }
};
_loc1.__set__player = function(sData)
{
   this.playerInfo = sData;
};
_loc1.addProperty("player",function()
{
}
,_loc1.__set__player);
ASSetPropFlags(_loc1,null,1);
_loc1.playerInfo = "";
_global.dofus["\r\x14"].gapi.ui.PanelPrestige.CLASS_NAME = "PanelPrestige";
Object.registerClass("UI_PanelPrestige",dofus["\r\x14"].gapi.ui.PanelPrestige);
#endinitclip