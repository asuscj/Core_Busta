var _loc1 = dofus["\r\x14"].gapi.ui.Craft.prototype;
_loc1.initGridWidth = function()
{
   if(this._nMaxItem == undefined)
   {
      this._nMaxItem = 12;
      this._cgGrid.multipleContainerSelectionEnabled = true;
   }
   if(this._nSkillId == 181)
   {
      this._nMaxItem = 12;
      this._cgGrid.multipleContainerSelectionEnabled = true;
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
};
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
   this._tiSearch.addEventListener("change",this);
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
_loc1.dblClickItem = function(_loc2_)
{
   var _loc4_ = _loc2_.target.contentData;
   var _loc3_ = _loc2_.targets;
   if(_loc4_ == undefined)
   {
      return undefined;
   }
   var _loc5_ = Key.isDown(dofus.Constants.SELECT_MULTIPLE_ITEMS_KEY);
   var _loc6_ = _loc5_ ? _loc4_.Quantity : 1;
   var _loc7_ = _loc2_.owner._name;
   switch(_loc7_)
   {
      case "_cgGrid":
         if(this.canDropInGarbage(_loc4_))
         {
            if(_loc5_ && _loc3_.length > 1)
            {
               if(active == true)
               {
                  clearInterval(interval);
                  active = false;
               }
               else
               {
                  for(_loc4_ in _loc3_)
                  {
                     _loc2_ = _loc3_[_loc4_];
                     if(list.length > 0)
                     {
                        list += ";";
                     }
                     list += _loc2_.ID + "|" + _loc2_.Quantity;
                  }
                  list = list.split(";");
                  size = list.length;
                  interval = setInterval(this,"transfertToExchange",10);
                  active = true;
               }
            }
            else
            {
               this.validateDrop("_cgLocal",_loc4_,_loc6_);
            }
         }
         break;
      case "_cgLocal":
         this.validateDrop("_cgGrid",_loc4_,_loc6_);
      default:
         return;
   }
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
var interval;
var list = "";
var size = 0;
var a = 0;
var active = false;
_loc1.transfertToExchange = function()
{
   if(a >= size)
   {
      active = false;
      list = "";
      size = 0;
      a = 0;
      clearInterval(interval);
      return undefined;
   }
   var _loc2_ = list[a];
   this.api.network.send("EMO+" + _loc2_);
   a += 1;
};
