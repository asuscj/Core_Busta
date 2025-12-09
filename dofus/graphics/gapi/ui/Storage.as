#initclip 197
var _loc1 = dofus["\r\x14"].gapi.ui.Storage.prototype;
_loc1.createChildren = function()
{
   this.player = this.api.datacenter.Player;
   var _loc2_ = this.api.datacenter.getHero(this.heroID);
   if(_loc2_ != undefined)
   {
      this.player = _loc2_;
   }
   if(this._bMount != true)
   {
      this._pbPods._visible = false;
   }
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.initTexts});
   this.hideItemViewer(true);
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._ivInventoryViewer.addEventListener("selectedItem",this);
   this._ivInventoryViewer.addEventListener("dblClickItem",this);
   this._ivInventoryViewer.addEventListener("dropItem",this);
   this._ivInventoryViewer.addEventListener("dragKama",this);
   this._ivInventoryViewer2.addEventListener("selectedItem",this);
   this._ivInventoryViewer2.addEventListener("dblClickItem",this);
   this._ivInventoryViewer2.addEventListener("dropItem",this);
   this._ivInventoryViewer2.addEventListener("dragKama",this);
   this._btnMoveAll.addEventListener("click",this);
   this._btnTransfertToRight.addEventListener("click",this);
   if(this._oData != undefined)
   {
      this._oData.addEventListener("modelChanged",this);
   }
};
_loc1.initTexts = function()
{
   var _loc2_ = this.player.data.name;
   if(!_loc2_)
   {
      _loc2_ = this.player.name;
   }
   this._winInventory.title = _loc2_;
   if(this._bMount != true)
   {
      this._winInventory2.title = this.api.lang.getText("STORAGE");
   }
   else
   {
      this._winInventory2.title = this.api.lang.getText("MY_MOUNT");
   }
   this._btnMoveAll.label = this.api.lang.getText("MOVE_ALL");
};
_loc1.click = function(oEvent)
{
   var _loc8_;
   var _loc4_;
   var _loc9_;
   var _loc11_;
   var _loc3_;
   switch(oEvent.target._name)
   {
      case "_btnMoveAll":
         _loc8_ = new Array();
         for(var _loc10_ in this._ivInventoryViewer._cgGrid.dataProvider)
         {
            _loc4_ = this._ivInventoryViewer._cgGrid.dataProvider[_loc10_];
            _loc8_.push({Add:true,ID:_loc4_.ID,Quantity:_loc4_.Quantity});
         }
         _global.HERO_ID = this.heroID;
         this.api.network.Exchange.movementItems(_loc8_);
         break;
      case "_btnTransfertToRight":
         _loc9_ = new Array();
         _loc11_ = 0;
         for(_loc10_ in this._ivInventoryViewer2._cgGrid.dataProvider)
         {
            _loc3_ = this._ivInventoryViewer2._cgGrid.dataProvider[_loc10_];
            _loc9_.push({Add:false,ID:_loc3_.ID,Quantity:_loc3_.Quantity});
         }
         _global.HERO_ID = this.heroID;
         this.api.network.Exchange.movementItems(_loc9_);
         break;
      case "_btnClose":
         this.callClose();
      default:
         return;
   }
};
_loc1.initData = function()
{
   if(this._bMount == true)
   {
      this._ivInventoryViewer.showKamas = false;
      this._ivInventoryViewer2.showKamas = false;
   }
   this._ivInventoryViewer.dataProvider = this.player.Inventory;
   this._ivInventoryViewer.kamasProvider = this.player;
   this._ivInventoryViewer2.kamasProvider = this._oData;
   this._ivInventoryViewer.checkPlayerPods = true;
   this._ivInventoryViewer2.checkMountPods = this._bMount;
   
   // Recuperar último filtro guardado (mismo sistema que Inventory.as)
   var _loc2_ = this.api.datacenter.Basics.storage_filter;
   var _loc4_;
   var _loc5_;
   var _loc6_;
   
   // Determinar filtro a aplicar según preferencia guardada o usar equipement por defecto
   switch(_loc2_)
   {
      case "nonequipement":
         _loc4_ = dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_NONEQUIPEMENT;
         _loc5_ = dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_NONEQUIPEMENT;
         _loc6_ = "_btnFilterNonEquipement";
         break;
      case "resources":
         _loc4_ = dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_RESSOURECES;
         _loc5_ = dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_RESSOURECES;
         _loc6_ = "_btnFilterRessoureces";
         break;
      case "runes":
         _loc4_ = dofus.Constants.FILTER_RUNES;
         _loc5_ = dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_RUNES;
         _loc6_ = "_btnFilterRunes";
         break;
      case "soul":
         _loc4_ = dofus.Constants.FILTER_SOUL;
         _loc5_ = dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_SOUL;
         _loc6_ = "_btnFilterSoul";
         break;
      case "cards":
         _loc4_ = dofus.Constants.FILTER_CARDS;
         _loc5_ = dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_CARDS;
         _loc6_ = "_btnFilterCards";
         break;
      case "equipement":
      default:
         _loc4_ = dofus.Constants.FILTER_EQUIPEMENT;
         _loc5_ = dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_EQUIPEMENT;
         _loc6_ = "_btnFilterEquipement";
   }
   
   // Aplicar filtro al primer InventoryViewer (inventario del jugador)
   if(this._ivInventoryViewer != undefined)
   {
      this._ivInventoryViewer._aSelectedSuperTypes = _loc4_;
      this._ivInventoryViewer._nCurrentFilterID = _loc5_;
      
      // Marcar el botón correcto como seleccionado
      if(this._ivInventoryViewer[_loc6_] != undefined)
      {
         this._ivInventoryViewer[_loc6_].selected = true;
         this._ivInventoryViewer._btnSelectedFilterButton = this._ivInventoryViewer[_loc6_];
      }
      
      if(this._ivInventoryViewer.updateData != undefined)
      {
         this._ivInventoryViewer.updateData(true);
      }
   }
   
   // Aplicar el mismo filtro al segundo InventoryViewer (banco/cofre)
   if(this._ivInventoryViewer2 != undefined)
   {
      this._ivInventoryViewer2._aSelectedSuperTypes = _loc4_;
      this._ivInventoryViewer2._nCurrentFilterID = _loc5_;
      
      // Marcar el botón correcto como seleccionado
      if(this._ivInventoryViewer2[_loc6_] != undefined)
      {
         this._ivInventoryViewer2[_loc6_].selected = true;
         this._ivInventoryViewer2._btnSelectedFilterButton = this._ivInventoryViewer2[_loc6_];
      }
      
      if(this._ivInventoryViewer2.updateData != undefined)
      {
         this._ivInventoryViewer2.updateData(true);
      }
   }
   
   this.modelChanged();
};
_loc1.out = function(_loc2_)
{
   this.api.ui.hideTooltip();
};
_loc1.moveItems = function(_loc2_, _loc3_)
{
   var _loc9_ = new Array();
   var _loc3_ = 0;
   var _loc4_;
   while(_loc3_ < _loc2_.length)
   {
      _loc4_ = _loc2_[_loc3_];
      _loc9_.push({Add:_loc3_,ID:_loc4_.ID,Quantity:_loc4_.Quantity});
      _loc3_ += 1;
   }
   _global.HERO_ID = this.heroID;
   this.api.network.Exchange.movementItems(_loc9_);
};
_loc1.moveItem = function(_loc2_, _loc3_, _loc4_)
{
   var _loc4_ = _loc2_.Quantity;
   var _loc3_ = 1;
   if(_loc4_)
   {
      _loc3_ = _loc4_;
   }
   _global.HERO_ID = this.heroID;
   this.api.network.Exchange.movementItem(_loc3_,_loc2_,_loc3_);
};
_loc1.dropItem = function(_loc2_)
{
   switch(_loc2_.target._name)
   {
      case "_ivInventoryViewer":
         _global.HERO_ID = this.heroID;
         this.api.network.Exchange.movementItem(false,_loc2_.item,_loc2_.quantity);
         break;
      case "_ivInventoryViewer2":
         _global.HERO_ID = this.heroID;
         this.api.network.Exchange.movementItem(true,_loc2_.item,_loc2_.quantity);
      default:
         return;
   }
};
_loc1.dragKama = function(_loc2_)
{
   switch(_loc2_.target)
   {
      case this._ivInventoryViewer:
         _global.HERO_ID = this.heroID;
         this.api.network.Exchange.movementKama(_loc2_.quantity);
         break;
      case this._ivInventoryViewer2:
         _global.HERO_ID = this.heroID;
         this.api.network.Exchange.movementKama(- _loc2_.quantity);
      default:
         return;
   }
};
_loc1.callClose = function()
{
   // Guardar el filtro actual antes de cerrar (mismo sistema que Inventory.as)
   if(this._ivInventoryViewer != undefined && this._ivInventoryViewer._nCurrentFilterID != undefined)
   {
      switch(this._ivInventoryViewer._nCurrentFilterID)
      {
         case dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_EQUIPEMENT:
            this.api.datacenter.Basics.storage_filter = "equipement";
            break;
         case dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_NONEQUIPEMENT:
            this.api.datacenter.Basics.storage_filter = "nonequipement";
            break;
         case dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_RESSOURECES:
            this.api.datacenter.Basics.storage_filter = "resources";
            break;
         case dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_SOUL:
            this.api.datacenter.Basics.storage_filter = "soul";
            break;
         case dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_CARDS:
            this.api.datacenter.Basics.storage_filter = "cards";
            break;
         case dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_RUNES:
            this.api.datacenter.Basics.storage_filter = "runes";
      }
   }
   if(this._bMount == true)
   {
      this.api.ui.loadUIComponent("Mount","Mount");
   }
   _global.HERO_ID = this.heroID;
   this.api.network.Exchange.leave();
   return true;
};
_loc1.storageUsersCount = function(_loc2_)
{
};
#endinitclip