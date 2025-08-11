_global.dofus["\r\x14"].gapi.ui.CambiarColor = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.CambiarColor.prototype = new ank.gapi.core["\x1e\n\r"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.CambiarColor.prototype;
_loc1.init = function()
{
   super.init(false,"CambiarColor");
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.initData = function()
{
   this._svPersonaje.zoom = 200;
   var _loc2_ = this.api.datacenter.Player.data;
   if(_loc2_ == undefined)
   {
      return undefined;
   }
   var _loc3_ = new ank.battlefield.datacenter["\x1e\x0e\x10"]("viewer",ank.battlefield.mc["\x1e\x0e\x10"],_loc2_.gfxFile,undefined,5);
   this._oColors = {color1:-1,color2:-1,color3:-1};
   this._svPersonaje.spriteAnims = ["StaticF","StaticR","StaticL"];
   this._svPersonaje.refreshDelay = 50;
   this._svPersonaje.useSingleLoader = true;
   _loc3_.accessories = _loc2_.accessories;
   _loc3_.mount = _loc2_.mount;
   this._svPersonaje.spriteData = _loc3_;
   this._svPersonaje.setColors(this._oColors);
   this._csColores.breed = this.api.datacenter.Player.Guild;
   this._csColores.sex = this.api.datacenter.Player.Sex;
   this._nSavedColor = -1;
};
_loc1.addListeners = function()
{
   this._btnOk.addEventListener("click",this);
   this._btnCerrar.addEventListener("click",this);
   this._btnCerrar2.addEventListener("click",this);
   this._csColores.addEventListener("over",this);
   this._csColores.addEventListener("out",this);
   this._csColores.addEventListener("change",this);
};
_loc1.initTexts = function()
{
   this._winBg.title = this.api.datacenter.Player.Name + ", " + this.api.lang.getText("PANEL_CHANGE_COLOURS");
   this._btnOk.label = "OK";
   this._btnCerrar.label = "";
   this._btnCerrar2.label = "CANCEL";
   this._txtNombrePj.text = this.api.datacenter.Player.Name;
   this._txtTitulo.text = this.api.lang.getText("CHANGE_COLOR");
};
_loc1.mostrarColor = function(nIndex)
{
   var bWhite = true;
   this._nSavedColor = this._svPersonaje.getColor(nIndex);
   this.onEnterFrame = function()
   {
      bWhite = !bWhite;
      this._svPersonaje.setColor(nIndex,!bWhite ? 16746632 : 16733525);
   };
};
_loc1.esconderColor = function(nIndex)
{
   delete this.onEnterFrame;
   this._svPersonaje.setColor(nIndex,this._nSavedColor);
};
_loc1.cambiarColor = function(oColors)
{
   this._oColors = oColors;
   this._svPersonaje.setColors(this._oColors);
};
_loc1.over = function(oEvent)
{
   var _loc0_;
   if((_loc0_ = oEvent.target) === this._csColores)
   {
      this.mostrarColor(oEvent.index);
   }
};
_loc1.out = function(oEvent)
{
   var _loc0_;
   if((_loc0_ = oEvent.target) === this._csColores)
   {
      this.esconderColor(oEvent.index);
   }
};
_loc1.change = function(oEvent)
{
   var _loc0_;
   if((_loc0_ = oEvent.target) === this._csColores)
   {
      this.cambiarColor(oEvent.value);
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnOk:
         this.api.network.send("ZsC" + this._svPersonaje.getColor(1) + ";" + this._svPersonaje.getColor(2) + ";" + this._svPersonaje.getColor(3));
         break;
      case this._btnCerrar:
         this.gapi.unloadUIComponent("Panel");
         this.unloadThis();
         break;
      case this._btnCerrar2:
         this.gapi.unloadUIComponent("Panel");
         this.unloadThis();
   }
};
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.CambiarColor.CLASS_NAME = "CambiarColor";
