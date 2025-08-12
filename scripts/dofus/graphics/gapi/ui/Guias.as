#initclip 21
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
_global.dofus["\r\x14"].gapi.ui.Guias = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Guias.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Guias.prototype;
_loc1.__set__data = function(sData)
{
   this._sData = sData;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Guias.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._lstLogros.addEventListener("itemSelected",this);
   this._btnClose.addEventListener("click",this);
   this._btnAdd.addEventListener("click",this);
   this._btnEdit.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._winBackground.title = this.api.lang.getText("GUIAS");
   this._btnAdd.label = this.api.lang.getText("CREATE");
   this._lstLogros.columnsNames = [this.api.lang.getText("GUIAS_MAIN_DISPLAY")];
};
_loc1.initData = function()
{
   var _loc7_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc9_ = this._sData.split("|")[1] == "true";
   var _loc3_ = this._sData.split("|")[0].split(";");
   var _loc8_ = 0;
   this._btnAdd._visible = _loc9_;
   this.txtGuiasEdit._visible = false;
   this._btnEdit._visible = _loc9_;
   this.Fondo._visible = false;
   var _loc2_;
   for(_loc8_ in _loc3_)
   {
      _loc2_ = _loc3_[_loc8_].split("~");
      _loc7_.push({id:Number(_loc2_[0]),guia:_loc2_[1],label:this.api.lang.getText("LGCATEGORIA_" + Number(_loc2_[0]))});
      _loc8_ = _loc8_ + 1;
      this.ultimaId++;
   }
   this._lstLogros.dataProvider = _loc7_;
};
_loc1.ultimaId = 0;
_loc1.updateData = function()
{
   var _loc2_ = this._lstLogros.selectedItem.id;
   this._btnEdit._visible = true;
   this.api.kernel.debug(this._lstLogros.selectedItem.guia);
   this._txtText.text = this._lstLogros.selectedItem.guia;
};
_loc1.itemSelected = function(oEvent)
{
   var _loc2_ = oEvent.target._name;
   var _loc0_;
   if((_loc0_ = _loc2_) === "_lstLogros")
   {
      this.updateData();
   }
};
_loc1.editado = false;
_loc1.click = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnAdd":
         if(this.editado == false)
         {
            this._btnEdit._visible = false;
            this._txtText._visible = false;
            this.Fondo._visible = true;
            this.editado = true;
            this.txtGuiasEdit._visible = true;
            this.txtGuiasEdit.setFocus();
            this.txtGuiasEdit.text = "";
            this._btnEdit.icon = "UI_MainMenuCross";
         }
         else
         {
            this.api.network.send("wy" + (this.ultimaId + 1) + "@" + this.txtGuiasEdit.text);
            this.api.ui.unloadUIComponent("Guias");
         }
         break;
      case "_btnEdit":
         if(this.editado == false)
         {
            this._txtText._visible = false;
            this.Fondo._visible = true;
            this.editado = true;
            this.txtGuiasEdit._visible = true;
            this.txtGuiasEdit.setFocus();
            this.txtGuiasEdit.text = this._lstLogros.selectedItem.guia;
            this._btnEdit.icon = "UI_MainMenuCross";
         }
         else
         {
            this.api.network.send("wy" + this._lstLogros.selectedItem.id + "@" + this.txtGuiasEdit.text);
            this.api.ui.unloadUIComponent("Guias");
         }
         break;
      case "_btnClose":
         this.api.ui.unloadUIComponent("Guias");
   }
};
_loc1.addProperty("data",function()
{
}
,_loc1.__set__data);
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.Guias.CLASS_NAME = "Guias";
#endinitclip