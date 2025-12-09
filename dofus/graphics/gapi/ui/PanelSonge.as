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
_global.dofus["\r\x14"].gapi.ui.PanelSonge = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.PanelSonge.prototype = new ank.gapi.core["\x1e\n\r"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.PanelSonge.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.PanelSonge.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.__set__Data = function(sValue)
{
   this._sData = sValue;
};
_loc1.addListeners = function()
{
   this._btnCancel.addEventListener("click",this);
   this._btnTienda.addEventListener("click",this);
   this._btnTienda.addEventListener("over",this);
   this._btnTienda.addEventListener("out",this);
   this._btnReset.addEventListener("click",this);
   this._btnReset.addEventListener("over",this);
   this._btnReset.addEventListener("out",this);
   this._btnEmpezar1.addEventListener("click",this);
   this._btnEmpezar1.addEventListener("over",this);
   this._btnEmpezar1.addEventListener("out",this);
   this._btnEmpezar2.addEventListener("click",this);
   this._btnEmpezar2.addEventListener("over",this);
   this._btnEmpezar2.addEventListener("out",this);
   this._btnEmpezar3.addEventListener("click",this);
   this._btnEmpezar3.addEventListener("over",this);
   this._btnEmpezar3.addEventListener("out",this);
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnCancel:
         this.api.ui.unloadUIComponent("PanelSonge");
         break;
      case this._btnTienda:
         this.escojerTienda();
         break;
      case this._btnReset:
         this.escojerReset();
         break;
      case this._btnEmpezar1:
         this.escojerDificultad(1);
         break;
      case this._btnEmpezar2:
         this.escojerDificultad(2);
         break;
      case this._btnEmpezar3:
         this.escojerDificultad(3);
      default:
         return;
   }
};
_loc1.out = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnTienda":
         this.gapi.showTooltip(this.api.lang.getText("PANEL_SONG_SHOP"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnReset":
         this.gapi.showTooltip(this.api.lang.getText("RESET_SONGE"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnEmpezar1":
         this.gapi.showTooltip(this.api.lang.getText("START_SONGE_1"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnEmpezar2":
         this.gapi.showTooltip(this.api.lang.getText("START_SONGE_2"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnEmpezar3":
         this.gapi.showTooltip(this.api.lang.getText("START_SONGE_3"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
      default:
         return;
   }
};
_loc1.initTexts = function()
{
   this._winBg.title = this.api.lang.getText("PANEL_SONG");
   this._winB2g.title = this.api.lang.getText("PANEL_SONG");
   this._lblNombre.text = this.api.datacenter.Player.Name;
   this._lblNivel.text = this.api.lang.getText("LEVEL") + " " + this.api.datacenter.Player.Level;
   this._btnTienda.label = this.api.lang.getText("BOUTIQUE");
   this._btnReset.label = this.api.lang.getText("RESET_SONGE");
   this._btnEmpezar1.label = "Normal";
   this._btnEmpezar2.label = "Medium";
   this._btnEmpezar3.label = "Hard";
   this._taInfo.text = this.api.lang.getText("GUIA_SONGE");
};
_loc1.initData = function()
{
   this.cargarDatos(this._sData);
   this.initPlayer();
};
_loc1.cargarDatos = function(sValue)
{
   this._sData = sValue;
   var _loc4_ = this._sData.split(",");
   this._nNivelSong = _loc4_[0];
   var _loc3_ = Number(this._nNivelSong);
   var _loc2_ = Number(_loc3_ / 5);
   this._txtCantidad.text = _loc4_[1];
   this._txtEtapa.text = _loc3_;
   this._txtRecord.text = _loc4_[2];
   this._txtStat1.text = "+ " + Number(20 * _loc3_) + "% " + this.api.lang.getText("FULL_STATS_ID11");
   this._txtStat2.text = "+ " + Number(20 * _loc3_) + "% " + this.api.lang.getText("FULL_STATS_ID16");
   this._txtStat3.text = "+ " + Number(20 * _loc3_) + "% " + this.api.lang.getText("FULL_STATS_ID14");
   this._txtStat4.text = "+ " + Number(20 * _loc3_) + "% " + this.api.lang.getText("FULL_STATS_ID15");
   this._txtStat5.text = "+ " + Math.round(2 * _loc2_) + " " + this.api.lang.getText("FULL_STATS_ID17");
   this._txtStat6.text = "+ " + Math.round(3 * _loc2_) + " " + this.api.lang.getText("GOLPES_CRITICOS");
   this._txtStat7.text = "+ " + Math.round(2 * _loc2_) + " " + this.api.lang.getText("FULL_STATS_ID9");
   this._txtStat8.text = "+ " + Math.round(2 * _loc2_) + " " + this.api.lang.getText("FULL_STATS_ID10");
   this._txtStat9.text = "+ " + Math.round(2 * _loc2_) + " " + this.api.lang.getText("INVOCACIONES");
   this._txtStat10.text = "+ " + Number(100 * _loc2_) + " " + this.api.lang.getText("INITIATIVE");
   this._txtStat11.text = "+ " + Math.round(_loc2_) + " " + this.api.lang.getText("RESISTANCES");
};
_loc1.setSpriteAccessories = function(_loc3_)
{
   var _loc9_;
   var _loc6_;
   var _loc2_;
   var _loc5_;
   var _loc4_;
   var _loc7_;
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
            _loc5_ = _loc6_[_loc2_].split("~");
            _loc4_ = _global.parseInt(_loc5_[0],16);
            _loc7_ = _global.parseInt(_loc5_[1]);
            _loc3_ = _global.parseInt(_loc5_[2]) - 1;
            if(_loc3_ < 0)
            {
               _loc3_ = 0;
            }
         }
         else
         {
            _loc4_ = _global.parseInt(_loc6_[_loc2_],16);
            _loc7_;
            _loc3_;
         }
         if(!_global.isNaN(_loc4_))
         {
            _loc8_ = new dofus.datacenter["\x11"](_loc4_,_loc7_,_loc3_);
            _loc9_[_loc2_] = _loc8_;
         }
         _loc2_ += 1;
      }
      return _loc9_;
   }
};
_loc1.initPlayer = function()
{
   this._svCharacter.zoom = 200;
   this._svCharacter.fondo._visible = false;
   this._svCharacter.spriteAnims = ["StaticF"];
   this._svCharacter.refreshDelay = 50;
   this._svCharacter.spriteData = this.api.datacenter.Player.data;
   var _loc3_ = this.api.datacenter.Player.data;
   this._oColors = {color1:this.api.datacenter.Player.color1,color2:this.api.datacenter.Player.color2,color3:this.api.datacenter.Player.color3};
   this._svCharacter.useSingleLoader = true;
   this._csColors.breed = this.api.datacenter.Player.Guild;
   this._csColors.sex = this.api.datacenter.Player.Sex;
   this._csColors.colors = [this.api.datacenter.Player.color1,this.api.datacenter.Player.color2,this.api.datacenter.Player.color3];
   var _loc5_ = this.api.datacenter.Player.Guild + "" + this.api.datacenter.Player.Sex;
   var _loc4_ = new ank.battlefield.datacenter["\x1e\x0e\x10"](undefined,ank.battlefield.mc["\x1e\x0e\x10"],_global.palmad.dofus.Constants.CLIPS_PERSOS_PATH + _loc5_ + ".swf",undefined,5);
   _loc4_.accessories = _loc3_.accessories;
   this._svCharacter.enableBlur = true;
   this._svCharacter.refreshAccessories = !var2;
   this._svCharacter.sourceSpriteData = _loc3_;
   this._svCharacter.spriteData = _loc4_;
   this._svCharacter.setColors(this._oColors);
};
_loc1.escojerTienda = function()
{
   this.api.network.send("sT");
};
_loc1.escojerReset = function()
{
   this.api.network.send("sR");
};
_loc1.escojerDificultad = function(dif)
{
   this.api.network.send("sD" + dif);
};
_loc1.addProperty("data",function()
{
}
,_loc1.__set__Data);
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
_loc1._nNivelSong = 0;
_global.dofus["\r\x14"].gapi.ui.PanelSonge.CLASS_NAME = "PanelSonge";
