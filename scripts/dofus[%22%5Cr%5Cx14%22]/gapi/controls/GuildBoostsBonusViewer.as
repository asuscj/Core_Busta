#initclip 29
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
_global.dofus["\r\x14"].gapi.controls.GuildBoostsBonusViewer = function()
{
   super();
};
dofus["\r\x14"].gapi.controls.GuildBoostsBonusViewer.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.controls.GuildBoostsBonusViewer.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.controls.GuildBoostsBonusViewer.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this._btnBoostWisdom._visible = false;
   this._btnBoostPod._visible = false;
   this._btnBoostPop._visible = false;
   this._btnBoostPP._visible = false;
   this._btnHireTaxCollector._visible = false;
};
_loc1.addListeners = function()
{
   this._btnDonar.addEventListener("click",this);
   this.Miskamas.addEventListener("change",this);
   this.Misogrinas.addEventListener("change",this);
   this._btnDonarOk.addEventListener("click",this);
   this.panelDonacion(false);
};
_loc1.abierto = false;
_loc1.panelDonacion = function(sValue)
{
   this._winBgDonacion._visible = sValue;
   this.kamasDonacion._visible = sValue;
   this.Miskamas._visible = sValue;
   this.elback._visible = sValue;
   this.ogrinasdonacion._visible = sValue;
   this.Misogrinas._visible = sValue;
   this.elback2._visible = sValue;
   this._btnDonarOk._visible = sValue;
   this.abierto = sValue;
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnDonar:
         this.panelDonacion(!this.abierto);
         break;
      case this._btnDonarOk:
         this.api.network.send("gc" + this.Miskamas.text + ";" + this.Misogrinas.text);
         this.panelDonacion(false);
         this.Misogrinas.text = "0";
         this.Miskamas.text = "0";
   }
};
_loc1.change = function(oEvent)
{
   switch(oEvent.target)
   {
      case this.Misogrinas:
         if(this.Misogrinas.text.length <= 0)
         {
            this.Misogrinas.text = "0";
         }
         break;
      case this.Miskamas:
         if(this.Miskamas.text.length <= 0)
         {
            this.Miskamas.text = "0";
            break;
         }
   }
};
_loc1.initTexts = function()
{
   this._lblBonusTitle.text = this.api.lang.getText("BONUS_TITLE");
   this._lblActualBonus.text = this.api.lang.getText("ACTUAL_BONUS");
   this._lblStats.text = this.api.lang.getText("STATS_BUY");
   this._lblkamasText.text = this.api.lang.getText("KAMAS_DONADAS");
   this._lblogrinasText.text = this.api.lang.getText("OGRINAS_DONADAS");
   this._lblPrecio.text = this.api.lang.getText("PRICE");
   this._btnDonar.label = this.api.lang.getText("DONAR");
   this._btnDonarOk.label = this.api.lang.getText("OK");
   this._winBgDonacion.title = this.api.lang.getText("DONAR");
   this.Misogrinas.text = "0";
   this.Miskamas.text = "0";
};
_loc1.updateData = function()
{
   this.gapi.hideTooltip();
   var _loc9_ = this.api.datacenter.Player.guildInfos;
   this._lblGuildKamas.text = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc9_.kamasBonus).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   this._lblGuildOgrinas.text = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc9_.ogrinasBonus).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   var _loc7_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc11_ = 0;
   var _loc4_ = _loc9_.taxtShopBonus.split(";");
   var _loc3_;
   for(_loc11_ in _loc4_)
   {
      _loc3_ = new Object();
      _loc3_.id = Number(_loc4_[_loc11_].split(",")[0]);
      _loc3_.stats = _loc4_[_loc11_].split(",")[1];
      _loc3_.kamas = _loc4_[_loc11_].split(",")[2];
      _loc3_.ogrinas = _loc4_[_loc11_].split(",")[3];
      _loc3_.bonus = _loc4_[_loc11_].split(",")[4];
      _loc3_.icono = this.getIconByStatsId(Number(_loc4_[_loc11_].split(",")[0]));
      _loc7_.push(_loc3_);
      _loc11_ = _loc11_ + 1;
   }
   _loc7_.reverse();
   var _loc8_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc10_ = 0;
   var _loc6_;
   var _loc5_;
   if(_loc9_.boostStatsBonus != "")
   {
      _loc6_ = _loc9_.boostStatsBonus.split(";");
      for(_loc10_ in _loc6_)
      {
         _loc5_ = new Object();
         _loc5_.id = Number(_loc6_[_loc10_].split(",")[0]);
         _loc5_.stats = _loc6_[_loc10_].split(",")[1];
         _loc5_.bonus = _loc6_[_loc10_].split(",")[2] + "/" + _loc6_[_loc10_].split(",")[3];
         _loc5_.icono = this.getIconByStatsId(Number(_loc6_[_loc10_].split(",")[0]));
         _loc8_.push(_loc5_);
         _loc10_ = _loc10_ + 1;
      }
   }
   _loc8_.reverse();
   this._lstStatsBuy.dataProvider = _loc7_;
   this._lstStats.dataProvider = _loc8_;
};
_loc1.getIconByStatsId = function(_loc2_)
{
   var _loc1_ = "";
   switch(_loc2_)
   {
      case 7:
         _loc1_ = "IconXp";
         break;
      case 8:
         _loc1_ = "IconDrop";
         break;
      case 9:
         _loc1_ = "Star";
         break;
      case 10:
         _loc1_ = "IconMP";
         break;
      case 11:
         _loc1_ = "IconEarthBonus";
         break;
      case 12:
         _loc1_ = "IconVita";
         break;
      case 13:
         _loc1_ = "IconWisdom";
         break;
      case 14:
         _loc1_ = "IconWaterBonus";
         break;
      case 15:
         _loc1_ = "IconAirBonus";
         break;
      case 16:
         _loc1_ = "IconFireBonus";
         break;
      case 17:
         _loc1_ = "IconAlcance";
         break;
      case 18:
         _loc1_ = "IconSummons";
   }
   return _loc1_;
};
_global.dofus["\r\x14"].gapi.controls.GuildBoostsBonusViewer.CLASS_NAME = "GuildBoostsBonusViewer";
#endinitclip