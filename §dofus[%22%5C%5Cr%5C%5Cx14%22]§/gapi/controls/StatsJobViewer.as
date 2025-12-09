_global.dofus["\r\x14"].gapi.controls.StatsJobViewer = function()
{
   super();
};
dofus["\r\x14"].gapi.controls.StatsJobViewer.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.controls.StatsJobViewer.prototype;
_loc1.__get__currentJob = function()
{
   return this._oCurrentJob;
};
_loc1.__set__currentJob = function(oCurrentJob)
{
   this._oCurrentJob = oCurrentJob;
};
_loc1.init = function()
{
   super.init(false,"StatsJobViewer");
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
};
_loc1.initData = function()
{
   this._btnClose.addEventListener("click",this);
   this._winBg.title = "Mis oficios - " + this._parent.getCurrentSpriteView().data.name;
   var _loc9_ = this._parent.getCurrentSpriteView().Jobs;
   var _loc7_ = 0;
   var _loc4_;
   var _loc8_;
   var _loc6_;
   var _loc3_;
   var _loc5_;
   var _loc2_;
   while(_loc7_ < _loc9_.length)
   {
      _loc4_ = _loc9_[_loc7_];
      _loc8_ = _loc4_.specializationOf;
      if(_loc8_ != 0)
      {
         _loc6_ = 0;
         while(_loc6_ < 11)
         {
            _loc3_ = this["_ctrSpe" + _loc6_];
            if(_loc3_.contentData == undefined)
            {
               _loc3_.contentData = _loc4_;
               _loc3_.showLabel = true;
               _loc3_.styleName = "InventoryGridContainer";
               _loc3_.contentData = _loc4_;
               _loc3_.label = _loc4_.level;
               var ref = this.gapi;
               _loc3_.addEventListener("over",function(oEvent)
               {
                  ref.showTooltip(oEvent.target.contentData.name,oEvent.target,-20);
               }
               );
               _loc3_.addEventListener("out",this);
               _loc3_.addEventListener("click",this);
               break;
            }
            _loc6_ += 1;
         }
      }
      else
      {
         _loc5_ = 0;
         while(_loc5_ < 23)
         {
            _loc2_ = this["_ctrJob" + _loc5_];
            if(_loc2_.contentData == undefined)
            {
               _loc2_.contentData = _loc4_;
               _loc2_.showLabel = true;
               _loc2_.styleName = "InventoryGridContainer";
               _loc2_.contentData = _loc4_;
               _loc2_.label = _loc4_.level;
               var ref = this.gapi;
               _loc2_.addEventListener("over",function(oEvent)
               {
                  ref.showTooltip(oEvent.target.contentData.name,oEvent.target,-20);
               }
               );
               _loc2_.addEventListener("out",this);
               _loc2_.addEventListener("click",this);
               break;
            }
            _loc5_ += 1;
         }
      }
      _loc7_ += 1;
   }
};
_loc1.click = function(_loc2_)
{
   var _loc0_;
   if((_loc0_ = _loc2_.target._name) !== "_btnClose")
   {
      this["_ctrJob" + this.currentJob.id].selected = false;
      this._parent.showJob(_loc2_.target.contentData);
      if(this.currentJob.id == _loc2_.target.contentData.id)
      {
         this.currentJob = undefined;
      }
      else
      {
         this.currentJob = _loc2_.target.contentData;
         this["_ctrJob" + this.currentJob.id].selected = true;
      }
   }
   else
   {
      this._parent.hideJobs();
   }
};
_loc1.out = function(_loc2_)
{
   this.gapi.hideTooltip();
};
_loc1.addProperty("currentJob",_loc1.__get__currentJob,_loc1.__set__currentJob);
_global.dofus["\r\x14"].gapi.controls.StatsJobViewer.CLASS_NAME = "StatsJobViewer";
