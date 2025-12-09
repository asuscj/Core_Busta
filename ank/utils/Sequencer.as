#initclip 191
var _loc1 = ank["\x1e\n\x07"]["\x1e\x12\x14"].prototype;
_loc1.addAction = function(debugId, bWaitEnd, mRefObject, fFunction, aParams, nDuration)
{
   // Fix decompilation: avoid parameter shadowing and undefined _loc7
   var o = new Object();
   o.id = this.getActionIndex();
   o.debugId = debugId;
   o.waitEnd = bWaitEnd;
   o.object = mRefObject;
   o.fn = fFunction;
   o.parameters = aParams;
   o.duration = nDuration;
   this._aActions.push(o);
};
_loc1.execute = function(_loc2_)
{
   // Fix for cache clear issue - allow forced execution even when playing
   if(this._bPlaying && !_loc2_)
   {
      _global.API.kernel.debug("Sequencer already playing - checking if we can continue");
      // Only return if we have actions in queue and not forcing
      if(this._aActions.length > 0) {
         return undefined;
      }
      // If no actions in queue, reset and continue
      this._bPlaying = false;
   }
   this._bPlaying = true;
   var _loc4_ = true;
   var _loc3_;
   while(_loc4_)
   {
      if(this._aActions.length > 0)
      {
         _loc3_ = this._aActions[0];
         if(_loc3_.waitEnd)
         {
            _loc3_.object[this._unicID] = _loc3_.id;
         }
         _loc3_.fn.apply(_loc3_.object,_loc3_.parameters);
         if(!_loc3_.waitEnd)
         {
            this.onActionEnd(true);
         }
         else
         {
            _loc4_ = false;
            ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(_loc3_.object,"sequencer",this,this.onActionTimeOut,_loc3_.duration != undefined ? _loc3_.duration * this._nTimeModerator : this._nTimeout,[_loc3_]);
         }
      }
      else
      {
         _loc4_ = false;
         this.stop();
      }
   }
};
#endinitclip
