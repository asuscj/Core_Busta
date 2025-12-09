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
_global.dofus["\r\x14"].gapi.ui.RecordMobs = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.RecordMobs.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.RecordMobs.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.RecordMobs.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnBorrar.addEventListener("click",this);
   this._btnMobN.addEventListener("click",this);
   this._btnMobE.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._dgMobs.columnsNames = ["",this.api.lang.getText("MOBS_BOSS")];
   this._winBg.title = this.api.lang.getText("RECORD_MOBS");
   this._btnMobN.label = this.api.lang.getText("MOBS_BOSS");
   this._btnMobE.label = this.api.lang.getText("MOBS_BOSS_EXOTIC");
};
_loc1.tipoMob = function(sValue)
{
   this._aMobs = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc4_ = sValue.split(";");
   var _loc5_ = 0;
   var _loc3_;
   var _loc2_;
   for(_loc5_ in _loc4_)
   {
      _loc3_ = _loc4_[_loc5_];
      _loc2_ = new Object();
      _loc2_.idMob = _loc3_.split(",")[0];
      _loc2_.cantidad = _loc3_.split(",")[1];
      this._aMobs.push(_loc2_);
   }
   this._dgMobs.dataProvider = this._aMobs;
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnClose:
         this.api.ui.unloadUIComponent("RecordMobs");
         break;
      case this._btnMobE:
         this._dgMobs.columnsNames = ["",this.api.lang.getText("MOBS_BOSS_EXOTIC")];
         this.api.network.send("?MN");
         this._btnMobN.selected = false;
         break;
      case this._btnMobN:
         this._dgMobs.columnsNames = ["",this.api.lang.getText("MOBS_BOSS")];
         this.api.network.send("?ME");
         this._btnMobE.selected = false;
      default:
         return;
   }
};
_loc1._aMobs = new Array();
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
_global.dofus["\r\x14"].gapi.ui.RecordMobs.CLASS_NAME = "RecordMobs";
