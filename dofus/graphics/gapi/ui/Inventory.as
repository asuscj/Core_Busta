#initclip 115
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Inventory.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Inventory.CLASS_NAME);
   var banner = this.gapi.getUIComponent("Banner");
   if(banner != undefined && this.heroID == undefined)
   {
      banner.shortcuts.setCurrentTab("Items");
   }
   this.showCharacterPreview(this.api.kernel.OptionsManager.getOption("CharacterPreview"));
   this.showLivingItems(false);
   this.activaeliminar = false;
   this._windowInventoryRapidStuff._visible = false;
   this._tiSearch._visible = false;
   this._tiSearchFont._visible = false;
   this._btnQuitSearch._visible = false;
   this._ctr200._visible = false;
   this._ctr201._visible = false;
   this._ctr202._visible = false;
   this._ctr203._visible = false;
   this._ctr204._visible = false;
   this._ctr205._visible = false;
   this.tt._visible = false;
   this.cc._visible = false;
   this.bb._visible = false;
   this.cap._visible = false;
   this.ff._visible = false;
   this.dd._visible = false;
};
_loc1.kamaChanged = function(_loc2_)
{
   var kamaValue = _loc2_.value;
   if(kamaValue == undefined || _global.isNaN(Number(kamaValue)))
   {
      kamaValue = 0;
   }
   this._lblKama.text = new ank["\x1e\n\x07"]["\x0e\x1c"](kamaValue).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
};
_loc1.OgrineChanged = function(_loc2_)
{
   var ogrineValue = _loc2_.value;
   if(ogrineValue == undefined || _global.isNaN(Number(ogrineValue)))
   {
      ogrineValue = 0;
   }
   this._lblOgrina.text = new ank["\x1e\n\x07"]["\x0e\x1c"](ogrineValue).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
};
_loc1.createChildren = function()
{
   // Si no hay heroID, asegurar que el contexto está restaurado al personaje principal
   if(this.heroID == undefined) {
      this.api.datacenter.refresh();
   }
   
   this.player = this.api.datacenter.Player;
   var _loc2_ = this.api.datacenter.getHero(this.heroID);
   if(_loc2_ != undefined)
   {
      this.player = _loc2_;
   }
   this._winBg.onRelease = function()
   {
   };
   this._winBg.useHandCursor = false;
   this._winLivingItems.onRelease = function()
   {
   };
   this._winLivingItems.useHandCursor = false;
   this.addToQueue({object:this,method:this.hideEpisodicContent});
   this.addToQueue({object:this,method:this.initFilter});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
   this.hideItemViewer(true);
   this.hideItemSetViewer(true);
   this._ctrShield = this._ctr15;
   this._ctrWeapon = this._ctr1;
   this._ctrMount = this._ctr16;
   this._mcTwoHandedLink._visible = false;
   this._mcTwoHandedLink.stop();
   this._mcTwoHandedCrossLeft._visible = false;
   this._mcTwoHandedCrossRight._visible = false;
   Mouse.addListener(this);
   this.player.addEventListener("kamaChanged",this);
   // Ogrines always come from the main player, not from heroes
   this.api.datacenter.Player.addEventListener("OgrineChanged",this);
   this.player.addEventListener("mountChanged",this);
   this.player.addEventListener("nameChanged",this);
   this.addToQueue({object:this,method:this.kamaChanged,params:[{value:this.player.Kama}]});
   // Ogrines always come from the main player, not from heroes
   this.addToQueue({object:this,method:this.OgrineChanged,params:[{value:this.api.datacenter.Player.Ogrine}]});
   this.addToQueue({object:this,method:this.mountChanged});
   this.addToQueue({object:this,method:this.initTexts});
};
_loc1.initData = function()
{
   this._svCharacterViewer.zoom = 250;
   this.refreshSpriteViewer();
   this.dataProvider = this.player.Inventory;
};
_loc1.refreshSpriteViewer = function()
{
   var _loc2_ = this.player.data;
   if(_loc2_ == undefined)
   {
      _loc2_ = this.player;
   }
   var _loc3_ = new ank.battlefield.datacenter["\x1e\x0e\x10"]("viewer",ank.battlefield.mc["\x1e\x0e\x10"],_loc2_.gfxFile,undefined,5);
   _loc3_.color1 = _loc2_.color1;
   _loc3_.color2 = _loc2_.color2;
   _loc3_.color3 = _loc2_.color3;
   _loc3_.accessories = _loc2_.accessories;
   _loc3_.mount = _loc2_.mount;
   this._svCharacterViewer.sourceSpriteData = _loc2_;
   this._svCharacterViewer.spriteData = _loc3_;
};

_loc1.sortInventory = function(sField)
{
   if(!sField)
   {
      return undefined;
   }
   this._cgGrid.dataProvider.sortOn(sField,Array.NUMERIC);
   this._sCurrentSort = sField;
   this._nLastProviderLen = this._cgGrid.dataProvider.length;
   this._nLastFilterID = this._nCurrentFilterID;
   this._cgGrid.modelChanged();
};
_loc1.change = function(oEvent)
{
   if(this._tiSearch.text.length >= 3)
   {
      this.searchItem(this._tiSearch.text.toUpperCase());
   }
   else
   {
      this.updateData(false);
   }
};
_loc1.showCharacterPreview = function(bShow)
{
   if(bShow)
   {
      this._winPreview._visible = true;
      this._svCharacterViewer._visible = true;
      this._mcItemSetViewerPlacer._x = this._mcBottomPlacer._x;
      this._mcItemSetViewerPlacer._y = this._mcBottomPlacer._y;
      this._isvItemSetViewer._x = this._mcBottomPlacer._x;
      this._isvItemSetViewer._y = this._mcBottomPlacer._y;
   }
   else
   {
      this._winPreview._visible = false;
      this._svCharacterViewer._visible = false;
      this._mcItemSetViewerPlacer._x = this._winPreview._x;
      this._mcItemSetViewerPlacer._y = this._winPreview._y;
      this._isvItemSetViewer._x = this._winPreview._x;
      this._isvItemSetViewer._y = this._winPreview._y;
   }
};
_loc1.searchItem = function(sText)
{
   var _loc9_ = sText.split(" ");
   var _loc8_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc5_ = new Object();
   var _loc7_ = 0;
   var _loc2_ = 0;
   var _loc6_;
   var _loc3_;
   var _loc4_;
   while(_loc2_ < this._cgGridCopy.length)
   {
      _loc6_ = this._cgGridCopy[_loc2_];
      _loc3_ = this.searchWordsInName(_loc9_,_loc6_.name.toUpperCase(),_loc7_);
      if(_loc3_ != 0)
      {
         _loc4_ = new Object();
         _loc4_.oWords = _loc3_;
         _loc4_.oItem = _loc6_;
         _loc5_[_loc2_] = _loc4_;
         _loc7_ = _loc3_;
      }
      _loc2_ += 1;
   }
   for(var _loc10_ in _loc5_)
   {
      if(_loc5_[_loc10_].oWords >= _loc7_)
      {
         _loc8_.push(_loc5_[_loc10_].oItem);
      }
   }
   this._cgGrid.dataProvider = _loc8_;
   this._lblSearchCount.text = _loc8_.length != 0 ? _loc8_.length + " " + ank.utils.PatternDecoder.combine(this.api.lang.getText("OBJECTS"),"m",_loc8_ < 2) : this.api.lang.getText("NO_BIGSTORE_SEARCH_RESULT");
   this._btnView.enabled = false;
};
_loc1.searchWordsInName = function(aWords, sName, nMaxWordsCount)
{
   var _loc2_ = 0;
   var _loc1_ = aWords.length;
   var _loc3_;
   while(_loc1_ >= 0)
   {
      _loc3_ = aWords[_loc1_];
      if(sName.indexOf(_loc3_) != -1)
      {
         _loc2_ += 1;
      }
      else if(_loc2_ + _loc1_ < nMaxWordsCount)
      {
         return 0;
      }
      _loc1_ = _loc1_ - 1;
   }
   return _loc2_;
};
_loc1.resetTwoHandClip = function()
{
   this._cgGridCopy = this._cgGrid.dataProvider.clone();
   this._ctrShield.content._alpha = 100;
   this._ctrWeapon.content._alpha = 100;
   this._mcTwoHandedLink.gotoAndStop(1);
   if(this.api.datacenter.Player.weaponItem.needTwoHands)
   {
      this._mcTwoHandedLink._visible = true;
      this._mcTwoHandedCrossLeft._visible = true;
      this._mcTwoHandedCrossRight._visible = false;
   }
   else
   {
      this._mcTwoHandedLink._visible = false;
      this._mcTwoHandedCrossLeft._visible = false;
      this._mcTwoHandedCrossRight._visible = false;
   }
};
_loc1.showSearchButton = function(oValue, oClick)
{
   if(oValue)
   {
      this._cbTypes._visible = false;
      this._btnQuitSearch._visible = true;
      this._btnSearch._visible = false;
      this._tiSearch._visible = true;
      this._tiSearchFont._visible = true;
      this._tiSearch.text = "";
      this._tiSearch.setFocus();
   }
   else
   {
      this._cbTypes._visible = true;
      this._btnQuitSearch._visible = false;
      this._btnSearch._visible = true;
      this._tiSearch.text = "";
      this._tiSearch._visible = false;
      this._tiSearchFont._visible = false;
   }
};
_loc1.dropDownItem = function()
{
   if(!this.api.datacenter.Player.checkCanMoveItem())
   {
      return undefined;
   }
   var _loc3_ = this.gapi.getCursor();
   if(!_loc3_.canDrop)
   {
      this.gapi.loadUIComponent("AskOk","AskOkCantDrop",{title:this.api.lang.getText("IMPOSSIBLE"),text:this.api.lang.getText("CANT_DROP_ITEM")});
      return undefined;
   }
   this.gapi.removeCursor();
   var _loc4_;
   if(_loc3_.Quantity > 1)
   {
      _loc4_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:1,max:_loc3_.Quantity,params:{type:"drop",item:_loc3_}});
      _loc4_.addEventListener("validate",this);
   }
   else if(this.api.kernel.OptionsManager.getOption("ConfirmDropItem"))
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("CONFIRM_DROP_ITEM"),"CAUTION_YESNO",{name:"ConfirmDropOne",params:{item:_loc3_},listener:this});
   }
   else
   {
      _global.HERO_ID = this.heroID;
      this.api.network.Items.drop(_loc3_.ID,1);
   }
};
_loc1.yes = function(_loc2_)
{
   _global.HERO_ID = this.heroID;
   switch(_loc2_.target._name)
   {
      case "AskYesNoConfirmDropOne":
         this.api.network.Items.drop(_loc2_.target.params.item.ID,1);
         return;
      case "AskYesNoConfirmDrop":
         this.api.network.Items.drop(_loc2_.params.item.ID,Math.min(_loc2_.params.minValue,_loc2_.params.item.Quantity));
         return;
      case "AskYesNoDestroyMimibiote":
         this.api.network.Items.destroyMimibiote(_loc2_.target.params.item.ID);
         return;
      default:
         this.api.network.Items.destroy(_loc2_.target.params.item.ID,_loc2_.target.params.quantity);
         return;
   }
};
_loc1.askDestroy = function(_loc2_, _loc3_)
{
   var _loc4_;
   if(_loc2_.Quantity == 1)
   {
      _loc4_ = this.gapi.loadUIComponent("AskYesNo","AskYesNoDestroy",{title:this.api.lang.getText("QUESTION"),text:this.api.lang.getText("DO_U_DESTROY",[_loc3_,_loc2_.name]),params:{item:_loc2_,quantity:_loc3_}});
      _loc4_.addEventListener("yes",this);
   }
   else
   {
      _global.HERO_ID = this.heroID;
      this.api.network.Items.destroy(_loc2_.ID,_loc3_);
   }
};
_loc1.dropItem = function(p_event)
{
    if(!this.api.datacenter.Player.checkCanMoveItem())
    {
       return undefined;
    }
    var itemEnCursor = this.gapi.getCursor();
    if(itemEnCursor == undefined)
    {
       return undefined;
    }
    if(itemEnCursor.isShortcut)
    {
       this.api.network.InventoryShortcuts.sendInventoryShortcutRemove(itemEnCursor.position);
       return undefined;
    }
    var nuevaPosicion;
    if(p_event.target._parent == this)
    {
       nuevaPosicion = Number(p_event.target._name.substr(4));
    }
    else
    {
       if(itemEnCursor.position == -1)
       {
          this.resetTwoHandClip();
          return undefined;
       }
       nuevaPosicion = -1;
    }
    if(itemEnCursor.position == nuevaPosicion)
    {
       this.resetTwoHandClip();
       return undefined;
    }
    this.gapi.removeCursor();
    var popup;
    if(itemEnCursor.Quantity > 1 && (nuevaPosicion == -1 || nuevaPosicion == 16))
    {
       popup = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:itemEnCursor.Quantity,max:itemEnCursor.Quantity,params:{type:"move",position:nuevaPosicion,item:itemEnCursor}});
       popup.addEventListener("validate",this);
    }
    else
    {
       _global.HERO_ID = this.heroID;
       this.api.network.Items.movement(itemEnCursor.ID, nuevaPosicion);
    }
};
_loc1.outItem = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.addListeners = function()
{
   this._cgSets.addEventListener("overItem",this);
   this._cgSets.addEventListener("outItem",this);
   this._btnSearch.addEventListener("click",this);
   this._btnQuitSearch.addEventListener("click",this);
   this._tiSearch.addEventListener("change",this);
   this._cgGrid.addEventListener("dropItem",this);
   this._cgGrid.addEventListener("dragItem",this);
   this._cgGrid.addEventListener("selectItem",this);
   this._cgGrid.addEventListener("overItem",this);
   this._cgGrid.addEventListener("outItem",this);
   this._cgGrid.addEventListener("dblClickItem",this);
   this._btnCrear.addEventListener("click",this);
   this._btnNuevo.addEventListener("click",this);
   this._btnModificar.addEventListener("click",this);
   this._btnBorrar.addEventListener("click",this);
   this._btnUsar.addEventListener("click",this);
   this._btnFilterRunes.addEventListener("click",this);
   this._btnFilterSoul.addEventListener("click",this);
   this._btnFilterCards.addEventListener("click",this);
   this._btnFilterRunes.addEventListener("over",this);
   this._btnFilterSoul.addEventListener("over",this);
   this._btnFilterCards.addEventListener("over",this);
   this._btnFilterRunes.addEventListener("out",this);
   this._btnFilterSoul.addEventListener("out",this);
   this._btnFilterCards.addEventListener("out",this);
   this._btnMoreChoice.addEventListener("click",this);
   this._btnMoreChoice.addEventListener("over",this);
   this._btnMoreChoice.addEventListener("out",this);
   this._btnFilterSets.addEventListener("click",this);
   this._btnFilterSets.addEventListener("over",this);
   this._btnFilterSets.addEventListener("out",this);
   this._btnClose.addEventListener("click",this);
   this._btnFilterEquipement.addEventListener("click",this);
   this._btnFilterNonEquipement.addEventListener("click",this);
   this._btnFilterRessoureces.addEventListener("click",this);
   this._btnFilterQuest.addEventListener("click",this);
   this._btnFilterEquipement.addEventListener("over",this);
   this._btnFilterNonEquipement.addEventListener("over",this);
   this._btnFilterRessoureces.addEventListener("over",this);
   this._btnFilterQuest.addEventListener("over",this);
   this._btnFilterEquipement.addEventListener("out",this);
   this._btnFilterNonEquipement.addEventListener("out",this);
   this._btnFilterRessoureces.addEventListener("out",this);
   this._btnFilterQuest.addEventListener("out",this);
   this._itvItemViewer.addEventListener("useItem",this);
   this._itvItemViewer.addEventListener("destroyItem",this);
   this._itvItemViewer.addEventListener("separarMimobionte",this);
   this._itvItemViewer.addEventListener("verContenido",this);
   this._itvItemViewer.addEventListener("targetItem",this);
   this._cbTypes.addEventListener("itemSelected",this);
   var _loc4_;
   var _loc3_;
   var _loc2_;
   for(var _loc5_ in dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE)
   {
      _loc4_ = dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE[_loc5_];
      _loc3_ = 0;
      while(_loc3_ < _loc4_.length)
      {
         _loc2_ = this[_loc4_[_loc3_]];
         _loc2_.addEventListener("over",this);
         _loc2_.addEventListener("out",this);
         if(_loc2_.toolTipText == undefined)
         {
            _loc2_.toolTipText = this.api.lang.getText(_loc2_ == this._ctrMount ? "MOUNT" : "INVENTORY_" + _loc5_.toUpperCase());
         }
         _loc3_ += 1;
      }
   }
};
_loc1.initTexts = function()
{
   this._lblWeight.text = this.api.lang.getText("WEIGHT");
   this._winPreview.title = this.api.lang.getText("CHARACTER_PREVIEW",[this.api.datacenter.Player.Name]);
   this._winBg.title = this.api.lang.getText("INVENTORY");
   this._lblFilter.text = this.api.lang.getText("EQUIPEMENT");
   this._lblNoItem.text = this.api.lang.getText("SELECT_ITEM");
   this._winLivingItems.title = this.api.lang.getText("MANAGE_ITEM");
   this._txtNombre.text = "";
   this._txtNombre.restrict = "0-9a-zA-Z ";
   this._txtNombre.maxChars = 20;
   this._txtInformacion.text = this.api.lang.getText("ITEMS_SETS_RAPIDO");
   this._txtIntro.text = this.api.lang.getText("INTRO_SETS_RAPIDO");
   this._txtIconos.text = this.api.lang.getText("ICONOS_SETS_RAPIDO");
   this._btnNuevo.label = this.api.lang.getText("NEW");
   this._btnCrear.label = this.api.lang.getText("SAVE");
   this._btnUsar.label = this.api.lang.getText("USE");
   this._btnModificar.label = this.api.lang.getText("MODIFY");
   this._btnBorrar.label = this.api.lang.getText("DELETE");
   // Inicializar kamas y ogrinas directamente, como en Market.as
   this._lblKama.text = new ank["\x1e\n\x07"]["\x0e\x1c"](this.player.Kama).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   var ogrineVal = this.api.datacenter.Player.Ogrine;
   if(ogrineVal == undefined || ogrineVal == null)
   {
      ogrineVal = 0;
   }
   this._lblOgrina.text = new ank["\x1e\n\x07"]["\x0e\x1c"](ogrineVal).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   this._dgStats._visible = false;
};
_loc1.dblClickItem = function(_loc2_)
{
   if(!this.api.datacenter.Player.checkCanMoveItem())
   {
      return undefined;
   }
   var _loc3_ = _loc2_.target.contentData;
   if(_loc3_ == undefined)
   {
      return undefined;
   }
   _global.HERO_ID = this.heroID;
   if(_loc3_.position == -1)
   {
      if(_loc3_.canUse && this.api.datacenter.Player.canUseObject)
      {
         this.api.network.Items.use(_loc3_.ID);
      }
      else if(this.api.lang.getConfigText("DOUBLE_CLICK_TO_EQUIP"))
      {
         this.api.network.Items.equipItem(_loc3_);
      }
   }
   else
   {
      this.api.network.Items.movement(_loc3_.ID,-1);
   }
};
_loc1.equipItem = function(_loc2_)
{
   if(_loc2_.position != -1)
   {
      return undefined;
   }
   var _loc8_ = _loc2_.superType;
   var _loc5_;
   if(_loc2_.type != 83)
   {
      _loc5_ = 0;
      while(_loc5_ < dofus["\r\x14"].gapi.ui.Inventory.SUPERTYPE_NOT_EQUIPABLE.length)
      {
         if(dofus["\r\x14"].gapi.ui.Inventory.SUPERTYPE_NOT_EQUIPABLE[_loc5_] == _loc8_)
         {
            return undefined;
         }
         _loc5_ += 1;
      }
   }
   var _loc10_ = this.getFreeSlot(_loc2_);
   var _loc11_;
   var _loc4_;
   var _loc7_;
   var _loc3_;
   var _loc6_;
   if(_loc10_ != undefined)
   {
      _loc11_ = Number(_loc10_._name.substr(4));
      this.cleanRideIfNecessary(_loc8_);
      _global.HERO_ID = this.heroID;
      this.api.network.Items.movement(_loc2_.ID,_loc11_);
   }
   else
   {
      _loc4_ = this.api.lang.getSlotsFromSuperType(_loc2_.superType);
      _loc7_ = getTimer();
      _loc3_ = 0;
      while(_loc3_ < _loc4_.length)
      {
         if(this.api.kernel.GameManager.getLastModified(_loc4_[_loc3_]) < _loc7_)
         {
            _loc7_ = this.api.kernel.GameManager.getLastModified(_loc4_[_loc3_]);
            _loc6_ = _loc4_[_loc3_];
         }
         _loc3_ += 1;
      }
      if(this["_ctr" + _loc6_].contentData.ID == undefined || _global.isNaN(this["_ctr" + _loc6_].contentData.ID))
      {
         return undefined;
      }
      if(_loc6_ == undefined || _global.isNaN(_loc6_))
      {
         return undefined;
      }
      this.cleanRideIfNecessary(_loc8_);
      _global.HERO_ID = this.heroID;
      this.api.network.Items.movement(this["_ctr" + _loc6_].contentData.ID,-1);
      _global.HERO_ID = this.heroID;
      this.api.network.Items.movement(_loc2_.ID,_loc6_);
   }
};
_loc1.cleanRideIfNecessary = function(_loc2_)
{
   if(_loc2_ == 12 && (!this.api.datacenter.Game.isFight && this.api.datacenter.Player.isRiding))
   {
      _global.HERO_ID = this.heroID;
      this.api.network.Mount.ride();
   }
};
_loc1.useItem = function(_loc2_)
{
   if(!_loc2_.item.canUse || !this.api.datacenter.Player.canUseObject)
   {
      return undefined;
   }
   _global.HERO_ID = this.heroID;
   this.api.network.Items.use(_loc2_.item.ID);
};
_loc1.targetItem = function(_loc2_)
{
   if(!_loc2_.item.canTarget || !this.api.datacenter.Player.canUseObject)
   {
      return undefined;
   }
   this.api.kernel.GameManager.switchToItemTarget(_loc2_.item);
   this.callClose();
};
_loc1.mountChanged = function(_loc2_)
{
   var _loc2_ = this.api.datacenter.Player.mount;
   if(_loc2_ != undefined)
   {
      this._ctrMount.contentPath = "UI_InventoryMountIcon";
      this._mcMountCross._visible = false;
   }
   else
   {
      this._ctrMount.contentPath = "";
      this._mcMountCross._visible = true;
   }
   this.hideEpisodicContent();
};
_loc1.showItemInfos = function(_loc2_)
{
   var _loc2_;
   var _loc3_;
   if(_loc2_ == undefined)
   {
      this.hideItemViewer(true);
      this.hideItemSetViewer(true);
   }
   else
   {
      this.hideItemViewer(false);
      _loc2_ = _loc2_.clone();
      if(_loc2_.realGfx)
      {
         _loc2_.gfx = _loc2_.realGfx;
      }
      this._itvItemViewer.itemData = _loc2_;
      if(_loc2_.isFromItemSet)
      {
         _loc3_ = this.api.datacenter.Player.ItemSets.getItemAt(_loc2_.itemSetID);
         if(_loc3_ == undefined)
         {
            _loc3_ = new dofus.datacenter.ItemSet(_loc2_.itemSetID,"",[]);
         }
         this.hideItemSetViewer(false);
         this._isvItemSetViewer.itemSet = _loc3_;
      }
      else
      {
         this.hideItemSetViewer(true);
      }
   }
};
_loc1.mostrarPanelSet = function(bMostrar)
{
   this._cgGrid._visible = !bMostrar;
   this._cgSets._visible = bMostrar;
   if(bMostrar)
   {
      this._cgSets.dataProvider = this.api.datacenter.Player.SetsRapidos;
      this.actualizarContainers("");
   }
   else
   {
      this._dgStats._visible = false;
   }
   this._btnNuevo._visible = bMostrar;
   this._txtIntro._visible = bMostrar;
   this._txtInformacion._visible = bMostrar;
   this._nIcono = 1;
   this._oSet = undefined;
   var _loc2_ = 0;
   while(_loc2_ <= 17)
   {
      this["_sctr" + _loc2_]._visible = bMostrar;
      this["_m" + _loc2_]._visible = bMostrar;
      _loc2_ = _loc2_ + 1;
   }
   if(!bMostrar)
   {
      this._txtIconos._visible = false;
      this._cgIconos._visible = false;
      this._btnCrear._visible = false;
      this._btnUsar._visible = false;
      this._btnModificar._visible = false;
      this._btnBorrar._visible = false;
      this._mBlanco._visible = false;
      this._txtNombre._visible = false;
   }
};
_loc1.selectItem = function(oEvent)
{
   if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY) && oEvent.target.contentData != undefined)
   {
      this.api.kernel.GameManager.insertItemInChat(oEvent.target.contentData);
   }
   else
   {
      if(oEvent.target.contentData.position == -1 && this.activaeliminar)
      {
         _global.HERO_ID = this.heroID;
         this.api.network.send("Od" + oEvent.target.contentData.ID + "|" + oEvent.target.contentData.Quantity + "|1");
         this.api.datacenter.Player.dropItem(oEvent.target.contentData.ID);
      }
      this.showItemInfos(oEvent.target.contentData);
      this.showLivingItems(oEvent.target.contentData.skineable == true);
      if(oEvent.target.contentData.skineable)
      {
         this._livItemViewer.itemData = oEvent.target.contentData;
      }
   }
};
_loc1.initFilter = function()
{
   switch(this.api.datacenter.Basics.inventory_filter)
   {
      case "sets":
         this._btnFilterSets.selected = true;
         this._btnSelectedFilterButton = this._btnFilterSets;
         this.mostrarPanelSet(true);
         return;
      case "nonequipement":
         this._btnFilterNonEquipement.selected = true;
         this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Inventory.FILTER_NONEQUIPEMENT;
         this._btnSelectedFilterButton = this._btnFilterNonEquipement;
         this.mostrarPanelSet(false);
         return;
      case "resources":
         this._btnFilterRessoureces.selected = true;
         this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Inventory.FILTER_RESSOURECES;
         this._btnSelectedFilterButton = this._btnFilterRessoureces;
         this.mostrarPanelSet(false);
         return;
      case "runes":
         this._btnFilterRunes.selected = true;
         this._aSelectedSuperTypes = dofus.Constants.FILTER_RUNES;
         this._btnSelectedFilterButton = this._btnFilterRunes;
         this.mostrarPanelSet(false);
         return;
      case "soul":
         this._btnFilterSoul.selected = true;
         this._aSelectedSuperTypes = dofus.Constants.FILTER_SOUL;
         this._btnSelectedFilterButton = this._btnFilterSoul;
         this.mostrarPanelSet(false);
         return;
      case "cards":
         this._btnFilterCards.selected = true;
         this._aSelectedSuperTypes = dofus.Constants.FILTER_CARDS;
         this._btnSelectedFilterButton = this._btnFilterCards;
         this.mostrarPanelSet(false);
         return;
      case "quest":
         this._btnFilterQuest.selected = true;
         this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Inventory.FILTER_QUEST;
         this._btnSelectedFilterButton = this._btnFilterQuest;
         this.mostrarPanelSet(false);
         return;
      case "equipement":
      default:
         this._btnFilterEquipement.selected = true;
         this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Inventory.FILTER_EQUIPEMENT;
         this._btnSelectedFilterButton = this._btnFilterEquipement;
         this.mostrarPanelSet(false);
         return;
   }
};
_loc1.actualizarContainers = function(sData)
{
   var _loc3_ = 0;
   while(_loc3_ <= 17)
   {
      this["_sctr" + _loc3_].contentData = undefined;
      _loc3_ = _loc3_ + 1;
   }
   if(sData == undefined || sData == "")
   {
      return undefined;
   }
   var _loc8_ = sData.split(";");
   var _loc5_;
   var _loc7_;
   var _loc6_;
   var _loc4_;
   for(var _loc9_ in _loc8_)
   {
      _loc5_ = _loc8_[_loc9_].split(",");
      _loc7_ = _global.parseInt(_loc5_[0]);
      _loc6_ = _global.parseInt(_loc5_[1]);
   _loc4_ = this.api.datacenter.Player.getObjeto(_loc7_);
      if(_loc4_ != undefined)
      {
         this["_sctr" + _loc6_].contentData = _loc4_.item;
      }
   }
};
_loc1.showSearch = function()
{
   var _loc2_ = this.gapi.loadUIComponent("InventorySearch","InventorySearch",{_oDataProvider:this._cgGrid.dataProvider});
   _loc2_.addEventListener("selected",this);
};
_loc1.getData = function()
{
   var _loc2_ = "";
   var _loc3_ = 0;
   var _loc4_;
   while(_loc3_ <= 17)
   {
      _loc4_ = this["_ctr" + _loc3_].contentData;
      if(_loc4_ != undefined)
      {
         if(_loc2_.length > 0)
         {
            _loc2_ += ";";
         }
         _loc2_ += _loc4_.ID + "," + _loc4_.position;
      }
      _loc3_ = _loc3_ + 1;
   }
   return _loc2_;
};
_loc1.elegirSet = function(oEvent)
{
   var _loc4_ = oEvent.target.contentData;
   if(_loc4_ == undefined)
   {
      return undefined;
   }
   this._oSet = _loc4_;
   this.actualizarContainers(this._oSet.data);
   this._cgIconos._visible = false;
   this._btnCrear._visible = false;
   this._mBlanco._visible = false;
   this._txtNombre._visible = false;
   this._txtIconos._visible = false;
   this._btnUsar._visible = true;
   this._dgStats._visible = true;
   this._btnModificar._visible = true;
   this._btnBorrar._visible = true;
   var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc7_ = 0;
   var _loc2_ = this.api.datacenter.Player;
   _loc3_.push({name:"PDV",total:_loc2_.LP + "/" + _loc2_.LPmax,icon:"Coeur"});
   _loc3_.push({name:"PA",total:_loc2_.AP,icon:"Star"});
   _loc3_.push({name:"PM",total:_loc2_.MP,icon:"IconMP"});
   _loc3_.push({name:this.api.lang.getText("INITIATIVE"),total:_loc2_.Initiative,icon:"IconInit"});
   _loc3_.push({name:this.api.lang.getText("DISCERNMENT"),total:_loc2_.Discernment,icon:"IconPP"});
   _loc3_.push({name:this.api.lang.getText("VITALITY"),total:this.api.datacenter.Player.Vitality + (_loc2_.VitalityXtra != 0 ? (_loc2_.VitalityXtra > 0 ? " (+" : " (") + String(_loc2_.VitalityXtra) + ")" : ""),icon:"IconVita"});
   _loc3_.push({name:this.api.lang.getText("WISDOM"),total:this.api.datacenter.Player.Wisdom + (_loc2_.WisdomXtra != 0 ? (_loc2_.WisdomXtra > 0 ? " (+" : " (") + String(_loc2_.WisdomXtra) + ")" : ""),icon:"IconWisdom"});
   _loc3_.push({name:this.api.lang.getText("FORCE"),total:this.api.datacenter.Player.Force + (_loc2_.ForceXtra != 0 ? (_loc2_.ForceXtra > 0 ? " (+" : " (") + String(_loc2_.ForceXtra) + ")" : ""),icon:"IconEarthBonus"});
   _loc3_.push({name:this.api.lang.getText("INTELLIGENCE"),total:this.api.datacenter.Player.Intelligence + (_loc2_.IntelligenceXtra != 0 ? (_loc2_.IntelligenceXtra > 0 ? " (+" : " (") + String(_loc2_.IntelligenceXtra) + ")" : ""),icon:"IconFireBonus"});
   _loc3_.push({name:this.api.lang.getText("CHANCE"),total:this.api.datacenter.Player.Chance + (_loc2_.ChanceXtra != 0 ? (_loc2_.ChanceXtra > 0 ? " (+" : " (") + String(_loc2_.ChanceXtra) + ")" : ""),icon:"IconWaterBonus"});
   _loc3_.push({name:this.api.lang.getText("AGILITY"),total:this.api.datacenter.Player.Agility + (_loc2_.AgilityXtra != 0 ? (_loc2_.AgilityXtra > 0 ? " (+" : " (") + String(_loc2_.AgilityXtra) + ")" : ""),icon:"IconAirBonus"});
   this._dgStats.dataProvider = _loc3_;
};
_loc1.elegirIcono = function(oEvent)
{
   var _loc2_ = oEvent.target.contentData;
   if(_loc2_ == undefined)
   {
      return undefined;
   }
   this._nIcono = _loc2_.index;
};
_loc1.overItem = function(oEvent)
{
   // No mostrar nada si estamos arrastrando un objeto
   if(!this.gapi.isCursorHidden())
   {
      return;
   }
   // Obtenemos los datos del objeto sobre el que está el cursor
   var oItem = oEvent.target.contentData;
   // Si no hay un objeto, no hacemos nada
   if(oItem == undefined)
   {
      return;
   }
   // Construimos el texto inicial con nombre y nivel
   var sText = oItem.name + " (" + this.api.lang.getText("LEVEL_SMALL") + " " + oItem.level + ")";
   var nYOffset = -20;
   var bFirstEffect = true;
   // Recorremos todos los efectos (stats) del objeto
   var aEffects = oItem.effects;
   for(var i = 0; i < aEffects.length; i++)
   {
      var oEffect = aEffects[i];
      if(oEffect.description != undefined && oEffect.description.length > 0)
      {
         // Si es el primer stat, añadimos un espacio
         if(bFirstEffect)
         {
            sText += "\n";
            nYOffset -= 10;
            bFirstEffect = false;
         }
         // Añadimos cada stat al texto
         sText += "\n" + oEffect.description;
         nYOffset -= 12;
      }
   }
   // Mostramos el tooltip final
   this.api.ui.showTooltip(sText,oEvent.target,nYOffset,{bXLimit:true,bYLimit:false});
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnFilterSets:
         this.api.ui.showTooltip(this.api.lang.getText("SETS_RAPIDOS"),oEvent.target,-20);
         return;
      case this._btnFilterEquipement:
         this.api.ui.showTooltip(this.api.lang.getText("EQUIPEMENT"),oEvent.target,-20);
         return;
      case this._btnFilterNonEquipement:
         this.api.ui.showTooltip(this.api.lang.getText("NONEQUIPEMENT"),oEvent.target,-20);
         return;
      case this._btnFilterRessoureces:
         this.api.ui.showTooltip(this.api.lang.getText("RESSOURECES"),oEvent.target,-20);
         return;
      case this._btnFilterQuest:
         this.api.ui.showTooltip(this.api.lang.getText("QUEST_OBJECTS"),oEvent.target,-20);
         return;
      case this._btnFilterRunes:
         this.api.ui.showTooltip(this.api.lang.getText("RUNES"),oEvent.target,-20);
         return;
      case this._btnFilterSoul:
         this.api.ui.showTooltip(this.api.lang.getText("SOUL"),oEvent.target,-20);
         return;
      case this._btnFilterCards:
         this.api.ui.showTooltip(this.api.lang.getText("CARDS"),oEvent.target,-20);
         return;
      default:
         this.api.ui.showTooltip(oEvent.target.toolTipText,oEvent.target,-20);
         return;
   }
};
_loc1.cargarIconos = function()
{
   var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc2_ = 1;
   var _loc3_;
   while(_loc2_ <= 27)
   {
      _loc3_ = new Object();
      _loc3_.iconFile = dofus.Constants.SETS_RAPIDOS_ICONS_PATH + _loc2_ + ".swf";
      _loc3_.index = _loc2_;
      _loc4_.push(_loc3_);
      _loc2_ = _loc2_ + 1;
   }
   this._cgIconos.dataProvider = _loc4_;
};
_loc1.showLivingItems = function(bShow)
{
   this._livItemViewer._visible = bShow;
   this._winLivingItems._visible = bShow;
   if(bShow)
   {
      this._mcItemSetViewerPlacer._x = this._mcBottomPlacer._x;
      this._mcItemSetViewerPlacer._y = this._mcBottomPlacer._y;
      this._isvItemSetViewer._x = this._mcBottomPlacer._x;
      this._isvItemSetViewer._y = this._mcBottomPlacer._y;
   }
   else
   {
      this.showCharacterPreview(this.api.kernel.OptionsManager.getOption("CharacterPreview"));
   }
};
_loc1.separarMimobionte = function(oEvent)
{
   _global.HERO_ID = this.heroID;
   this.api.network.send("Om" + oEvent.item.ID);
};
_loc1.linkearItem = function(oEvent)
{
   _global.HERO_ID = this.heroID;
   this.api.network.send("Om" + oEvent.item.ID);
};
_loc1.VerouilleObject = function(oEvent)
{
   _global.HERO_ID = this.heroID;
   this.api.network.send("OL" + oEvent.item.ID);
};
_loc1.verContenido = function(oEvent)
{
   this.api.ui.loadUIComponent("Contenido","Contenido",{datos:oEvent.item.ID});
};
_loc1.deleteSetF = function()
{
   this._cgIconos._visible = false;
   this._btnCrear._visible = false;
   this._mBlanco._visible = false;
   this._txtNombre._visible = false;
   this._dgStats._visible = false;
   this._txtIconos._visible = false;
   this._btnUsar._visible = false;
   this._btnModificar._visible = false;
   this._btnBorrar._visible = false;
   this._cgSets.dataProvider = this.api.datacenter.Player.SetsRapidos;
   this.actualizarContainers("");
};
_loc1.click = function(oEvent)
{
   if(oEvent.target == this._btnClose)
   {
      this.callClose();
      return undefined;
   }
   var _loc4_;
   var _loc6_;
   var _loc5_;
   var _loc9_;
   var _loc10_;
   var _loc7_;
   var _loc13_;
   switch(oEvent.target._name)
   {
      case "_btnMimi":
         elementsVisible = !elementsVisible;
         this._ctr200._visible = elementsVisible;
         this._ctr201._visible = elementsVisible;
         this._ctr202._visible = elementsVisible;
         this._ctr203._visible = elementsVisible;
         this._ctr204._visible = elementsVisible;
         this._ctr205._visible = elementsVisible;
         this.tt._visible = elementsVisible;
         this.cc._visible = elementsVisible;
         this.bb._visible = elementsVisible;
         this.cap._visible = elementsVisible;
         this.ff._visible = elementsVisible;
         this.dd._visible = elementsVisible;
         this._ctr6._visible = !elementsVisible;
         this._ctr1._visible = !elementsVisible;
         this._ctr15._visible = !elementsVisible;
         this._ctr7._visible = !elementsVisible;
         this._ctr8._visible = !elementsVisible;
         this._ctr16._visible = !elementsVisible;
         this.t._visible = !elementsVisible;
         this.c._visible = !elementsVisible;
         this.b._visible = !elementsVisible;
         this.ca._visible = !elementsVisible;
         this.f._visible = !elementsVisible;
         this.d._visible = !elementsVisible;
         return undefined;
      case "_btnNuevo":
         this.gapi.loadUIComponent("CustomSetEdit","CustomSetEdit",{rapidStuff:undefined});
         _loc4_ = 0;
         while(_loc4_ <= 17)
         {
            this["_sctr" + _loc4_].contentData = this["_ctr" + _loc4_].contentData;
            _loc4_ = _loc4_ + 1;
         }
         return undefined;
      case "_btnCrear":
         if(this._txtNombre.text == "")
         {
            return undefined;
         }
         this._txtIconos._visible = false;
         this._cgIconos._visible = false;
         this._btnCrear._visible = false;
         this._mBlanco._visible = false;
         this._txtNombre._visible = false;
         if(this._cgSets.dataProvider.length >= 10)
         {
            return undefined;
         }
         _loc6_ = 0;
         _loc4_ = 1;
         while(_loc4_ <= 12)
         {
            _loc5_ = this.api.datacenter.Player.getSet(_loc4_);
            if(_loc5_ == undefined)
            {
               _loc6_ = _loc4_;
               break;
            }
            _loc4_ = _loc4_ + 1;
         }
         if(_loc6_ == 0)
         {
            return undefined;
         }
         _loc9_ = this.getData();
         _loc10_ = {ID:_loc6_,name:this._txtNombre.text,icono:this._nIcono,iconFile:dofus.Constants.SETS_RAPIDOS_ICONS_PATH + this._nIcono + ".swf",data:_loc9_};
         this.api.datacenter.Player.addSet(_loc10_);
         this._cgSets.dataProvider = this.api.datacenter.Player.SetsRapidos;
         _global.HERO_ID = this.heroID;
         this.api.network.send("ZSC" + _loc6_ + "|" + this._txtNombre.text + "|" + this._nIcono + "|" + _loc9_);
         return undefined;
         break;
      case "_btnModificar":
         if(this._oSet == undefined)
         {
            return undefined;
         }
         this.gapi.loadUIComponent("CustomSetEdit","CustomSetEdit",{rapidStuff:this._oSet});
         return undefined;
         break;
      case "_btnUsar":
         if(this._oSet == undefined)
         {
            return undefined;
         }
         _loc7_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         _loc13_ = 0;
         _loc5_ = this.api.datacenter.Player;
         _loc7_.push({name:"PDV",total:_loc5_.LP + "/" + _loc5_.LPmax,icon:"Coeur"});
         _loc7_.push({name:"PA",total:_loc5_.AP,icon:"Star"});
         _loc7_.push({name:"PM",total:_loc5_.MP,icon:"IconMP"});
         _loc7_.push({name:this.api.lang.getText("INITIATIVE"),total:_loc5_.Initiative,icon:"IconInit"});
         _loc7_.push({name:this.api.lang.getText("DISCERNMENT"),total:_loc5_.Discernment,icon:"IconPP"});
         _loc7_.push({name:this.api.lang.getText("VITALITY"),total:this.api.datacenter.Player.Vitality + (_loc5_.VitalityXtra != 0 ? (_loc5_.VitalityXtra > 0 ? " (+" : " (") + String(_loc5_.VitalityXtra) + ")" : ""),icon:"IconVita"});
         _loc7_.push({name:this.api.lang.getText("WISDOM"),total:this.api.datacenter.Player.Wisdom + (_loc5_.WisdomXtra != 0 ? (_loc5_.WisdomXtra > 0 ? " (+" : " (") + String(_loc5_.WisdomXtra) + ")" : ""),icon:"IconWisdom"});
         _loc7_.push({name:this.api.lang.getText("FORCE"),total:this.api.datacenter.Player.Force + (_loc5_.ForceXtra != 0 ? (_loc5_.ForceXtra > 0 ? " (+" : " (") + String(_loc5_.ForceXtra) + ")" : ""),icon:"IconEarthBonus"});
         _loc7_.push({name:this.api.lang.getText("INTELLIGENCE"),total:this.api.datacenter.Player.Intelligence + (_loc5_.IntelligenceXtra != 0 ? (_loc5_.IntelligenceXtra > 0 ? " (+" : " (") + String(_loc5_.IntelligenceXtra) + ")" : ""),icon:"IconFireBonus"});
         _loc7_.push({name:this.api.lang.getText("CHANCE"),total:this.api.datacenter.Player.Chance + (_loc5_.ChanceXtra != 0 ? (_loc5_.ChanceXtra > 0 ? " (+" : " (") + String(_loc5_.ChanceXtra) + ")" : ""),icon:"IconWaterBonus"});
         _loc7_.push({name:this.api.lang.getText("AGILITY"),total:this.api.datacenter.Player.Agility + (_loc5_.AgilityXtra != 0 ? (_loc5_.AgilityXtra > 0 ? " (+" : " (") + String(_loc5_.AgilityXtra) + ")" : ""),icon:"IconAirBonus"});
         this._dgStats.dataProvider = _loc7_;
         this.api.network.send("ZSU" + this._oSet.ID);
         return undefined;
         break;
      case "_btnBorrar":
         if(this._oSet == undefined)
         {
            return undefined;
         }
         this._cgIconos._visible = false;
         this._btnCrear._visible = false;
         this._mBlanco._visible = false;
         this._txtNombre._visible = false;
         this._txtIconos._visible = false;
         this._btnUsar._visible = false;
         this._btnModificar._visible = false;
         this._btnBorrar._visible = false;
         this.api.datacenter.Player.removeSet(this._oSet.ID);
         this._cgSets.dataProvider = this.api.datacenter.Player.SetsRapidos;
         this.actualizarContainers("");
         _global.HERO_ID = this.heroID;
         this.api.network.send("ZSB" + this._oSet.ID);
         return undefined;
         break;
      default:
         if(this._mcArrowAnimation._visible)
         {
            this._mcArrowAnimation._visible = false;
         }
         if(oEvent.target == this._btnMoreChoice)
         {
            _loc7_ = this.api.ui.createPopupMenu();
            _loc7_.addItem(this.api.lang.getText("INVENTORY_DATE_SORT"),this,this.sortInventory,["_itemDateId"]);
            _loc7_.addItem(this.api.lang.getText("INVENTORY_NAME_SORT"),this,this.sortInventory,["_itemName"]);
            _loc7_.addItem(this.api.lang.getText("INVENTORY_TYPE_SORT"),this,this.sortInventory,["_itemType"]);
            _loc7_.addItem(this.api.lang.getText("INVENTORY_LEVEL_SORT"),this,this.sortInventory,["_itemLevel"]);
            _loc7_.addItem(this.api.lang.getText("INVENTORY_POD_SORT"),this,this.sortInventory,["_itemWeight"]);
            _loc7_.addItem(this.api.lang.getText("INVENTORY_QTY_SORT"),this,this.sortInventory,["_nQuantity"]);
            _loc7_.show(_root._xmouse,_root._ymouse);
            return undefined;
         }
         if(oEvent.target != this._btnSelectedFilterButton)
         {
            this.api.sounds.events.onInventoryFilterButtonClick();
            this._btnSelectedFilterButton.selected = false;
            this._btnSelectedFilterButton = oEvent.target;
            switch(oEvent.target._name)
            {
               case "_btnFilterSets":
                  this._lblFilter.text = this.api.lang.getText("SETS_RAPIDOS");
                  this.mostrarPanelSet(true);
                  return undefined;
               case "_btnFilterEquipement":
                  this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Inventory.FILTER_EQUIPEMENT;
                  this._lblFilter.text = this.api.lang.getText("EQUIPEMENT");
                  this.api.datacenter.Basics.inventory_filter = "equipement";
                  this.mostrarPanelSet(false);
                  break;
               case "_btnFilterNonEquipement":
                  this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Inventory.FILTER_NONEQUIPEMENT;
                  this._lblFilter.text = this.api.lang.getText("NONEQUIPEMENT");
                  this.api.datacenter.Basics.inventory_filter = "nonequipement";
                  this.mostrarPanelSet(false);
                  break;
               case "_btnFilterRessoureces":
                  this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Inventory.FILTER_RESSOURECES;
                  this._lblFilter.text = this.api.lang.getText("RESSOURECES");
                  this.api.datacenter.Basics.inventory_filter = "resources";
                  this.mostrarPanelSet(false);
                  break;
               case "_btnFilterRunes":
                  this._aSelectedSuperTypes = dofus.Constants.FILTER_RUNES;
                  this._lblFilter.text = this.api.lang.getText("RUNES");
                  this.api.datacenter.Basics.inventory_filter = "runes";
                  this.mostrarPanelSet(false);
                  break;
               case "_btnFilterSoul":
                  this._aSelectedSuperTypes = dofus.Constants.FILTER_SOUL;
                  this._lblFilter.text = this.api.lang.getText("SOUL");
                  this.api.datacenter.Basics.inventory_filter = "soul";
                  this.mostrarPanelSet(false);
                  break;
               case "_btnFilterCards":
                  this._aSelectedSuperTypes = dofus.Constants.FILTER_CARDS;
                  this._lblFilter.text = this.api.lang.getText("CARDS");
                  this.api.datacenter.Basics.inventory_filter = "cards";
                  this.mostrarPanelSet(false);
                  break;
               case "_btnFilterQuest":
                  this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Inventory.FILTER_QUEST;
                  this._lblFilter.text = this.api.lang.getText("QUEST_OBJECTS");
                  this.api.datacenter.Basics.inventory_filter = "quest";
                  this.mostrarPanelSet(false);
                  break;
               case "_btnSearch":
                  this.showSearchButton(true);
                  break;
               case "_btnQuitSearch":
                  this.showSearchButton(false);
            }
            this.updateData(true);
            return;
         }
         oEvent.target.selected = true;
         return;
   }
};
_loc1.elementsVisible = false;
_loc1._oSet = undefined;
_loc1._nIcono = 1;
#endinitclip