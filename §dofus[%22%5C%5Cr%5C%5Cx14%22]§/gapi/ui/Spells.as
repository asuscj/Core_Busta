#initclip 142
var _loc1 = dofus["\r\x14"].gapi.ui.Spells.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Spells.CLASS_NAME);
   this.player = this.api.datacenter.Player;
   var _loc3_ = this.api.datacenter.getHero(this.heroID);
   if(_loc3_ != undefined)
   {
      this.player = _loc3_;
   }
   this.gapi.getUIComponent("Banner").shortcuts.setCurrentTab("Spells",this.player);
};
_loc1.createChildren = function()
{
   this._nSelectedSpellType = 0;
   this._mcSpellFullInfosPlacer._visible = false;
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.initTexts});
   this.hideSpellBoostViewer(true);
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._dgSpells.addEventListener("itemRollOver",this);
   this._dgSpells.addEventListener("itemRollOut",this);
   this._dgSpells.addEventListener("itemDrag",this);
   this._dgSpells.addEventListener("itemSelected",this);
   this._cbType.addEventListener("itemSelected",this);
   this._tiSearch.addEventListener("change",this);
   this._btnSearch.addEventListener("click",this);
   this.player.addEventListener("bonusSpellsChanged",this);
   this.player.Spells.addEventListener("modelChanged",this);
};
_loc1.modelChanged = function(oEvent)
{
   this.updateSpells();
};
_loc1.bonusSpellsChanged = function(oEvent)
{
   this.updateBonus(oEvent.value);
};
_loc1.updateSpells = function()
{
   var _loc9_ = this.player.Spells;
   var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc7_;
   for(var _loc11_ in _loc9_)
   {
      _loc7_ = _loc9_[_loc11_];
      if(_loc7_.classID != -1 && (_loc7_.classID == this._nSelectedSpellType || this._nSelectedSpellType == -2))
      {
         _loc4_.push(_loc7_);
      }
   }
   var _loc10_;
   var _loc5_;
   var _loc6_;
   var _loc3_;
   var _loc2_;
   var _loc8_;
   if(this.api.kernel.OptionsManager.getOption("SeeAllSpell") && this.player.canUseSeeAllSpell)
   {
      _loc10_ = this.api.lang.getClassText(this.player.Guild).s;
      _loc5_ = 0;
      while(_loc5_ < _loc10_.length)
      {
         _loc6_ = _loc10_[_loc5_];
         _loc3_ = false;
         _loc2_ = 0;
         while(_loc2_ < _loc4_.length && !_loc3_)
         {
            _loc3_ = _loc4_[_loc2_].ID == _loc6_;
            _loc2_ += 1;
         }
         _loc8_ = new dofus.datacenter["\x1e\x0e\x1c"](_loc6_,1);
         if(!_loc3_ && (_loc8_.classID == this._nSelectedSpellType || this._nSelectedSpellType == -2))
         {
            _loc4_.push(_loc8_);
         }
         _loc5_ += 1;
      }
   }
   _loc4_.sortOn("_minPlayerLevel",Array.NUMERIC);
   this._dataProviderCopy = _loc4_;
   if(this._btnSearch.icon == "UI_MainMenuCross")
   {
      this.searchItem(this._tiSearch.text.toUpperCase(),this._tiSearch);
   }
   else
   {
      this._dgSpells.dataProvider = _loc4_;
   }
};
_loc1.click = function(_loc2_)
{
   var _loc3_ = _loc2_.target._name;
   if(_loc3_ == "_btnClose")
   {
      this.callClose();
   }
   else if(_loc3_ == "_btnSearch")
   {
      if(_loc2_.target.icon == "UI_MainMenuCross")
      {
         _loc2_.target.icon = "Loupe";
         this._tiSearch._visible = false;
         this._cbTypes._visible = true;
         if(this._tiSearchFont._visible)
         {
            this._tiSearch.text = "";
            this._tiSearch.setFocus();
         }
         this._tiSearchFont._visible = false;
         this.updateSpells();
      }
      else
      {
         _loc2_.target.icon = "UI_MainMenuCross";
         this._tiSearch._visible = true;
         this._cbTypes._visible = false;
         this._tiSearchFont._visible = true;
      }
   }
};
_loc1.change = function(oEvent)
{
   if(oEvent.target.text.length >= 3)
   {
      this.searchItem(oEvent.target.text.toUpperCase(),oEvent);
   }
   else
   {
      this._dataProviderCopy = null;
      this.updateSpells(true);
   }
};
_loc1.searchItem = function(sText, oEvent)
{
   if(this._dataProviderCopy == null)
   {
      this._dataProviderCopy = this._dgSpells.dataProvider;
   }
   var _loc9_ = sText.split(" ");
   var _loc8_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc5_ = new Object();
   var _loc7_ = 0;
   var _loc2_ = 0;
   var _loc6_;
   var _loc3_;
   var _loc4_;
   while(_loc2_ < this._dataProviderCopy.length)
   {
      _loc6_ = this._dataProviderCopy[_loc2_];
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
   this._dgSpells.dataProvider = _loc8_;
   this._lblSearchCount.text = _loc8_.length == 0 ? this.api.lang.getText("NO_BIGSTORE_SEARCH_RESULT") : _loc8_.length + " " + ank["\x1e\n\t"]["\x1e\x16\x1a"].combine(this.api.lang.getText("OBJECTS"),"m",_loc8_ < 2);
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
      _loc1_ -= 1;
   }
   return _loc2_;
};
_loc1.updateBonus = function(_loc2_)
{
   this._lblBonus.text = _loc2_ == undefined ? String(this.player.BonusPointsSpell) : String(_loc2_);
   this.updateSpells();
};
_loc1.boostSpell = function(_loc2_)
{
   this.api.sounds.events.onSpellsBoostButtonClick();
   var _loc3_;
   if(this.canBoost(_loc2_) != undefined)
   {
      _loc3_ = new dofus.datacenter["\x1e\x0e\x1c"](_loc2_.ID,_loc2_.level + 1);
      if(this.player.Level < _loc3_.minPlayerLevel)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("LEVEL_NEED_TO_BOOST",[_loc3_.minPlayerLevel]),"ERROR_BOX");
         return false;
      }
      this.hideSpellBoostViewer(true);
      _global.HERO_ID = this.heroID;
      this.api.network.Spells.boost(_loc2_.ID);
      this._sfivSpellFullInfosViewer.spell = _loc3_;
      return true;
   }
   return false;
};
_loc1.modelChanged = function(oEvent)
{
   // Cuando cambia el modelo de Spells, actualizar lista
   if(this.heroID != undefined && oEvent.heroID == this.heroID)
   {
      this.updateSpells();
   }
   else if(this.heroID == undefined)
   {
      // Panel de jugador real, no h\u00e9roe
      this.updateSpells();
   }
};
_loc1.canBoost = function(_loc2_)
{
   if(_loc2_ != undefined)
   {
      if(this.getCostForBoost(_loc2_) > this.player.BonusPointsSpell)
      {
         return false;
      }
      if(_loc2_.level < _loc2_.maxLevel)
      {
         return true;
      }
   }
   return false;
};
_loc1.itemDrag = function(_loc2_)
{
   if(_loc2_.row.item == undefined)
   {
      return undefined;
   }
   if(this.player.Level < _loc2_.row.item._minPlayerLevel)
   {
      return undefined;
   }
   _loc2_.row.item.heroID = this.player.ID;
   trace("itemDrag spells " + _loc2_.row.item.heroID);
   this.gapi.removeCursor();
   this.gapi.setCursor(_loc2_.row.item,undefined,true);
};
_loc1.player;
#endinitclip