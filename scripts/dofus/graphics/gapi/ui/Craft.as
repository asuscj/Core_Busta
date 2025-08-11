var _loc1 = dofus["\r\x14"].gapi.ui.Craft.prototype;
_loc1.addListeners = function()
{
   this._cgGrid.addEventListener("dblClickItem",this);
   this._cgGrid.addEventListener("dropItem",this);
   this._cgGrid.addEventListener("dragItem",this);
   this._cgGrid.addEventListener("selectItem",this);
   this._cgGrid.addEventListener("overItem",this);
   this._cgGrid.addEventListener("outItem",this);
   this._cgLocal.addEventListener("dblClickItem",this);
   this._cgLocal.addEventListener("dropItem",this);
   this._cgLocal.addEventListener("dragItem",this);
   this._cgLocal.addEventListener("selectItem",this);
   this._cgLocal.addEventListener("overItem",this);
   this._cgLocal.addEventListener("outItem",this);
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
   this._btnFilterSoul.addEventListener("click",this);
   this._btnFilterCards.addEventListener("click",this);
   this._btnFilterSoul.addEventListener("over",this);
   this._btnFilterCards.addEventListener("over",this);
   this._btnFilterSoul.addEventListener("out",this);
   this._btnFilterCards.addEventListener("out",this);
   this._btnFilterRunes.addEventListener("out",this);
   this._btnFilterRunes.addEventListener("click",this);
   this._btnFilterRunes.addEventListener("over",this);
   this._btnClose.addEventListener("click",this);
   this._btnQuantity.addEventListener("click",this);
   this._btnTries.addEventListener("click",this);
   this._btnApplyRunes.addEventListener("click",this);
   this.api.datacenter.Exchange.addEventListener("localKamaChange",this);
   this.api.datacenter.Exchange.addEventListener("distantKamaChange",this);
   this._btnValidate.addEventListener("click",this);
   this._btnCraft.addEventListener("click",this);
   this._btnMemoryRecall.addEventListener("click",this);
   this._ctrPreview.addEventListener("over",this);
   this._ctrPreview.addEventListener("out",this);
   this._cbTypes.addEventListener("itemSelected",this);
   this._cgGrid.multipleContainerSelectionEnabled = false;
   this._cgDistant.multipleContainerSelectionEnabled = false;
   this._cgLocal.multipleContainerSelectionEnabled = false;
   this._cgLocalSave.multipleContainerSelectionEnabled = false;
};
_loc1.click = function(_loc2_)
{
   if(_loc2_.target == this._btnClose)
   {
      this.callClose();
      return undefined;
   }
   var _loc9_;
   var _loc8_;
   var _loc6_;
   var _loc3_;
   var _loc5_;
   var _loc2_;
   var _loc4_;
   var _loc11_;
   if(_loc2_.target == this._btnQuantity)
   {
      _loc9_ = 99;
      _loc8_ = 0;
      _loc6_ = 10000000;
      _loc3_ = 0;
      while(_loc3_ < this._eaLocalDataProvider.length)
      {
         _loc5_ = false;
         _loc2_ = 0;
         while(_loc2_ < this._eaDataProvider.length)
         {
            if(this._eaLocalDataProvider[_loc3_].ID == this._eaDataProvider[_loc2_].ID)
            {
               _loc5_ = true;
               _loc4_ = Math.floor(this._eaDataProvider[_loc2_].Quantity / this._eaLocalDataProvider[_loc3_].Quantity);
               if(_loc4_ < _loc6_)
               {
                  _loc6_ = _loc4_;
               }
            }
            _loc2_ += 1;
         }
         if(!_loc5_)
         {
            break;
         }
         _loc3_ += 1;
      }
      if(_loc5_)
      {
         _loc8_ = 1;
         _loc9_ = _loc6_ + 1;
         if(_loc8_ > _loc6_)
         {
            _loc8_ = _loc6_;
         }
      }
      else
      {
         _loc9_ = 0;
         _loc8_ = 0;
      }
      _loc11_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:1,max:_loc9_,params:{targetType:"repeat"}});
      _loc11_.addEventListener("validate",this);
      return undefined;
   }
   var _loc10_;
   if(_loc2_.target == this._btnTries)
   {
      _loc10_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:1,max:99,params:{targetType:"tries"}});
      _loc10_.addEventListener("validate",this);
      return undefined;
   }
   var _loc12_;
   if(_loc2_.target == this._btnValidate || _loc2_.target == this._btnApplyRunes)
   {
      if(this._bIsLooping)
      {
         this.api.network.Exchange.stopRepeatCraft();
         return undefined;
      }
      if(this._eaLocalDataProvider.length == 0)
      {
         return undefined;
      }
      _loc12_ = this.api.kernel.GameManager.analyseReceipts(this.api.kernel.GameManager.mergeUnicItemInInventory(this._eaLocalDataProvider),this._nSkillId,this._nMaxItem);
      if(_loc12_ == undefined && this.api.kernel.OptionsManager.getOption("AskForWrongCraft"))
      {
         this.api.kernel.showMessage(this.api.lang.getText("INFORMATIONS"),this.api.lang.getText("WRONG_CRAFT_CONFIRM"),"CAUTION_YESNO",{name:"confirmWrongCraft",listener:this});
      }
      else
      {
         this.validCraft();
      }
      return undefined;
   }
   if(_loc2_.target == this._btnCraft)
   {
      this.showCraftViewer(_loc2_.target.selected);
      return undefined;
   }
   if(_loc2_.target == this._btnMemoryRecall)
   {
      this.api.network.Exchange.replayCraft();
      return undefined;
   }
   if(_loc2_.target != this._btnSelectedFilterButton)
   {
      this._btnSelectedFilterButton.selected = false;
      this._btnSelectedFilterButton = _loc2_.target;
      switch(_loc2_.target._name)
      {
         case "_btnFilterEquipement":
            this._aSelectedSuperTypes = dofus.Constants.FILTER_EQUIPEMENT;
            this._lblFilter.text = this.api.lang.getText("EQUIPEMENT");
            break;
         case "_btnFilterNonEquipement":
            this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Craft.FILTER_NONEQUIPEMENT;
            this._lblFilter.text = this.api.lang.getText("NONEQUIPEMENT");
            break;
         case "_btnFilterSoul":
            this._aSelectedSuperTypes = dofus.Constants.FILTER_SOUL;
            this._lblFilter.text = this.api.lang.getText("SOUL");
            break;
         case "_btnFilterRunes":
            this._aSelectedSuperTypes = dofus.Constants.FILTER_RUNES;
            this._lblFilter.text = this.api.lang.getText("RUNES");
            break;
         case "_btnFilterCards":
            this._aSelectedSuperTypes = dofus.Constants.FILTER_CARDS;
            this._lblFilter.text = this.api.lang.getText("CARDS");
            break;
         case "_btnFilterRessoureces":
            this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Craft.FILTER_RESSOURECES;
            this._lblFilter.text = this.api.lang.getText("RESSOURECES");
      }
      this.updateData(true);
   }
   else
   {
      _loc2_.target.selected = true;
   }
};
_loc1.initGridWidth = function()
{
   if(this._nMaxItem == undefined)
   {
      this._nMaxItem = 12;
   }
   if(this._nSkillId == 181)
   {
      this._nMaxItem = 12;
   }
   this._cgLocal.visibleColumnCount = this._nMaxItem;
   var _loc2_ = dofus["\r\x14"].gapi.ui.Craft.GRID_CONTAINER_WIDTH * this._nMaxItem;
   var _loc3_ = Math.max(304,_loc2_);
   this._cgLocal.setSize(_loc2_);
   this._cgLocal._x = this._nMaxRight - _loc2_ - this._nCgLocalWinLocal / 2;
   this._winLocal.setSize(_loc3_ + this._nCgLocalWinLocal);
   this._winLocal._x = this._nMaxRight - _loc3_ - this._nCgLocalWinLocal;
   this._mcArrow._x = this._winLocal._x - this._nArrowToLocalWin;
   this._winDistant._x = this._winLocal._x - this._nDistantToLocalWin;
   this._lblNewObject._x = this._winDistant._x + this._nLblNewToDistantWin;
   this._cgDistant._x = this._winDistant._x + this._nCgDistantToDistantWin;
   this._ctrPreview._x = this._cgDistant._x;
   this._mcFiligrane._x = this._cgDistant._x;
   this.showBottom(true);
   this._tiSearch.addEventListener("change",this);
};
_loc1.validCraft = function()
{
   this.showCraftViewer(false);
   this.recordGarbage();
   if(this._nCurrentQuantity > 1)
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("CRAFT_LOOP_START",[this._nCurrentQuantity]),"INFO_CHAT");
      this.repeatCraft();
   }
   else
   {
      this.setReady();
   }
};
_loc1.change = function(oEvent)
{
   if(this._tiSearch.text.length >= 2)
   {
      this.searchItem(this._tiSearch.text.toUpperCase());
   }
   else
   {
      this.updateData(false);
   }
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
      _loc1_ -= 1;
   }
   return _loc2_;
};
_loc1.searchItem = function(sText)
{
   var _loc9_ = sText.split(" ");
   var _loc8_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc5_ = new Object();
   var _loc7_ = 0;
   var _loc2_ = 0;
   var _loc6_;
   var _loc4_;
   var _loc3_;
   while(_loc2_ < this._cgGrid.dataProvider.length)
   {
      _loc6_ = this._cgGrid.dataProvider[_loc2_];
      _loc4_ = this.searchWordsInName(_loc9_,_loc6_.name.toUpperCase(),_loc7_);
      if(_loc4_ != 0)
      {
         _loc3_ = new Object();
         _loc3_.oWords = _loc4_;
         _loc3_.oItem = _loc6_;
         _loc5_[_loc2_] = _loc3_;
         _loc7_ = _loc4_;
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
      case this._btnFilterRessoureces:
         this.api.ui.showTooltip(this.api.lang.getText("RESSOURECES"),_loc2_.target,-20);
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
      case this._ctrPreview:
         if(this._mcFiligrane.itemName != undefined)
         {
            this.gapi.showTooltip(this._mcFiligrane.itemName,this._ctrPreview,-22);
            break;
         }
   }
};
_loc1.repeatCraft = function()
{
   if(this.api.datacenter.Exchange.localGarbage.length == 0)
   {
      return undefined;
   }
   this._bIsLooping = true;
   this._btnValidate.label = this._btnApplyRunes.label = this.api.lang.getText("STOP_WORD");
   this.api.network.Exchange.repeatCraft(this._nCurrentQuantity);
};
_loc1.setReady = function()
{
   if(this.api.datacenter.Exchange.localGarbage.length == 0)
   {
      return undefined;
   }
   this.api.network.Exchange.repeatCraft(1);
};
