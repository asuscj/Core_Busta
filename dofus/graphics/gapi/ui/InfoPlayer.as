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
_global.dofus["\r\x14"].gapi.ui.InfoPlayer = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.InfoPlayer.prototype = new ank.gapi.core["\x1e\n\r"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.InfoPlayer.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.InfoPlayer.CLASS_NAME);
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
   var _loc4_ = [];
   var _loc3_ = 1;
   while(_loc3_ <= 13)
   {
      _loc4_.push("_btnServicio" + _loc3_);
      _loc3_ = _loc3_ + 1;
   }
   var _loc2_;
   for(var _loc5_ in _loc4_)
   {
      _loc2_ = this[_loc4_[_loc5_]];
      if(_loc2_)
      {
         _loc2_.addEventListener("click",this);
         _loc2_.addEventListener("over",this);
         _loc2_.addEventListener("out",this);
      }
   }
   this._btnSolo.addEventListener("click",this);
   this._btnSolo.addEventListener("over",this);
   this._btnSolo.addEventListener("out",this);
   this._btnSavePos.addEventListener("click",this);
   this._btnSavePos.addEventListener("over",this);
   this._btnSavePos.addEventListener("out",this);
   this._btnIpDrop.addEventListener("click",this);
   this._btnIpDrop.addEventListener("over",this);
   this._btnIpDrop.addEventListener("out",this);
   this._btnIpKamas.addEventListener("click",this);
   this._btnIpKamas.addEventListener("over",this);
   this._btnIpKamas.addEventListener("out",this);
   this._btnReporte.addEventListener("click",this);
   this._btnReporte.addEventListener("over",this);
   this._btnReporte.addEventListener("out",this);
   this._btnNombre.addEventListener("click",this);
   this._btnNombre.addEventListener("over",this);
   this._btnNombre.addEventListener("out",this);
   this._btnColor.addEventListener("click",this);
   this._btnColor.addEventListener("over",this);
   this._btnColor.addEventListener("out",this);
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnCancel:
         this.api.ui.unloadUIComponent("InfoPlayer");
         break;
      case this._btnServicio1:
         this.api.network.send("?1O");
         break;
      case this._btnServicio2:
         this.api.network.send("?2");
         break;
      case this._btnServicio3:
         this.api.network.send("?3");
         break;
      case this._btnServicio4:
         this.api.network.send("?4");
         break;
      case this._btnServicio5:
         this.api.network.send("?5");
         break;
      case this._btnServicio6:
         this.api.network.send("HP");
         break;
      case this._btnServicio7:
         this.api.network.send("?7");
         break;
      case this._btnServicio8:
         this.api.network.send("?8");
         break;
      case this._btnServicio9:
         this.api.network.send("?9");
         break;
      case this._btnServicio10:
         this.api.network.send("?k");
         break;
      case this._btnServicio11:
         this.api.network.send("?cA");
         break;
      case this._btnServicio12:
         this.api.network.send("?m");
         break;
      case this._btnServicio13:
         this.api.network.send("?a");
         break;
      case this._btnSolo:
         this.escojerComando("S");
         break;
      case this._btnIpDrop:
         this.escojerComando("D");
         break;
      case this._btnIpKamas:
         this.escojerComando("K");
         break;
      case this._btnNombre:
         this.api.ui.loadUIComponent("CambiarNombre","CambiarNombre");
         break;
      case this._btnColor:
         this.api.ui.loadUIComponent("CambiarColor","CambiarColor");
         break;
      case this._btnReporte:
         this.api.ui.loadUIComponent("ReportBug","ReportBug");
         break;
      case this._btnSavePos:
         this.escojerComando("P");
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
      case "_btnServicio1":
         this.gapi.showTooltip(this.api.lang.getText("SERVICIO_1"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnServicio2":
         this.gapi.showTooltip(this.api.lang.getText("SERVICIO_2"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnServicio3":
         this.gapi.showTooltip(this.api.lang.getText("SERVICIO_3"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnServicio4":
         this.gapi.showTooltip(this.api.lang.getText("SERVICIO_4"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnServicio5":
         this.gapi.showTooltip(this.api.lang.getText("SERVICIO_5"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnServicio6":
         this.gapi.showTooltip(this.api.lang.getText("SERVICIO_6"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnServicio7":
         this.gapi.showTooltip(this.api.lang.getText("SERVICIO_7"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnServicio8":
         this.gapi.showTooltip(this.api.lang.getText("SERVICIO_8"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnServicio9":
         this.gapi.showTooltip(this.api.lang.getText("SERVICIO_9"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnServicio10":
         this.gapi.showTooltip(this.api.lang.getText("SERVICIO_10"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnServicio11":
         this.gapi.showTooltip(this.api.lang.getText("SERVICIO_11"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnServicio12":
         this.gapi.showTooltip(this.api.lang.getText("SERVICIO_12"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnServicio13":
         this.gapi.showTooltip(this.api.lang.getText("SERVICIO_13"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnTurno":
         this.gapi.showTooltip(this.api.lang.getText("ACTIVAR_TURNO_AUTO"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnSolo":
         this.gapi.showTooltip(this.api.lang.getText("ACTIVAR_AUTO_LISTO"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnModular":
         this.gapi.showTooltip(this.api.lang.getText("ACTIVAR_MODO_MODULAR"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnIpDrop":
         this.gapi.showTooltip(this.api.lang.getText("ACTIVAR_MODO_DROP"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnIpKamas":
         this.gapi.showTooltip(this.api.lang.getText("ACTIVAR_MODO_KAMAS"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnReporte":
         this.gapi.showTooltip(this.api.lang.getText("REPORTAR_BUGS"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnNombre":
         this.gapi.showTooltip(this.api.lang.getText("CAMBIAR_NOMBRE"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnColor":
         this.gapi.showTooltip(this.api.lang.getText("CAMBIAR_COLOR"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnSavePos":
         this.gapi.showTooltip(this.api.lang.getText("ACTIVAR_GUARDAR_POS"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
      default:
         return;
   }
};
_loc1.initTexts = function()
{
   this._winBg.title = this.api.lang.getText("PANEL_INFO_PLAYER");
   this._lblNombre.text = this.api.datacenter.Player.Name;
};
_loc1.initData = function()
{
   this.cargarDatos(this._sData);
   this.initPlayer();
};
_loc1.cargarDatos = function(sValue)
{
   this._sData = sValue;
   var _loc2_ = this._sData.split(";");
   this._txtPocionExp.text = Number(_loc2_[0]) >= 1 ? String(_loc2_[0]) : "Inactivo";
   this._txtPocionDrop.text = Number(_loc2_[1]) >= 1 ? String(_loc2_[1]) : "Inactivo";
   this._txtTimeVIP.text = Number(_loc2_[2]) >= 1 ? String(_loc2_[2]) : "Inactivo";
   this._txtTimeE.text = Number(_loc2_[3]) >= 1 ? String(_loc2_[3]) : "Inactivo";
   this._txtSoloR.text = Number(_loc2_[4]) != 0 ? "Activado" : "Desactivado";
   if(Number(_loc2_[4]) == 0)
   {
      this._btnSolo.styleName = "RedCheckButton";
      this._btnSolo.selected = false;
   }
   else if(Number(_loc2_[4]) != 0)
   {
      this._btnSolo.styleName = "GreenCheckButton";
      this._btnSolo.selected = true;
   }
   this._txtSavePos.text = Number(_loc2_[5]) != 0 ? "Activado" : "Desactivado";
   if(Number(_loc2_[5]) == 0)
   {
      this._btnSavePos.styleName = "RedCheckButton";
      this._btnSavePos.selected = false;
   }
   else if(Number(_loc2_[5]) != 0)
   {
      this._btnSavePos.styleName = "GreenCheckButton";
      this._btnSavePos.selected = true;
   }
   this._txtIpDrop.text = Number(_loc2_[6]) != 0 ? "Activado" : "Desactivado";
   if(Number(_loc2_[6]) == 0)
   {
      this._btnIpDrop.styleName = "RedCheckButton";
      this._btnIpDrop.selected = false;
   }
   else if(Number(_loc2_[6]) != 0)
   {
      this._btnIpDrop.styleName = "GreenCheckButton";
      this._btnIpDrop.selected = true;
   }
   this._txtIpKamas.text = Number(_loc2_[7]) != 0 ? "Activado" : "Desactivado";
   if(Number(_loc2_[7]) == 0)
   {
      this._btnIpKamas.styleName = "RedCheckButton";
      this._btnIpKamas.selected = false;
   }
   else if(Number(_loc2_[7]) != 0)
   {
      this._btnIpKamas.styleName = "GreenCheckButton";
      this._btnIpKamas.selected = true;
   }
   this._txtJgOnline.text = String(_loc2_[8]);
   this._txtJgOnlineM.text = String(_loc2_[9]);
   this._txtKamasGlobales.text = Number(_loc2_[10]);
   this._txtKamasGlobales.text = new ank["\x1e\n\x07"]["\x0e\x1c"](Number(_loc2_[10])).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   this._txtOgrinasGlobales.text = Number(_loc2_[11]);
   this._txtOgrinasGlobales.text = new ank["\x1e\n\x07"]["\x0e\x1c"](Number(_loc2_[11])).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
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
_loc1.escojerComando = function(comando)
{
   this.api.network.send("I" + comando);
};
_loc1.addProperty("data",function()
{
}
,_loc1.__set__Data);
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
_loc1._nNivelSong = 0;
_global.dofus["\r\x14"].gapi.ui.InfoPlayer.CLASS_NAME = "InfoPlayer";
