#initclip 37
if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus["\r\x14"])
{
   _global.dofus["\r\x14"] = new Object();
}
if(!dofus["\r\x14"].gapi)
{
   _global.dofus["\r\x14"].gapi = new Object();
}
if(!dofus["\r\x14"].gapi.ui)
{
   _global.dofus["\r\x14"].gapi.ui = new Object();
}
if(!dofus["\r\x14"].gapi.ui.gameresult)
{
   _global.dofus["\r\x14"].gapi.ui.gameresult = new Object();
}
_global.dofus["\r\x14"].gapi.ui["\r\x1c"].GameResultPlayerLightPVP = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui["\r\x1c"].GameResultPlayerLightPVP.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = dofus["\r\x14"].gapi.ui["\r\x1c"].GameResultPlayerLightPVP.prototype;
_loc1.__set__list = function(_loc2_)
{
   this._mcList = _loc2_;
};
_loc1.GameResultPlayerLightPVP = function()
{
   super();
};

_loc1.setValue = function(_loc2_, _loc3_, _loc4_)
{
   this._oItems = _loc4_;
   if(_loc2_)
   {
      switch(_loc4_.type)
      {
         case "monster":
         case "taxcollector":
         case "player":
            var api = _global.API;
            if(_loc4_.rank == 0 && !api.datacenter.Basics.aks_current_server.isHardcore())
            {
               this._lblWinHonour._visible = false;
               this._lblRank._visible = false;
            }
            else
            {
               this._lblWinHonour._visible = true;
               this._lblRank._visible = true;
               if(_loc4_.winhonour >= 0)
               {
                  this._lblCurrentHonour.text = "" + (_loc4_.honour - _loc4_.winhonour);
                  this.setMovieClipColor(this._lblWinHonour,39168);
                  this._lblWinHonour.text = _global.isNaN(_loc4_.winhonour) ? "" : " + " + new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.winhonour).addMiddleChar(api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
               }
               else
               {
                  var winHonourAbs = Math.abs(_loc4_.winhonour);
                  this._lblCurrentHonour.text = "" + (_loc4_.honour - _loc4_.winhonour);
                  this.setMovieClipColor(this._lblWinHonour,12648448);
                  this._lblWinHonour.text = _global.isNaN(winHonourAbs) ? "" : " - " + new ank["\x1e\n\x07"]["\x0e\x1c"](winHonourAbs).addMiddleChar(api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
               }
               this._lblRank.text = _global.isNaN(_loc4_.rank) ? "" : _loc4_.rank;
               this._lblKama.text = _global.isNaN(_loc4_.kama) ? "0" : new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.kama).addMiddleChar(api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
               this._sDisgrace = _global.isNaN(_loc4_.disgrace) ? "" : new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.disgrace).addMiddleChar(api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
               this._sHonour = _global.isNaN(_loc4_.honour) ? "" : new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.honour).addMiddleChar(api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
               var alignment = _loc4_.alignment;
               if(this._lblRank._visible && alignment > 0)
               {
                  this._mcAlignment.gotoAndStop(alignment + 1);
               }
               this.createEmptyMovieClip("_mcItems",10);
               var hasOverflow = false;
               this._oItems.items.sortOn(["_itemLevel","_itemName"],Array.DESCENDING | Array.NUMERIC);
               var itemCount = this._oItems.items.length;
               while(itemCount = itemCount - 1, itemCount >= 0)
               {
                  var itemX = this._mcItemPlacer._x + 24 * itemCount;
                  var itemY = this._mcItemPlacer._y + 24 * itemCount;
                  if(itemX < this._mcItemPlacer._x + this._mcItemPlacer._width)
                  {
                     var itemData = this._oItems.items[itemCount];
                     var ctr = this._mcItems.attachMovie("Container","_ctrItem" + itemCount,itemCount,{_x:itemX,_y:this._mcItemPlacer._y + 1});
                     ctr.setSize(18,18);
                     ctr.addEventListener("over",this);
                     ctr.addEventListener("out",this);
                     ctr.addEventListener("click",this);
                     ctr.enabled = true;
                     ctr.margin = 0;
                     ctr.contentData = itemData;
                     continue;
                  }
                  hasOverflow = true;
               }
               this._ldrAllDrop._visible = hasOverflow;
            }
      }
   }
};
_loc1.init = function()
{
   super.init(false);
   this._mcItemPlacer._alpha = 0;
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.size = function()
{
   super.size();
};
_loc1.addListeners = function()
{
   var _loc3_ = this;
   this._ldrAllDrop.addEventListener("over",this);
   this._ldrAllDrop.addEventListener("out",this);
   this._mcDetailsXP.onRollOver = function()
   {
      this._parent.over({target:this});
   };
   this._mcDetailsXP.onRollOut = function()
   {
      this._parent.out({target:this});
   };
};
_loc1.over = function(_loc2_)
{
   var _loc10_ = _global.API;
   var _loc6_;
   var _loc4_;
   var _loc3_;
   var _loc5_;
   var _loc7_;
   var _loc9_;
   if(_loc2_.target != this._mcDetailsXP)
   {
      _loc6_ = this._oItems.items;
      _loc4_ = "";
      _loc3_ = 0;
      while(_loc3_ < _loc6_.length)
      {
         _loc5_ = _loc6_[_loc3_];
         if(_loc3_ > 0)
         {
            _loc4_ += "\n";
         }
         _loc4_ += _loc5_.Quantity + " x " + _loc5_.name;
         _loc3_ += 1;
      }
      if(_loc4_ != "")
      {
         this._mcList.gapi.showTooltip(_loc4_,_loc2_.target,30);
      }
   }
   else
   {
      _loc7_ = _loc2_.target.contentData;
      _loc9_ = _loc7_.style + "ToolTip";
      this.gapi.showTooltip(_loc7_.Quantity + " x " + _loc7_.name,_loc2_.target,20,undefined,_loc9_);
   }
};
_loc1.out = function(_loc2_)
{
   this._mcList.gapi.hideTooltip();
};
_loc1.click = function(_loc2_)
{
   var _loc3_ = _loc2_.target.contentData;
   if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY) && _loc3_ != undefined)
   {
      this._mcList._parent.gapi.api.kernel.GameManager.insertItemInChat(_loc3_);
   }
};
_loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
_loc1._mcList = "";
_global.dofus["\r\x14"].gapi.ui.GameResultLight.CLASS_NAME = "GameResultLight";
#endinitclip
