#initclip 173
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
_loc1.selectRouletteItem = function(_loc2_)
{
   this.api.network.send("wc" + _loc2_);
};
_loc1.associateMimibiote = function(_loc2_, _loc3_)
{
   this.aks.send("AEi" + _loc2_ + "|" + _loc3_);
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
      _loc10_ = getTimer();
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
   var _loc7_ = _loc12_[1];
   // Usar el método centralizado de CharactersManager para parsear accesorios
   // Esto garantiza consistencia entre carga inicial y updates en tiempo real
   var _loc14_ = this.api.datacenter.Sprites.getItemAt(_loc11_);
   this.api.kernel.CharactersManager.setSpriteAccessories(_loc14_,_loc7_);
   trace("Items onAccessories " + _loc11_ + " " + _loc14_.accessories);
   var _loc13_ = this.api.datacenter.getHero(_loc11_);
   if(_loc13_ != undefined)
   {
      trace("set heroe " + _loc11_ + " accessories " + _loc14_.accessories);
      _loc13_.accessories = _loc14_.accessories;
   }
   this.api.gfx.setForcedSpriteAnim(_loc11_,"static");
   if(_loc11_ == this.api.datacenter.Player.ID)
   {
      this.api.datacenter.Player.updateCloseCombat();
   }
};
_loc1.onQuantity2 = function(_loc2_)
{
   var _loc9_ = _loc2_.split("|");
   var _loc10_ = _loc9_[0];
   var _loc8_ = this.api.datacenter.getHero(_loc10_);
   if(_loc8_ == undefined)
   {
      _loc8_ = this.api.datacenter.Player;
   }
   _global.tracec("hero : " + _loc8_.ID + " " + _loc8_.data.name);
   var _loc5_ = _loc9_[1].split("*");
   var _loc3_ = 0;
   var _loc4_;
   var _loc6_;
   var _loc7_;
   while(_loc3_ < _loc5_.length)
   {
      _loc4_ = _loc5_[_loc3_].split(",");
      _loc6_ = Number(_loc4_[0]);
      _loc7_ = Number(_loc4_[1]);
      if(_loc5_.length > 1)
      {
         _loc8_.Inventory.startNoEventDispatchsPeriod(dofus["\x12\x03"].DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
      }
      _loc8_.updateItemQuantity(_loc6_,_loc7_);
      _loc3_ += 1;
   }
};
_loc1.onAdd2 = function(_loc2_, _loc3_)
{
   _global.tracec(_loc2_ + " " + _loc3_);
   var _loc8_;
   var _loc7_;
   var _loc3_;
   var _loc4_;
   var _loc6_;
   var _loc5_;
   if(!_loc2_)
   {
      switch(_loc3_)
      {
         case "F":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("INVENTORY_FULL"),"ERROR_BOX",{name:"Full"});
            return;
         case "L":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("TOO_LOW_LEVEL_FOR_ITEM"),"ERROR_BOX",{name:"LowLevel"});
            return;
         default:
            if(_loc0_ !== "A")
            {
               return;
            }
            this.api.kernel.showMessage(undefined,this.api.lang.getText("ALREADY_EQUIPED"),"ERROR_BOX",{name:"Already"});
            return;
      }
   }
   else
   {
      var _loc0_ = _loc3_.split("|");
      _loc8_ = this.api.datacenter.getHero(_loc0_[0]);
      if(_loc8_ == undefined)
      {
         _loc8_ = this.api.datacenter.Player;
      }
      _global.tracec("addItem : " + _loc8_.ID);
      _loc7_ = _loc0_[1].split("*");
      _loc3_ = 0;
      while(_loc3_ < _loc7_.length)
      {
         _loc4_ = _loc7_[_loc3_];
         _loc6_ = _loc4_.charAt(0);
         _loc4_ = _loc4_.substr(1);
         switch(_loc6_)
         {
            default:
               ank["\x1e\n\t"]["\x0b\x0b"].err("Ajout d\'un type obj inconnu");
               break;
            case "O":
               _loc5_ = this.api.kernel.CharactersManager.getItemObjectFromData(_loc4_);
               if(_loc5_ != undefined)
               {
                  _global.tracec("addon");
                  _loc8_.addItem(_loc5_);
               }
               break;
            case "G":
         }
         _loc3_ += 1;
      }
   }
};
_loc1.onRemove2 = function(_loc2_)
{
   var _loc7_ = _loc2_.split("|")[0];
   var _loc6_ = this.api.datacenter.getHero(_loc7_);
   if(_loc6_ == undefined)
   {
      _loc6_ = this.api.datacenter.Player;
   }
   var _loc5_ = _loc2_.split("|")[1].split("*");
   _global.tracec("onHeroRemove" + _loc7_ + " " + _loc6_.ID + " " + _loc2_);
   var _loc3_ = 0;
   var _loc4_;
   while(_loc3_ < _loc5_.length)
   {
      _loc4_ = Number(_loc5_[_loc3_]);
      _global.tracec("Remove " + _loc4_);
      _loc6_.dropItem(_loc4_);
      _loc3_ += 1;
   }
};
_loc1.onChange2 = function(_loc2_)
{
   var _loc10_ = _loc2_.split("|")[0];
   var _loc7_ = this.api.datacenter.getHero(_loc10_);
   if(_loc7_ == undefined)
   {
      _loc7_ = this.api.datacenter.Player;
   }
   var _loc9_ = _loc2_.split("|")[1].split("*");
   var _loc6_ = 0;
   var _loc8_;
   var _loc5_;
   var _loc3_;
   var _loc4_;
   while(_loc6_ < _loc9_.length)
   {
      _loc8_ = _loc9_[_loc6_];
      _loc5_ = _loc8_.split(";");
      _global.tracec("onChange, _loc6_ : " + _loc5_.length + " " + _loc7_.data.name + " " + _loc10_);
      _loc3_ = 0;
      while(_loc3_ < _loc5_.length)
      {
         _global.tracec("onChange1 : " + _loc5_[_loc3_]);
         _loc4_ = this.api.kernel.CharactersManager.getItemObjectFromData(_loc5_[_loc3_]);
         _global.tracec("onChange2 : " + _loc4_);
         if(_loc4_ != undefined)
         {
            _loc7_.updateItem(_loc4_);
         }
         _loc3_ += 1;
      }
      _loc6_ += 1;
   }
};
#endinitclip