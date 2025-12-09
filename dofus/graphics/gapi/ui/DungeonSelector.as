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
_global.dofus["\r\x14"].gapi.ui.DungeonSelector = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.DungeonSelector.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.DungeonSelector.prototype;
_loc1.__set__data = function(sData)
{
   this._sData = sData;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.DungeonSelector.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._dgDungs.addEventListener("itemSelected",this);
   this._btnClose.addEventListener("click",this);
   this._btnSearch.addEventListener("click",this);
   this._btnJoin.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._winBackground.title = this.api.lang.getText("DUNGEONS");
   this._btnSearch.label = this.api.lang.getText("SERACH");
   this._btnJoin.label = this.api.lang.getText("JOIN_DUNG");
   this._tiSearch.text = "";
   this._tiSearch.setFocus();
   this._tiSearch.borderColor3 = 65280;
   this._btnJoin.enabled = false;
};
_loc1.initData = function()
{
   this._aDungs = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc4_ = this._sData.split("|");
   var _loc5_ = 0;
   var _loc3_;
   var _loc2_;
   for(_loc5_ in _loc4_)
   {
      _loc3_ = _loc4_[_loc5_];
      _loc2_ = new Object();
      _loc2_.id = _loc3_.split(";")[0];
      _loc2_.name = _loc3_.split(";")[1];
      _loc2_.level = _loc3_.split(";")[2];
      _loc2_.completo = _loc3_.split(";")[3] == "1";
      this._aDungs.push(_loc2_);
      _loc5_ = _loc5_ + 1;
   }
   if(this._aDungs.length == 0)
   {
      this._dgDungs._visible = false;
   }
   else
   {
      this._dgDungs._visible = true;
      this._dgDungs.dataProvider = this._aDungs;
      this._dgDungs.columnsNames = ["","",""];
   }
};
_loc1.itemSelected = function(oEvent)
{
   var _loc2_ = oEvent.target._name;
   var _loc0_;
   if((_loc0_ = _loc2_) !== "_dgDungs")
   {
      this._btnJoin.enabled = false;
   }
   else if(this._dgDungs.selectedIndex != -1)
   {
      this._btnJoin.enabled = true;
   }
   else
   {
      this._btnJoin.enabled = false;
   }
};
_loc1.buscar = function(sFilter)
{
   var _loc5_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc2_;
   var _loc3_;
   for(var _loc6_ in this._aDungs)
   {
      _loc2_ = this._aDungs[_loc6_];
      _loc3_ = _loc2_.name;
      if(!(sFilter.length > 0 && _loc3_.toUpperCase().indexOf(sFilter.toUpperCase()) == -1))
      {
         _loc5_.push(_loc2_);
      }
   }
   if(_loc5_.length == 0)
   {
      this._dgDungs._visible = false;
   }
   else
   {
      this._dgDungs._visible = true;
      this._dgDungs.dataProvider = _loc5_;
   }
};
_loc1.openInterface = function(sData)
{
   this.api.ui.loadUIAutoHideComponent("DungeonInterface","DungeonInterface",{data:sData,infoDungeon:this._dgDungs.selectedItem.name + "@" + this._dgDungs.selectedItem.level});
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnSearch":
         this.buscar(this._tiSearch.text);
         break;
      case "_btnClose":
         this.api.ui.unloadUIComponent("DungeonSelector");
         break;
      case "_btnJoin":
         if(this._dgDungs.selectedIndex != -1)
         {
            this.api.network.send("xB" + this._dgDungs.selectedItem.id);
         }
         else
         {
            this._btnJoin.enabled = false;
         }
      default:
         return;
   }
};
_loc1.addProperty("data",function()
{
}
,_loc1.__set__data);
_loc1._aDungs = new Array();
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
_global.dofus["\r\x14"].gapi.ui.DungeonSelector.CLASS_NAME = "DungeonSelector";
