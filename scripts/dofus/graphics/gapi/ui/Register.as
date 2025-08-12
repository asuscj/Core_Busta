#initclip 101
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
if(!dofus["\r\x14"].gapi.ui.recompensas)
{
   _global.dofus["\r\x14"].gapi.ui.recompensas = new Object();
}
_global.dofus["\r\x14"].gapi.ui.recompensas.RecompensasItem = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.recompensas.RecompensasItem.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.recompensas.RecompensasItem.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   var _loc3_;
   var _loc2_;
   var _loc4_;
   if(bUsed)
   {
      this._oItem = oItem;
      _loc3_ = oItem.items.split("|");
      _loc2_ = -1;
      while(true)
      {
         _loc2_ += 1;
         if(_loc2_ >= 6)
         {
            break;
         }
         this["_ctr" + _loc2_]._visible = true;
         if(_loc2_ < _loc3_.length)
         {
            if(_loc3_[_loc2_] == "")
            {
               this["_txtCant" + _loc2_]._visible = false;
               this["_bg" + _loc2_]._visible = false;
            }
            else
            {
               _loc4_ = new dofus.datacenter["\f\f"](0,_loc3_[_loc2_].split(",")[0],1,-1,-1);
               this["_ctr" + _loc2_].contentData = _loc4_;
               this["_txtCant" + _loc2_].text = _loc3_[_loc2_].split(",")[1];
               this["_txtCant" + _loc2_]._visible = true;
               this["_bg" + _loc2_]._visible = true;
            }
         }
      }
      this._txtName.text = oItem.name;
      this._txtXP.text = oItem.xp;
      this._txtKamas.text = oItem.kamas;
      this._btnOK._visible = true;
      this._mcXP._visible = true;
      this._mcKamas._visible = true;
   }
   else if(this._txtName.text != undefined)
   {
      this.ocultar();
   }
};
_loc1.init = function()
{
   super.init(false);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.addListeners = function()
{
   this._btnOK.addEventListener("click",this);
   this._btnOK.label = "OK";
   var _loc2_ = -1;
   while(true)
   {
      _loc2_ += 1;
      if(_loc2_ >= 6)
      {
         break;
      }
      this["_ctr" + _loc2_].addEventListener("over",this);
      this["_ctr" + _loc2_].addEventListener("out",this);
   }
};
_loc1.ocultar = function()
{
   var _loc2_ = -1;
   while(true)
   {
      _loc2_ += 1;
      if(_loc2_ >= 6)
      {
         break;
      }
      this["_ctr" + _loc2_]._visible = false;
      this["_txtCant" + _loc2_]._visible = false;
      this["_bg" + _loc2_]._visible = false;
   }
   this._txtName.text = "";
   this._txtXP.text = "";
   this._txtKamas.text = "";
   this._btnOK._visible = false;
   this._mcXP._visible = false;
   this._mcKamas._visible = false;
};
_loc1.click = function(oEvent)
{
   this._mcList._parent.recibirRecompensa(this._oItem.id);
};
_loc1.over = function(oEvent)
{
   var _loc2_ = oEvent.target.contentData;
   if(_loc2_.name != undefined)
   {
      this._mcList.gapi.api.ui.showTooltip("x" + _loc2_.Quantity + " - " + _loc2_.name,oEvent.target,-20);
   }
};
_loc1.out = function(oEvent)
{
   this._mcList.gapi.api.ui.hideTooltip();
};
_loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
ASSetPropFlags(_loc1,null,1);
#endinitclip
