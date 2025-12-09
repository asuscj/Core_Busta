#initclip 100
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
_global.dofus["\r\x14"].gapi.ui.HeroItem = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.HeroItem.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.HeroItem.prototype;
_loc1.__set__data = function(oData)
{
   this._oData = oData;
   this.updateData();
};
_loc1.__get__data = function()
{
   return this._oData;
};
_loc1.init = function()
{
   super.init(false,dofus.graphics.gapi.controls.HeroItem.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.showButtons = function(bVisible)
{
   this._btnMount._visible = bVisible;
   this._btnBank._visible = bVisible;
   this._btnStatsJob._visible = bVisible;
   this._btnSpells._visible = bVisible;
   this._btnInventory._visible = bVisible;
   this._btnParty._visible = bVisible;
};
_loc1.addListeners = function()
{
   this._btnLeader.addEventListener("click",this);
   this._btnLeader.addEventListener("over",this);
   this._btnLeader.addEventListener("out",this);
   this._btnMount.addEventListener("click",this);
   this._btnMount.addEventListener("over",this);
   this._btnMount.addEventListener("out",this);
   this._btnBank.addEventListener("click",this);
   this._btnBank.addEventListener("over",this);
   this._btnBank.addEventListener("out",this);
   this._btnStatsJob.addEventListener("click",this);
   this._btnStatsJob.addEventListener("over",this);
   this._btnStatsJob.addEventListener("out",this);
   this._btnSpells.addEventListener("click",this);
   this._btnSpells.addEventListener("over",this);
   this._btnSpells.addEventListener("out",this);
   this._btnInventory.addEventListener("click",this);
   this._btnInventory.addEventListener("over",this);
   this._btnInventory.addEventListener("out",this);
   this._btnParty.addEventListener("click",this);
   this._btnParty.addEventListener("over",this);
   this._btnParty.addEventListener("out",this);
   this._btnMenu.addEventListener("click",this);
   this._btnMenu.addEventListener("over",this);
   this._btnMenu.addEventListener("out",this);
};
_loc1.initData = function()
{
   this.updateData();
};
_loc1.updateData = function()
{
   this._visible = this._oData != undefined;
   var _loc2_;
   if(this._oData != undefined)
   {
      this._svHero.spriteData = this._oData.sprite;
      this._lblName.text = this._oData.Name + " (" + this.api.lang.getText("LEVEL_SMALL") + " " + this._oData.Level + ")";
      this._lblInit.text = this._oData.iniciativa;
      this._lblSab.text = this._oData.sabiduria;
      _loc2_ = this._oData.ID == this.api.datacenter.PlayerReal.ID;
      this._btnLeader.icon = !_loc2_ ? "LeaderIcon" : "Leader2Icon";
      this._btnParty._visible = !_loc2_;
      this._btnParty.icon = !this._oData.inParty ? "PartyIcon" : "Party2Icon";
   }
   else
   {
      this._svHero.spriteData = undefined;
      this._lblName.text = "";
   }
};
_loc1.click = function(oEvent)
{
   var _loc5_;
   var _loc6_;
   var _loc4_;
   switch(oEvent.target._name)
   {
      case "_btnParty":
         _global.API.network.send2(this._oData.ID,"Hp");
         break;
      case "_btnMount":
         _global.API.network.send2(this._oData.ID,"Hr");
         this.gapi.unloadUIComponent("HeroesPanel");
         break;
      case "_btnBank":
         _global.API.network.send2(this._oData.ID,"Hc");
         this.gapi.unloadUIComponent("HeroesPanel");
         break;
      case "_btnMenu":
         this.api.sounds.events.onBannerChatButtonClick();
         _loc5_ = this.api.ui.createPopupMenu();
         _loc5_.addStaticItem(this.api.lang.getText("HERO_SETTINGS"));
         _loc6_ = this._oData.ID == this.api.datacenter.PlayerReal.ID;
         if(_loc6_)
         {
            _loc5_.addItem("IP Drop",this,this.escojerDrop);
            _loc5_.addItem("IP Kamas",this,this.escojerKamas);
         }
         else
         {
            _loc5_.addItem("Automatic turn",this,this.escojerAuto);
         }
         _loc5_.show(_root._xmouse,_root._ymouse);
         break;
      case "_btnSpells":
      case "_btnInventory":
      case "_btnStatsJob":
         _loc4_ = oEvent.target._name.substr(4);
         _global.API.network.send2(this._oData.ID,"Hh" + _loc4_);
         this.gapi.unloadUIComponent("HeroesPanel");
         this.gapi.unloadUIComponent("UI_Spells");
         this.gapi.unloadUIComponent("UI_Inventory");
         this.gapi.unloadUIComponent("UI_StatsJob");
         break;
      case "_btnLeader":
         _loc6_ = this._oData.ID == this.api.datacenter.PlayerReal.ID;
         if(_loc6_)
         {
            return undefined;
         }
         _loc5_ = this.gapi.loadUIComponent("AskYesNo","AskYesNoLeader",{title:this.api.lang.getText("HEROE_CAMBIAR"),text:this.api.lang.getText("HEROE_CAMBIAR2") + this._oData.Name});
         _loc5_.addEventListener("yes",this);
      default:
         return;
   }
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnMenu":
         this.gapi.showTooltip(this.api.lang.getText("HEROE_MENU"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnLeader":
         this.gapi.showTooltip(this.api.lang.getText("HEROE_LIDER"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnInventory":
         this.gapi.showTooltip(this.api.lang.getText("HEROE_INVENTARIO"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnMount":
         this.gapi.showTooltip(this.api.lang.getText("HEROE_MONTURA"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnBank":
         this.gapi.showTooltip(this.api.lang.getText("HEROE_BANCO"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnStatsJob":
         this.gapi.showTooltip(this.api.lang.getText("HEROE_STATS"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnSpells":
         this.gapi.showTooltip(this.api.lang.getText("HEROE_HECHIZOS"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnParty":
         this.gapi.showTooltip(this.api.lang.getText("HEROE_GRUPO"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
      default:
         return;
   }
};
_loc1.out = function(_loc2_)
{
   this.api.ui.hideTooltip();
};
_loc1.escojerDrop = function()
{
   _global.API.network.send2(this._oData.ID,"HOd");
};
_loc1.escojerKamas = function()
{
   _global.API.network.send2(this._oData.ID,"HOk");
};
_loc1.escojerAuto = function()
{
   _global.API.network.send2(this._oData.ID,"HOa");
};
_loc1.yes = function(oEvent)
{
   _global.API.network.send2(this._oData.ID,"HL");
   this.gapi.unloadUIComponent("HeroesPanel");
};
_loc1.addProperty("data",_loc1.__get__data,_loc1.__set__data);
ASSetPropFlags(_loc1,null,1);
_global.dofus.graphics.gapi.controls.ChooseHeroSprite.CLASS_NAME = "HeroItem";
#endinitclip
