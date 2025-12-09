_global.dofus["\r\x14"].gapi.controls.HistoryCraftItems = function()
{
   super();
};
dofus["\r\x14"].gapi.controls.HistoryCraftItems.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.controls.HistoryCraftItems.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   var _loc3_;
   if(bUsed)
   {
      this.Nombre = oItem.name;
      this._ldr._visible = false;
      if(oItem.exito == "1")
      {
         this._lblName.styleName = "GreenLeftSmallLabel";
         this._lblName.text = oItem.name;
      }
      else if(oItem.exito == "0")
      {
         this._lblName.styleName = "RedLeftSmallLabel";
         this._lblName.text = oItem.name;
      }
      else if(oItem.exito == "2")
      {
         this._lblName.styleName = "BrownLeftSmallLabel";
         this._lblName.text = this.api.lang.getText(oItem.name);
      }
      else
      {
         this._lblName.styleName = "BrownCenterSmallBoldLabel";
         this._ldr._visible = true;
         _loc3_ = new dofus.datacenter["\f\f"](0,Number(oItem.name),1,-1);
         this._lblName.text = _loc3_.name;
         this._ldr.contentPath = _loc3_.iconFile;
      }
   }
   else if(this._lblName.text != undefined)
   {
      this._lblPosition.text = "";
      this._lblName.text = "";
      this._lblEstado.text = "";
      this._btnInfo._visible = false;
      this._misok._visible = false;
      this._misnok._visible = false;
      this._ldr._visible = false;
   }
};
_loc1.click = function(oEvent)
{
};
_loc1.out = function(oEvent)
{
   api = _global.API;
   api.ui.hideTooltip();
};
_loc1.over = function(oEvent)
{
};
_loc1.addListeners = function()
{
};
_loc1.init = function()
{
   super.init(false);
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
_loc1.Nombre = "";
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
