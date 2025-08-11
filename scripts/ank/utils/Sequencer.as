var _loc1 = ank["\x1e\n\x07"]["\x1e\x12\x14"].prototype;
_loc1.addAction = function(_loc2_, bWaitEnd, mRefObject, fFunction, aParams, nDuration, _loc8_)
{
   var _loc2_ = new Object();
   _loc7.debugId = _loc2_;
   _loc2_.id = this.getActionIndex();
   _loc2_.waitEnd = bWaitEnd;
   _loc2_.object = mRefObject;
   _loc2_.fn = fFunction;
   _loc2_.parameters = aParams;
   _loc2_.duration = nDuration;
   _loc2_.forceTimeout = bWaitEnd && (_loc8_ != undefined && _loc8_);
   this._aActions.push(_loc2_);
};
