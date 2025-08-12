#initclip 135
var _loc1 = dofus["\r\x14"].gapi.ui.ForgemagusCraft.prototype;
_loc1.addListeners = function()
{
   this._cgGrid.addEventListener("dblClickItem",this);
   this._cgGrid.addEventListener("dropItem",this);
   this._cgGrid.addEventListener("dragItem",this);
   this._cgGrid.addEventListener("selectItem",this);
   this._cgGrid.addEventListener("overItem",this);
   this._cgGrid.addEventListener("outItem",this);
   this._cgLocal.addEventListener("dblClickItem",this);
   this._cgLocal.addEventListener("overItem",this);
   this._cgLocal.addEventListener("outItem",this);
   this._cgLocal.addEventListener("dropItem",this);
   this._cgLocal.addEventListener("dragItem",this);
   this._cgLocal.addEventListener("selectItem",this);
   this._ctrItem.addEventListener("dblClick",this);
   this._ctrItem.addEventListener("drag",this);
   this._ctrItem.addEventListener("drop",this);
   this._ctrItem.addEventListener("click",this);
   this._btnFilterSoul.addEventListener("click",this);
   this._btnFilterCards.addEventListener("click",this);
   this._btnFilterSoul.addEventListener("over",this);
   this._btnFilterCards.addEventListener("over",this);
   this._btnFilterSoul.addEventListener("out",this);
   this._btnFilterCards.addEventListener("out",this);
   this._btnFilterRunes.addEventListener("out",this);
   this._btnFilterRunes.addEventListener("click",this);
   this._btnFilterRunes.addEventListener("over",this);
   this._ctrSignature.addEventListener("dblClick",this);
   this._ctrSignature.addEventListener("drag",this);
   this._ctrSignature.addEventListener("drop",this);
   this._ctrSignature.addEventListener("click",this);
   this._ctrRune.addEventListener("dblClick",this);
   this._ctrRune.addEventListener("drag",this);
   this._ctrRune.addEventListener("drop",this);
   this._ctrRune.addEventListener("click",this);
   this._cgDistant.addEventListener("selectItem",this);
   this._btnFilterEquipement.addEventListener("click",this);
   this._btnFilterNonEquipement.addEventListener("click",this);
   this._btnFilterRessoureces.addEventListener("click",this);
   this._btnFilterEquipement.addEventListener("over",this);
   this._btnFilterNonEquipement.addEventListener("over",this);
   this._btnFilterRessoureces.addEventListener("over",this);
   this._btnFilterEquipement.addEventListener("out",this);
   this._btnFilterNonEquipement.addEventListener("out",this);
   this._btnFilterRessoureces.addEventListener("out",this);
   this._btnClose.addEventListener("click",this);
   this._btnOneShot.addEventListener("click",this);
   this._btnLoop.addEventListener("click",this);
   this._btnProb.addEventListener("click",this);
   this.api.datacenter.Exchange.addEventListener("localKamaChange",this);
   this.api.datacenter.Exchange.addEventListener("distantKamaChange",this);
   this.api.datacenter.Player.addEventListener("kamaChanged",this);
   this.addToQueue({object:this,method:this.kamaChanged,params:[{value:this.api.datacenter.Player.Kama}]});
   this._cbTypes.addEventListener("itemSelected",this);
   this.api.kernel.KeyManager.addShortcutsListener("onShortcut",this);
};
_loc1.onShortcut = function(_loc2_)
{
   var _loc2_ = true;
   if(_loc2_ == "MERGE_RUNE")
   {
      if(this["\x02\x14"]())
      {
         _loc2_ = false;
      }
      else
      {
         this["\x1b\x12\x0f"]();
         this["\x1b\x03\x16"]();
         _loc2_ = false;
      }
   }
   return _loc2_;
};
_loc1["\x1b\x12\x0f"] = function()
{
   this._aGarbageMemory = new Array();
   var _loc2_ = 0;
   var _loc3_;
   while(_loc2_ < this._eaLocalDataProvider.length)
   {
      _loc3_ = this._eaLocalDataProvider[_loc2_];
      this._aGarbageMemory.push({id:_loc3_.ID,quantity:_loc3_.Quantity});
      _loc2_ += 1;
   }
};
_loc1["\x1b\x03\x16"] = function()
{
   if(this.api.datacenter.Exchange.localGarbage.length == 0)
   {
      return undefined;
   }
   this.api.network.Exchange.ready();
};
_loc1["\x02\x14"] = function()
{
   if(this._ctrItem.contentData == undefined || this._ctrRune.contentData == undefined)
   {
      this.api.kernel.showMessage(this.api.lang.getText("ERROR_WORD"),this.api.lang.getText("FM_ERROR_NO_ITEMS"),"ERROR_BOX");
      return true;
   }
   return false;
};
_loc1.initTexts = function()
{
   this._lblFilter.text = this.api.lang.getText("EQUIPEMENT");
   this._winInventory.title = this.api.datacenter.Player.data.name;
   this._lblNewObject.text = this.api.lang.getText("CRAFTED_ITEM");
   this._lblSkill.text = this.api.lang.getText("SKILL") + " : " + this.api.lang.getSkillText(this._nSkillId).d;
   this._lblItemTitle.text = this.api.lang.getText("FM_CRAFT_ITEM");
   this._lblRuneTitle.text = this.api.lang.getText("FM_CRAFT_RUNE");
   this._lblSignatureTitle.text = this.api.lang.getText("FM_CRAFT_SIGNATURE");
   this._btnOneShot.label = this.api.lang.getText("APPLY_ONE_RUNE");
   this._btnLoop.label = this.api.lang.getText("APPLY_MULTIPLE_RUNES");
   this._btnProb.label = this.api.lang.getText("PROBABILIDAD_FORJA");
};
_loc1.validateDrop = function(sTargetGrid, oItem, nValue)
{
   if(nValue < 1 || nValue == undefined)
   {
      return undefined;
   }
   if(nValue > oItem.Quantity)
   {
      nValue = oItem.Quantity;
   }
   var _loc12_;
   var _loc13_;
   var _loc4_;
   var _loc9_;
   var _loc7_;
   var _loc8_;
   var _loc2_;
   var _loc6_;
   var _loc3_;
   var _loc5_;
   switch(sTargetGrid)
   {
      case "_cgGrid":
         this.api.network.Exchange.movementItem(false,oItem,nValue);
         break;
      case "_cgLocal":
         this.api.network.Exchange.movementItem(true,oItem,nValue);
         break;
      case "_ctrItem":
      case "_ctrRune":
      case "_ctrSignature":
         _loc12_ = false;
         _loc13_ = false;
         switch(sTargetGrid)
         {
      case "_ctrItem":
         if(this._nForgemagusItemType != oItem.type || !oItem.enhanceable)
         {
        return undefined;
         }
    // BUCLE 1 REEMPLAZADO CON 'FOR'
    for (var i = 0; i < this._eaLocalDataProvider.length; i++)
    {
        var isAllowed = false;
        var currentItem = this._eaLocalDataProvider[i];
        // BUCLE 2 REEMPLAZADO CON 'FOR'
        for (var j = 0; j < dofus.gapi.ui.ForgemagusCraft.ITEMS_ALLOWED_AS_SIGNATURE.length; j++)
        {
            if (dofus.gapi.ui.ForgemagusCraft.ITEMS_ALLOWED_AS_SIGNATURE[j] == currentItem.unicID)
            {
                isAllowed = true;
                break; // Sale del bucle j.
            }
        }
        
        // BUCLE 3 REEMPLAZADO CON 'FOR'
        for (var k = 0; k < dofus.gapi.ui.ForgemagusCraft.TYPES_ALLOWED_AS_COMPONENT.length; k++)
        {
            if (dofus.gapi.ui.ForgemagusCraft.TYPES_ALLOWED_AS_COMPONENT[k] == currentItem.type)
            {
                isAllowed = true;
                break; // Sale del bucle k.
            }
        }

        if (!isAllowed)
        {
            this.api.network.Exchange.movementItem(false, currentItem, currentItem.Quantity);
        }
    }

    _loc12_ = true;
    break;
            case "_ctrRune":
                        // Recorre todos los items en el panel de forjamagia
                        for (var i = 0; i < this._eaLocalDataProvider.length; i++) {
                           var currentItem = this._eaLocalDataProvider[i];
                        // Recorre la lista de tipos de item permitidos como runas
                        for (var j = 0; j < dofus.gapi.ui.ForgemagusCraft.TYPES_ALLOWED_AS_COMPONENT.length; j++) {
                           var allowedType = dofus.gapi.ui.ForgemagusCraft.TYPES_ALLOWED_AS_COMPONENT[j];
                        // Si el item es una runa, pero NO es la que acabamos de soltar, la devuelve al inventario.
                        if (allowedType == currentItem.type && currentItem.unicID != oItem.unicID) {
                           this.api.network.Exchange.movementItem(false, currentItem, currentItem.Quantity);
                              }
                           }
                  }
               break;
            case "_ctrSignature":
                  // Recorre todos los items en el panel de forjamagia
               for (var i = 0; i < this._eaLocalDataProvider.length; i++) {
                  var currentItem = this._eaLocalDataProvider[i];
                  // Recorre la lista de runas de firma permitidas
               for (var j = 0; j < dofus.gapi.ui.ForgemagusCraft.ITEMS_ALLOWED_AS_SIGNATURE.length; j++) {
                  var signatureID = dofus.gapi.ui.ForgemagusCraft.ITEMS_ALLOWED_AS_SIGNATURE[j];
            // Si el item es una runa de firma, la devuelve al inventario (para asegurar que solo haya una).
               if (signatureID == currentItem.unicID) {
                this.api.network.Exchange.movementItem(false, currentItem, currentItem.Quantity);
                  }
               }
             }
    if (this.getCurrentCraftLevel() < 100) {
        _loc13_ = true;
        this.api.kernel.showMessage(undefined, this.api.lang.getText("CRAFT_LEVEL_DOESNT_ALLOW_A_SIGNATURE"), "ERROR_CHAT");
    }
    _loc12_ = true;
         }
         if(!_loc13_)
         {
            this.api.network.Exchange.movementItem(true,oItem,!_loc12_ ? nValue : 1);
            break;
         }
   }
   if(this._bInvalidateDistant)
   {
      this.api.datacenter.Exchange.clearDistantGarbage();
      this._bInvalidateDistant = false;
   }
};
_loc1.updateInventori = function()
{
};
_loc1.repeatCraft = function()
{
   var _loc2_ = this._ctrRune.contentData.Quantity;
   if(_loc2_ <= 1)
   {
      return undefined;
   }
   this._bIsLooping = true;
   this.api.network.Exchange.repeatCraft(_loc2_);
   this._btnLoop.label = this.api.lang.getText("STOP_WORD");
   this._btnOneShot.enabled = false;
   this._btnProb.enabled = false;
};
_loc1.setReady = function()
{
   if(this.api.datacenter.Exchange.localGarbage.length == 0)
   {
      return undefined;
   }
   this.api.network.Exchange.repeatCraft(1);
};
_loc1.onCraftLoopEnd = function()
{
   this._btnLoop.label = this.api.lang.getText("APPLY_MULTIPLE_RUNES");
   this._btnOneShot.enabled = true;
   this._btnProb.enabled = true;
   this._bIsLooping = false;
   this._nCurrentQuantity = 1;
   this.updateData();
};
_loc1.over = function(_loc2_)
{
   switch(_loc2_.target)
   {
      case this._btnFilterEquipement:
         this.api.ui.showTooltip(this.api.lang.getText("EQUIPEMENT"),_loc2_.target,-20);
         break;
      case this._btnFilterNonEquipement:
         this.api.ui.showTooltip(this.api.lang.getText("NONEQUIPEMENT"),_loc2_.target,-20);
         break;
      case this._btnFilterSoul:
         this.api.ui.showTooltip(this.api.lang.getText("SOUL"),_loc2_.target,-20);
         break;
      case this._btnFilterRunes:
         this.api.ui.showTooltip(this.api.lang.getText("RUNES"),_loc2_.target,-20);
         break;
      case this._btnFilterCards:
         this.api.ui.showTooltip(this.api.lang.getText("CARDS"),_loc2_.target,-20);
         break;
      case this._btnFilterRessoureces:
         this.api.ui.showTooltip(this.api.lang.getText("RESSOURECES"),_loc2_.target,-20);
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnProb:
         this.api.network.send("EF");
         break;
      case this._btnClose:
         this.callClose();
         break;
      case this._btnOneShot:
         if(this.checkIsBaka())
         {
            return undefined;
         }
         this.recordGarbage();
         this.setReady();
         break;
      case this._btnLoop:
         if(this._bIsLooping)
         {
            this.api.network.Exchange.stopRepeatCraft();
            return undefined;
         }
         if(this.checkIsBaka())
         {
            return undefined;
         }
         this.recordGarbage();
         this.repeatCraft();
         break;
      case this._ctrItem:
      case this._ctrRune:
      case this._ctrSignature:
         if(oEvent.target.contentData == undefined)
         {
            this.hideItemViewer(true);
         }
         else
         {
            if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY))
            {
               this.api.kernel.GameManager.insertItemInChat(oEvent.target.contentData);
               return undefined;
            }
            this.hideItemViewer(false);
            this._itvItemViewer.itemData = oEvent.target.contentData;
         }
         break;
      default:
         if(oEvent.target != this._btnSelectedFilterButton)
         {
            this._btnSelectedFilterButton.selected = false;
            this._btnSelectedFilterButton = oEvent.target;
            switch(oEvent.target._name)
            {
               case "_btnFilterEquipement":
                  this._aSelectedSuperTypes = dofus.Constants.FILTER_EQUIPEMENT;
                  this._lblFilter.text = this.api.lang.getText("EQUIPEMENT");
                  break;
               case "_btnFilterNonEquipement":
                  this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.ForgemagusCraft.FILTER_NONEQUIPEMENT;
                  this._lblFilter.text = this.api.lang.getText("NONEQUIPEMENT");
                  break;
               case "_btnFilterSoul":
                  this._aSelectedSuperTypes = dofus.Constants.FILTER_SOUL;
                  break;
               case "_btnFilterRunes":
                  this._aSelectedSuperTypes = dofus.Constants.FILTER_RUNES;
                  break;
               case "_btnFilterCards":
                  this._aSelectedSuperTypes = dofus.Constants.FILTER_CARDS;
                  break;
               case "_btnFilterRessoureces":
                  this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.ForgemagusCraft.FILTER_RESSOURECES;
                  this._lblFilter.text = this.api.lang.getText("RESSOURECES");
            }
            this.updateData(true);
            break;
         }
         oEvent.target.selected = true;
         break;
   }
};
#endinitclip