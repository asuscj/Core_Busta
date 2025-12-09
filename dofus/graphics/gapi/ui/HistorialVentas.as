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
_global.dofus["\r\x14"].gapi.ui.HistorialVentas = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.HistorialVentas.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.HistorialVentas.prototype;
_loc1.__set__Data = function(sValue)
{
   this._sData = sValue.split(";");
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.HistorialVentas.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._dgVentas.addEventListener("itemSelected",this);
   this._btnClose.addEventListener("click",this);
   this._btnBorrar.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._dgVentas.columnsNames = ["",""];
   this._winBg.title = this.api.lang.getText("HISTORIAL_VENTAS");
   this._btnBorrar.label = this.api.lang.getText("DELETE");
};
_loc1.initData = function()
{
   this._aVentas = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc4_ = this._sData;
   var _loc6_ = true;
   var _loc5_ = 0;
   var _loc3_;
   var _loc2_;
   for(_loc5_ in _loc4_)
   {
      _loc3_ = _loc4_[_loc5_];
      _loc2_ = new Object();
      _loc2_.id = _loc3_.split(",")[0];
      _loc2_.idItem = _loc3_.split(",")[1];
      _loc2_.cantidad = _loc3_.split(",")[2];
      _loc2_.fecha = _loc3_.split(",")[3];
      _loc2_.kamas = _loc3_.split(",")[4];
      _loc2_.total = _loc3_.split(",")[5];
      this._aVentas.push(_loc2_);
   }
   this._dgVentas.dataProvider = this._aVentas;
   this._txtTotal.text = _loc2_.total;
};
_loc1.itemSelected = function(oEvent)
{
   var _loc2_ = oEvent.target._name;
   var _loc0_;
   var _loc3_;
   if((_loc0_ = _loc2_) === "_dgVentas")
   {
      _loc3_ = this._dgVentas.selectedItem.id;
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnClose:
         this.api.ui.unloadUIComponent("HistorialVentas");
         break;
      case this._btnBorrar:
         this.api.network.send("Eb");
         this.gapi.unloadUIComponent("HistorialVentas");
      default:
         return;
   }
};
_loc1.addProperty("data",function()
{
}
,_loc1.__set__Data);
_loc1._sNombre = "";
_loc1._nSpellID = 0;
_loc1._aVentas = new Array();
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
_global.dofus["\r\x14"].gapi.ui.HistorialVentas.CLASS_NAME = "HistorialVentas";
