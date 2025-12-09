#initclip 141
var _loc1 = dofus.aks.Basics.prototype;
_loc1.autorisedMoveCommand = function(_loc2_, _loc3_, _loc4_)
{
   this.aks.send("BaM" + _loc2_ + "," + _loc3_ + "," + _loc4_,false);
};
_loc1.popupResponse = function(_loc2_)
{
   this.aks.send("BP" + (!_loc2_ ? "E" : "K"));
};
_loc1.onPopupCloseOrOpen = function(_loc2_)
{
   var _loc5_ = _loc2_.charAt(0);
   var _loc3_;
   var _loc4_;
   if(_loc5_ == "K")
   {
      var _loc6_ = _loc2_.substr(1);
      _loc3_ = Number(_loc6_.split(",")[0]);
      _loc4_ = Number(_loc6_.split(",")[1]);
      if(this.api.ui.getUIComponent("PopupNotification") == undefined)
      {
         this.api.ui.loadUIComponent("PopupNotification","PopupNotification",{time:_loc3_,textId:_loc4_},{bUltimateOnTop:true});
      }
   }
   else
   {
      this.api.ui.unloadUIComponent("PopupNotification");
   }
};
#endinitclip
