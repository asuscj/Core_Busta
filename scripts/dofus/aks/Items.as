var _loc1 = dofus.aks.Items.prototype;
_loc1.setsRapidos = function(sData)
{
   var _loc10_ = sData.split("*");
   var _loc4_;
   var _loc3_;
   var _loc6_;
   var _loc8_;
   var _loc5_;
   var _loc9_;
   var _loc7_;
   for(var _loc16_ in _loc10_)
   {
      _loc4_ = _loc10_[_loc16_];
      if(_loc4_.length > 0)
      {
         _loc3_ = _loc4_.split("|");
         _loc6_ = _global.parseInt(_loc3_[0]);
         _loc8_ = _loc3_[1];
         _loc5_ = _global.parseInt(_loc3_[2]);
         _loc9_ = _loc3_[3];
         _loc7_ = {ID:_loc6_,name:_loc8_,icono:_loc5_,iconFile:dofus.Constants.SETS_RAPIDOS_ICONS_PATH + _loc5_ + ".swf",data:_loc9_};
         this.api.datacenter.Player.addSet(_loc7_);
      }
   }
};
_loc1.equipItem = function(_loc2_)
{
   if(_loc2_.isEquiped || _loc2_.isShortcut)
   {
      return false;
   }
   var _loc11_ = _loc2_.superType;
   var _loc5_;
   if(_loc2_.type != 83)
   {
      _loc5_ = 0;
      while(_loc5_ < dofus["\r\x14"].gapi.ui.Inventory.SUPERTYPE_NOT_EQUIPABLE.length)
      {
         if(dofus["\r\x14"].gapi.ui.Inventory.SUPERTYPE_NOT_EQUIPABLE[_loc5_] == _loc11_)
         {
            return false;
         }
         _loc5_ += 1;
      }
   }
   var _loc4_ = this.api.lang.getSlotsFromSuperType(_loc2_.superType);
   var _loc9_;
   var _loc6_ = 0;
   var _loc7_;
   var _loc8_;
   while(_loc6_ < _loc4_.length)
   {
      _loc7_ = Number(_loc4_[_loc6_]);
      _loc8_ = this.api.datacenter.Player.InventoryByItemPositions.getItemAt(_loc7_) == undefined;
      if(_loc8_)
      {
         _loc9_ = _loc7_;
         break;
      }
      _loc6_ += 1;
   }
   var _loc13_ = _loc9_ == undefined;
   var _loc10_;
   var _loc3_;
   if(_loc13_)
   {
      _loc10_ = 9744;
      _loc3_ = 0;
      while(_loc3_ < _loc4_.length)
      {
         if(this.api.kernel.GameManager.getLastModified(_loc4_[_loc3_]) < _loc10_)
         {
            _loc10_ = this.api.kernel.GameManager.getLastModified(_loc4_[_loc3_]);
            _loc9_ = _loc4_[_loc3_];
         }
         _loc3_ += 1;
      }
   }
   if(_loc9_ == undefined || _global.isNaN(_loc9_))
   {
      return false;
   }
   this.api.network.Items.movement(_loc2_.ID,_loc9_);
   return true;
};
_loc1.updateCandy = function(_loc2_)
{
   if(_loc2_.length == 0)
   {
      return null;
   }
   var _loc3_ = _loc2_.split("~");
   var _loc7_ = _global.parseInt(_loc3_[0],16);
   var _loc6_ = _global.parseInt(_loc3_[1],16);
   var _loc9_ = _global.parseInt(_loc3_[2],16);
   var _loc8_ = _loc3_[3].length == 0 ? -1 : _global.parseInt(_loc3_[3],16);
   var _loc5_ = _loc3_[4];
   var _loc4_ = new dofus.datacenter["\f\f"](_loc7_,_loc6_,_loc9_,_loc8_,_loc5_);
   _loc4_.priceMultiplicator = this.api.lang.getConfigText("SELL_PRICE_MULTIPLICATOR");
   this.api.datacenter.Player.updateItem(_loc4_);
};
_loc1.useItemQ = function(sData)
{
   if(!oEvent.item.canUse || !this.api.datacenter.Player.canUseObject)
   {
      return undefined;
   }
   this.api.network.send("Ot" + oEvent.item.ID);
};
_loc1.onAccessories = function(sExtraData)
{
   var _loc12_ = sExtraData.split("|");
   var _loc11_ = _loc12_[0];
   var _loc7_ = _loc12_[1].split(",");
   var _loc10_ = new Array();
   var _loc3_ = 0;
   var _loc5_;
   var _loc6_;
   var _loc8_;
   var _loc4_;
   var _loc9_;
   while(_loc3_ < _loc7_.length)
   {
      if(_loc7_[_loc3_].indexOf("~") != -1)
      {
         _loc5_ = _loc7_[_loc3_].split("~");
         _loc6_ = _global.parseInt(_loc5_[0],16);
         _loc8_ = _global.parseInt(_loc5_[1]);
         _loc4_ = _global.parseInt(_loc5_[2]) - 1;
         if(_loc4_ < 0)
         {
            _loc4_ = 0;
         }
      }
      else
      {
         _loc6_ = _global.parseInt(_loc7_[_loc3_],16);
         _loc8_;
         _loc4_;
      }
      if(!_global.isNaN(_loc6_))
      {
         _loc9_ = new dofus.datacenter["\x11"](_loc6_,_loc8_,_loc4_);
         _loc10_[_loc3_] = _loc9_;
      }
      _loc3_ += 1;
   }
   var _loc13_ = this.api.datacenter.Sprites.getItemAt(_loc11_);
   _loc13_.accessories = _loc10_;
   this.api.gfx.setForcedSpriteAnim(_loc11_,"static");
   if(_loc11_ == this.api.datacenter.Player.ID)
   {
      this.api.datacenter.Player.updateCloseCombat();
   }
};
