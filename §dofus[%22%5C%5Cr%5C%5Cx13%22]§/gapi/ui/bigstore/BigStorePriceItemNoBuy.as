_global.dofus["\r\x14"].gapi.ui.bigstore.BigStorePriceItemNoBuy = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.bigstore.BigStorePriceItemNoBuy.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.bigstore.BigStorePriceItemNoBuy.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.__set__row = function(_loc2_)
{
   this._mcRow = _loc2_;
};
_loc1.setValue = function(_loc2_, _loc3_, _loc4_)
{
   delete this._nSelectedSet;
   var _loc4_;
   var _loc6_;
   var _loc5_;
   var _loc7_;
   var _loc8_;
   if(_loc2_)
   {
      this._oItem = _loc4_;
      _loc4_ = this._mcList._parent._parent.isThisPriceSelected(_loc4_.id,1);
      _loc6_ = this._mcList._parent._parent.isThisPriceSelected(_loc4_.id,2);
      _loc5_ = this._mcList._parent._parent.isThisPriceSelected(_loc4_.id,3);
      if(_loc4_)
      {
         _loc7_ = this._btnPriceSet1;
      }
      if(_loc6_)
      {
         _loc7_ = this._btnPriceSet2;
      }
      if(_loc5_)
      {
         _loc7_ = this._btnPriceSet3;
      }
      if(_loc4_ || (_loc6_ || _loc5_))
      {
         _loc8_ = this._btnBuy;
      }
      if(_loc8_ != undefined)
      {
         this._mcList._parent._parent.setButtons(_loc7_,_loc8_);
      }
      this._btnPriceSet1.selected = _loc4_ && !_global.isNaN(_loc4_.priceSet1);
      this._btnPriceSet2.selected = _loc6_ && !_global.isNaN(_loc4_.priceSet2);
      this._btnPriceSet3.selected = _loc5_ && !_global.isNaN(_loc4_.priceSet3);
      if(_loc4_)
      {
         this._nSelectedSet = 1;
      }
      else if(_loc6_)
      {
         this._nSelectedSet = 2;
      }
      else if(_loc5_)
      {
         this._nSelectedSet = 3;
      }
      this._btnBuy.enabled = this._nSelectedSet != undefined;
      this._btnBuy._visible = true;
      this._btnPriceSet1._visible = true;
      this._btnPriceSet2._visible = true;
      this._btnPriceSet3._visible = true;
      this._btnPriceSet1.enabled = !_global.isNaN(_loc4_.priceSet1);
      this._btnPriceSet2.enabled = !_global.isNaN(_loc4_.priceSet2);
      this._btnPriceSet3.enabled = !_global.isNaN(_loc4_.priceSet3);
      this._btnPriceSet1.label = _global.isNaN(_loc4_.priceSet1) ? "-  " : new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.priceSet1).addMiddleChar(this._mcList.gapi.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) + "  ";
      this._btnPriceSet2.label = _global.isNaN(_loc4_.priceSet2) ? "-  " : new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.priceSet2).addMiddleChar(this._mcList.gapi.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) + "  ";
      this._btnPriceSet3.label = _global.isNaN(_loc4_.priceSet3) ? "-  " : new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.priceSet3).addMiddleChar(this._mcList.gapi.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) + "  ";
      if(dofus.datacenter["\f\f"].isFullSoul(_global.API.lang.getItemUnicText(_loc4_.item.unicID).t) && _loc4_.item.isSoulMobeable)
      {
         this._ldrIconMonster._x = 10;
         this._ldrIconMonster._y = 16.5;
         this._ldrIconMonster.contentParams = _loc4_.item.params;
         this._ldrIconMonster.contentPath = _loc4_.item.iconFile;
         this._ldrIconMonster.forceReload = true;
         this._ldrIcon.contentPath = "";
         this._ldrIcon._visible = false;
      }
      else
      {
         this._ldrIcon.contentParams = _loc4_.item.params;
         this._ldrIcon.contentPath = _loc4_.item.iconFile;
         this._ldrIconMonster.contentPath = "";
         this._ldrIconMonster._visible = false;
      }
   }
   else if(this._ldrIcon.contentPath != undefined)
   {
      this._btnPriceSet1._visible = false;
      this._btnPriceSet2._visible = false;
      this._btnPriceSet3._visible = false;
      this._btnBuy._visible = false;
      this._ldrIcon.contentPath = "";
      this._ldrIconMonster.contentPath = "";
   }
};
_loc1.click = function(_loc2_)
{
   var _loc3_;
   switch(_loc2_.target._name)
   {
      case "_btnPriceSet1":
      case "_btnPriceSet2":
      case "_btnPriceSet3":
         _loc3_ = Number(_loc2_.target._name.substr(12));
         this._mcList._parent._parent.selectPrice(this._oItem);
         if(this._nSelectedSet)
         {
            delete this._nSelectedSet;
         }
         else
         {
            this._nSelectedSet = _loc3_;
            _global.API.kernel.debugAstra("here");
            this._mcRow.select();
         }
      default:
         return;
   }
};
_loc1.init = function()
{
   super.init(false);
   this._btnPriceSet1._visible = false;
   this._btnPriceSet2._visible = false;
   this._btnPriceSet3._visible = false;
   this._btnBuy._visible = false;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
};
_loc1.addListeners = function()
{
   this._btnPriceSet1.addEventListener("click",this);
   this._btnPriceSet2.addEventListener("click",this);
   this._btnPriceSet3.addEventListener("click",this);
   this._btnBuy.addEventListener("click",this);
   this._ldrIconMonster.addEventListener("initialization",this);
};
_loc1.initTexts = function()
{
   this._btnBuy.label = this._mcList.gapi.api.lang.getText("BUY");
};
_loc1.initialization = function(_loc2_)
{
   var mc = _loc2_.clip;
   mc._visible = false;
   mc.attachMovie("staticR","mcAnim",10);
   var MonsterView = this;
   var nCompteur = 0;
   mc.onEnterFrame = function()
   {
      nCompteur++;
      if(nCompteur >= 3)
      {
         MonsterView.prepareSprite(this);
         delete mc.onEnterFrame;
      }
   };
};
_loc1.prepareSprite = function(_loc2_)
{
   if(_loc2_._width > _loc2_._height)
   {
      _loc2_._xscale = _loc2_._yscale = 2000 / _loc2_._width;
   }
   else
   {
      _loc2_._yscale = _loc2_._xscale = 2000 / _loc2_._height;
   }
   _loc2_._visible = true;
};
_loc1.addProperty("list",function()
{
}
,_loc1.__set__list,_loc1.__get__list);
_loc1.addProperty("row",function()
{
}
,_loc1.__set__row,_loc1.__get__row);
ASSetPropFlags(_loc1,null,1);
