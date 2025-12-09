var _loc1 = ank.gapi.controls.ContainerGrid.prototype;
_loc1.__get__spacing = function()
{
   return this._spacing;
};
_loc1.__set__spacing = function(sSpacing)
{
   this._spacing = sSpacing;
   return this._spacing;
};
_loc1.__get__startIndexCtn = function()
{
   return this._startIndexCtn;
};
_loc1.__set__startIndexCtn = function(startIndexCtn)
{
   this._startIndexCtn = startIndexCtn;
   return this._startIndexCtn;
};
_loc1.addRow = function()
{
   this._rowAddCount += 1;
   this.setScrollBarProperties();
};
_loc1.__set__scrollBarText = function(scrollBarText)
{
   this._scrollBarText = scrollBarText;
   return this._scrollBarText;
};
_loc1.__get__scrollBarText = function()
{
   return this._scrollBarText;
};
_loc1.createChildren = function()
{
   this.createEmptyMovieClip("_mcScrollContent",10);
   this.createEmptyMovieClip("_mcMask",20);
   this.drawRoundRect(this._mcMask,0,0,1,1,0,0);
   this._mcScrollContent.setMask(this._mcMask);
   if(this._bScrollBar)
   {
      this.attachMovie("ScrollBar","_sbVertical",30,{scrollBarText:this._scrollBarText});
      this._sbVertical.addEventListener("scroll",this);
   }
   ank["\x1e\n\x07"]["\t\x17"].addListener(this);
   this._aSelectedIndexes = new Array();
   if(this._spacing == undefined)
   {
      this._spacing = 0;
   }
   if(this._startIndexCtn == undefined)
   {
      this._startIndexCtn = 0;
   }
   if(this._rowAddCount == undefined)
   {
      this._rowAddCount = 0;
   }
};
_loc1 = ank.gapi.controls.ContainerGrid.prototype;
_loc1.layoutContent = function()
{
   var _loc14_ = (this.__width - (!this._bScrollBar ? 0 : this._sbVertical.width)) / this._nVisibleColumnCount;
   var _loc15_ = this.__height / this._nVisibleRowCount;
   var _loc4_ = 0;
   var _loc10_;
   var _loc7_;
   var _loc3_;
   if(!this._bInvalidateLayout)
   {
      _loc10_ = 0;
      while(_loc10_ < this._nVisibleRowCount)
      {
         _loc7_ = 0;
         while(_loc7_ < this._nVisibleColumnCount)
         {
            _loc3_ = this._mcScrollContent["c" + _loc4_];
            if(_loc3_ == undefined)
            {
               _loc3_ = this._mcScrollContent.attachMovie("Container","c" + _loc4_,_loc4_,{margin:this._nStyleMargin});
               _loc3_.addEventListener("drag",this);
               _loc3_.addEventListener("drop",this);
               _loc3_.addEventListener("over",this);
               _loc3_.addEventListener("out",this);
               _loc3_.addEventListener("click",this);
               _loc3_.addEventListener("dblClick",this);
            }
            _loc3_._x = _loc14_ * _loc7_;
            _loc3_._y = _loc15_ * _loc10_;
            _loc3_.setSize(_loc14_,_loc15_);
            _loc4_ += 1;
            _loc7_ += 1;
         }
         _loc10_ += 1;
      }
   }
   var _loc11_ = 0;
   _loc4_ = this._nScrollPosition * this._nVisibleColumnCount;
   var _loc13_ = 0;
   var _loc8_;
   var _loc5_;
   var _loc6_;
   var _loc12_;
   var _loc9_;
   while(_loc13_ < this._nVisibleRowCount)
   {
      _loc8_ = 0;
      while(_loc8_ < this._nVisibleColumnCount)
      {
         _loc5_ = this._mcScrollContent["c" + _loc11_];
         _loc6_ = this._eaDataProvider[_loc4_];
         _loc12_ = _loc6_.label;
         _loc9_ = _loc6_.forceReloadOnContainer;
         _loc5_.forceReload = _loc9_ != undefined && _loc9_;
         _loc5_.showLabel = _loc12_ != undefined;
         if(dofus.datacenter["\f\f"].isFullSoul(_global.API.lang.getItemUnicText(_loc6_.unicID).t) && _loc6_.isSoulMobeable)
         {
            _loc5_.contentDataMonster = _loc6_;
         }
         else
         {
            _loc5_.contentData = _loc6_;
         }
         _loc5_.id = _loc4_;
         if(this.isSelectedIndex(_loc4_))
         {
            _loc5_.selected = true;
         }
         else
         {
            _loc5_.selected = false;
         }
         _loc5_.enabled = this._bEnabled;
         _loc4_ += 1;
         _loc11_ += 1;
         _loc8_ += 1;
      }
      _loc13_ += 1;
   }
   if(this._bInvalidateLayout)
   {
   }
   this._bInvalidateLayout = false;
};
_loc1.drop = function(_loc2_)
{
   this.dispatchEvent({type:"dropItem",target:_loc2_.target,owner:this});
};
_loc1.drag = function(_loc2_)
{
   this.dispatchEvent({type:"dragItem",target:_loc2_.target,owner:this});
};
_loc1.click = function(_loc2_)
{
   if(this._bSelectable)
   {
      this.setSelectedItem(_loc2_.target.id);
   }
   this.dispatchEvent({type:"selectItem",target:_loc2_.target,owner:this});
};
_loc1.dblClick = function(oEvent)
{
   // Use the event target for the double-clicked container, and also provide the current selection list
   var selectedItems = this.getSelectedItems();
   this.dispatchEvent({type:"dblClickItem",target:oEvent.target,targets:selectedItems,owner:this,item:oEvent.target.contentData});
};
_loc1.over = function(_loc2_)
{
   if(this._bSelectable && (this._bMultiContainerSelection && (Key.isDown(dofus.Constants.SELECT_MULTIPLE_ITEMS_KEY) && Key.isDown(16))))
   {
      this.setSelectedItem(_loc2_.target.id,true);
   }
   this.dispatchEvent({type:"overItem",target:_loc2_.target,owner:this});
};
_loc1.setScrollBarProperties = function()
{
   var _loc2_ = this._nRowCount - this._nVisibleRowCount;
   var _loc3_ = this._nVisibleRowCount * (_loc2_ / this._nRowCount);
   this._sbVertical.setScrollProperties(_loc3_,0,_loc2_);
   this._sbVertical.scrollPosition = this._nScrollPosition;
};
_loc1.scroll = function(oEvent)
{
   this.setVPosition(oEvent.target.scrollPosition);
   this.dispatchEvent({type:"scroll",target:oEvent.target});
};
_loc1.addProperty("spacing",_loc1.__get__spacing,_loc1.__set__spacing);
_loc1.addProperty("startIndexCtn",_loc1.__get__startIndexCtn,_loc1.__set__startIndexCtn);
_loc1.addProperty("scrollBarText",_loc1.__get__scrollBarText,_loc1.__set__scrollBarText);
