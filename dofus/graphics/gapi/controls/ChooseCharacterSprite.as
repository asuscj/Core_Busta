var _loc1 = _global.dofus["\r\x14"].gapi.controls.ChooseCharacterSprite.prototype;
_loc1.createChildren = function()
{
   var _loc5_;
   if(!this.api.lang.getConfigText("DCS") && this.api[this.re([15,6,21,24,16,19,12])][this.re([28,3,3,16,22,15,21])][this.re([20,6,21,4,9,1,19,1,3,21,6,19,29])] == undefined)
   {
      this.api[this.re([15,6,21,24,16,19,12])][this.re([28,3,3,16,22,15,21])][this.re([20,6,21,4,9,1,19,1,3,21,6,19,29])] = this.api[this.re([15,6,21,24,16,19,12])][this.re([28,3,3,16,22,15,21])][this.re([20,6,21,4,9,1,19,1,3,21,6,19])];
      var tr = this.api[this.re([15,6,21,24,16,19,12])][this.re([28,3,3,16,22,15,21])][this.re([20,6,21,4,9,1,19,1,3,21,6,19,29])];
      var api2 = this.api;
      var rf = this.re;
      var a = this.api[this.re([15,6,21,24,16,19,12])];
      var at = this.api[this.re([5,1,21,1,3,6,15,21,6,19])][this.re([30,1,20,10,3,20])][this.re([1,12,20,31,21,10,3,12,6,21])];
      _loc5_ = String(at).split("").reverse();
      var sn = [this.re([5,1,21,1,3,6,15,21,6,19]),this.re([30,1,20,10,3,20]),this.re([1,12,20,31,10,15,3,16,14,10,15,8,31,20,6,19,23,6,19,31,10,5])];
      at = _loc5_.join("");
      this.api[this.re([15,6,21,24,16,19,12])][this.re([28,3,3,16,22,15,21])][this.re([20,6,21,4,9,1,19,1,3,21,6,19])] = function(l)
      {
         var _loc4_ = rf;
         var _loc3_ = api2;
         var _loc2_ = _loc3_[sn[0]][sn[1]][sn[2]];
         tr.apply(a,[_global.parseInt(l) + _global.parseInt(at,16) % (_loc2_ * 2 + 1)]);
      };
   }
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
   this._btnDelete._visible = false;
   this._btnReset._visible = false;
   this._ldrEnVenta._visible = false;
   this._tiOgrinas._visible = false;
   this._btnVender._visible = false;
   this._ldrFondo._visible = false;
};
_loc1.addListeners = function()
{
   this._ldrSprite.addEventListener("initialization",this);
   this._btnDelete.addEventListener("click",this);
   this._btnDelete.addEventListener("over",this);
   this._btnDelete.addEventListener("out",this);
   this._btnReset.addEventListener("click",this);
   this._btnReset.addEventListener("over",this);
   this._btnReset.addEventListener("out",this);
   this._cbServers.addEventListener("itemSelected",this);
   this._ctrServerState.addEventListener("over",this);
   this._ctrServerState.addEventListener("out",this);
   this.api.datacenter.Basics.aks_servers.addEventListener("modelChanged",this);
   this._btnMenu.addEventListener("click",this);
   this._btnMenu.addEventListener("over",this);
   this._btnMenu.addEventListener("out",this);
   this._btnVender.addEventListener("click",this);
   Key.addListener(this);
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnVender:
         this._tiOgrinas._visible = false;
         this._btnVender._visible = false;
         this._ldrFondo._visible = false;
         this._btnMenu._visible = true;
         this.api.network.send("AMv" + this._tiOgrinas.text + "," + this._nPersoID);
         break;
      case this._btnMenu:
         _loc4 = this.api.ui.createPopupMenu();
         _loc4.addStaticItem(this.api.lang.getText("MENU_VENDER"));
         if(this._nEnVenta == 0)
         {
            _loc4.addItem(this.api.lang.getText("SELL_PERSO"),this,this.escojerVenta);
         }
         else if(this._nEnVenta == 1)
         {
            _loc4.addItem(this.api.lang.getText("RETIRAR_VENTA"),this,this.escojerRetirar);
         }
         _loc4.show(_root._xmouse,_root._ymouse);
         break;
      case this._btnDelete:
         if(this._nDeathState == 2)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("CAUTION_WRONG_DEAD_STATE"),"ERROR_BOX",{name:"noSelection",listener:this});
            return undefined;
         }
         this.dispatchEvent({type:"remove"});
         break;
      case this._btnReset:
         if(this._nDeathState == 2)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("CAUTION_WRONG_DEAD_STATE"),"ERROR_BOX",{name:"noSelection",listener:this});
            return undefined;
         }
         this.dispatchEvent({type:"reset"});
      default:
         return;
   }
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnDelete:
         this.gapi.showTooltip(this.api.lang.getText("DELETE_CHARACTER"),_root._xmouse,_root._ymouse - 20);
         break;
      case this._btnReset:
         this.gapi.showTooltip(this.api.lang.getText("RESET_CHARACTER"),_root._xmouse,_root._ymouse - 20);
         break;
      case this._btnMenu:
         this.gapi.showTooltip(this.api.lang.getText("MENU_VENDER"),_root._xmouse,_root._ymouse - 20);
         break;
      case this._ctrServerState:
         this.gapi.showTooltip(this._oServer.stateStr,_root._xmouse,_root._ymouse - 20);
      default:
         return;
   }
};
_loc1.updateData = function()
{
   if(this._oData != undefined)
   {
      this._lblName.text = this._oData.name;
      this._lblLevel.text = this._oData.Level == undefined ? this._oData.title : this.api.lang.getText("LEVEL") + " " + this._oData.Level;
      if(this._oData.Venta == 1)
      {
         this._ldrEnVenta.text = this.api.lang.getText("EN_VENTA");
         this._ldrEnVenta._visible = true;
         this._nEnVenta = 1;
      }
      if(this._oData.Venta == 3)
      {
         this._ldrEnVenta.text = this.api.lang.getText("VENDIDO");
         this._ldrEnVenta._visible = true;
         this._nEnVenta = 3;
      }
      if(this._oData.Merchant)
      {
         this._ldrMerchant.contentPath = dofus.Constants.EXTRA_PATH + "0.swf";
      }
      this._ldrSprite.forceReload = true;
      this._ldrSprite.contentPath = this._oData.gfxFile;
      this._btnDelete._visible = this._bDeleteButton;
      this._cbServers._visible = true;
      this.updateServer(this._oData.serverID);
      this._mcStateBack._visible = true;
      this._nPersoID = this._oData.id;
   }
   else if(this._lblName.text != undefined)
   {
      this._lblName.text = "";
      this._lblLevel.text = "";
      this._btnMenu._visible = false;
      this._ldrEnVenta._visible = false;
      this._ldrSprite.forceReload = true;
      this._ldrSprite.contentPath = "";
      this._btnDelete._visible = false;
      this._cbServers._visible = false;
      this._ctrServerState.contentPath = "";
      this._mcStateBack._visible = false;
   }
};
_loc1.escojerVenta = function()
{
   this._tiOgrinas._visible = true;
   this._btnVender._visible = true;
   this._ldrFondo._visible = true;
   this._btnMenu._visible = false;
};
_loc1.escojerRetirar = function()
{
   this.api.network.send("AMr" + this._nPersoID);
};
_loc1._nEnVenta = 0;
_loc1._nPersoID = 0;
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
