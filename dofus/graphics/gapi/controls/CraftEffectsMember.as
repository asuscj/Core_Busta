_global.dofus["\r\x14"].gapi.controls.CraftEffectsMember = function()
{
   super();
};
dofus["\r\x14"].gapi.controls.CraftEffectsMember.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.controls.CraftEffectsMember.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   var _loc6_;
   var _loc2_;
   var _loc3_;
   var _loc4_;
   if(bUsed)
   {
      this._lblMin.text = oItem.min;
      this._lblMax.text = oItem.max;
      this._lblEffect.text = oItem.value;
      if(oItem.isExo)
      {
         this._lblEffect.styleName = "BlueLeftSmallLabel";
      }
      else if(oItem.value > oItem.max)
      {
         this._lblEffect.styleName = "GreenLeftMediumBoldLabel";
      }
      else
      {
         this._lblEffect.styleName = "GreenLeftSmallLabel";
      }
      if(oItem.modify != undefined && oItem.modify != "" && oItem.modify != "0")
      {
         this._mcOver._visible = true;
         this._lblModify.text = oItem.modify;
      }
      else
      {
         this._mcOver._visible = false;
      }
      if(oItem.runes != undefined)
      {
         _loc6_ = oItem.runes.split(",");
         _loc2_ = 0;
         while(_loc2_ < 3)
         {
            _loc3_ = _loc6_[_loc2_].split("#");
            if(_loc3_ != undefined)
            {
               _loc4_ = new dofus.datacenter["\f\f"](_loc3_[0],_loc3_[1],_loc3_[2],-1,-1);
               this["_ctr" + _loc2_].contentData = _loc4_;
            }
            else
            {
               this["_ctr" + _loc2_].contentData = undefined;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      else
      {
         this._ctr0.contentData = undefined;
         this._ctr1.contentData = undefined;
         this._ctr2.contentData = undefined;
      }
   }
   else if(this._lblEffect.text != undefined)
   {
      this._lblMin.text = "";
      this._lblEffect.text = "";
      this._lblModify.text = "";
      this._lblMax.text = "";
      this._mcOver._visible = false;
      this._ctr0.contentData = undefined;
      this._ctr1.contentData = undefined;
      this._ctr2.contentData = undefined;
   }
};
_loc1.click = function(oEvent)
{
   var _loc2_ = oEvent.target.contentData;
   this._mcList._parent._parent.validateDrop("_ctrRune",_loc2_,_loc2_.Quantity);
};
_loc1.out = function(oEvent)
{
   api = _global.API;
   api.ui.hideTooltip();
};
_loc1.over = function(oEvent)
{
   if(oEvent.target._name === "_btnInfo")
   {
      api = _global.API;
      api.ui.showTooltip("Plus d\'information sur la quête: " + this.Nombre,oEvent.target,-20,{bXLimit:true,bYLimit:false});
   }
};
_loc1.addListeners = function()
{
   var _loc2_ = 0;
   while(_loc2_ < 3)
   {
      this["_ctr" + _loc2_].addEventListener("over",this);
      this["_ctr" + _loc2_].addEventListener("out",this);
      this["_ctr" + _loc2_].addEventListener("dblClick",this);
      _loc2_ += 1;
   }
   this._mcOver._visible = false;
};
_loc1.dblClick = function(_loc2_)
{
   this.click(_loc2_);
};
_loc1.init = function()
{
   super.init(false);
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
_loc1.Nombre = "";
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
