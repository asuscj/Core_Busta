var _loc1 = dofus["\r\x14"].gapi.ui["\x1e\t\x18"]["\x1e\t\x17"].prototype;
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   var _loc4_;
   var _loc5_;
   var _loc7_;
   var _loc6_;
   if(bUsed)
   {
      this._oItem = oItem;
      _loc4_ = _global.API.lang.getMapText(oItem.id);
      _loc5_ = _global.API.lang.getMapAreaInfos(_loc4_.sa);
      _loc7_ = _global.API.lang.getMapSubAreaText(_loc4_.sa).n;
      _loc6_ = _global.API.lang.getMapAreaText(_loc5_.areaID).n;
      this._lblCost.text = oItem.cost != 0 ? new ank["\x1e\n\x07"]["\x0e\x1c"](oItem.cost).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"),3) : "-";
      this._mcKamas._visible = oItem.cost > 0;
      this._btnLocate.label = "[" + oItem.coordinates + "]";
      this._lblArea.text = _loc6_;
      this._lblSubarea.text = _loc7_;
      this._mcRespawn._visible = oItem.isRespawn;
      this._mcCurrent._visible = oItem.isCurrent;
      this._btnLocate._visible = true;
   }
   else if(this._lblCost.text != undefined)
   {
      this._lblCost.text = "";
      this._btnLocate.label = "";
      this._mcRespawn._visible = false;
      this._mcCurrent._visible = false;
      this._mcKamas._visible = false;
      this._btnLocate._visible = false;
   }
};
