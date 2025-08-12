#initclip 83
var _loc1 = dofus["\r\x14"].gapi.ui.spells.SpellsItem.prototype;
_loc1.setValue = function(_loc2_, _loc3_, _loc4_)
{
   var _loc3_;
   var _loc7_;
   var _loc5_;
   var _loc6_;
   var _loc4_;
   if(_loc2_)
   {
      this._oItem = _loc4_;
      _loc4_.sortName = _loc4_.name;
      _loc4_.sortLevel = _loc4_.level;
      _loc3_ = this._mcList._parent._parent.api;
      this._lblName.text = _loc4_.name;
      this._lblLevel.text = _loc3_.lang.getText("LEVEL") + " " + _loc4_.level;
      this._lblRange.text = (_loc4_.rangeMin != 0 ? _loc4_.rangeMin + "-" : "") + _loc4_.rangeMax + " " + _loc3_.lang.getText("RANGE");
      this._lblAP.text = _loc4_.apCost + " " + _loc3_.lang.getText("AP");
      this._ldrIcon.contentPath = _loc4_.iconFile;
      if(dofus.Constants.DOUBLEFRAMERATE && this._ldrIcon.loaded)
      {
         _loc7_ = _loc3_.kernel.OptionsManager.getOption("RemasteredSpellIconsPack");
         this._ldrIcon.content.gotoAndStop(_loc7_);
      }
      _loc5_ = this._mcList._parent._parent.canBoost(_loc4_) && _loc3_.datacenter.Basics.canUseSeeAllSpell;
      _loc6_ = this._mcList._parent._parent.getCostForBoost(_loc4_);
      _loc4_ = _loc4_.level > 1 && _loc3_.datacenter.Basics.canUseSeeAllSpell;
      this._btnBoost.enabled = true;
      this._btnBoost._visible = this.api.datacenter.Game.isFight != (_loc5_ == true) ? true : false;
      this._btnForget.enabled = true;
      this._btnForget._visible = this.api.datacenter.Game.isFight != (_loc4_ == true) ? true : false;
      this._btnForget._x = 260;
      this._btnforget._y = 16;
      if(!_loc5_ && _loc4_)
      {
         this._btnForget._x = this._btnBoost._x;
         this._btnForget._y = this._btnBoost._y;
      }
      this._lblBoost.text = _loc6_ != -1 && _loc3_.datacenter.Basics.canUseSeeAllSpell ? _loc3_.lang.getText("POINT_NEED_TO_BOOST_SPELL",[_loc6_]) : "";
      if(_loc3_.datacenter.Player.Level < _loc4_._minPlayerLevel)
      {
         _loc4_ = 50;
         this._lblName._alpha = _loc4_;
         this._ldrIcon._alpha = _loc4_;
         this._lblAP._alpha = _loc4_;
         this._lblRange._alpha = _loc4_;
         this._lblLevel._visible = false;
         this._lblBoost._visible = false;
         this._btnBoost._visible = false;
         this._btnForget._visible = false;
      }
      else
      {
         this._lblName._alpha = 100;
         this._ldrIcon._alpha = 100;
         this._lblAP._alpha = 100;
         this._lblRange._alpha = 100;
         this._lblLevel._alpha = 100;
         this._lblLevel._visible = true;
         this._lblBoost._visible = true;
      }
   }
   else if(this._lblName.text != undefined)
   {
      this._lblName.text = "";
      this._lblLevel.text = "";
      this._lblBoost.text = "";
      this._lblRange.text = "";
      this._lblAP.text = "";
      this._ldrIcon.contentPath = "";
      this._btnBoost._visible = false;
      this._btnForget._visible = false;
   }
};
_loc1.addListeners = function()
{
   this._ldrIcon.addEventListener("complete",this);
   this._btnBoost.addEventListener("click",this);
   this._btnBoost.addEventListener("over",this);
   this._btnBoost.addEventListener("out",this);
   this._btnForget.addEventListener("click",this);
   this._btnForget.addEventListener("over",this);
   this._btnForget.addEventListener("out",this);
};
_loc1.click = function(oEvent)
{
   var _loc2_ = this._mcList._parent._parent.api;
   var _loc3_ = oEvent.target;
   switch(_loc3_)
   {
      case this._btnBoost:
         this.yes();
         break;
      case this._btnForget:
         if(this.api.datacenter.Game.isFight)
         {
            break;
         }
         _loc2_.network.send("Aps" + this._oItem.ID);
         break;
   }
};
_loc1.over = function(oEvent)
{
   var _loc2_ = this._mcList._parent._parent.api;
   var _loc4_ = oEvent.target;
   switch(_loc4_)
   {
      case this._btnBoost:
         _loc2_.ui.showTooltip(_loc2_.lang.getText("CLICK_HERE_FOR_SPELL_BOOST",[this._mcList._parent._parent.getCostForBoost(this._oItem),this._oItem.name,String(this._oItem.level + 1)]),oEvent.target,-30,{bXLimit:true,bYLimit:false});
         break;
      case this._btnForget:
         _loc2_.ui.showTooltip(_loc2_.lang.getText("CLICK_HERE_FOR_SPELL_FORGET"),oEvent.target,-30,{bXLimit:true,bYLimit:false});
   }
};
_loc1.out = function(oEvent)
{
   var _loc2_ = this._mcList._parent._parent.api;
   var _loc3_ = oEvent.target;
   switch(_loc3_)
   {
      case this._btnBoost:
      case this._btnForget:
         _loc2_.ui.hideTooltip();
   }
};
#endinitclip