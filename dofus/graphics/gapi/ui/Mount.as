var _loc1 = dofus["\r\x14"].gapi.ui.Mount.prototype;
_loc1.createChildren = function()
{
   this.player = this.api.datacenter.Player;
   var _loc2_ = this.api.datacenter.getHero(this.heroID);
   trace("UI Mount hero " + this.heroID);
   if(_loc2_ != undefined)
   {
      this.player = _loc2_;
   }
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.mountChanged,params:[{mount:this.player.mount}]});
};
_loc1.addListeners = function()
{
   this._btnNameValid.addEventListener("click",this);
   this._btnName.addEventListener("click",this);
   this._btnName.addEventListener("over",this);
   this._btnName.addEventListener("out",this);
   this._btnXP.addEventListener("click",this);
   this._btnXP.addEventListener("over",this);
   this._btnXP.addEventListener("out",this);
   this._btnRide.addEventListener("click",this);
   this._btnRide.addEventListener("over",this);
   this._btnRide.addEventListener("out",this);
   this._btnInventory.addEventListener("click",this);
   this._btnInventory.addEventListener("over",this);
   this._btnInventory.addEventListener("out",this);
   this._btnAction.addEventListener("click",this);
   this._btnAction.addEventListener("over",this);
   this._btnAction.addEventListener("out",this);
   this.player.addEventListener("mountXPPercentChanged",this);
   this.player.addEventListener("mountChanged",this);
   this._btnClose.addEventListener("click",this);
};
_loc1.mountXPPercentChanged = function(_loc2_)
{
   this._lblPercentXPValue.text = this.player.mountXPPercent + "%";
};
_loc1.click = function(_loc2_)
{
   trace("click Mount hero " + this.heroID);
   var _loc6_;
   var _loc4_;
   var _loc5_;
   switch(_loc2_.target)
   {
      case this._btnNameValid:
         if(this._tiName.text != "")
         {
            _global.HERO_ID = this.heroID;
            this.api.network.Mount.rename(this._tiName.text);
         }
         break;
      case this._btnName:
         this.editName(true);
         break;
      case this._btnXP:
         _loc6_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:this.player.mountXPPercent,max:90});
         _loc6_.addEventListener("validate",this);
         break;
      case this._btnClose:
         this.callClose();
         break;
      case this._btnRide:
         _global.HERO_ID = this.heroID;
         this.api.network.Mount.ride();
         break;
      case this._btnInventory:
         _global.HERO_ID = this.heroID;
         this.api.network.Exchange.request(15);
         break;
      case this._btnAction:
         _loc4_ = this.api.ui.createPopupMenu();
         _loc5_ = this.api.datacenter.Player.mount;
         _loc4_.addStaticItem(_loc5_.name);
         _loc4_.addItem(this.api.lang.getText("MOUNT_CASTRATE_TOOLTIP"),this,this.castrateMount);
         _loc4_.addItem(this.api.lang.getText("MOUNT_KILL_TOOLTIP"),this,this.killMount);
         _loc4_.addItem(this.api.lang.getText("REMOVE_MIMO"),this,this.RemoveMimo);
         _loc4_.show(_root._xmouse,_root._ymouse);
      default:
         return;
   }
};
_loc1.castrateMount = function()
{
   this.api.kernel.showMessage(undefined,this.api.lang.getText("DO_U_CASTRATE_YOUR_MOUNT"),"CAUTION_YESNO",{name:"CastrateMount",listener:this});
};
_loc1.killMount = function()
{
   this.api.kernel.showMessage(undefined,this.api.lang.getText("DO_U_KILL_YOUR_MOUNT"),"CAUTION_YESNO",{name:"KillMount",listener:this});
};
_loc1.nameChanged = function(_loc2_)
{
   var _loc2_ = this.player.mount;
   this._lblNameValue.text = _loc2_.name;
   this._tiName.text = _loc2_.name;
   this.editName(false);
};
_loc1.mountChanged = function(_loc2_)
{
   var _loc2_ = this.player.mount;
   if(_loc2_ != undefined)
   {
      _loc2_.addEventListener("nameChanged",this);
      this._mvMountViewer.mount = _loc2_;
      this.mountXPPercentChanged();
      this.nameChanged();
   }
   else
   {
      this.callClose();
   }
};
_loc1.validate = function(_loc2_)
{
   var _loc3_ = _loc2_.value;
   if(_global.isNaN(_loc3_))
   {
      return undefined;
   }
   if(_loc3_ > 90)
   {
      return undefined;
   }
   if(_loc3_ < 0)
   {
      return undefined;
   }
   _global.HERO_ID = this.heroID;
   this.api.network.Mount.setXP(_loc3_);
};
_loc1.yes = function(_loc2_)
{
   switch(_loc2_.target._name)
   {
      case "AskYesNoKillMount":
         _global.HERO_ID = this.heroID;
         this.api.network.Mount.kill();
         break;
      case "AskYesNoCastrateMount":
         _global.HERO_ID = this.heroID;
         this.api.network.Mount.castrate();
      default:
         return;
   }
};
