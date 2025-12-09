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
_global.dofus["\r\x14"].gapi.ui.Antibot = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Antibot.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Antibot.prototype;
_loc1.__set__Data = function(sValue)
{
   this._sData = sValue;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Antibot.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._btnAceptar.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._btnAceptar.label = this.api.lang.getText("ACCEPT");
   this._tiCodigo.restrict = "A-Za-z0-9";
};
_loc1.initData = function()
{
   var _loc2_ = this._sData;
   this._txtC1.text = _loc2_.split(",")[0];
   this._txtC2.text = _loc2_.split(",")[1];
   this._txtC3.text = _loc2_.split(",")[2];
   this._txtC4.text = _loc2_.split(",")[3];
   this._txtC5.text = _loc2_.split(",")[4];
   this._txtC6.text = _loc2_.split(",")[5];
};
_loc1.click = function(oEvent)
{
   var _loc0_;
   if((_loc0_ = oEvent.target) === this._btnAceptar)
   {
      this.api.network.send("?AV" + this._tiCodigo.text);
   }
};
_loc1.addProperty("data",function()
{
}
,_loc1.__set__Data);
_loc1._sCodigo = "";
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
_global.dofus["\r\x14"].gapi.ui.Antibot.CLASS_NAME = "Antibot";
