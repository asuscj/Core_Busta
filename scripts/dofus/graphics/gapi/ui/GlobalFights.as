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
_global.dofus["\r\x14"].gapi.ui.GlobalFights = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.GlobalFights.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.GlobalFights.prototype;
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.initTexts});
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._winBg.title = "Combates en Curso";
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.GlobalFights.CLASS_NAME);
};
_loc1.__set__Peleas = function(sData)
{
   this.sPeleas = sData;
};
_loc1.initData = function()
{
   var _loc4_ = this.sPeleas.split("~");
   var _loc3_ = new Object();
   var _loc5_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc2_;
   if(_loc4_.length > 0)
   {
      _loc2_ = 0;
      while(_loc2_ < _loc4_.length)
      {
         _loc3_.mapa = _loc4_[_loc2_].split(";")[0];
         _loc3_.versus = _loc4_[_loc2_].split(";")[1];
         _loc3_.perso = _loc4_[_loc2_].split(";")[2];
         _loc5_.push(_loc3_);
         _loc3_ = new Object();
         _loc2_ = _loc2_ + 1;
      }
      this._dgMembers._visible = true;
      this._dgMembers.columnsNames = ["Zona","vs","Combate"];
      this._dgMembers.dataProvider = _loc5_;
   }
};
_loc1.joinSpectator = function(sName)
{
   if(!this.api.datacenter.Game.isRunning)
   {
      this.api.network.send("FS" + sName);
   }
};
_loc1.click = function(oEvent)
{
   var _loc0_;
   if((_loc0_ = oEvent.target._name) === "_btnClose")
   {
      this.api.ui.unloadUIComponent("GlobalFights");
   }
};
_loc1.addProperty("peleas",function()
{
}
,_loc1.__set__Peleas);
_loc1.sPeleas = "";
_global.dofus["\r\x14"].gapi.ui.GlobalFights.CLASS_NAME = "GlobalFights";
