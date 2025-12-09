if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus.aks)
{
   _global.dofus.aks = new Object();
}
_global.dofus.aks.ChooseReward = function(oAKS, oAPI)
{
   super.initialize(oAKS,oAPI);
};
_global.dofus.aks.ChooseReward.prototype = new dofus.aks.Handler();
var _loc1_ = _global.dofus.aks.ChooseReward.prototype;
_loc1_.ChooseReward = function(_loc3_, oAPI)
{
   super.initialize(_loc3_,oAPI);
};
_loc1_.getReward = function(_loc2_)
{
   this.api.network.Items.selectRouletteItem(_loc2_);
};
_loc1_.onData = function(_loc2_)
{
   var _loc12_;
   var _loc11_;
   var _loc13_;
   var _loc4_;
   var _loc6_;
   var _loc5_;
   var _loc8_;
   var _loc10_;
   var _loc9_;
   var _loc7_;
   var _loc2_;
   var _loc3_;
   if(_loc2_.length != 0)
   {
      _loc12_ = new Array();
      _loc11_ = _loc2_.split("|");
      _loc13_ = _loc11_[3];
      _loc4_ = 0;
      while(_loc4_ < _loc11_.length)
      {
         _loc6_ = new Array();
         _loc5_ = _loc11_[_loc4_].split(";");
         _loc8_ = new dofus.datacenter["\f\f"](undefined,_loc5_[0]);
         _loc10_ = _loc5_[2].slice(14);
         _loc9_ = new dofus.datacenter["\f\f"](undefined,undefined,1,0,String(_loc10_));
         _loc7_ = _loc5_[1].split(",");
         _loc2_ = 0;
         while(_loc2_ < dofus.aks.ChooseReward.ICONS_NEEDED)
         {
            _loc6_.push(new dofus.datacenter["\f\f"](undefined,_loc7_[_loc2_]));
            _loc2_ += 1;
         }
         _loc3_ = new Object();
         _loc3_.fakeItems = _loc6_;
         _loc3_.realItem = _loc8_;
         _loc3_.bonusEffects = _loc9_;
         _loc12_.push(_loc3_);
         _loc4_ += 1;
      }
      if(this.api.ui.getUIComponent("ChooseReward") == undefined)
      {
         this.api.ui.loadUIComponent("ChooseReward","ChooseReward",{items:_loc12_,currentRoom:_loc13_},{bAlwaysOnTop:true});
      }
   }
};
_global.dofus.aks.ChooseReward.ICONS_NEEDED = 6;
