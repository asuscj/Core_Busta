var _loc1 = dofus["\r\x14"].gapi.ui["\x1e\f\x03"]["\x1e\f\x02"].prototype;
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   var _loc6_;
   var _loc4_;
   var _loc5_;
   if(bUsed)
   {
      this._oItem = oItem;
      _loc6_ = _global.API.lang.getMapText(oItem.id);
      _loc4_ = _global.API.lang.getMapAreaInfos(_loc6_.sa);
      _loc5_ = _global.API.lang.getMapAreaText(_loc4_.areaID).n;
      this._lblCost.text = oItem.cost;
      this._lblCoords.text = oItem.coordinates;
      this._lblName.text = oItem.name;
      this._lblArea.text = _loc5_;
      if(oItem.areaName == undefined)
      {
         this._lblName._y = 3;
      }
      this._btnLocate._visible = true;
      this._mcKamas._visible = oItem.cost > 0;
      if(this._oItem.attackNear)
      {
         this._mcUnderAttack._visible = true;
         this._mcUnderAttackInteractivity._visible = true;
         var ref = this;
         this._mcUnderAttackInteractivity.onRollOver = function()
         {
            ref.over({target:this});
         };
         this._mcUnderAttackInteractivity.onRollOut = function()
         {
            ref.out({target:this});
         };
      }
      else
      {
         this._mcUnderAttack._visible = false;
         this._mcUnderAttackInteractivity._visible = false;
      }
   }
   else if(this._lblCost.text != undefined)
   {
      this._lblCost.text = "";
      this._lblCoords.text = "";
      this._lblName.text = "";
      this._lblArea.text = "";
      this._btnLocate._visible = false;
      this._mcUnderAttack._visible = false;
      this._mcUnderAttackInteractivity._visible = false;
      this._mcKamas._visible = false;
   }
};
