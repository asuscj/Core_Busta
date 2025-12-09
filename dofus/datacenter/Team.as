var _loc1 = dofus.datacenter.Team.prototype;
_loc1.refreshSwordSprite = function()
{
   if(this.type != 0)
   {
      return undefined;
   }
   var _loc8_ = _global.API;
   var _loc4_ = false;
   var _loc5_ = _loc8_.ui.getUIComponent("Party");
   var _loc3_;
   for(var _loc6_ in this._aPlayers)
   {
      _loc3_ = this._aPlayers[_loc6_];
      if(_loc5_.getMember(_loc3_.id) != undefined)
      {
         _loc4_ = true;
         break;
      }
   }
   var _loc7_ = dofus.Constants.getTeamFileFromType(this.type,this.alignment.value,_loc4_);
   if(_loc7_ != this.gfxFile)
   {
      this.gfxFile = _loc7_;
      this.mc.draw();
   }
};
