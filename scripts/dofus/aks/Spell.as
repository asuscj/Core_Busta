var _loc1 = dofus.aks.Spells.prototype;
_loc1.onSpellMove = function(_loc2_)
{
   var _loc2_ = _loc2_.split("|");
   var _loc4_ = Number(_loc2_[0]);
   var _loc3_ = Number(_loc2_[1]);
   this.api.ui.getUIComponent("Banner").shortcuts.spellMove(_loc4_,_loc3_);
};
_loc1.onSpellRemove = function(_loc2_)
{
   var _loc2_ = Number(_loc2_);
   this.api.ui.getUIComponent("Banner").shortcuts.spellRemove(_loc2_);
};
_loc1.updateSummons = function(_loc2_)
{
   this.api.datacenter.Player.SummonedCreatures = _loc2_;
};
_loc1.onSpellCooldown = function(_loc2_)
{
   var _loc5_ = _loc2_.split(";");
   var _loc2_ = Number(_loc5_[0]);
   var _loc6_ = Number(_loc5_[1]);
   var _loc7_ = this.api.datacenter.Player.Spells.findFirstItem("ID",_loc2_).item;
   var _loc3_;
   var _loc4_;
   if(_loc7_ != undefined)
   {
      _loc3_ = this.api.datacenter.Player.SpellsManager;
      if(_loc3_.hasSpellLaunched(_loc2_))
      {
         _loc4_ = _loc3_.getSpellLaunched(_loc2_);
      }
      else
      {
         _loc4_ = new dofus.datacenter["\x0b\x18"](_loc2_,undefined);
         _loc3_.addLaunchedSpell(_loc4_);
      }
      _loc4_.remainingTurn = _loc6_;
      _loc3_.dispatchEvent({type:"nextTurn"});
   }
};
_loc1.onList2 = function(Packet)
{
   var _loc8_ = Packet.split(",");
   var _loc9_ = _loc8_[0];
   var _loc13_ = this.api.datacenter.Sprites.getItemAt(_loc9_);
   var _loc6_ = _loc8_[1];
   var _loc12_ = _loc8_[2];
   var _loc7_ = _loc8_[3];
   var _loc5_;
   var _loc11_;
   var _loc10_;
   var _loc2_;
   var _loc3_;
   var _loc4_;
   if(_loc9_ == this.api.datacenter.Player.ID)
   {
      _loc5_ = this.api.datacenter.Player.SpellsManager;
      _loc11_ = this.api.gfx.mapHandler.getCellData(_loc12_).spriteOnID;
      _loc10_ = new dofus.datacenter["\x0b\x18"](_loc6_,_loc11_);
      _loc5_.addLaunchedSpell(_loc10_);
      _loc10_.remainingTurn = _loc7_;
      _loc2_ = _loc5_._aSpellsDelay.length;
      while(true)
      {
         _loc2_ -= 1;
         if(_loc2_ < 0)
         {
            break;
         }
         _loc3_ = _loc5_._aSpellsDelay[_loc2_];
         _loc4_ = _loc3_.spell;
         if(_loc4_.ID == _loc6_)
         {
            _loc3_.remainingTurn = _loc7_;
         }
      }
   }
};
_loc1.spellRemove = function(_loc2_)
{
   this.aks.send("SR" + _loc2_);
};
_loc1.Delete = function(_loc2_)
{
   this.aks.send("SMD" + _loc2_,false);
};
