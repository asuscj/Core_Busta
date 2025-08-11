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
_global.dofus["\r\x14"].gapi.ui.Recompensas = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Recompensas.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Recompensas.prototype;
_loc1.__set__data = function(sData)
{
   this._sData = sData;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Recompensas.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnTodos.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._winBackground.title = this.api.lang.getText("RECOMPENSAS_ESPERA");
   this._btnTodos.label = this.api.lang.getText("ACCEPT_ALL");
};
_loc1.initData = function()
{
   var _loc3_ = this._sData.split(";");
   this._aRecompensas = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc2_;
   for(var _loc4_ in _loc3_)
   {
      _loc2_ = new Object();
      _loc2_.id = _loc3_[_loc4_].split("~")[0];
      _loc2_.items = _loc3_[_loc4_].split("~")[1];
      _loc2_.name = _loc3_[_loc4_].split("~")[2];
      _loc2_.xp = _loc3_[_loc4_].split("~")[3];
      _loc2_.kamas = _loc3_[_loc4_].split("~")[4];
      this._aRecompensas.push(_loc2_);
   }
   this._aRecompensas.sortOn("id",Array.ASCENDING);
   this._lstRecompensas.dataProvider = this._aRecompensas;
};
_loc1.recibirRecompensa = function(nID)
{
   var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc4_ = true;
   var _loc2_;
   for(var _loc6_ in this._aRecompensas)
   {
      _loc2_ = this._aRecompensas[_loc6_];
      if(_loc2_.id != nID)
      {
         _loc4_ = false;
         _loc3_.push(_loc2_);
      }
   }
   this._aRecompensas = _loc3_;
   this._aRecompensas.sortOn("id",Array.ASCENDING);
   this._lstRecompensas.dataProvider = this._aRecompensas;
   this.api.network.send("wF" + nID);
   if(_loc4_)
   {
      this.api.ui.unloadUIComponent("Recompensas");
   }
};
_loc1.click = function(oEvent)
{
   var _loc2_;
   var _loc3_;
   switch(oEvent.target)
   {
      case this._btnTodos:
         _loc2_ = "";
         for(var _loc4_ in this._aRecompensas)
         {
            _loc3_ = this._aRecompensas[_loc4_];
            if(_loc2_.length > 0)
            {
               _loc2_ += ",";
            }
            _loc2_ += _loc3_.id;
         }
         this.api.network.send("wF" + _loc2_);
         break;
      case this._btnClose:
         break;
      default:
   }
   this.api.ui.unloadUIComponent("Recompensas");
   return undefined;
};
_loc1.addProperty("data",function()
{
}
,_loc1.__set__data);
_loc1._aRecompensas = new Array();
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.Recompensas.CLASS_NAME = "Recompensas";
