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
if(!dofus["\r\x14"].gapi.ui.bonus)
{
   _global.dofus["\r\x14"].gapi.ui.bonus = new Object();
}
_global.dofus["\r\x14"].gapi.ui.bonus.BonusItem = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.bonus.BonusItem.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.bonus.BonusItem.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   var _loc6_;
   var _loc5_;
   var _loc4_;
   if(bUsed)
   {
      this._oItem = oItem;
      _loc6_ = oItem.idBonus;
      _loc5_ = oItem.cantidad;
      _loc4_ = oItem.caracteristica;
      if(_loc4_ == 0)
      {
         this._lblNombre.text = "";
      }
      else
      {
         this._lblNombre.text = "+" + _loc5_ + " " + _global.API.lang.getText("STATS_ID" + _loc4_);
      }
      this.iconID(_loc4_);
   }
   else if(Number(oItem.idBonus) < 1)
   {
      this._lblNombre.text = "";
      this._txtCantidad.text = "";
      this._ldrIcon.contentPath = "";
   }
};
_loc1.iconID = function(statID)
{
   switch(Number(statID))
   {
      case 7:
         this._ldrIcon.contentPath = "IconXp";
         break;
      case 8:
         this._ldrIcon.contentPath = "IconDrop";
         break;
      case 9:
         this._ldrIcon.contentPath = "Star";
         break;
      case 10:
         this._ldrIcon.contentPath = "IconMP";
         break;
      case 11:
         this._ldrIcon.contentPath = "IconEarthBonus";
         break;
      case 12:
         this._ldrIcon.contentPath = "IconVita";
         break;
      case 13:
         this._ldrIcon.contentPath = "IconWisdom";
         break;
      case 14:
         this._ldrIcon.contentPath = "IconWaterBonus";
         break;
      case 15:
         this._ldrIcon.contentPath = "IconAirBonus";
         break;
      case 16:
         this._ldrIcon.contentPath = "IconFireBonus";
         break;
      case 17:
         this._ldrIcon.contentPath = "IconAlcance";
         break;
      case 18:
         this._ldrIcon.contentPath = "IconSummons";
         break;
      case 19:
         this._ldrIcon.contentPath = "IconPods";
         break;
      case 20:
         this._ldrIcon.contentPath = "IconOficio";
         break;
      case 21:
         this._ldrIcon.contentPath = "KamaSymbol";
         break;
      case 22:
         this._ldrIcon.contentPath = "IconInit";
         break;
      case 23:
         this._ldrIcon.contentPath = "IconAirDommage";
         break;
      case 24:
         this._ldrIcon.contentPath = "IconEarthDommage";
         break;
      case 25:
         this._ldrIcon.contentPath = "IconFireDommage";
         break;
      case 26:
         this._ldrIcon.contentPath = "IconNeutralDommage";
         break;
      case 27:
         this._ldrIcon.contentPath = "IconWaterDommage";
      default:
         return;
   }
};
_loc1.init = function()
{
   super.init(false);
   this._mcF._visible = false;
   this._svPersonaje._visible = false;
   this._lblName.text = "";
   this._txtCantidad.text = "";
};
loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
