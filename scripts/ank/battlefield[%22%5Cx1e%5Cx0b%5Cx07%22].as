#initclip 49
var _loc1 = ank.battlefield["\x1e\x0b\x07"].prototype;
_loc1["\x1e\x0b\x07"] = function(_loc2_, _loc3_, _loc4_)
{
   this.initialize(_loc2_,_loc3_,_loc4_);
};
_loc1.initialize = function(_loc2_, _loc3_, _loc4_)
{
   this._mcBattlefield = _loc2_;
   this._mcContainer = _loc3_;
   this._oDatacenter = _loc4_;
};
_loc1.clear = function()
{
   for(var _loc2_ in this._mcContainer)
   {
      this._mcContainer[_loc2_].removeMovieClip();
   }
};
_loc1.addBubble = function(sID, nX, nY, _loc5_, _loc6_)
{
   var _loc4_ = (this._oDatacenter.Map.width - 1) * ank.battlefield.Constants.CELL_WIDTH;
   this.removeBubble(sID);
   this.api.kernel.showMessage(undefined,"Bubble: " + _loc6_,"COMMANDS_CHAT");
   var _loc3_ = this._mcContainer.attachClassMovie(_loc6_ == ank.battlefield["\x1e\x0b\x07"].BUBBLE_TYPE_THINK ? ank.battlefield.mc["\x14\x0b"] : ank.battlefield.mc["\x14\f"],"bubble" + sID,this._mcContainer.getNextHighestDepth(),[_loc5_,nX,nY,_loc4_]);
   var _loc2_ = this._mcBattlefield.getZoom();
   if(_loc2_ < 100)
   {
      _loc3_._xscale = _loc3_._yscale = 10000 / _loc2_;
   }
};
_loc1.removeBubble(sID);
var _loc3_ = this._mcContainer["bubble" + sID];
_loc3_.remove();
_loc1.BUBBLE_TYPE_CHAT = 1;
_loc1.BUBBLE_TYPE_THINK = 2;
_loc1._aVisibleTypes = [true,true,true,true,true,true,true,true,true,true,true,true,true];
#endinitclip