_global.dofus["\r\x14"].gapi.ui.EscogerNivel = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.EscogerNivel.prototype = new ank.gapi.core["\x1e\n\r"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.EscogerNivel.prototype;
_loc1.__set__Nivel = function(nValue)
{
   this._nNivel = nValue;
};
_loc1.init = function()
{
   super.init(false,"EscogerNivel");
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.initData = function()
{
};
_loc1.addListeners = function()
{
   this._btnOk.addEventListener("click",this);
   this._btnMasNivel.addEventListener("click",this);
   this._btnMenosNivel.addEventListener("click",this);
   this._btnCerrar.addEventListener("click",this);
   this._btnBonta.addEventListener("click",this);
   this._btnBrakmar.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._btnOk.label = "OK";
   this._lblNivel.text = this.api.lang.getText("LEVEL");
   this._lblAlineacion.text = this.api.lang.getText("ALIGNMENT");
   this._txtNivel.text = this._nNivel;
   this._txtNivel.setFocus();
   this._winEscogerNivel.title = this.api.lang.getText("ESCOGER_NIVEL");
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnOk:
         this.api.network.send("ZP" + (!this._btnBonta.selected ? (!this._btnBrakmar.selected ? "0" : "2") : "1"));
         break;
      case this._btnCerrar:
         break;
      case this._btnMenosNivel:
         if(_global.parseInt(this._txtNivel.text) > this._nNivel)
         {
            this._txtNivel.text = _global.parseInt(this._txtNivel.text) - 1;
         }
         break;
      case this._btnMasNivel:
         if(_global.parseInt(this._txtNivel.text) < 200)
         {
            this._txtNivel.text = _global.parseInt(this._txtNivel.text) + 1;
         }
         break;
      case this._btnBonta:
      case this._btnBrakmar:
         this._btnBonta.selected = oEvent.target == this._btnBonta;
         this._btnBrakmar.selected = oEvent.target == this._btnBrakmar;
      default:
         return;
   }
   this.unloadThis();
};
_loc1.addProperty("nivel",function()
{
}
,_loc1.__set__Nivel);
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
_global.dofus["\r\x14"].gapi.ui.EscogerNivel.CLASS_NAME = "EscogerNivel";
