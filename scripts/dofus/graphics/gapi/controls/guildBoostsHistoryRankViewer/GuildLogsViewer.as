#initclip 9
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
if(!dofus["\r\x14"].gapi.ui.guildBoostsHistoryRankViewer)
{
   _global.dofus["\r\x14"].gapi.ui.guildBoostsHistoryRankViewer = new Object();
}
_global.dofus["\r\x14"].gapi.ui.guildBoostsHistoryRankViewer.GuildLogsViewer = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.guildBoostsHistoryRankViewer.GuildLogsViewer.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.guildBoostsHistoryRankViewer.GuildLogsViewer.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this._oItem = oItem;
      this._lblDate.text = oItem.date;
      switch(oItem.type)
      {
         case "1":
            this._lblName.text = _global.API.lang.getText("DONATION",[oItem.name,oItem.cant,oItem.currency]);
            this._lblName.styleName = "BrownLeftSmallLabel";
            break;
         case "2":
            this._lblName.text = _global.API.lang.getText("JOING_GUILD",[oItem.name]);
            this._lblName.styleName = "GreenLeftSmallLabel";
            break;
         case "3":
            this._lblName.text = _global.API.lang.getText("LEFT_GUILD",[oItem.name]);
            this._lblName.styleName = "RedLeftSmallLabel";
      }
   }
   else if(this._lblName.text == "" || this._lblName.text == "undefined")
   {
      this._lblName.text = "";
      this.kk._visible = false;
      this.og._visible = false;
   }
};
_loc1.init = function()
{
   super.init(false);
   this.kk._visible = false;
   this.og._visible = false;
};
loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
ASSetPropFlags(_loc1,null,1);
#endinitclip