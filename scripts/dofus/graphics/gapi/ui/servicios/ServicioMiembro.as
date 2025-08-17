#initclip 107
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
if(!dofus["\r\x14"].gapi.ui.servicios)
{
   _global.dofus["\r\x14"].gapi.ui.servicios = new Object();
}
_global.dofus["\r\x14"].gapi.ui.servicios.ServicioMiembro = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.servicios.ServicioMiembro.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.servicios.ServicioMiembro.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this._oItem = oItem;
      this._nID = oItem.id;
      this._lblDescripcion.text = oItem.descripcion;
      if(_global.NO_CREDITOS)
      {
         this._lblCreditos.text = "";
         this._btnCreditos._visible = false;
      }
      else if(this._oItem.creditos == "---")
      {
         this._lblCreditos.text = oItem.creditos;
         this._btnCreditos._visible = false;
      }
      else
      {
         this._btnCreditos._visible = true;
         this._btnCreditos.label = oItem.creditos;
      }
      if(this._oItem.ogrinas == "---")
      {
         this._lblOgrinas.text = oItem.ogrinas;
         this._btnOgrinas._visible = false;
      }
      else
      {
         this._btnOgrinas._visible = true;
         this._btnOgrinas.label = oItem.ogrinas;
      }
      this._btnOk._visible = true;
   }
   else if(this._nID != -1)
   {
      this._lblDescripcion.text = "";
      this._lblCreditos.text = "";
      this._lblOgrinas.text = "";
      this._btnOk._visible = false;
      this._btnCreditos._visible = false;
      this._btnOgrinas._visible = false;
   }
};
_loc1.init = function()
{
   super.init(false);
   this._btnOk._visible = false;
   this._btnCreditos._visible = false;
   this._btnOgrinas._visible = false;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.addListeners = function()
{
   this._btnOk.addEventListener("click",this);
   this._btnCreditos.addEventListener("click",this);
   this._btnOgrinas.addEventListener("click",this);
};
_loc1.click = function(oEvent)
{
   var _loc2_;
   switch(oEvent.target)
   {
      case this._btnCreditos:
         this._btnCreditos.selected = true;
         this._btnOgrinas.selected = false;
         this._nMedioPago = 1;
         break;
      case this._btnOgrinas:
         this._btnCreditos.selected = false;
         this._btnOgrinas.selected = true;
         this._nMedioPago = 2;
         break;
      case this._btnOk:
         _loc2_ = this._mcList.gapi.api;
         if((this._oItem.creditos != "---" || this._oItem.ogrinas != "---") && this._nMedioPago == 0)
         {
            _loc2_.kernel.showMessage(_loc2_.lang.getText("PANEL_OGRINAS"),_loc2_.lang.getText("ESGOGE_MEDIO_PAGO"),"ERROR_BOX");
            break;
         }
         switch(this._nMedioPago)
         {
            case 1:
               _loc2_.kernel.showMessage(_loc2_.lang.getText("PANEL_OGRINAS"),_loc2_.lang.getText("CONFIRMAR_GASTO") + " " + this._lblDescripcion.text + ", " + this._oItem.creditos + " " + _loc2_.lang.getText("CREDITOS"),"CAUTION_YESNO",{listener:this});
               break; 
            case 2:
               _loc2_.kernel.showMessage(_loc2_.lang.getText("PANEL_OGRINAS"),_loc2_.lang.getText("CONFIRMAR_GASTO") + " " + this._lblDescripcion.text + ", " + this._oItem.ogrinas + " " + _loc2_.lang.getText("OGRINAS"),"CAUTION_YESNO",{listener:this});
               break; 
            default:
               this.yes();
               break; 
         }
         break; // break para el "case this._btnOk"
   }
};
_loc1.yes = function(oEvent)
{
   this._mcList.gapi.api.network.send("Zs" + this._nID + ";" + this._nMedioPago);
};
_loc1._nMedioPago = 0;
_loc1._nID = -1;
_loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
ASSetPropFlags(_loc1,null,1);
#endinitclip