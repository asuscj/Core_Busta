#initclip 10
var _loc1 = dofus["\r\x14"].gapi.controls.MouseShortcuts.prototype;
_loc1.initTexts = function()
{
   this._btnTabSpells.label = "S1";
   this._btnTabSpells2.label = "S2";
   this._btnTabSpells3.label = "S3";
   this._btnTabSpells4.label = "S4";
   this._btnTabSets.label = "SET";
   this._btnTabItems.label = this.api.lang.getText("BANNER_TAB_ITEMS");
};
_loc1.addListeners = function()
{
   this._btnTabSpells.addEventListener("click",this);
   this._btnTabSpells2.addEventListener("click",this);
   this._btnTabSpells2.addEventListener("over",this);
   this._btnTabSpells2.addEventListener("out",this);
   this._btnTabItems.addEventListener("click",this);
   this._btnTabSpells.addEventListener("over",this);
   this._btnTabItems.addEventListener("over",this);
   this._btnTabSpells.addEventListener("out",this);
   this._btnTabItems.addEventListener("out",this);
   this._btnTabSets.addEventListener("click",this);
   this._btnTabSets.addEventListener("over",this);
   this._btnTabSets.addEventListener("out",this);
   var _loc3_ = 1;
   var _loc2_;
   while(_loc3_ < dofus["\r\x14"].gapi.controls.MouseShortcuts.MAX_CONTAINER)
   {
      _loc2_ = this["_ctr" + _loc3_];
      _loc2_.addEventListener("click",this);
      _loc2_.addEventListener("dblClick",this);
      _loc2_.addEventListener("over",this);
      _loc2_.addEventListener("out",this);
      _loc2_.addEventListener("drag",this);
      _loc2_.addEventListener("drop",this);
      _loc2_.addEventListener("onContentLoaded",this);
      _loc2_.params = {position:_loc3_};
      _loc3_ += 1;
   }
   this._ctrCC.addEventListener("click",this);
   this._ctrCC.addEventListener("over",this);
   this._ctrCC.addEventListener("out",this);
   this.api.kernel.KeyManager.addShortcutsListener("onShortcut",this);
   this.api.datacenter.Player.Spells.addEventListener("modelChanged",this);
   this.api.datacenter.Player.Spells2.addEventListener("modelChanged",this);
   this.api.datacenter.Player.Inventory.addEventListener("modelChanged",this);
   this.api.datacenter.Player.SetsRapidos.addEventListener("modelChanged",this);
   this.api.datacenter.Player.InventoryShortcuts.addEventListener("modelChanged",this);
};
_loc1.getCurrentTab = function()
{
   return this._sCurrentTab;
};
_loc1.updateSets = function()
{
   var _loc6_ = new Array();
   var _loc3_ = 0;
   while(_loc3_ < dofus["\r\x14"].gapi.controls.MouseShortcuts.MAX_CONTAINER)
   {
      _loc6_[_loc3_] = true;
      _loc3_ += 1;
   }
   var _loc8_ = this.api.datacenter.Player.SetsRapidos;
   var _loc4_;
   var _loc5_;
   var _loc7_;
   for(var _loc9_ in _loc8_)
   {
      _loc4_ = _loc8_[_loc9_];
      _loc5_ = _loc4_.ID;
      _loc7_ = this["_ctr" + _loc5_];
      _loc7_.contentData = _loc4_;
      _loc6_[_loc5_] = false;
   }
   var _loc2_ = 0;
   while(_loc2_ < dofus["\r\x14"].gapi.controls.MouseShortcuts.MAX_CONTAINER)
   {
      if(_loc6_[_loc2_])
      {
         this["_ctr" + _loc2_].contentData = undefined;
      }
      _loc2_ += 1;
   }
};
_loc1.updateSpells = function()
{
   var _loc8_ = new Array();
   var _loc5_ = 0;
   while(_loc5_ < dofus["\r\x14"].gapi.controls.MouseShortcuts.MAX_CONTAINER)
   {
      _loc8_[_loc5_] = true;
      _loc5_ += 1;
   }
   var _loc9_ = this.api.datacenter.Player.Spells;
   var _loc7_;
   var _loc6_;
   var _loc4_;
   for(var _loc10_ in _loc9_)
   {
      _loc7_ = _loc9_[_loc10_];
      _loc6_ = _loc7_.position;
      if(!_global.isNaN(_loc6_))
      {
         _loc4_ = Number(_loc6_);
         if(this._sCurrentTab == "Spells2")
         {
            _loc4_ -= _global.dofus["\r\x14"].gapi.controls.MouseShortcuts.VALOR_TAB2;
         }
         this["_ctr" + _loc4_].contentData = _loc7_;
         _loc8_[_loc4_] = false;
      }
   }
   var _loc3_ = 0;
   while(_loc3_ < dofus["\r\x14"].gapi.controls.MouseShortcuts.MAX_CONTAINER)
   {
      if(_loc8_[_loc3_])
      {
         this["_ctr" + _loc3_].contentData = undefined;
      }
      _loc3_ += 1;
   }
   this.addToQueue({object:this,method:this.setSpellStateOnAllContainers});
};
_loc1.updateCurrentTabInformations = function()
{
   switch(this._sCurrentTab)
   {
      case "Spells2":
      case "Spells":
         this.updateSpells();
         this._ctrCC._visible = !this.api.datacenter.Player.isMutant;
         break;
      case "Items":
         // Intentamos restaurar atajos persistidos (solo una vez por sesión)
         this.restoreItemShortcuts();
         this.updateItems();
         this._ctrCC._visible = false;
         break;
      case "Sets":
         this.updateSets();
         this._ctrCC._visible = false;
      default:
         return;
   }
};
_loc1.click = function(oEvent)
{
   var _loc4_;
   var _loc6_;
   var _loc2_;
   var _loc5_;
   switch(oEvent.target._name)
   {
      case "_btnTabSets":
         this.setCurrentTab("Sets");
         return;
      case "_btnTabSpells2":
         this.api.sounds.events.onBannerSpellItemButtonClick();
         this.setCurrentTab("Spells2");
         return;
      case "_btnTabSpells":
         this.api.sounds.events.onBannerSpellItemButtonClick();
         this.setCurrentTab("Spells");
         return;
      case "_btnTabItems":
         this.api.sounds.events.onBannerSpellItemButtonClick();
         this.setCurrentTab("Items");
         return;
      case "_ctrCC":
         if(this._ctrCC._visible)
         {
            if(this.api.kernel.TutorialManager.isTutorialMode)
            {
               this.api.kernel.TutorialManager.onWaitingCase({code:"CC_CONTAINER_SELECT"});
               return;
            }
            this.api.kernel.GameManager.switchToSpellLaunch(this.api.datacenter.Player.Spells[0],false);
            return;
         }
         return;
         break;
      default:
         switch(this._sCurrentTab)
         {
            case "Spells2":
            case "Spells":
               this.api.sounds.events.onBannerSpellSelect();
               if(this.api.kernel.TutorialManager.isTutorialMode)
               {
                  this.api.kernel.TutorialManager.onWaitingCase({code:"SPELL_CONTAINER_SELECT",params:[Number(oEvent.target._name.substr(4))]});
               }
               else
               {
                  if(this.gapi.getUIComponent("Spells") != undefined)
                  {
                     return undefined;
                  }
                  _loc4_ = oEvent.target.contentData;
                  if(_loc4_ == undefined)
                  {
                     return undefined;
                  }
                  this.api.kernel.GameManager.switchToSpellLaunch(_loc4_,true);
               }
               break;
            case "Items":
               if(this.api.kernel.TutorialManager.isTutorialMode)
               {
                  this.api.kernel.TutorialManager.onWaitingCase({code:"OBJECT_CONTAINER_SELECT",params:[Number(oEvent.target._name.substr(4))]});
               }
               else
               {
                  _loc6_ = oEvent.target.contentData;
                  _loc2_ = _loc6_ != undefined ? _loc6_.realLinkedItem : undefined;
                  if(_loc2_ == undefined)
                  {
                     return undefined;
                  }
                  if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY))
                  {
                     this.api.kernel.GameManager.insertItemInChat(_loc2_);
                     return undefined;
                  }
                  _loc5_ = this.gapi.getUIComponent("Inventory");
                  if(_loc5_ != undefined)
                  {
                     _loc5_.showItemInfos(_loc2_);
                  }
                  else
                  {
                     if(!this.api.datacenter.Player.checkCanMoveItem())
                     {
                        return undefined;
                     }
                     if(oEvent.keyBoard)
                     {
                        if(_loc2_.isEquiped)
                        {
                           this.api.network.Items.movement(_loc2_.ID,-1);
                           return undefined;
                        }
                        if(this.api.network.Items.equipItem(_loc2_))
                        {
                           return undefined;
                        }
                     }
                     if(this.api.datacenter.Player.canUseObject)
                     {
                        if(_loc2_.canTarget)
                        {
                           this.api.kernel.GameManager.switchToItemTarget(_loc2_);
                        }
                        else if(_loc2_.canUse && oEvent.keyBoard)
                        {
                           this.api.network.Items.use(_loc2_.ID);
                        }
                     }
                  }
               }
            default:
               return;
         }
   }
};
_loc1.setSpellStateOnAllContainers = function()
{
   if(this._sCurrentTab != "Spells" && this._sCurrentTab != "Spells2")
   {
      return undefined;
   }
   var _loc3_ = this.api.datacenter.Player.Spells;
   if(this._sCurrentTab == "Spells")
   {
      for(var _loc4_ in _loc3_)
      {
         if(!_global.isNaN(_loc3_[_loc4_].position))
         {
            this.setSpellStateOnContainer(_loc3_[_loc4_].position);
         }
      }
   }
   else if(this._sCurrentTab == "Spells2")
   {
      for(_loc4_ in _loc3_)
      {
         if(!_global.isNaN(_loc3_[_loc4_].position))
         {
            this.setSpellStateOnContainer(_loc3_[_loc4_].position - _global.dofus["\r\x14"].gapi.controls.MouseShortcuts.VALOR_TAB2);
         }
      }
      if(this._sCurrentTab == "Spells2")
      {
      }
   }
   if(this._sCurrentTab == "Spells")
   {
      this.setSpellStateOnContainer(0);
   }
   this.setSpellStateOnContainer(0);
};
_loc1.dblClick = function(oEvent)
{
   var _loc0_;
   var _loc4_;
   var _loc22_;
   var _loc5_;
   var _loc3_;
   var _loc9_;
   var _loc10_;
   var _loc7_;
   var _loc11_;
   var _loc8_;
   switch(this._sCurrentTab)
   {
      case "Spells2":
      case "Spells":
         if((_loc0_ = oEvent.target._name) !== "_ctrCC")
         {
            _loc4_ = oEvent.target.contentData;
         }
         else
         {
            _loc4_ = this.api.datacenter.Player.Spells[0];
         }
         if(_loc4_ == undefined)
         {
            return undefined;
         }
         if(Key.isDown(16))
         {
            _loc22_ = oEvent.target.params.position;
            this.api.network.send("SN" + _loc4_.ID + "|" + 0,false);
            this.addToQueue({object:this,method:this.setSpellStateOnAllContainers});
            return undefined;
         }
         this.gapi.loadUIAutoHideComponent("SpellInfos","SpellInfos",{spell:_loc4_},{bStayIfPresent:true});
         break;
      case "Items":
      case "Items":
         if(!this.api.datacenter.Player.checkCanMoveItem())
         {
            return undefined;
         }
         _loc5_ = oEvent.target.contentData;
         _loc3_ = _loc5_ != undefined ? _loc5_.realLinkedItem : undefined;
         if(_loc3_ == undefined)
         {
            return undefined;
         }
         // SHIFT (key code 16) + doble click sobre el slot de Items => remover atajo sin tocar el ítem real
         if(Key.isDown(16))
         {
            var _shortcutPos = oEvent.target.params != undefined ? oEvent.target.params.position : undefined;
            if(!_global.isNaN(_shortcutPos))
            {
               this.api.network.InventoryShortcuts.sendInventoryShortcutRemove(_shortcutPos); // Aviso al servidor si soporta OrR
               this.api.datacenter.Player.InventoryShortcuts.removeItemAt(_shortcutPos); // Remoción optimista local
               this.addToQueue({object:this,method:this.updateItems});
               this.persistItemShortcuts();
               return undefined;
            }
         }
         _loc9_ = _loc3_;
         if(Key.isDown(17))
         {
            _loc4_ = this.api.ui;
            _loc5_ = "POPUP_QUANTITY_BATCH_USE_ITEM_DESCRIPTION";
            _loc3_ = _loc9_.name;
            _loc10_ = [function(_loc2_, _loc3, _loc4_)
            {
               return String(_loc4_);
            },_loc3_];
            _loc7_ = _loc9_.Quantity;
            _loc11_ = _loc4_.loadUIComponent("PopupQuantityWithDescription","PopupQuantityWithDescription",{descriptionLangKey:_loc5_,descriptionLangKeyParams:_loc10_,value:1,max:_loc7_,params:{type:"batchUseItem",item:_loc9_}},{bForceLoad:true});
            _loc8_ = new Object();
            // debug traces removed
            _loc8_.validate = function(var2)
            {
               var _loc2_ = var2.params.item.ID;
               _global.API.network.send("OT" + _loc2_ + "|" + var2.value);
            };
            _loc11_.addEventListener("validate",_loc8_);
         }
         else if(!_loc3_.isEquiped)
         {
            if(!_loc3_.canUse || !this.api.datacenter.Player.canUseObject)
            {
               this.api.network.Items.equipItem(_loc3_);
            }
            else
            {
               this.api.network.Items.use(_loc3_.ID);
            }
         }
         else
         {
            this.api.network.Items.movement(_loc3_.ID,-1);
         }
         // Refrescar estado visual de la pestaña Items tras la acción
         this.addToQueue({object:this,method:this.updateItems});
         break;
      case "Sets":
         _loc9_ = oEvent.target.contentData;
         if(_loc9_ != undefined)
         {
            this.api.network.send("ZSU" + _loc9_.ID);
         }
      default:
         return;
   }
};
_loc1.over = function(oEvent)
{
   if(!this.gapi.isCursorHidden())
   {
      return undefined;
   }
   var _loc0_;
   var _loc6_;
   var _loc3_;
   var _loc4_;
   var _loc7_;
   var _loc8_;
   if((_loc0_ = oEvent.target._name) !== "_ctrCC")
   {
      switch(this._sCurrentTab)
      {
         case "Spells2":
         case "Spells":
            _loc6_ = oEvent.target.contentData;
            if(_loc6_ != undefined)
            {
               this.gapi.showTooltip(_loc6_.name + " (" + _loc6_.apCost + " " + this.api.lang.getText("AP") + (_loc6_.actualCriticalHit <= 0 ? "" : ", " + this.api.lang.getText("ACTUAL_CRITICAL_CHANCE") + ": 1/" + _loc6_.actualCriticalHit) + ")",oEvent.target,-20,{bXLimit:true,bYLimit:false});
            }
            break;
         case "Items":
            _loc3_ = oEvent.target.contentData;
            if(_loc3_ != undefined)
            {
               _loc4_ = _loc3_.name;
               if(this.gapi.getUIComponent("Inventory") == undefined)
               {
                  if(_loc3_.canUse && _loc3_.canTarget)
                  {
                     _loc4_ += "\n" + this.api.lang.getText("HELP_SHORTCUT_DBLCLICK_CLICK");
                  }
                  else
                  {
                     if(_loc3_.canUse)
                     {
                        _loc4_ += "\n" + this.api.lang.getText("HELP_SHORTCUT_DBLCLICK");
                     }
                     if(_loc3_.canTarget)
                     {
                        _loc4_ += "\n" + this.api.lang.getText("HELP_SHORTCUT_CLICK");
                     }
                  }
               }
               this.gapi.showTooltip(_loc4_,oEvent.target,-30,{bXLimit:true,bYLimit:false});
            }
            break;
         case "Sets":
            _loc3_ = oEvent.target.contentData;
            if(_loc3_ != undefined)
            {
               this.gapi.showTooltip(_loc3_.name,oEvent.target,-30,{bXLimit:true,bYLimit:false});
            }
         default:
            return;
      }
   }
   else
   {
      _loc7_ = this.api.datacenter.Player.Spells[0];
      _loc8_ = this.api.kernel.GameManager.getCriticalHitChance(this.api.datacenter.Player.weaponItem.criticalHit);
      this.gapi.showTooltip(_loc7_.name + "\n" + _loc7_.descriptionVisibleEffects + " (" + _loc7_.apCost + " " + this.api.lang.getText("AP") + (_global.isNaN(_loc8_) ? "" : ", " + this.api.lang.getText("ACTUAL_CRITICAL_CHANCE") + ": 1/" + _loc8_) + ")",oEvent.target,-30,{bXLimit:true,bYLimit:false});
   }
};
_loc1.drop = function(_loc2_)
{
   var _loc3_;
   var _loc6_;
   var _loc4_;
   var _loc8_;
   var _loc5_;
   var _loc9_;
   var _loc7_;
   switch(this._sCurrentTab)
   {
      case "Spells":
      case "Spells2":
         if(this.gapi.getUIComponent("Spells") == undefined && !Key.isDown(16))
         {
            return undefined;
         }
         _loc3_ = this.gapi.getCursor();
         if(_loc3_ == undefined)
         {
            return undefined;
         }
         this.gapi.removeCursor();
         _loc6_ = _loc3_.position;
         _loc4_ = _loc2_.target.params.position;
         if(this._sCurrentTab == "Spells2")
         {
            _loc6_ -= _global.dofus["\r\x14"].gapi.controls.MouseShortcuts.VALOR_TAB2;
         }
         if(_loc6_ == _loc4_)
         {
            return undefined;
         }
         if(_loc6_ != undefined)
         {
            this["_ctr" + _loc6_].contentData = undefined;
         }
         _loc8_ = this["_ctr" + _loc4_].contentData;
         if(_loc8_ != undefined)
         {
            _loc8_.position = undefined;
         }
         if(this._sCurrentTab == "Spells2")
         {
            _loc4_ += _global.dofus["\r\x14"].gapi.controls.MouseShortcuts.VALOR_TAB2;
         }
         _loc3_.position = _loc4_;
         _loc2_.target.contentData = _loc3_;
         // debug trace removed
         _global.HERO_ID = _loc3_.heroID;
         this.api.network.Spells.moveToUsed(_loc3_.ID,_loc4_);
         this.addToQueue({object:this,method:this.setSpellStateOnAllContainers});
         break;
      case "Items":
         if(this.gapi.getUIComponent("Inventory") == undefined && !Key.isDown(16))
         {
            return undefined;
         }
         _loc5_ = this.gapi.getCursor();
         if(_loc5_ == undefined)
         {
            return undefined;
         }
         _loc9_ = _loc5_.ID;
         if(_loc9_ == -1)
         {
            return undefined;
         }
         this.gapi.removeCursor();
         _loc7_ = _loc2_.target.params.position;
         // debug trace removed
         if(_loc5_.isShortcut && _loc5_.position == _loc7_)
         {
            return undefined;
         }
         if(_loc5_.isShortcut)
         {
            // Move existing shortcut: send packet and optimistically update the model
            var _oldPos = _loc5_.position;
            this.api.network.InventoryShortcuts.sendInventoryShortcutMove(_oldPos,_loc7_);
            // Optimistic datacenter update
            var _list = this.api.datacenter.Player.InventoryShortcuts;
            // Reuse existing generic/effects if available
            var _gen = (_loc5_.genericID != undefined) ? _loc5_.genericID : (_loc5_.unicID != undefined ? _loc5_.unicID : _loc9_);
            var _eff = (_loc5_.compressedEffects != undefined) ? _loc5_.compressedEffects : (_loc5_.effects != undefined ? _loc5_.effects : "");
            var _qty = (_loc5_.Quantity != undefined) ? _loc5_.Quantity : 1;
            var _previewMove = new dofus.datacenter.InventoryShortcutItem(_gen,_loc7_,_eff,_qty);
            _list.removeItemAt(_oldPos);
            _list.addItemAt(_loc7_,_previewMove);
            _loc2_.target.contentData = _previewMove;
            this.setMovieClipTransform(_loc2_.target.content,_previewMove.findRealItem() ? dofus["\r\x14"].gapi.controls.MouseShortcuts.NO_TRANSFORM : dofus["\r\x14"].gapi.controls.MouseShortcuts.INACTIVE_TRANSFORM);
         }
         else
         {
            this.api.network.InventoryShortcuts.sendInventoryShortcutAdd(_loc7_,_loc9_);
            // Optimistic UI + model update: create shortcut and insert into datacenter so updateItems persists it
            var _tmpGenericID = (_loc5_.unicID != undefined) ? _loc5_.unicID : _loc9_;
            var _tmpEffects = (_loc5_.compressedEffects != undefined) ? _loc5_.compressedEffects : "";
            var _tmpQuantity = (_loc5_.Quantity != undefined) ? _loc5_.Quantity : 1;
            var _shortcutPreview = new dofus.datacenter.InventoryShortcutItem(_tmpGenericID,_loc7_,_tmpEffects,_tmpQuantity);
            // Insert into model so updateItems uses it
            this.api.datacenter.Player.InventoryShortcuts.addItemAt(_loc7_,_shortcutPreview);
            // Also reflect immediately in UI target
            _loc2_.target.contentData = _shortcutPreview;
            this.setMovieClipTransform(_loc2_.target.content,_shortcutPreview.findRealItem() ? dofus["\r\x14"].gapi.controls.MouseShortcuts.NO_TRANSFORM : dofus["\r\x14"].gapi.controls.MouseShortcuts.INACTIVE_TRANSFORM);
         }
         // Actualizar UI después de drop de item (igual que se hace con spells)
         this.addToQueue({object:this,method:this.updateItems});
         this.persistItemShortcuts();
         break;
      default:
         return;
   }
};
_loc1.modelChanged = function(oEvent)
{
   switch(oEvent.eventName)
   {
      case "updateOne":
      case "updateAll":
   }
   if(oEvent.target == this.api.datacenter.Player.Spells || oEvent.target == this.api.datacenter.Player.Spells2)
   {
      if(this._sCurrentTab == "Spells" || this._sCurrentTab == "Spells2")
      {
         this.updateSpells();
      }
   }
   else if(oEvent.target == this.api.datacenter.Player.InventoryShortcuts || oEvent.target == this.api.datacenter.Player.Inventory)
   {
      if(this._sCurrentTab == "Items")
      {
         this.updateItems();
      }
   }
   else if(oEvent.target == this.api.datacenter.Player.SetsRapidos)
   {
      if(this._sCurrentTab == "Sets")
      {
         this.updateSets();
      }
   }
};
_loc1.updateItems = function()
{
   if(this._sCurrentTab != "Items")
   {
      return undefined;
   }
   var _loc8_ = new Array();
   var _loc4_ = 1;
   _loc4_ = 1;
   while(_loc4_ < dofus["\r\x14"].gapi.controls.MouseShortcuts.MAX_CONTAINER)
   {
      _loc8_[_loc4_] = true;
      _loc4_ += 1;
   }
   var _loc9_ = this.api.datacenter.Player.InventoryShortcuts.getItems();
   var _loc5_;
   var _loc6_;
   var _loc7_;
   for(var _loc10_ in _loc9_)
   {
      _loc5_ = _loc9_[_loc10_];
      if(!_global.isNaN(_loc5_.position))
      {
         // Refrescar cantidad cacheada antes de mostrar en UI
         if(_loc5_.refreshCachedQuantity != undefined)
         {
            _loc5_.refreshCachedQuantity();
         }
         _loc6_ = _loc5_.position;
         _loc7_ = this["_ctr" + _loc6_];
         _loc7_.contentData = _loc5_;
         this.setMovieClipTransform(_loc7_.content,_loc5_.findRealItem() ? dofus["\r\x14"].gapi.controls.MouseShortcuts.NO_TRANSFORM : dofus["\r\x14"].gapi.controls.MouseShortcuts.INACTIVE_TRANSFORM);
         _loc8_[_loc6_] = false;
      }
   }
   var _loc3_ = 1;
   while(_loc3_ < dofus["\r\x14"].gapi.controls.MouseShortcuts.MAX_CONTAINER)
   {
      if(_loc8_[_loc3_])
      {
         this["_ctr" + _loc3_].contentData = undefined;
      }
      _loc3_ += 1;
   }
   this.addToQueue({object:this,method:this.setItemStateOnAllContainers});
};
// Persistencia local de atajos de objetos (cliente) para sesión futura
_loc1.persistItemShortcuts = function()
{
   var _store = this.api.datacenter.Player.InventoryShortcuts;
   if(_store == undefined || _store.getItems == undefined){ return; }
   var _items = _store.getItems();
   var _parts = [];
   for(var k in _items)
   {
      var it = _items[k];
      if(it != undefined && !_global.isNaN(it.position))
      {
         // Formato extendido: pos:gen:eff:qty para preservar cantidades
         var qty = (it.Quantity != undefined) ? it.Quantity : 1;
         _parts.push(it.position + ":" + it.genericID + ":" + it.compressedEffects + ":" + qty);
      }
   }
   // Persist shortcuts per-character so different characters keep their own layout.
   // Use Player.Name as primary key (available earlier and stable across sessions);
   // fall back to Player.ID only if Name is empty.
   var pid = this.api.datacenter.Player.Name != undefined && String(this.api.datacenter.Player.Name) != "" ? String(this.api.datacenter.Player.Name) : (this.api.datacenter.Player.ID != undefined ? String(this.api.datacenter.Player.ID) : "unknown");
   var key = "LocalItemShortcuts_" + pid;
   this.api.kernel.OptionsManager.setOption(key, _parts.join(","));
};
_loc1.restoreItemShortcuts = function()
{
   // Restore per-character shortcuts. Use Player.Name as primary key (stable);
   // fall back to Player.ID if Name is not available.
   var pid = this.api.datacenter.Player.Name != undefined && String(this.api.datacenter.Player.Name) != "" ? String(this.api.datacenter.Player.Name) : (this.api.datacenter.Player.ID != undefined ? String(this.api.datacenter.Player.ID) : "unknown");
   if(this._aShortcutsRestored == undefined)
   {
      this._aShortcutsRestored = new Object();
   }
   // Si ya restauramos, permitimos reintentar SOLO si el data store está vacío (para evitar estado muerto)
   if(this._aShortcutsRestored[pid])
   {
      var _ds = this.api.datacenter.Player.InventoryShortcuts;
      if(_ds != undefined && _ds.getItems != undefined)
      {
         var _items = _ds.getItems();
         var _hasAny = false;
         for(var kk in _items){ _hasAny = true; break; }
         if(_hasAny)
         {
            return; // ya hay datos, no re-restaurar
         }
      }
      // Si llegamos aquí, no hay datos: reintentar restauración
      this._aShortcutsRestored[pid] = false;
   }
   var key = "LocalItemShortcuts_" + pid;
   var raw = this.api.kernel.OptionsManager.getOption(key);
   // Legacy migration: si no existe todavía la clave por personaje pero existe la antigua global
   // "LocalItemShortcuts" copiamos su contenido una sola vez para no perder los atajos previos.
   if((raw == undefined || raw == "") && !this._aShortcutsRestored["__migration_checked__"])
   {
      var legacy = this.api.kernel.OptionsManager.getOption("LocalItemShortcuts");
      this._aShortcutsRestored["__migration_checked__"] = true;
      if(legacy != undefined && legacy != "")
      {
         this.api.kernel.OptionsManager.setOption(key, legacy);
         raw = legacy;
      }
   }
   if(raw == undefined || raw == ""){
      // If no saved data yet, do not mark as restored immediately: during fast
      // in-client account switches the OptionsManager or shared data may not be
      // populated yet. Retry a few times via the queue before giving up to avoid
      // a permanent empty state until a full client restart.
      if(this._aShortcutsRetry == undefined)
      {
         this._aShortcutsRetry = new Object();
      }
      var _retries = this._aShortcutsRetry[pid] == undefined ? 0 : this._aShortcutsRetry[pid];
      if(_retries < 3)
      {
         this._aShortcutsRetry[pid] = _retries + 1;
         // Re-enqueue restore to run after other queued UI/loader operations.
         this.addToQueue({object:this,method:this.restoreItemShortcuts});
         return;
      }
      // Exhausted retries: mark restored to avoid infinite loops.
      this._aShortcutsRestored[pid] = true;
      return;
   }
   var shortcutsDS = this.api.datacenter.Player.InventoryShortcuts;
   var entries = raw.split(",");
   for(var i=0;i<entries.length;i++)
   {
      var e = entries[i];
      if(e == "") continue;
      var bits = e.split(":");
      if(bits.length < 3) continue;
      var pos = Number(bits[0]);
      var gen = Number(bits[1]);
      var eff = bits[2];
      // Nuevo formato incluye cantidad en bits[3]; mantener compatibilidad con formato antiguo
      var qty = (bits.length > 3 && !_global.isNaN(Number(bits[3]))) ? Number(bits[3]) : 1;
      if(_global.isNaN(pos)) continue;
      // Si ya existe algo en esa posición, no duplicar
      if(shortcutsDS.getItemAt != undefined)
      {
         var existing = shortcutsDS.getItemAt(pos);
         if(existing != undefined){ continue; }
      }
      var preview = new dofus.datacenter.InventoryShortcutItem(gen,pos,eff,qty);
      shortcutsDS.addItemAt(pos,preview);
   }
   this._aShortcutsRestored[pid] = true;
   this.addToQueue({object:this,method:this.updateItems});
};
_loc1.clearRestoreFlag = function()
{
   // Clear the "restored" flag for the current character so shortcuts can be reloaded
   // when switching back to this character. This fixes the issue where returning to
   // a character shows an empty banner because the flag was already set.
   var pid = this.api.datacenter.Player.Name != undefined && String(this.api.datacenter.Player.Name) != "" ? String(this.api.datacenter.Player.Name) : (this.api.datacenter.Player.ID != undefined ? String(this.api.datacenter.Player.ID) : "unknown");
   if(this._aShortcutsRestored != undefined)
   {
      this._aShortcutsRestored[pid] = false;
   }
   if(this._aShortcutsRetry != undefined)
   {
      this._aShortcutsRetry[pid] = 0;
   }
};
_loc1.setItemStateOnAllContainers = function()
{
   if(this._sCurrentTab != "Items")
   {
      return undefined;
   }
   var _loc4_ = this.api.datacenter.Player.InventoryShortcuts.getItems();
   var _loc3_;
   for(var _loc5_ in _loc4_)
   {
      _loc3_ = _loc4_[_loc5_];
      if(!(_global.isNaN(_loc3_) && _loc5_ < 1))
      {
         this.setItemStateOnContainer(_loc5_);
      }
   }
   this.setSpellStateOnContainer(0);
};
_loc1.setSpellStateOnContainer = function(nIndex)
{
   var _loc2_ = nIndex != 0 ? this["_ctr" + nIndex] : this._ctrCC;
   var _loc4_ = nIndex != 0 ? _loc2_.contentData : this.api.datacenter.Player.Spells[0];
   if(_loc4_ == undefined)
   {
      return undefined;
   }
   var _loc3_ = this.api.datacenter.Player.SpellsManager.checkCanLaunchSpellReturnObject(_loc4_.ID);
   if(this.api.kernel.TutorialManager.isTutorialMode)
   {
      _loc3_.can = true;
   }
   if(_loc3_.can == false)
   {
      switch(_loc3_.type)
      {
         case "NOT_IN_REQUIRED_STATE":
         case "IN_FORBIDDEN_STATE":
            this.setMovieClipTransform(_loc2_.content,dofus["\r\x14"].gapi.controls.MouseShortcuts.WRONG_STATE_TRANSFORM);
            if(_loc3_.params[1])
            {
               _loc2_.showLabel = true;
               _loc2_.label = _loc3_.params[1];
            }
            else
            {
               _loc2_.showLabel = false;
            }
            break;
         case "IS_AUTOMATIC_END_TURN":
         case "NOT_ENOUGH_AP":
         case "CANT_SUMMON_MORE_CREATURE":
         case "CANT_LAUNCH_MORE":
         case "CANT_RELAUNCH":
         case "NOT_IN_FIGHT":
            _loc2_.showLabel = false;
            this.setMovieClipTransform(_loc2_.content,dofus["\r\x14"].gapi.controls.MouseShortcuts.INACTIVE_TRANSFORM);
            break;
         case "CANT_LAUNCH_BEFORE":
            this.setMovieClipTransform(_loc2_.content,dofus["\r\x14"].gapi.controls.MouseShortcuts.INACTIVE_TRANSFORM);
            _loc2_.showLabel = true;
            _loc2_.label = _loc3_.params[0];
         default:
            return;
      }
   }
   else
   {
      _loc2_.showLabel = false;
      this.setMovieClipTransform(_loc2_.content,dofus["\r\x14"].gapi.controls.MouseShortcuts.NO_TRANSFORM);
   }
};
_loc1.setItemStateOnContainer = function(_loc2_)
{
   var _loc2_ = this["_ctr" + _loc2_];
   var _loc3_ = _loc2_.contentData;
   if(_loc3_ == undefined)
   {
      return undefined;
   }
   this.setMovieClipTransform(_loc2_.content,_loc3_.findRealItem() ? dofus["\r\x14"].gapi.controls.MouseShortcuts.NO_TRANSFORM : dofus["\r\x14"].gapi.controls.MouseShortcuts.INACTIVE_TRANSFORM);
   _loc2_.showLabel = _loc3_.label != undefined;
};
_global.dofus["\r\x14"].gapi.controls.MouseShortcuts.MAX_CONTAINER = 31;
_global.dofus["\r\x14"].gapi.controls.MouseShortcuts.VALOR_TAB2 = 14;
_loc1._aShortcutsRestored = new Object();
#endinitclip