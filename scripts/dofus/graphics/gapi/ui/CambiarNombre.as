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
dofus["\r\x14"].gapi.ui.CambiarNombre.prototype = new ank.gapi.core["\x1e\n\r"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.CambiarNombre.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.CambiarNombre.CLASS_NAME);
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
   this._btnOk.addEventListener("click",this);
   this._csColors.addEventListener("change",this);
};
_loc1.initTexts = function()
{
   this._winBg.title = this.api.datacenter.Player.Name + ", " + this.api.lang.getText("PANEL_CAMBIAR_NOMBREPJ");
   this._txtNombre.restrict = "a-zA-Z\\-";
   this._txtNombre.maxChars = 20;
   this._txtTitulo.text = this.api.lang.getText("CHANGE_NAME");
   this._btnOk.label = "OK";
};
_loc1.initData = function()
{
   this._txtNombre.textColor = this._nColor;
   this._csColors.applyColor(this._nColor,1);
};
_loc1.__set__color = function(nColor)
{
   this._nColor = nColor;
};
_loc1.setColors = function(oColors)
{
   this._nColor = Number(oColors.color1);
   this._txtNombre.textColor = this._nColor;
};
_loc1.change = function(oEvent)
{
   var _loc0_;
   if((_loc0_ = oEvent.target) === this._csColors)
   {
      this.setColors(oEvent.value);
   }
};
_loc1.close = function()
{
   this.gapi.unloadUIComponent("Panel");
   this.unloadThis();
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnOk:
         if(this._txtNombre.text == undefined || this._txtNombre.text == "")
         {
            return undefined;
         }
         this.api.network.send("ZsN" + this._txtNombre.text + ";" + this._nColor);
         break;
      case this._btnCerrar:
         this.gapi.unloadUIComponent("Panel");
         this.unloadThis();
   }
};
_loc1.addProperty("color",function()
{
}
,_loc1.__set__color);
ASSetPropFlags(_loc1,null,1);
_loc1._nColor = -1;
_global.dofus["\r\x14"].gapi.ui.CambiarNombre.CLASS_NAME = "CambiarNombre";
