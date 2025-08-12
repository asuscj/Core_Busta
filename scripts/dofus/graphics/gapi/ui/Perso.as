#initclip 58
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
_global.dofus["\r\x14"].gapi.ui.Perso = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Perso.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Perso.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Perso.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.initData = function()
{
   this._svPersonaje.zoom = 250;
   this._svPersonaje.spriteAnims = ["StaticR","StaticS","StaticL","StaticF"];
   this._svPersonaje.refreshDelay = 50;
   this._svPersonaje.spriteData = this.api.datacenter.Player.data;
   var _loc3_ = this.api.datacenter.Player.data;
   this._oColors = {color1:this.api.datacenter.Player.color1,color2:this.api.datacenter.Player.color2,color3:this.api.datacenter.Player.color3};
   this._svPersonaje.useSingleLoader = true;
   this._csColors.breed = this.api.datacenter.Player.Guild;
   this._csColors.sex = this.api.datacenter.Player.Sex;
   this._csColors.colors = [this.api.datacenter.Player.color1,this.api.datacenter.Player.color2,this.api.datacenter.Player.color3];
   var _loc5_ = this.api.datacenter.Player.Guild + "" + this.api.datacenter.Player.Sex;
   var _loc4_ = new ank.battlefield.datacenter["\x1e\x0e\x10"](undefined,ank.battlefield.mc["\x1e\x0e\x10"],_global.palmad.dofus.Constants.CLIPS_PERSOS_PATH + _loc5_ + ".swf",undefined,5);
   _loc4_.accessories = _loc3_.accessories;
   this._svPersonaje.enableBlur = true;
   this._svPersonaje.refreshAccessories = !var2;
   this._svPersonaje.sourceSpriteData = _loc3_;
   this._svPersonaje.spriteData = _loc4_;
   this._svPersonaje.setColors(this._oColors);
   _loc4_.mount = _loc3_.mount;
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnOrnamentos.addEventListener("click",this);
   this._btnTitulos.addEventListener("click",this);
   this._btnTituloPerso.addEventListener("click",this);
   this._btnNombre.addEventListener("click",this);
   this._btnColor.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._winBg.title = "Personalización";
   this._lblNombre.text = this.api.datacenter.Player.data.name;
   this._txtTitulo.text = this._sTitulo;
   this._btnTitulos.label = "Mis titulos";
   this._btnOrnamentos.label = "Ornamentos";
   this._btnTituloPerso.text = "Titulo VIP";
   this._btnNombre.label = "Cambiar nombre";
   this._btnColor.label = "Cambiar color";
};
_loc1.actualizarTitulo = function(sValue, nColor)
{
   this._sTitulo = String(sValue);
   this._txtTitulo.text = "« " + this._sTitulo + " »";
   this._txtTitulo.textColor = nColor;
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnTitulos:
         this.api.network.send("Zt");
         break;
      case this._btnNombre:
         this.api.network.send("wA");
         break;
      case this._btnOrnamentos:
         this.api.network.send("Zñ");
         break;
      case this._btnColor:
         this.api.network.send("wN");
         break;
      case this._btnClose:
         this.api.ui.unloadUIComponent("Perso");
   }
};
ASSetPropFlags(_loc1,null,1);
_loc1._sTitulo = "";
_global.dofus["\r\x14"].gapi.ui.Perso.CLASS_NAME = "Perso";
#endinitclip