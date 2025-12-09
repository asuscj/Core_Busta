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
if(!dofus["\r\x14"].gapi.ui.historialventas)
{
   _global.dofus["\r\x14"].gapi.ui.historialventas = new Object();
}
_global.dofus["\r\x14"].gapi.ui.historialventas.VentasItem = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.historialventas.VentasItem.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.historialventas.VentasItem.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   var _loc3_;
   var _loc5_;
   var _loc4_;
   var _loc6_;
   if(bUsed)
   {
      this._oItem = oItem;
      _loc3_ = this.api.lang.getItemUnicText(oItem.idItem);
      _loc5_ = _loc3_.g;
      _loc4_ = _loc3_.t;
      _loc6_ = _loc3_.n;
      this._lblName.text = _loc6_;
      this._mcF._visible = true;
      this._txtCantidad.text = "x " + oItem.cantidad;
      this._txtFecha.text = oItem.fecha;
      this._txtKamas.text = oItem.kamas;
      this._ldrIcon.contentPath = dofus.Constants.ITEMS_PATH + _loc4_ + "/" + _loc5_ + ".swf";
      this._txtKamas.text = new ank["\x1e\n\x07"]["\x0e\x1c"](oItem.kamas).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
      this._iconK._visible = true;
      this._txtFecha1.text = "Fecha:";
   }
   else if(Number(oItem.cantidad) < 1)
   {
      this._lblName.text = "";
      this._txtCantidad.text = "";
      this._ldrIcon.contentPath = "";
      this._txtFecha.text = "";
      this._txtKamas.text = "";
      this._mcF._visible = false;
      this._iconK._visible = false;
      this._txtFecha1.text = "";
      this._txtFecha.text = "";
   }
};
_loc1.init = function()
{
   super.init(false);
   this._mcF._visible = false;
   this._iconK._visible = false;
};
loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
