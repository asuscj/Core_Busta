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
_global.dofus["\r\x14"].gapi.ui.ReportBug = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.ReportBug.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.ReportBug.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.ReportBug.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._btnCancel.addEventListener("click",this);
   this._btnOk.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._winBackground.title = this.api.lang.getText("REPORT_BUG");
   this._lblGonnaReport.text = this.api.lang.getText("GONNA_REPORT_THIS_MESSAGE");
   this._lblReason.text = this.api.lang.getText("REASON_WORD") + ":";
   this._lblTitulo.text = this.api.lang.getText("REPORTE_TITULO") + ":";
   this._btnOk.label = this.api.lang.getText("VALIDATE");
   this._btnCancel.label = "Cancel";
};
_loc1.initData = function()
{
   var _loc5_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc2_ = this.api.lang.getListaReportes();
   _loc5_.push({id:-1,label:"(" + this.api.lang.getText("PLEASE_SELECT") + ")"});
   for(var _loc6_ in _loc2_)
   {
      _loc5_.push({id:_loc2_[_loc6_].i,label:_loc2_[_loc6_].t});
   }
   this._cbReason.dataProvider = _loc5_;
   this._cbReason.selectedIndex = 0;
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnOk:
         if(this._cbReason.selectedItem.id <= 0)
         {
            this.api.kernel.showMessage(this.api.lang.getText("ERROR_WORD"),this.api.lang.getText("ERROR_MUST_SELECT_A_REASON"),"ERROR_BOX");
            break;
         }
         this.api.network.send("ZRM" + this._cbReason.selectedItem.id + this.api.datacenter.Player.Name + "|" + this._itTitulo.text + "|" + this._itContenido.text);
      case this._btnCancel:
         this.gapi.unloadUIComponent("ReportBug");
   }
};
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.ReportBug.CLASS_NAME = "ReportBug";
