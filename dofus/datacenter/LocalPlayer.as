#initclip 126
var _loc1 = dofus.datacenter["\x0b\r"].prototype;
this._bHeroes = new ank["\x1e\n\x07"]["\x0f\x01"]();
_loc1.__set__hero = function(bHero)
{
   _loc1._bHero = bHero;
   this.dispatchEvent({type:"infoHero",value:bHero});
};
_loc1.__get__hero = function()
{
   return _loc1._bHero;
};
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
_loc1.getObjeto = function(nID)
{
   return this.Inventory.findFirstItem("ID",nID);
};
__loc1.__set__ttgCollection = function(bOgrine)
{
   this.ttgCollection = bOgrine;
};
_loc1.addHeroe = function(oData)
{
   // Normalizar claves de ID para consistencia
   var newId = Number(oData.id != undefined ? oData.id : oData.ID);
   if(_global.isNaN(newId))
   {
      // Si no trae id válido, intentamos no romper la UI
      this.HeroesList.push(oData);
      this.arrangeHeroes();
      return;
   }
   // De-duplicar: actualizar si ya existe, si no, insertar
   var existing = this.HeroesList.findFirstItem("id", newId);
   if(existing.index == -1)
   {
      existing = this.HeroesList.findFirstItem("ID", newId);
   }
   if(existing.index != -1)
   {
      // Actualizar el item existente con los nuevos datos (shallow merge)
      var current = existing.item;
      for(var k in oData){ current[k] = oData[k]; }
      this.HeroesList.updateItem(existing.index, current);
   }
   else
   {
      // Asegurar que el objeto tenga ambas claves para búsquedas futuras
      oData.ID = newId;
      oData.id = newId;
      this.HeroesList.push(oData);
   }
   // Reordenar según el líder actual
   this.arrangeHeroes();
};
_loc1.getHeroes = function()
{
   return this.HeroesList;
};
_loc1.setHeroes = function(sHeroesList)
{
   this.HeroesList = sHeroesList;
   this.arrangeHeroes();
};
_loc1.clearHeroes = function()
{
   this.HeroesList = new _global.palmad.ank.utils.ExtendedArray();
};
_loc1.arrangeHeroes = function()
{
   if(this.HeroesList == undefined)
   {
      this.HeroesList = new _global.palmad.ank.utils.ExtendedArray();
   }
   // El líder actual es this.ID; moverlo a la primera posición,
   // eliminando duplicados por ID/id en el proceso (comportamiento de pila)
   var leaderId = Number(this.ID);
   if(_global.isNaN(leaderId)) return;

   // 1) Eliminar duplicados manteniendo el primer encuentro
   var seen = {};
   var compacted = new _global.palmad.ank.utils.ExtendedArray();
   for(var i = 0; i < this.HeroesList.length; i++)
   {
      var h = this.HeroesList[i];
      var hid = Number(h.id != undefined ? h.id : h.ID);
      if(_global.isNaN(hid)) continue;
      if(seen[hid]){ continue; }
      seen[hid] = true;
      // Normalizar claves
      h.ID = hid; h.id = hid;
      compacted.push(h);
   }
   this.HeroesList = compacted;

   // 2) Buscar el líder en la lista y moverlo al frente
   var found = this.HeroesList.findFirstItem("id", leaderId);
   if(found.index == -1){ found = this.HeroesList.findFirstItem("ID", leaderId); }
   if(found.index != -1)
   {
      var leaderItem = found.item;
      this.HeroesList.removeItems(found.index,1);
      this.HeroesList.unshift(leaderItem);
   }
};
_loc1.findHeroe = function(nHeroeId)
{
   var _loc2_ = this.HeroesList.findFirstItem("ID",nHeroeId);
   if(_loc2_.index == -1)
   {
      _loc2_ = this.HeroesList.findFirstItem("id",nHeroeId);
   }
   return _loc2_.item;
};
_loc1.checkCanMoveItem = function()
{
   var _loc5_ = this.api.datacenter.Game.isRunning;
   var _loc4_ = this.api.datacenter.Exchange != undefined;
   var _loc3_ = true;
   var _loc2_ = true;
   if(_loc5_ || (_loc4_ || (!_loc3_ || !_loc2_)))
   {
      this.gapi.loadUIComponent("AskOk","AskOkInventory",{title:this.api.lang.getText("INFORMATIONS"),text:this.api.lang.getText("CANT_MOVE_ITEM")});
   }
   return !(_loc5_ || (_loc4_ || (!_loc3_ || !_loc2_)));
};
_loc1.__set__weaponItem = function(oWeaponItem)
{
   _global.API.kernel.debug("HERE SET " + oWeaponItem);
   this._oWeaponItem = oWeaponItem;
   this.updateCloseCombat();
};
_loc1.__get__ttgCollection = function()
{
   return this.ttgCollection;
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
   this.Titles = new _global.palmad.ank.utils.ExtendedObject();
   this.InventoryByItemPositions = new _global.palmad.ank.utils.ExtendedObject();
   this.InventoryShortcuts = new _global.palmad.ank.utils.ExtendedObject();
   this.SetsRapidos = new _global.palmad.ank.utils.ExtendedArray();
   this.clearSummon();
   this._bCraftPublicMode = false;
   this.ttgCollection = undefined;
   if(this.HeroesList == undefined)
   {
      this.HeroesList = new _global.palmad.ank.utils.ExtendedArray();
   }
   this._bInParty = false;
   _loc1._bOgrine = 0;
   // Initialize Kama to 0 for heroes to prevent "undefined" in Inventory UI
   if(this.Kama == undefined)
   {
      this.Kama = 0;
   }
};
_loc1.reset = function()
{
   this.currentUseObject = null;
   this.hero = undefined;
   this.api.datacenter.Game.heroPlaying = undefined;
   if(this.HeroesList == undefined)
   {
      this.HeroesList = new _global.palmad.utils.ExtendedArray();
   }
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
_loc1.dropItem = function(nItemNum)
{
   var _loc2_ = this.Inventory.findFirstItem("ID",nItemNum);
   this.api.kernel.debug("dropItem : " + _loc2_.item.position);
   if(_loc2_.item.position == 1)
   {
      this.setWeaponItem();
   }
   this.Inventory.removeItems(_loc2_.index,1);
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
_loc1.updateItem = function(p_itemData) 
{
    // Buscamos el Ã­tem en el inventario usando el ID de los datos que llegaron
    var itemEnInventario = this.Inventory.findFirstItem("ID", p_itemData.ID);
    
    // Comparamos el Ã­tem del inventario con los datos nuevos
    if(itemEnInventario.item.ID == p_itemData.ID && itemEnInventario.item.maxSkin != p_itemData.maxSkin)
    {
       if(!itemEnInventario.item.isLeavingItem && p_itemData.isLeavingItem)
       {
          this.api.kernel.SpeakingItemsManager.triggerPrivateEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_ASSOCIATE);
       }
       if(itemEnInventario.item.isLeavingItem && p_itemData.isLeavingItem)
       {
          this.api.kernel.SpeakingItemsManager.triggerPrivateEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_LEVEL_UP);
       }
    }
    // Y actualizamos el resto.
    if(itemEnInventario != undefined && itemEnInventario.isEquiped)
    {
       this.InventoryByItemPositions.removeItemAt(itemEnInventario.position);
    }
    this.Inventory.startNoEventDispatchsPeriod(dofus.Constants.DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
    this.Inventory.updateItem(itemEnInventario.index, p_itemData); // Actualizamos con los datos nuevos
    if(p_itemData.isEquiped) // Usamos los datos nuevos para ver si estÃ¡ equipado
    {
       this.InventoryByItemPositions.addItemAt(p_itemData.position, p_itemData);
    }
};
_loc1.updateItemPosition = function(p_itemID, p_newPosition)
{
    
    var itemEnInventario = this.Inventory.findFirstItem("ID", p_itemID);
    var itemObject = itemEnInventario.item; // El objeto del Ã­tem real

    if(itemObject.position == 1) // Si la posiciÃ³n ANTIGUA era el arma
    {
       this.setWeaponItem();
    }
    else if(p_newPosition == 1) // Si la posiciÃ³n NUEVA es el arma
    {
       this.setWeaponItem(itemObject);
    }

    if(itemObject.isEquiped)
    {
       this.InventoryByItemPositions.removeItemAt(itemObject.position);
    }
    itemObject.position = p_newPosition; // Asignamos la NUEVA posiciÃ³n
    this.Inventory.startNoEventDispatchsPeriod(dofus.Constants.DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
    this.Inventory.updateItem(itemEnInventario.index, itemObject);
    if(itemObject.isEquiped)
    {
       this.InventoryByItemPositions.addItemAt(itemObject.position, itemObject);
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
_loc1.removeSet = function(nID)
{
   var _loc2_ = this.SetsRapidos.findFirstItem("ID",nID);
   if(_loc2_.index != -1)
   {
      this.SetsRapidos.removeItems(_loc2_.index,1);
   }
};
_loc1.__get__accessories = function()
{
   return this._aAccessories;
};
_loc1.__set__accessories = function(_loc2_)
{
   this.dispatchEvent({type:"accessoriesChanged",value:_loc2_});
   this._aAccessories = _loc2_;
};
_loc1._oWeaponItem = undefined;
_loc1.addProperty("weaponItem",_loc1.__get__weaponItem,_loc1.__set__weaponItem);
_loc1.addProperty("Ogrine",_loc1.__get__ogrine,_loc1.__set__ogrine);
_loc1.addProperty("hero",_loc1.__get__hero,_loc1.__set__hero);
_loc1.addProperty("accessories",_loc1.__get__accessories,_loc1.__set__accessories);
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
#endinitclip