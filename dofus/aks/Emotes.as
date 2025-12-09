var _loc1 = dofus.aks.Emotes.prototype;
_loc1.onList = function(_loc2_)
{
   var _loc7_ = _loc2_.split("|");
   var _loc6_ = Number(_loc7_[0]);
   var _loc5_ = Number(_loc7_[1]);
   var _loc4_ = this.api.datacenter.Player;
   _loc4_.clearEmotes();
   var _loc3_ = 0;
   while(_loc3_ < 32)
   {
      if((_loc6_ >> _loc3_ & 1) == 1)
      {
         if(this.api.lang.getEmoteText(_loc3_ + 1) != undefined)
         {
            _loc4_.addEmote(_loc3_ + 1);
         }
      }
      _loc3_ += 1;
   }
   var _loc2_ = 0;
   while(_loc2_ < 32)
   {
      if((_loc5_ >> _loc2_ & 1) == 1)
      {
         if(this.api.lang.getEmoteText(_loc2_ + 1) != undefined)
         {
            _loc4_.addEmote(_loc2_ + 1);
         }
      }
      _loc2_ += 1;
   }
};
