#initclip 34
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
if(!dofus["\r\x14"].gapi.ui.titulos)
{
   _global.dofus["\r\x14"].gapi.ui.titulos = new Object();
}
_global.dofus["\r\x14"].gapi.ui.titulos.TitulosItem = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.titulos.TitulosItem.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.titulos.TitulosItem.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this._oItem = oItem;
      this._lblName.text = oItem.name;
      this.chek._visible = oItem.owner == true;
      this.candado._visible = oItem.owner == false;
      this._mcF._visible = true;
   }
   else if(this._lblName.text != "")
   {
      this._lblName.text = "";
      this._mcSombra._visible = false;
      this._mcF._visible = false;
   }
};
_loc1.init = function()
{
   super.init(false);
   this.chek._visible = false;
   this.candado._visible = false;
   this._mcF._visible = false;
};
loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
ASSetPropFlags(_loc1,null,1);
#endinitclip