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
_global.dofus["\r\x14"].gapi.ui.Bonus = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Bonus.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Bonus.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Bonus.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._dgBonus1.columnsNames = ["",this.api.lang.getText("BONUS_GREMIO")];
   this._dgBonus2.columnsNames = ["",this.api.lang.getText("BONUS_POCIMAS")];
   this._dgBonus3.columnsNames = ["",this.api.lang.getText("BONUS_ALINEACION")];
   this._dgBonus4.columnsNames = ["",this.api.lang.getText("BONUS_ABONO")];
   this._btnClose.label = this.api.lang.getText("CLOSE");
   this._winBg.title = this.api.lang.getText("BONUS");
};
_loc1.tipoBonus = function(sValue)
{
   var _loc8_ = sValue.split("|");
   var _loc6_ = 0;
   var _loc7_;
   var _loc5_;
   var _loc4_;
   var _loc3_;
   var _loc2_;
   while(_loc6_ < _loc8_.length)
   {
      _loc7_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      _loc5_ = _loc8_[_loc6_].split(";");
      _loc4_ = 0;
      while(_loc4_ < _loc5_.length)
      {
         _loc3_ = _loc5_[_loc4_].split(",");
         _loc2_ = new Object();
         _loc2_.idBonus = _loc3_[0];
         _loc2_.cantidad = _loc3_[1];
         _loc2_.caracteristica = _loc3_[2];
         _loc7_.push(_loc2_);
         _loc4_ = _loc4_ + 1;
      }
      this["_dgBonus" + (_loc6_ + 1)].dataProvider = _loc7_;
      _loc6_ = _loc6_ + 1;
   }
};
_loc1.click = function(oEvent)
{
   var _loc0_;
   if((_loc0_ = oEvent.target) === this._btnClose)
   {
      this.api.ui.unloadUIComponent("Bonus");
   }
};
_loc1._aBonus = new Array();
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
_global.dofus["\r\x14"].gapi.ui.Bonus.CLASS_NAME = "Bonus";
