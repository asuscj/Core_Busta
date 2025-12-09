#initclip 59
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
_global.dofus["\r\x14"].gapi.ui["\r\x1c"].GameResultPlayerLight = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui["\r\x1c"].GameResultPlayerLight.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = dofus["\r\x14"].gapi.ui["\r\x1c"].GameResultPlayerLight.prototype;
_loc1.__set__list = function(_loc2_)
{
   this._mcList = _loc2_;
};
_loc1.GameResultPlayerLight = function()
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
            this._lblName.text = _loc4_.name;
            if(_global.isNaN(_loc4_.xp))
            {
               this._pbXP._visible = false;
            }
            else
            {
               this._pbXP._visible = true;
               this._pbXP.minimum = _loc4_.minxp;
               this._pbXP.maximum = _loc4_.maxxp;
               this._pbXP.value = _loc4_.xp;
            }
            this._lblWinXP.text = _global.isNaN(_loc4_.winxp) ? "0" : new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.winxp).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"),3);
            this._sGuildXP = _global.isNaN(_loc4_.guildxp) ? "0" : new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.guildxp).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"),3);
            this._sMountXP = _global.isNaN(_loc4_.mountxp) ? "0" : new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.mountxp).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"),3);
            this._lblKama.text = _global.isNaN(_loc4_.kama) ? "0" : new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.kama).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"),3);
            this._lblLevel.text = _loc4_.level;
            this._mcDeadHead._visible = _loc4_.bDead;
            this.createEmptyMovieClip("_mcItems",10);
            var _loc10_ = false;
            var itemsLength = this._oItems.items.length;
            var i = 0;
            while(i < itemsLength)
            {
               var _loc6_ = this._mcItemPlacer._x + 24 * i;
               if(_loc6_ < this._mcItemPlacer._x + this._mcItemPlacer._width)
               {
                  var _loc7_ = this._oItems.items[i];
                  var _loc3_ = this._mcItems.attachMovie("Container","_ctrItem" + i,i,{_x:_loc6_,_y:this._mcItemPlacer._y + 1});
                  _loc3_.setSize(18,18);
                  _loc3_.addEventListener("over",this);
                  _loc3_.addEventListener("out",this);
                  _loc3_.addEventListener("click",this);
                  _loc3_.enabled = true;
                  _loc3_.margin = 0;
                  _loc3_.contentData = _loc7_;
               }
               else
               {
                  _loc10_ = true;
               }
               i = i + 1;
            }
            this._ldrAllDrop._visible = _loc10_;
         default:
            return;
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
   var api = _global.API;
   var target = _loc2_.target;
   if(target == this._mcDetailsXP)
   {
      this.gapi.showTooltip(api.lang.getText("WORD_XP") + " " + api.lang.getText("XP_GUILD") + " : " + this._sGuildXP + "\n" + api.lang.getText("WORD_XP") + " " + api.lang.getText("XP_MOUNT") + " : " + this._sMountXP, this._lblWinXP, 22, {bXLimit: true, bYLimit: false});
      return;
   }
   if(target == this._ldrAllDrop)
   {
      var allItemsText = "";
      var itemsList = this._oItems.items;
      for(var i = 0; i < itemsList.length; i = i + 1)
      {
         var item = itemsList[i];
         if(i > 0)
         {
            allItemsText += "\n";
         }
         allItemsText += item.Quantity + " x " + item.name;
      }
      if(allItemsText != "")
      {
         this.gapi.showTooltip(allItemsText, target, 30);
      }
      return;
   }
   var itemData = target.contentData;
   if(itemData != undefined)
   {
      var tooltipText = itemData.Quantity + " x " + itemData.name;
      this.gapi.showTooltip(tooltipText, target, 20);
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
