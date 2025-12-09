var _loc1 = _global.dofus["\x0b\b"].InteractionsManager.prototype;
_loc1.calculatePath = function(mapHandler, _loc3_, _loc4_, _loc5_, _loc6_, _loc7_)
{
   if(!_loc6_)
   {
      this.api.gfx.mapHandler.resetEmptyCells();
   }
   var _loc7_ = this._playerManager.data.cellNum;
   var _loc2_ = mapHandler.getCellData(_loc3_);
   var _loc8_ = _loc2_.spriteOnID;
   var _loc5_ = !_loc6_ && _loc8_ != undefined;
   trace("INTERACTION calculatePath _loc8_ " + _loc7_ + " _loc10_ " + _loc8_ + " _loc11_ " + _loc5_);
   var _loc4_;
   var _loc3_;
   if(_loc5_ && !this.api.datacenter.Game.isFight)
   {
      _loc4_ = dofus["\r\x14"].gapi.ui.Party(this.api.ui.getUIComponent("Party"));
      _loc3_ = false;
      if(_loc4_ != undefined)
      {
         for(_loc6_ in _loc2_.allSpritesOn)
         {
            if(_loc2_.allSpritesOn[_loc6_] && _loc4_.getMember(String(_loc6_)) != undefined)
            {
               _loc3_ = true;
               break;
            }
         }
      }
      if(!_loc3_)
      {
         _loc5_ = false;
      }
   }
   trace("INTERACTION calculatePath _loc11_ " + _loc5_);
   if(_loc5_)
   {
      return false;
   }
   if(_loc2_.movement == 0)
   {
      return false;
   }
   if(_loc2_.movement == 1 && _loc5_)
   {
      return false;
   }
   trace("INTERACTION calculatePath this._state " + this._state);
   switch(this._state)
   {
      case dofus["\x0b\b"].InteractionsManager.STATE_MOVE_SINGLE:
         this.api.datacenter.Basics.interactionsManager_path = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].pathFind(this.api,mapHandler,_loc7_,_loc3_,{bAllDirections:_loc7_,bIgnoreSprites:_loc6_});
         if(this.api.datacenter.Basics.interactionsManager_path != null)
         {
            return true;
         }
         return false;
         break;
      case dofus["\x0b\b"].InteractionsManager.STATE_SELECT:
         if(_loc4_)
         {
            this.api.gfx.select(this.convertToSimplePath(this.api.datacenter.Basics.interactionsManager_path),dofus.Constants.CELL_PATH_SELECT_COLOR);
            return this.api.datacenter.Basics.interactionsManager_path != null;
         }
         this.api.datacenter.Basics.interactionsManager_path = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].pathFind(this.api,mapHandler,_loc7_,_loc3_,{bAllDirections:false,nMaxLength:(_loc5_ ? this._playerManager.data.MP : 500)});
         this.api.gfx.unSelect(true);
         this.api.gfx.select(this.convertToSimplePath(this.api.datacenter.Basics.interactionsManager_path),dofus.Constants.CELL_PATH_OVER_COLOR);
   }
   return false;
};
