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
_global.dofus["\r\x14"].gapi.ui.guildBoostsBonusViewer.GuildBoostsViewerBonus = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.guildBoostsBonusViewer.GuildBoostsViewerBonus.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.guildBoostsBonusViewer.GuildBoostsViewerBonus.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this._oItem = oItem;
      this._lblName.text = "+" + oItem.bonus + " " + _global.API.lang.getText("STATS_ID" + oItem.id);
      this._lblKamas.text = new ank["\x1e\n\x07"]["\x0e\x1c"](oItem.kamas).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"),3);
      this._lblOgrinas.text = new ank["\x1e\n\x07"]["\x0e\x1c"](oItem.ogrinas).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"),3);
      this._ldrIcon.contentPath = oItem.icono;
      this._btnOg._visible = true;
      this._btnkk._visible = true;
   }
   else if(this._lblName.text == "" || this._lblName.text == "undefined")
   {
      this._lblName.text = "";
      this._mcF._visible = false;
      this._ldrIcon.contentPath = "";
      this._btnOg._visible = false;
      this._btnkk._visible = false;
   }
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.addListeners = function()
{
   this._btnkk.addEventListener("click",this);
   this._btnOg.addEventListener("click",this);
};
_loc1.init = function()
{
   super.init(false);
   this._ldrIcon._visible = false;
};
_loc1.click = function(oEvent)
{
   var _loc5_ = _global.API.datacenter.Player.guildInfos;
   var _loc7_ = _loc5_.playerRights;
   var _loc8_ = Number(_loc5_.kamasBonus);
   var _loc6_ = Number(_loc5_.ogrinasBonus);
   var _loc4_ = oEvent.target == this._btnOg;
   if(!_loc7_.canManageRights)
   {
      _global.API.kernel.showMessage(undefined,_global.API.lang.getText("RANGO_NO_SUFICIENTE"),"ERROR_CHAT");
      return undefined;
   }
   var _loc3_;
   if(!_loc4_)
   {
      if(_global.parseInt(this._oItem.kamas) > Number(_loc8_))
      {
         this.gapi.loadUIComponent("AskOk","AskOkNotRich",{title:_global.API.lang.getText("ERROR_WORD"),text:_global.API.lang.getText("NOT_ENOUGH_RICH_KAMAS")});
      }
      else
      {
         _loc3_ = this.gapi.loadUIComponent("AskYesNo","AskYesNoBuy",{title:_global.API.lang.getText("GUILD_BONUS"),text:_global.API.lang.getText("DO_U_BUY_ITEM_BONUS_KAMAS",[this._oItem.kamas + " Kamas",this._oItem.kamas]),params:{id:this._oItem.id,kamas:_loc4_}});
         _loc3_.addEventListener("yes",this);
      }
   }
   else if(_global.parseInt(this._oItem.ogrinas) > Number(_loc6_))
   {
      this.gapi.loadUIComponent("AskOk","AskOkNotRich",{title:_global.API.lang.getText("ERROR_WORD"),text:_global.API.lang.getText("NOT_ENOUGH_RICH_OGRINAS")});
   }
   else
   {
      _loc3_ = this.gapi.loadUIComponent("AskYesNo","AskYesNoBuy",{title:_global.API.lang.getText("GUILD_BONUS"),text:_global.API.lang.getText("DO_U_BUY_ITEM_BONUS_OGRINAS",[this._oItem.ogrinas + " Ogrinas",this._oItem.ogrinas]),params:{id:this._oItem.id,kamas:_loc4_}});
      _loc3_.addEventListener("yes",this);
   }
};
_loc1.yes = function(_loc2_)
{
   if(_loc2_.target.params.kamas)
   {
      _global.API.network.send("gA" + _loc2_.target.params.id);
   }
   else
   {
      _global.API.network.send("ga" + _loc2_.target.params.id);
   }
};
loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
ASSetPropFlags(_loc1,null,1);
