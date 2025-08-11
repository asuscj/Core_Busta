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
_global.dofus["\r\x14"].gapi.ui.Ornamento = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Ornamento.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Ornamento.prototype;
_loc1.__set__Ornamentos = function(sValue)
{
   this._aTitulos = sValue.split(";");
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Ornamento.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._dgLogros.addEventListener("itemSelected",this);
   this._csColors.addEventListener("change",this);
   this._btnCerrar.addEventListener("click",this);
   this._btnOk.addEventListener("click",this);
   this._btnNo.addEventListener("click",this);
   this._btnCerrar.addEventListener("click",this);
   this._btnOk.addEventListener("click",this);
   this._btnBorrar.addEventListener("click",this);
   this._csColors.addEventListener("change",this);
   this._lstTitulos.addEventListener("itemSelected",this);
   this._btnAlmanax.addEventListener("click",this);
   this._btnServi.addEventListener("click",this);
   this._btnOrnaments.addEventListener("click",this);
   this._btnCompra.addEventListener("click",this);
   this._btnAura.addEventListener("click",this);
   this._precio._visible = false;
   this.og._visible = false;
   this.createEmptyMovieClip("_mcOrnamentos",10);
   var _loc3_ = new MovieClipLoader();
   _loc3_.addListener(this);
   _loc3_.loadClip(_global.palmad.dofus.Constants.CLIPS_ORNAMENTOS,this._mcOrnamentos);
};
_loc1.initTexts = function()
{
   this._win.title = this.api.datacenter.Player.Name + ", " + this.api.lang.getText("PANEL_CHOOSE_ORNAMENTS");
   this._dgLogros.columnsNames = ["",""];
   this._btnOk.label = this.api.lang.getText("OK");
   this._btnNo.label = this.api.lang.getText("REMOVEORNAMENT");
   this._lblName.text = this._sNombre;
   this._txtNombre.text = this._sNombre;
   this._txtTitulo.text = "";
   this._lblName.text = this.api.lang.getText("ORNAMENTOS_LIST");
};
_loc1.initPlayer = function()
{
   this._svPersonaje.zoom = 250;
   this._svPersonaje.spriteAnims = ["StaticR","StaticS","StaticL","StaticF"];
   this._svPersonaje.refreshDelay = 50;
   var _loc2_ = this.api.datacenter.Player.data;
   if(_loc2_ == undefined)
   {
      return undefined;
   }
   var _loc3_ = new ank.battlefield.datacenter["\x1e\x0e\x10"]("viewer",ank.battlefield.mc["\x1e\x0e\x10"],_loc2_.gfxFile,undefined,5);
   _loc3_.color1 = _loc2_.color1;
   _loc3_.color2 = _loc2_.color2;
   _loc3_.color3 = _loc2_.color3;
   _loc3_.accessories = _loc2_.accessories;
   _loc3_.mount = _loc2_.mount;
   this._svPersonaje.spriteData = _loc3_;
};
_loc1.initData = function()
{
   this.initPlayer();
   this._aLogros = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc4_ = this._aTitulos;
   var _loc6_ = true;
   var _loc5_ = 0;
   var _loc3_;
   var _loc2_;
   for(_loc5_ in _loc4_)
   {
      _loc3_ = _loc4_[_loc5_];
      _loc2_ = new Object();
      _loc2_.id = _loc3_.split(",")[0];
      _loc2_.name = this.api.lang.getText("ORNAMENTO_" + _loc3_.split(",")[0]);
      switch(_loc3_.split(",")[1].charAt(0))
      {
         case "K":
            _loc2_.img = "KamaSymbol";
            break;
         case "O":
            _loc2_.img = "OgrineSymbol";
            break;
         case "C":
            _loc2_.img = "CreditSymbol";
      }
      _loc2_.precio = _loc3_.split(",")[1].substr(1);
      _loc2_.owner = _loc3_.split(",")[1].charAt(0) == "T";
      this._aLogros.push(_loc2_);
   }
   this._dgLogros.dataProvider = this._aLogros;
};
_loc1.itemSelected = function(oEvent)
{
   var _loc3_ = oEvent.target._name;
   var _loc0_;
   var _loc2_;
   if((_loc0_ = _loc3_) === "_dgLogros")
   {
      _loc2_ = this._dgLogros.selectedItem.id;
      this._ldrOrnamento.contentPath = "clips/items/300/" + _loc2_ + ".swf";
      if(this._ldrOrnamento.attachMovie("ornament_" + _loc2_,"ornamento",10))
      {
         if(this._ldrOrnamento.ornamento._height > 140)
         {
            this._mcOrnamentos.ornamento._xscale = _loc0_ = 140 / this._mcOrnamentos.ornamento._height * 100;
            this._ldrOrnamento.ornamento._yscale = _loc0_;
         }
      }
      if(this._dgLogros.selectedItem.id != 0 && this._dgLogros.selectedItem.owner)
      {
         this._btnOk._visible = true;
         this._btnOk.label = this.api.lang.getText("OK");
         this._precio._visible = false;
         this.og._visible = false;
      }
      else if(this._dgLogros.selectedItem.precio == undefined)
      {
         this._btnOk._visible = true;
         this._precio._visible = false;
         this.og._visible = false;
      }
      else
      {
         this._btnOk._visible = true;
         this._precio._visible = true;
         this.og._visible = true;
         this.og.contentPath = this._dgLogros.selectedItem.img;
         this._precio.text = this.api.lang.getText("PRICE") + ": " + this._dgLogros.selectedItem.precio;
         this._btnOk.label = this.api.lang.getText("BUY");
      }
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnOk:
         this.api.network.send("ZÑ" + this._dgLogros.selectedItem.id);
         this.gapi.unloadUIComponent("Ornamento");
         this.unloadThis();
         break;
      case this._btnNo:
         this.api.network.send("ZÑ0");
         this.unloadThis();
         break;
      case this._btnCerrar:
         this.gapi.unloadUIComponent("Ornamento");
         this.unloadThis();
   }
};
_loc1.addProperty("ornamentos",function()
{
}
,_loc1.__set__Ornamentos);
_loc1._sNombre = "";
_loc1._aLogros = new Array();
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.Ornamento.CLASS_NAME = "Ornamento";
