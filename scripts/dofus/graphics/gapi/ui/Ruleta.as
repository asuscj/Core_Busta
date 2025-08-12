#initclip 130
_global.dofus["\r\x14"].gapi.ui.Ruleta = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Ruleta.prototype = new ank.gapi.core["\x1e\n\r"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Ruleta.prototype;
_loc1.__set__ficha = function(nFicha)
{
   this._nFicha = nFicha;
};
_loc1.__set__premios = function(sPremios)
{
   this._sPremios = sPremios;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Ruleta.CLASS_NAME);
};
_loc1.callClose = function()
{
   this.gapi.unloadUIComponent("Ruleta");
   return true;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initAnimList});
   this.addToQueue({object:this,method:this.loadMonsters});
};
_loc1.initTexts = function()
{
   this._txtInfos.text = this.api.lang.getText("DESC_SPIN");
   this.Spin.text = this._nFicha;
   this.Spin2.text = this.api.lang.getText("REMAINING_SPIN");
   this.Botonsito.name.text = this.api.lang.getText("SPIN");
   this._lblTitleRuleta.text = this.api.lang.getText("RULETA_TITLE");
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnCancel.addEventListener("click",this);
   this._btnGirar.addEventListener("click",this);
   var _loc6_ = this._sPremios.split(",");
   var ref = this;
   var _loc2_ = 0;
   var _loc4_;
   var _loc3_;
   while(_loc2_ < 8)
   {
      _loc4_ = new dofus.datacenter["\f\f"](0,Number(_loc6_[_loc2_]));
      this._oItems[_loc2_] = _loc4_;
      _loc3_ = this._mcRuleta["_ldrItem" + _loc2_];
      _loc3_.contentPath = _loc4_.iconFile;
      _loc3_.onRollOver = function()
      {
         ref.over({target:this});
      };
      _loc3_.onRollOut = function()
      {
         ref.out({target:this});
      };
      _loc3_._rotation = _loc2_ * 45;
      _loc2_ = _loc2_ + 1;
   }
   this._mcRuleta._rotation = 0;
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnClose":
      case "_btnCancel":
         this.dispatchEvent({type:"cancel"});
         this.callClose();
         break;
      case "_btnGirar":
         this._btnGirar._visible = false;
         this.Botonsito._visible = false;
         this.api.network.send("wF");
   }
};
_loc1.ganador = function(sDatos)
{
   var nID = sDatos.split(";")[0];
   var _loc2_ = sDatos.split(";")[1];
   this._nFicha = _loc2_;
   var vuelta = 40;
   var veces = 0;
   var gG = (8 - Number(nID)) * 45;
   gG = gG <= 180 ? gG : gG - 360;
   var marcado = 0;
   this._mcRuleta._rotation = 0;
   this.onEnterFrame = function()
   {
      veces++;
      this._mcRuleta._rotation += vuelta;
      if(vuelta <= 5)
      {
         if(veces % 24 == 0)
         {
            vuelta -= 1;
         }
         if(vuelta <= 0)
         {
            this.resaltar(nID,this._nFicha);
         }
      }
      if(vuelta == 15 && marcado == 1)
      {
         if(this._mcRuleta._rotation == gG)
         {
            marcado = 2;
            veces = 0;
         }
      }
      else if(veces % 12 == 0)
      {
         if(vuelta != 15 || marcado == 2)
         {
            vuelta -= 5;
         }
         else
         {
            marcado = 1;
         }
      }
   };
};
_loc1.resaltar = function(nID, Intentos)
{
   delete this.onEnterFrame;
   var item = this._mcRuleta["_ldrItem" + nID];
   var b = false;
   this.onEnterFrame = function()
   {
      if(b)
      {
         item._alpha = 10;
      }
      else
      {
         item._alpha = 100;
      }
      b = !b;
   };
   this.Spin.text = this._nFicha;
   if(Intentos > 0)
   {
      this._btnGirar._visible = true;
      this.Botonsito._visible = true;
   }
   else
   {
      this._btnGirar._visible = false;
      this.Botonsito._visible = false;
   }
};
_loc1.over = function(oEvent)
{
   var _loc2_ = oEvent.target._name.substr(8);
   this.gapi.showTooltip(this._oItems[_loc2_].name,oEvent.target,20);
};
_loc1.out = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.addProperty("premios",function()
{
}
,_loc1.__set__premios);
_loc1.addProperty("ficha",function()
{
}
,_loc1.__set__ficha);
_loc1._nFicha = 0;
_loc1._sPremios = "";
_loc1._oItems = new Array();
ASSetPropFlags(_loc1,null,1);
#endinitclip