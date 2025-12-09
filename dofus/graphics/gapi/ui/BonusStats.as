#initclip 106
_global.dofus["\r\x14"].gapi.ui.BonusStats = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.BonusStats.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.BonusStats.prototype;
_loc1.__set__Stat = function(nValue)
{
   this._nStat = nValue;
};
_loc1.init = function()
{
   super.init(false,"BonusStats");
};
_loc1.createChildren = function()
{
   this.player = this.api.datacenter.Player;
   var _loc2_ = this.api.datacenter.getHero(this.heroID);
   if(_loc2_ != undefined)
   {
      this.player = _loc2_;
   }
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.initData = function()
{
   switch(_global.parseInt(this._nStat,10))
   {
      case 10:
         this._lblIcone.contentPath = "IconEarthBonus";
         return;
      case 11:
         this._lblIcone.contentPath = "IconVita";
         return;
      case 12:
         this._lblIcone.contentPath = "IconWisdom";
         return;
      case 13:
         this._lblIcone.contentPath = "IconWaterBonus";
         return;
      case 14:
         this._lblIcone.contentPath = "IconAirBonus";
         return;
      case 15:
         this._lblIcone.contentPath = "IconFireBonus";
         return;
      default:
         this._lblIcone.contentPath = "OeufCasse";
         return;
   }
};
_loc1.addListeners = function()
{
   this._btnValidate.addEventListener("click",this);
   this._btnUp.addEventListener("click",this);
   this._btnCancel.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._btnValidate.label = this.api.lang.getText("VALIDATE");
   this._btnUp.label = this.api.lang.getText("MAX");
   this._txtTitle.text = this.api.lang.getText("AUTO_BOOST");
   this._txtDescription.text = this.api.lang.getText("QUANTITY");
};
_loc1.click = function(oEvent)
{
   var _loc2_;
   switch(oEvent.target)
   {
      case this._btnValidate:
         if(!this.api.datacenter.Game.isFight)
         {
            _loc2_ = "AB" + this._nStat + ";" + this._tiSearch.text;
            this.api.network.send2(this.heroID,_loc2_);
         }
         break;
      case this._btnCancel:
         break;
      case this._btnUp:
         this._tiSearch.text = this.player.BonusPoints;
      default:
         return;
   }
   this.gapi.unloadUIComponent("BonusStats");
};
_loc1.addProperty("stat",function()
{
}
,_loc1.__set__Stat);
_loc1.player;
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.BonusStats.CLASS_NAME = "BonusStats";
#endinitclip
