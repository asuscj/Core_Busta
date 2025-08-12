#initclip 128
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Guild.prototype;
_loc1.__set__Anuncio = function(sValue)
{
   this.sAnuncio = sValue.split("~")[0];
   this.sRemitente = sValue.split("~")[1];
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.setCurrentTab,params:[this._sCurrentTab]});
   this._mcPlacer._visible = false;
   this._mcCaution._visible = this._lblValid._visible = false;
};
_loc1.initTexts = function()
{
   this._btnTabMembers.label = this.api.lang.getText("GUILD_MEMBERS");
   this._btnTabBoosts.label = this.api.lang.getText("GUILD_BOOSTS");
   this._btnTabTaxCollectors.label = this.api.lang.getText("GUILD_TAXCOLLECTORS");
   this._btnTabMountParks.label = this.api.lang.getText("MOUNT_PARK");
   this._btnTabGuildHouses.label = this.api.lang.getText("HOUSES_WORD");
   this._btnTabBoostsBonus.label = this.api.lang.getText("DONACIONES");
   this._btnTabInformations.label = this.api.lang.getText("INFORMATIONS");
   this._btnTabHistoryRank.label = this.api.lang.getText("RANK_HISTORY");
   this._lblXP.text = this.api.lang.getText("EXPERIMENT");
   this._taGuildNote.text = this.sAnuncio;
   this._taGuildNote2.text = this.sAnuncio;
   this._lblLastModified.text = this.sRemitente;
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnEdit.addEventListener("click",this);
   this._btnTabInformations.addEventListener("click",this);
   this._btnTabMembers.addEventListener("click",this);
   this._btnTabBoosts.addEventListener("click",this);
   this._btnTabBoostsBonus.addEventListener("click",this);
   this._btnTabHistoryRank.addEventListener("click",this);
   this._btnCancel.addEventListener("click",this);
   this._btnSave.addEventListener("click",this);
   this._btnTabTaxCollectors.addEventListener("click",this);
   this._btnTabMountParks.addEventListener("click",this);
   this._btnTabGuildHouses.addEventListener("click",this);
   this.api.datacenter.Player.guildInfos.addEventListener("modelChanged",this);
   this._pbXP.addEventListener("over",this);
   this._pbXP.addEventListener("out",this);
   this.toggleInfosEditor(false);
};
_loc1.initData = function()
{
   var _loc3_ = this.api.datacenter.Player.guildInfos;
   var _loc2_ = _loc3_.emblem;
   this._eEmblem.backID = _loc2_.backID;
   this._eEmblem.backColor = _loc2_.backColor;
   this._eEmblem.upID = _loc2_.upID;
   this._eEmblem.upColor = _loc2_.upColor;
   this._winBg.title = this.api.lang.getText("GUILD") + " \'" + _loc3_.name + "\'";
   this.api.network.Guild.getInfosGeneral();
   var _loc4_ = _loc3_.playerRights;
   this._btnEdit._visible = _loc4_.canManageRights;
};
_loc1.modelChanged = function(_loc2_)
{
   var _loc2_;
   var _loc0_;
   switch(_loc2_.eventName)
   {
      case "infosUpdate":
         this.initData();
         break;
      case "general":
         _loc2_ = this.api.datacenter.Player.guildInfos;
         this._lblLevel.text = this.api.lang.getText("LEVEL") + " " + _loc2_.level;
         this._pbXP.minimum = _loc2_.xpmin;
         this._pbXP.maximum = _loc2_.xpmax;
         this._pbXP.value = _loc2_.xp;
         this._pbXP.onRollOver = function()
         {
            this._parent.gapi.showTooltip(this.value + " / " + this.maximum,this,-20);
         };
         this._pbXP.onRollOut = function()
         {
            this._parent.gapi.hideTooltip();
         };
         if(_loc2_.isValid)
         {
            this._y = 0;
            _loc0_ = _loc0_ = false;
            this._lblValid._visible = _loc0_;
            this._mcCaution._visible = _loc0_;
         }
         else
         {
            this._y = -20;
            _loc0_ = _loc0_ = true;
            this._lblValid._visible = _loc0_;
            this._mcCaution._visible = _loc0_;
            this._lblValid.text = this.api.lang.getText("GUILD_INVALID_INFOS");
         }
         break;
      case "members":
         if(this._sCurrentTab == "Members")
         {
            this._mcTabViewer.members = this.api.datacenter.Player.guildInfos.members;
         }
         break;
      case "infosUpdateBoost":
         if(this._sCurrentTab == "BoostsBonus")
         {
            this._mcTabViewer.updateData();
         }
         break;
      case "infosUpdateRankHistory":
         if(this._sCurrentTab == "HistoryRank")
         {
            this._mcTabViewer.updateData();
         }
         break;
      case "boosts":
         if(this._sCurrentTab == "Boosts")
         {
            this._mcTabViewer.updateData();
         }
         break;
      case "informations":
         if(this._sCurrentTab == "Informations")
         {
            this._mcTabViewer.updateData();
         }
         break;
      case "taxcollectors":
         if(this._sCurrentTab == "TaxCollectors")
         {
            this._mcTabViewer.taxCollectors = this.api.datacenter.Player.guildInfos.taxCollectors;
         }
         break;
      case "noboosts":
      case "notaxcollectors":
         this.api.kernel.showMessage(undefined,this.api.lang.getText("NOT_ENOUGHT_MEMBERS_IN_GUILD"),"ERROR_BOX");
         this.setCurrentTab("Members");
         break;
      case "mountParks":
         if(this._sCurrentTab == "MountParks")
         {
            this._mcTabViewer.mountParks = this.api.datacenter.Player.guildInfos.mountParks;
         }
         break;
      case "houses":
         if(this._sCurrentTab == "GuildHouses")
         {
            this._mcTabViewer.houses = this.api.datacenter.Player.guildInfos.houses;
            break;
         }
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnClose":
         this.callClose();
         break;
      case "_btnEdit":
         this.toggleInfosEditor(true);
         break;
      case "_btnCancel":
         this.toggleInfosEditor(false);
         break;
      case "_btnSave":
         this.toggleInfosEditor(false);
         this.api.network.send("wG" + this._taGuildNote2.text);
         this._taGuildNote.text = this._taGuildNote2.text;
         break;
      case "_btnTabInformations":
         this.setCurrentTab("Informations");
         break;
      case "_btnTabMembers":
         this.setCurrentTab("Members");
         break;
      case "_btnTabBoostsBonus":
         if(this.api.datacenter.Player.guildInfos.isValid)
         {
            this.setCurrentTab("BoostsBonus");
            break;
         }
         this.api.kernel.showMessage(undefined,this.api.lang.getText("NOT_ENOUGHT_MEMBERS_IN_GUILD"),"ERROR_BOX");
         oEvent.target.selected = true;
         break;
      case "_btnTabHistoryRank":
         if(this.api.datacenter.Player.guildInfos.isValid)
         {
            this.setCurrentTab("HistoryRank");
            break;
         }
         this.api.kernel.showMessage(undefined,this.api.lang.getText("NOT_ENOUGHT_MEMBERS_IN_GUILD"),"ERROR_BOX");
         oEvent.target.selected = true;
         break;
      case "_btnTabBoosts":
         if(this.api.datacenter.Player.guildInfos.isValid)
         {
            this.setCurrentTab("Boosts");
         }
         else
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("NOT_ENOUGHT_MEMBERS_IN_GUILD"),"ERROR_BOX");
            oEvent.target.selected = true;
         }
         break;
      case "_btnTabTaxCollectors":
         if(this.api.datacenter.Player.guildInfos.isValid)
         {
            this.setCurrentTab("TaxCollectors");
         }
         else
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("NOT_ENOUGHT_MEMBERS_IN_GUILD"),"ERROR_BOX");
            oEvent.target.selected = true;
         }
         break;
      case "_btnTabBoosts":
         if(this.api.datacenter.Player.guildInfos.isValid)
         {
            this.setCurrentTab("Boosts");
         }
         else
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("NOT_ENOUGHT_MEMBERS_IN_GUILD"),"ERROR_BOX");
            oEvent.target.selected = true;
         }
         break;
      case "_btnTabMountParks":
         if(this.api.datacenter.Player.guildInfos.isValid)
         {
            this.setCurrentTab("MountParks");
         }
         else
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("NOT_ENOUGHT_MEMBERS_IN_GUILD"),"ERROR_BOX");
            oEvent.target.selected = true;
         }
         break;
      case "_btnTabGuildHouses":
         if(this.api.datacenter.Player.guildInfos.isValid)
         {
            this.setCurrentTab("GuildHouses");
            break;
         }
         this.api.kernel.showMessage(undefined,this.api.lang.getText("NOT_ENOUGHT_MEMBERS_IN_GUILD"),"ERROR_BOX");
         oEvent.target.selected = true;
         break;
   }
};
_loc1.toggleInfosEditor = function(_loc2_)
{
   this._taGuildNote2._visible = _loc2_;
   this._taGuildNote._visible = !_loc2_;
   this._taGuildNote2.editable = _loc2_;
   this._btnCancel._visible = _loc2_;
   this._btnSave._visible = _loc2_;
   this._mcEditMode._visible = _loc2_;
   this._btnEdit._visible = !_loc2_;
   if(_loc2_)
   {
      this._taGuildNote.setFocus(false);
   }
};
_loc1.updateCurrentTabInformations = function()
{
   this._mcTabViewer.removeMovieClip();
   if(this._sCurrentTab !== "Members")
   {
      switch(this._sCurrentTab)
      {
         case "Boosts":
            this.attachMovie("GuildBoostsViewer","_mcTabViewer",this.getNextHighestDepth(),{_x:this._mcPlacer._x,_y:this._mcPlacer._y});
            this.api.network.Guild.getInfosBoosts();
            break;
         case "TaxCollectors":
            this.attachMovie("TaxCollectorsViewer","_mcTabViewer",this.getNextHighestDepth(),{_x:this._mcPlacer._x,_y:this._mcPlacer._y});
            this.api.datacenter.Player.guildInfos.taxCollectors.removeAll();
            this.api.network.Guild.getInfosTaxCollector();
            break;
         case "MountParks":
            this.attachMovie("GuildMountParkViewer","_mcTabViewer",this.getNextHighestDepth(),{_x:this._mcPlacer._x,_y:this._mcPlacer._y});
            this.api.network.Guild.getInfosMountPark();
            break;
         case "GuildHouses":
            this.attachMovie("GuildHousesViewer","_mcTabViewer",this.getNextHighestDepth(),{_x:this._mcPlacer._x,_y:this._mcPlacer._y});
            this.api.network.Guild.getInfosGuildHouses();
            break;
         case "BoostsBonus":
            this.attachMovie("GuildBoostsBonusViewer","_mcTabViewer",this.getNextHighestDepth(),{_x:this._mcPlacer._x,_y:this._mcPlacer._y});
            this.api.network.Game.getInfosBoostsStats();
            break;
         case "HistoryRank":
            this.attachMovie("GuildBoostsHistoryRankViewer","_mcTabViewer",this.getNextHighestDepth(),{_x:this._mcPlacer._x,_y:this._mcPlacer._y});
            this.api.network.Game.getRankHistoryInfo();
            break;
         case "Informations":
            this.attachMovie("GuildInformationsViewer","_mcTabViewer",this.getNextHighestDepth(),{_x:this._mcPlacer._x,_y:this._mcPlacer._y});
            this.api.network.Game.getInformationsGuild();
      }
   }
   else
   {
      this.attachMovie("GuildMembersViewer","_mcTabViewer",this.getNextHighestDepth(),{_x:this._mcPlacer._x,_y:this._mcPlacer._y});
      this.api.datacenter.Player.guildInfos.members.removeAll();
      this.api.network.Guild.getInfosMembers();
   }
};
_loc1.over = function(oEvent)
{
   if(oEvent.target._name === "_pbXP")
   {
      this.gapi.showTooltip(new ank.utils.ExtendedString(this._pbXP.value).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) + " / " + new ank.utils.ExtendedString(this._pbXP.maximum).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3),this._pbXP,-20);
   }
};
_loc1.out = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.addProperty("anuncio",function()
{
}
,_loc1.__set__Anuncio);
_loc1.editado = false;
_loc1.sAnuncio = "";
#endinitclip