if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus.datacenter)
{
   _global.dofus.datacenter = new Object();
}
_global.dofus.datacenter.HuntMatchmakingStatus = function(_loc2_, _loc3_)
{
   super();
   this._bActive = _loc2_;
   this._sCurrentStatus = _loc3_;
};
var _loc1 = _global.dofus.datacenter.HuntMatchmakingStatus.prototype;
_loc1.__get__isActive = function()
{
   return this._bActive;
};
_loc1.__get__currentStatus = function()
{
   return this._sCurrentStatus;
};
_loc1.__set__isActive = function(_loc2_)
{
   return this._bActive = _loc2_;
};
_loc1.__set__currentStatus = function(_loc2_)
{
   return this._sCurrentStatus = _loc2_;
};
_loc1.addProperty("isActive",_loc1.__get__isActive,_loc1.__set__isActive);
_loc1.addProperty("currentStatus",_loc1.__get__currentStatus,_loc1.__set__currentStatus);
_loc1._bActive = false;
_loc1._sCurrentStatus = "";
ASSetPropFlags(_loc1,null,1);
