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
_global.dofus["\r\x14"].gapi.ui.CambiarNombre = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.CambiarNombre.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.CambiarNombre.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.CambiarNombre.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initInterface});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this._lblError._visible = false;
};
_loc1.initTexts = function()
{
   this._btnOk.label = this.api.lang.getText("OK");
   this._btnCancel.label = this.api.lang.getText("CANCEL_SMALL");
   this._lblTitle.text = this.api.lang.getText("ESCOGER_NEW_NOMBRE");
   this._txtHelp.text = this.api.lang.getText("CHOOSE_NICKNAME_HELP");
};
_loc1.addListeners = function()
{
   this._btnOk.addEventListener("click",this);
   this._btnCancel.addEventListener("click",this);
};
_loc1.nombreUsado = function(sValue)
{
   this._lblError._visible = true;
   this._lblError.text = this.api.lang.getText("NOMBRE_EXISTENTE");
};
_loc1.nombreError = function(sValue)
{
   this._lblError._visible = true;
   this._lblError.text = this.api.lang.getText("NOMBRE_ERROR");
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnOk":
         if(this._tiNickName.text == "")
         {
            this._lblError.text = this.api.lang.getText("NOMBRE_VACIO");
         }
         else
         {
            this.api.network.send("ZsN" + this._tiNickName.text);
         }
         break;
      case "_btnCancel":
         this.gapi.unloadUIComponent("CambiarNombre");
      default:
         return;
   }
};
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
_global.dofus["\r\x14"].gapi.ui.CambiarNombre.CLASS_NAME = "CambiarNombre";
