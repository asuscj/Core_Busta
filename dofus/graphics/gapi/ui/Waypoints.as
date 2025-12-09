var _loc1 = dofus["\r\x14"].gapi.ui.Waypoints.prototype;
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.initTexts = function()
{
   this._winBg.title = this.api.lang.getText("WAYPOINT_LIST");
   this._lblCoords.text = this.api.lang.getText("COORDINATES_SMALL");
   this._lblName.text = this.api.lang.getText("SUBAREA") + " (" + this.api.lang.getText("RESPAWN_SMALL") + ")";
   this._lblCost.text = this.api.lang.getText("COST");
   this._lblArea.text = this.api.lang.getText("AREA");
   this._lblDescription.text = this.api.lang.getText("CLICK_ON_WAYPOINT");
   this._btnClose2.label = this.api.lang.getText("CLOSE");
   this._btnTeleport.label = this.api.lang.getText("TELEPORT");
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnClose2.addEventListener("click",this);
   this._btnTeleport.addEventListener("click",this);
   this._lstWaypoints.addEventListener("itemdblClick",this);
   this._lstWaypoints.addEventListener("itemSelected",this);
   this._tiSearch.addEventListener("change",this);
   this._btnSearch.addEventListener("click",this);
};
_loc1.initData = function()
{
   if(this._eaData != undefined)
   {
      this._eaData.sortOn("fieldToSort",Array.CASEINSENSITIVE);
      this._lstWaypoints.dataProvider = this._eaData;
   }
};
_loc1.teleport = function()
{
   var _loc2_ = this._oSelectedRow;
   var _loc3_ = _loc2_.cost;
   if(this.api.datacenter.Player.Kama >= _loc3_)
   {
      this.api.network.Waypoints.use(_loc2_.id);
   }
   else
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("NOT_ENOUGH_RICH"),"ERROR_CHAT");
   }
};
_loc1.teleport = function()
{
   var _loc2_ = this._oSelectedRow;
   var _loc3_ = _loc2_.cost;
   if(this.api.datacenter.Player.Kama >= _loc3_)
   {
      this.api.network.Waypoints.use(_loc2_.id);
   }
   else
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("NOT_ENOUGH_RICH"),"ERROR_CHAT");
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnClose:
      case this._btnClose2:
         this.callClose();
         break;
      case this._btnTeleport:
         this.teleport();
      default:
         return;
   }
};
_loc1.itemdblClick = function(oEvent)
{
   this.teleport();
};
_loc1.itemSelected = function(oEvent)
{
   this._oSelectedRow = oEvent.row.item;
   this._btnTeleport.enabled = true;
};
