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
if(!dofus["\r\x14"].gapi.ui.guildBoostsBonusViewer)
{
   _global.dofus["\r\x14"].gapi.ui.guildBoostsBonusViewer = new Object();
}
_global.dofus["\r\x14"].gapi.ui.guildBoostsBonusViewer.GuildBoostsViewerOwn = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.guildBoostsBonusViewer.GuildBoostsViewerOwn.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.guildBoostsBonusViewer.GuildBoostsViewerOwn.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this._oItem = oItem;
      this._lblName.text = _global.API.lang.getText("STATS_ID" + oItem.id);
      this._lblBonus.text = oItem.bonus;
      this._ldrIcon.contentPath = oItem.icono;
   }
   else if(this._lblName.text == "" || this._lblName.text == "undefined")
   {
      this._lblName.text = "";
      this._ldrIcon.contentPath = "";
   }
};
_loc1.init = function()
{
   super.init(false);
   this._ldrIcon._visible = false;
};
loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
ASSetPropFlags(_loc1,null,1);
