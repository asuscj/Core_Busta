var _loc1 = dofus.datacenter["\x0b\r"].prototype;
_loc1.__set__ogrine = function(bOgrine)
{
   _loc1._bOgrine = bOgrine;
   this.dispatchEvent({type:"playerOgrineChange",value:bOgrine});
   return _loc1._bOgrine;
};
_loc1.__get__ogrine = function()
{
   return _loc1._bOgrine;
};
_loc1.__set__mule = function(bOgrine)
{
   this._isMule = bOgrine;
};
_loc1.__get__mule = function()
{
   return this._isMule;
};
_loc1.__set__huntMatchmakingStatus = function(_loc2_)
{
   this._huntMatchmakingStatus = _loc2_;
   this.dispatchEvent({type:"huntMatchmakingStatusChanged",status:_loc2_});
};
_loc1.__get__huntMatchmakingStatus = function()
{
   return this._huntMatchmakingStatus;
};
_loc1.isHuntMatchmakingActive = function()
{
   return this._huntMatchmakingStatus != undefined && this._huntMatchmakingStatus.isActive;
};
_loc1.getObjeto = function(nID)
{
   return this.Inventory.findFirstItem("ID",nID);
};
_loc1.ArmaOneWindows = function(_loc2_)
{
   var _loc2_ = this.api.kernel.CharactersManager.getItemObjectFromData(_loc2_);
   this.setWeaponItem(_loc2_);
};
_loc1.canBoost = function(_loc2_, _loc3_)
{
   var _loc2_ = this.getBoostCostAndCountForCharacteristic(_loc2_,_loc3_).cost;
   if(this._nBoostPoints >= _loc2_ && _loc2_ != undefined)
   {
      return true;
   }
   return false;
};
_loc1.getBoostCostAndCountForCharacteristicV2 = function(var2)
{
   var _loc3_ = this.api.lang.getClassText(this._nGuild)["b" + var2];
   var _loc6_ = 1;
   var _loc7_ = 1;
   var _loc5_ = 0;
   switch(var2)
   {
      case 10:
         _loc5_ = this._nForce;
         break;
      case 11:
         _loc5_ = this._nVitality;
         break;
      case 12:
         _loc5_ = this._nWisdom;
         break;
      case 13:
         _loc5_ = this._nChance;
         break;
      case 14:
         _loc5_ = this._agility;
         break;
      case 15:
         _loc5_ = this._intelligence;
   }
   var _loc2_ = 0;
   var _loc4_;
   while(_loc2_ < _loc3_.length)
   {
      _loc4_ = _loc3_[_loc2_][0];
      if(_loc5_ < _loc4_)
      {
         _loc6_ = _loc3_[_loc2_][1];
         _loc7_ = _loc3_[_loc2_][2] == undefined ? 1 : _loc3_[_loc2_][2];
         break;
      }
      _loc2_ += 1;
   }
   var _loc8_ = _loc4_ - _loc5_;
   return {cost:_loc6_,count:_loc7_,possibleCount:_loc8_};
};
_loc1.clean = function()
{
   this.SpellsManager = new _global.palmad.dofus.managers.SpellsManager(this);
   this.InteractionsManager = new _global.palmad.dofus.managers.InteractionsManager(this,this.api);
   this.Inventory = new _global.palmad.ank.utils.ExtendedArray();
   this.ItemSets = new _global.palmad.ank.utils.ExtendedObject();
   this.Jobs = new _global.palmad.ank.utils.ExtendedArray();
   this.Spells = new _global.palmad.ank.utils.ExtendedArray();
   this.Emotes = new _global.palmad.ank.utils.ExtendedObject();
   this.InventoryByItemPositions = new _global.palmad.ank.utils.ExtendedObject();
   this.InventoryShortcuts = new _global.palmad.ank.utils.ExtendedObject();
   this.Titles = new _global.palmad.ank.utils.ExtendedObject();
   this.SetsRapidos = new _global.palmad.ank.utils.ExtendedArray();
   this.clearSummon();
   this._bCraftPublicMode = false;
   this._bInParty = false;
   _loc1._bOgrine = 0;
};
_loc1.getSet = function(nID)
{
   var _loc2_ = this.SetsRapidos.findFirstItem("ID",nID);
   if(_loc2_.index == -1)
   {
      return undefined;
   }
   return _loc2_.item;
};
_loc1.updateItem = function(_loc2_)
{
   var _loc2_ = this.Inventory.findFirstItem("ID",_loc2_.ID);
   if(_loc2_.item.ID == _loc2_.ID && _loc2_.item.maxSkin != _loc2_.maxSkin)
   {
      if(!_loc2_.item.isLeavingItem && _loc2_.isLeavingItem)
      {
         this.api.kernel.SpeakingItemsManager.triggerPrivateEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_ASSOCIATE);
      }
      if(_loc2_.item.isLeavingItem && _loc2_.isLeavingItem)
      {
         this.api.kernel.SpeakingItemsManager.triggerPrivateEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_LEVEL_UP);
      }
   }
   if(_loc2_ != undefined && _loc2_.isEquiped)
   {
      this.InventoryByItemPositions.removeItemAt(_loc2_.position);
   }
   this.Inventory.startNoEventDispatchsPeriod(dofus.Constants.DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
   this.Inventory.updateItem(_loc2_.index,_loc2_);
   if(_loc2_.isEquiped)
   {
      this.InventoryByItemPositions.addItemAt(_loc2_.position,_loc2_);
   }
};
_loc1.updateItemPosition = function(_loc2_, _loc3_)
{
   var _loc3_ = this.Inventory.findFirstItem("ID",_loc2_);
   var _loc2_ = _loc3_.item;
   if(_loc2_.position == 1)
   {
      this.setWeaponItem();
   }
   else if(_loc3_ == 1)
   {
      this.setWeaponItem(_loc2_);
   }
   if(_loc2_.isEquiped)
   {
      this.InventoryByItemPositions.removeItemAt(_loc2_.position);
   }
   _loc2_.position = _loc3_;
   this.Inventory.startNoEventDispatchsPeriod(dofus.Constants.DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
   this.Inventory.updateItem(_loc3_.index,_loc2_);
   if(_loc2_.isEquiped)
   {
      this.InventoryByItemPositions.addItemAt(_loc2_.position,_loc2_);
   }
};
_loc1.dropItem = function(_loc2_)
{
   var _loc3_ = this.Inventory.findFirstItem("ID",_loc2_);
   var _loc2_ = _loc3_.item;
   if(_loc2_ == undefined)
   {
      return undefined;
   }
   _loc2_.isRemovedFromInventory = true;
   if(_loc3_.item.position == 1)
   {
      this.setWeaponItem();
   }
   this.Inventory.startNoEventDispatchsPeriod(dofus.Constants.DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
   this.Inventory.removeItems(_loc3_.index,1);
   if(_loc2_.isEquiped)
   {
      this.InventoryByItemPositions.removeItemAt(_loc2_.position);
   }
};
_loc1.checkCanMoveItem = function()
{
   var _loc3_ = this.api.datacenter.Game.isRunning;
   var _loc2_ = this.api.datacenter.Exchange != undefined;
   if(_loc3_ || _loc2_)
   {
      this.gapi.loadUIComponent("AskOk","AskOkInventory",{title:this.api.lang.getText("INFORMATIONS"),text:this.api.lang.getText("CANT_MOVE_ITEM")});
   }
   return !(_loc3_ || _loc2_);
};
_loc1.addItem = function(_loc2_)
{
   if(_loc2_.position == 1)
   {
      this.setWeaponItem(_loc2_);
   }
   this.Inventory.startNoEventDispatchsPeriod(dofus.Constants.DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
   this.Inventory.push(_loc2_);
   if(_loc2_.isEquiped)
   {
      this.InventoryByItemPositions.addItemAt(_loc2_.position,_loc2_);
   }
};
_loc1.addSet = function(oItem)
{
   var _loc2_ = this.SetsRapidos.findFirstItem("ID",oItem.ID);
   if(_loc2_.index == -1)
   {
      this.SetsRapidos.push(oItem);
   }
   else
   {
      this.SetsRapidos.updateItem(_loc2_.index,oItem);
   }
};
_loc1.removeSet = function(nID)
{
   var _loc2_ = this.SetsRapidos.findFirstItem("ID",nID);
   if(_loc2_.index != -1)
   {
      this.SetsRapidos.removeItems(_loc2_.index,1);
   }
};
_loc1.addProperty("huntMatchmakingStatus",_loc1.__get__huntMatchmakingStatus,_loc1.__set__huntMatchmakingStatus);
_loc1.addProperty("isMule",_loc1.__get__mule,_loc1.__set__mule);
_loc1.addProperty("Ogrine",_loc1.__get__ogrine,_loc1.__set__ogrine);
