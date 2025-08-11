if(!dofus["\r\x14"].gapi.ui)
{
   _global.dofus["\r\x14"].gapi.ui = new Object();
}
_global.dofus["\r\x14"].gapi.ui.Servicios = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Servicios.prototype = new ank.gapi.core["\x1e\n\r"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Servicios.prototype;
_loc1.__set__Ogrinas = function(nValue)
{
   this._nOgrinas = Number(nValue);
};
_loc1.__set__Creditos = function(nValue)
{
   this._nCreditos = Number(nValue);
};
_loc1.__set__Data = function(sData)
{
   this._sData = sData;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Servicios.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._btnCerrar.addEventListener("click",this);
   this._btnComprar.addEventListener("click",this);
   if(_global.NO_CREDITOS)
   {
      this._txtCreditos._visible = false;
      this._iconCreditos._visible = false;
      this._txtOgrinas._y -= 15;
      this._iconOgrinas._y -= 15;
   }
};
_loc1.initTexts = function()
{
   this._winBackground.title = this.api.datacenter.Player.Name + ", " + this.api.lang.getText("PANEL_SERVICESS");
   this._txtOgrinas.text = this._nOgrinas;
   this._txtCreditos.text = this._nCreditos;
   this._txtComprar.text = this.api.lang.getText("BUY");
   this._dgServicios.columnsNames = [this.api.lang.getText("DESCRIPCION"),!_global.NO_CREDITOS ? this.api.lang.getText("CREDITOS") : "",this.api.lang.getText("OGRINAS"),""];
};
_loc1.initData = function()
{
   var _loc8_ = this._sData.split("|");
   var _loc9_ = _loc8_.length;
   var _loc7_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc4_ = 0;
   var _loc5_;
   var _loc6_;
   var _loc3_;
   while(_loc4_ < _loc9_)
   {
      _loc5_ = _loc8_[_loc4_];
      if(!(_loc5_ == undefined || _loc5_ == ""))
      {
         _loc6_ = _loc5_.split(";");
         _loc3_ = new Object();
         _loc3_.id = _global.parseInt(_loc6_[0]);
         _loc3_.descripcion = this.api.lang.getText("SERVICIO_" + _loc3_.id);
         _loc3_.creditos = _global.parseInt(_loc6_[1]);
         _loc3_.ogrinas = _global.parseInt(_loc6_[2]);
         if(_loc3_.creditos <= 0)
         {
            _loc3_.creditos = "---";
         }
         if(_loc3_.ogrinas <= 0)
         {
            _loc3_.ogrinas = "---";
         }
         _loc7_.push(_loc3_);
      }
      _loc4_ = _loc4_ + 1;
   }
   this._dgServicios.dataProvider = _loc7_;
};
_loc1.actualizar = function(nCreditos, nOgrinas)
{
   this._nOgrinas = Number(nOgrinas);
   this._txtOgrinas.text = this._nOgrinas;
   this._nCreditos = Number(nCreditos);
   this._txtCreditos.text = this._nCreditos;
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnComprar":
         this.getURL(_global.URL_LINK_COMPRA,"_blank");
         break;
      default:
         break;
      case "_btnCerrar":
         this.close();
         return undefined;
   }
};
_loc1.close = function()
{
   this.gapi.unloadUIComponent("Panel");
   this.unloadThis();
};
_loc1.addProperty("ogrinas",function()
{
}
,_loc1.__set__Ogrinas);
_loc1.addProperty("creditos",function()
{
}
,_loc1.__set__Creditos);
_loc1.addProperty("data",function()
{
}
,_loc1.__set__Data);
_loc1._sLink = "";
_loc1._sData = "";
_loc1._nOgrinas = 0;
_loc1._nCreditos = 0;
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.Servicios.CLASS_NAME = "Servicios";
