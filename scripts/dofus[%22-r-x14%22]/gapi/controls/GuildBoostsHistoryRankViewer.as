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
if(!dofus["\r\x14"].gapi.controls)
{
   _global.dofus["\r\x14"].gapi.controls = new Object();
}
_global.dofus["\r\x14"].gapi.controls.GuildBoostsHistoryRankViewer = function()
{
   super();
};
dofus["\r\x14"].gapi.controls.GuildBoostsHistoryRankViewer.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.controls.GuildBoostsHistoryRankViewer.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.controls.GuildBoostsHistoryRankViewer.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.addListeners = function()
{
};
_loc1.click = function(oEvent)
{
};
_loc1.initTexts = function()
{
   this._lblHistoryTitle.text = this.api.lang.getText("HISTORY_RANK_TITLE");
   this._lblRankName.text = this.api.lang.getText("NAME");
   this._lblRankKamas.text = this.api.lang.getText("KAMAS");
   this._lblRankOgrinas.text = this.api.lang.getText("OGRINAS");
   this._lblHistoryName.text = this.api.lang.getText("LOGS");
   this._lblHistoryDate.text = this.api.lang.getText("DATE");
};
_loc1.updateData = function()
{
   this.gapi.hideTooltip();
   var _loc9_ = this.api.datacenter.Player.guildInfos;
   var _loc8_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc4_ = 0;
   var _loc6_ = _loc9_.ranking.split("|");
   var _loc3_;
   for(_loc4_ in _loc6_)
   {
      _loc3_ = new Object();
      _loc3_.id = _loc4_ + 1;
      _loc3_.name = _loc6_[_loc4_].split(";")[0];
      _loc3_.kk = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc6_[_loc4_].split(";")[1]).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"),3);
      _loc3_.og = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc6_[_loc4_].split(";")[2]).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"),3);
      _loc8_.push(_loc3_);
      _loc4_ = _loc4_ + 1;
   }
   _loc8_.reverse();
   this._lstRanking.dataProvider = _loc8_;
   var _loc7_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc5_ = _loc9_.logs.split("|");
   for(_loc4_ in _loc5_)
   {
      _loc3_ = new Object();
      _loc3_.name = _loc5_[_loc4_].split(";")[0].split("@")[0];
      _loc3_.date = _loc5_[_loc4_].split(";")[1];
      _loc3_.type = _loc5_[_loc4_].split(";")[0].split("@")[1];
      _loc3_.cant = _loc5_[_loc4_].split(";")[0].split("@")[2];
      _loc3_.currency = _loc5_[_loc4_].split(";")[0].split("@")[3];
      _loc7_.push(_loc3_);
      _loc4_ = _loc4_ + 1;
   }
   _loc7_.reverse();
   this._lstLogs.dataProvider = _loc7_;
};
_global.dofus["\r\x14"].gapi.controls.GuildBoostsHistoryRankViewer.CLASS_NAME = "GuildBoostsHistoryRankViewer";
