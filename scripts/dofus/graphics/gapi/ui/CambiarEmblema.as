_global.dofus["\r\x14"].gapi.ui.CambiarEmblema = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.CambiarEmblema.prototype = new ank.gapi.core["\x1e\n\r"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.CambiarEmblema.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.CambiarEmblema.CLASS_NAME);
};
_loc1.callClose = function()
{
   this.unloadThis();
};
_loc1.__set__precio = function(sData)
{
   this.sPrecio = sData;
};
_loc1.createChildren = function()
{
   this._eaBacks = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc3_ = 0;
   while(true)
   {
      _loc3_ = _loc3_ + 1;
      if(_loc3_ > dofus.Constants.EMBLEM_BACKS_COUNT)
      {
         break;
      }
      this._eaBacks.push({iconFile:dofus.Constants.EMBLEMS_BACK_PATH + _loc3_ + ".swf"});
   }
   this._eaUps = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc2_ = 0;
   while(true)
   {
      _loc2_ = _loc2_ + 1;
      if(_loc2_ > dofus.Constants.EMBLEM_UPS_COUNT)
      {
         break;
      }
      this._eaUps.push({iconFile:dofus.Constants.EMBLEMS_UP_PATH + _loc2_ + ".swf"});
   }
   this._nBackID = 1;
   this._nUpID = 1;
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.setTextFocus});
   this.addToQueue({object:this,method:this.updateCurrentTabInformations});
   this.addToQueue({object:this,method:this.updateBack});
   this.addToQueue({object:this,method:this.updateUp});
};
_loc1.initTexts = function()
{
   this._winBg.title = this.api.lang.getText("GUILD_CREATION");
   this._lblName.text = this.api.lang.getText("GUILD_NAME");
   this._lblEmblem.text = this.api.lang.getText("EMBLEM");
   this._lblColors.text = this.api.lang.getText("CREATE_COLOR");
   this._btnCancel.label = this.api.lang.getText("CANCEL_SMALL");
   this._btnCreate.label = "OK";
   this._precio.text = "Prix: " + this.sPrecio;
   this._btnTabBack.label = this.api.lang.getText("EMBLEM_BACK");
   this._btnTabUp.label = this.api.lang.getText("EMBLEM_UP");
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnCancel.addEventListener("click",this);
   this._btnCreate.addEventListener("click",this);
   this._btnTabBack.addEventListener("click",this);
   this._btnTabUp.addEventListener("click",this);
   this._cpColors.addEventListener("change",this);
   this._cgGrid.addEventListener("selectItem",this);
};
_loc1.setTextFocus = function()
{
   this._itName.setFocus();
};
_loc1.updateCurrentTabInformations = function()
{
   switch(this._sCurrentTab)
   {
      case "Back":
         this._cpColors.setColor(this._nBackColor);
         this._cgGrid.dataProvider = this._eaBacks;
         this._cgGrid.selectedIndex = this._nBackID - 1;
         break;
      case "Up":
         this._cpColors.setColor(this._nUpColor);
         this._cgGrid.dataProvider = this._eaUps;
         this._cgGrid.selectedIndex = this._nUpID - 1;
   }
};
_loc1.setCurrentTab = function(sNewTab)
{
   var _loc3_ = this["_btnTab" + this._sCurrentTab];
   var _loc2_ = this["_btnTab" + sNewTab];
   _loc3_.selected = true;
   _loc3_.enabled = true;
   _loc2_.selected = false;
   _loc2_.enabled = false;
   this._sCurrentTab = sNewTab;
   this.updateCurrentTabInformations();
};
_loc1.updateBack = function()
{
   this._eEmblem.backID = this._nBackID;
   this._eEmblem.backColor = this._nBackColor;
};
_loc1.updateUp = function()
{
   this._eEmblem.upID = this._nUpID;
   this._eEmblem.upColor = this._nUpColor;
};
_loc1.setEnabled = function(bEnabled)
{
   this._btnCancel.enabled = this._bEnabled;
   this._btnClose.enabled = this._bEnabled;
   this._btnCreate.enabled = this._bEnabled;
};
_loc1.click = function(oEvent)
{
   var _loc2_;
   switch(oEvent.target._name)
   {
      case "_btnClose":
         this.gapi.unloadUIComponent("Panel");
         this.unloadThis();
         break;
      case "_btnCreate":
         _loc2_ = this._itName.text;
         if(_loc2_ == undefined || _loc2_.length < 3)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("BAD_GUILD_NAME"),"ERROR_BOX");
            return undefined;
         }
         if(this._nBackID == undefined || this._nUpID == undefined)
         {
            return undefined;
         }
         this.enabled = false;
         this.api.network.send("ZsG" + this._nBackID + "|" + this._nBackColor + "|" + this._nUpID + "|" + this._nUpColor + "|" + _loc2_);
         break;
      case "_btnTabBack":
         this.setCurrentTab("Back");
         break;
      case "_btnTabUp":
         this.setCurrentTab("Up");
   }
};
_loc1.change = function(oEvent)
{
   switch(this._sCurrentTab)
   {
      case "Back":
         this._nBackColor = oEvent.value;
         this.updateBack();
         break;
      case "Up":
         this._nUpColor = oEvent.value;
         this.updateUp();
   }
};
_loc1.selectItem = function(oEvent)
{
   switch(this._sCurrentTab)
   {
      case "Back":
         this._nBackID = oEvent.owner.selectedIndex + 1;
         this.updateBack();
         break;
      case "Up":
         this._nUpID = oEvent.owner.selectedIndex + 1;
         this.updateUp();
   }
};
_loc1.addProperty("precio",function()
{
}
,_loc1.__set__precio);
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.CambiarEmblema.CLASS_NAME = "CambiarEmblema";
_loc1._nBackColor = 14933949;
_loc1._nUpColor = 0;
_loc1._sCurrentTab = "Back";
