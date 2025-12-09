#initclip 113
var _loc1 = dofus["\r\x14"].gapi.controls.PlayerWeight.prototype;
_loc1.createChildren = function()
{
   this.player = this.api.datacenter.Player;
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._pbWeight.addEventListener("over",this);
   this._pbWeight.addEventListener("out",this);
};
_loc1.initData = function(p)
{
   trace("initdata playerweigth " + p);
   if(p != undefined)
   {
      this.player = p;
   }
   if(this._sStyleName != undefined)
   {
      this._pbWeight.styleName = this._sStyleName;
   }
   this.currentWeightChanged({value:this.player.currentWeight});
};
_loc1.currentWeightChanged = function(_loc2_)
{
   var _loc3_ = this.player.maxWeight;
   var _loc4_ = _loc2_.value;
   trace("currentWeightChanged playerweigth " + _loc4_ + "/" + _loc3_);
   this._nCurrentWeight = _loc4_;
   this._pbWeight.maximum = _loc3_;
   this._pbWeight.value = _loc4_;
};
#endinitclip
