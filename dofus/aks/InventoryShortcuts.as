#initclip 149
if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus.aks)
{
   _global.dofus.aks = new Object();
}
_global.dofus.aks.InventoryShortcuts = function(oAKS, oAPI)
{
   super.initialize(oAKS,oAPI);
};
_global.dofus.aks.InventoryShortcuts.prototype = new dofus.aks.Handler();
var _loc1 = _global.dofus.aks.InventoryShortcuts.prototype;
_loc1.sendInventoryShortcutAdd = function(_loc2_, nObjectID)
{
   this.aks.send("OrA" + _loc2_ + ";" + nObjectID);
};
_loc1.sendInventoryShortcutMove = function(nOldPosition, nNewPosition)
{
   this.aks.send("OrM" + nOldPosition + ";" + nNewPosition);
};
_loc1.sendInventoryShortcutRemove = function(_loc2_)
{
   this.aks.send("OrR" + _loc2_);
};
_loc1.onInventoryShortcutAdded = function(_loc2_)
{
   // Packet format expected: position;objectID;compressedEffects OR position;objectID
   // Decompiled core ambiguity: server may be sending objectID (unique) instead of generic/unicID.
   // We resolve by searching current Inventory for a matching item ID to extract its unicID & effects.
   var _loc8_ = _loc2_.split(";");
   if(_loc8_.length < 2){ return; }
   var _loc3_ = Number(_loc8_[0]); // position
   var _locObjID = Number(_loc8_[1]); // may be object unique ID or generic ID
   var _locEffectsFromPacket = _loc8_.length > 2 ? _loc8_[2] : undefined;
   var _locInv = this.api.datacenter.Player.Inventory; // collection of items
   var _locGenericID = _locObjID; // default assume packet already generic
   var _locCompressedEffects = _locEffectsFromPacket; // fallback
   var _locQuantity = 1; // fallback
   // Search inventory for real item by object ID
   for(var k in _locInv){
      var it = _locInv[k];
      if(it != undefined){
         // Some decompiled items expose ID/unicID/compressedEffects; guard usage
         if(it.ID == _locObjID){
            if(it.unicID != undefined){ _locGenericID = it.unicID; }
            if(it.compressedEffects != undefined){ _locCompressedEffects = it.compressedEffects; }
            if(it.Quantity != undefined){ _locQuantity = it.Quantity; }
            break;
         }
      }
   }
   if(_locCompressedEffects == undefined){ _locCompressedEffects = ""; }
   var _loc6_ = new dofus.datacenter.InventoryShortcutItem(_locGenericID,_loc3_,_locCompressedEffects,_locQuantity);
   var _loc4_ = this.api.datacenter.Player.InventoryShortcuts;
   _loc4_.addItemAt(_loc3_,_loc6_);
};
_loc1.onInventoryShortcutRemoved = function(_loc2_)
{
   var _loc3_ = Number(_loc2_);
   var _loc2_ = this.api.datacenter.Player.InventoryShortcuts;
   _loc2_.removeItemAt(_loc3_);
};
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
#endinitclip