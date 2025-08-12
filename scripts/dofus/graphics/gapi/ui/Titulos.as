#initclip 40
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
_global.dofus["\r\x14"].gapi.ui.Titulos = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Titulos.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Titulos.prototype;
_loc1.__set__Titulos = function(sValue)
{
   this._aTitulos = sValue.split(";");
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Titulos.CLASS_NAME);
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
   this._btnClose.addEventListener("click",this);
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
};
_loc1.initTexts = function()
{
   this._win.title = this.api.datacenter.Player.Name + ", " + this.api.lang.getText("PANEL_CHOOSE_TITLES");
   this._dgLogros.columnsNames = ["",""];
   this._btnOk.label = this.api.lang.getText("OK");
   this._btnNo.label = this.api.lang.getText("CANCEL");
   this._lblName.text = this._sNombre;
   this._txtNombre.text = this._sNombre;
   this._txtTitulo.text = "";
   this._lblName.text = this.api.lang.getText("TITLES_LIST");
};
_loc1.initPlayer = function()
{
   this._svPersonaje.zoom = 250;
   this._svPersonaje.spriteAnims = ["StaticR","StaticS","StaticL","StaticF"];
   this._svPersonaje.refreshDelay = 50;
   this._svPersonaje.spriteData = this.api.datacenter.Player.data;
   var _loc3_ = this.api.datacenter.Player.data;
   this._oColors = {color1:this.api.datacenter.Player.color1,color2:this.api.datacenter.Player.color2,color3:this.api.datacenter.Player.color3};
   this._svPersonaje.useSingleLoader = true;
   this._csColors.breed = this.api.datacenter.Player.Guild;
   this._csColors.sex = this.api.datacenter.Player.Sex;
   this._csColors.colors = [this.api.datacenter.Player.color1,this.api.datacenter.Player.color2,this.api.datacenter.Player.color3];
   var _loc5_ = this.api.datacenter.Player.Guild + "" + this.api.datacenter.Player.Sex;
   var _loc4_ = new ank.battlefield.datacenter["\x1e\x0e\x10"](undefined,ank.battlefield.mc["\x1e\x0e\x10"],_global.palmad.dofus.Constants.CLIPS_PERSOS_PATH + _loc5_ + ".swf",undefined,5);
   _loc4_.accessories = _loc3_.accessories;
   this._svPersonaje.enableBlur = true;
   this._svPersonaje.refreshAccessories = !var2;
   this._svPersonaje.sourceSpriteData = _loc3_;
   this._svPersonaje.spriteData = _loc4_;
   this._svPersonaje.setColors(this._oColors);
   _loc4_.mount = _loc3_.mount;
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
      _loc2_.name = this.api.lang.getTitle(_loc3_.split(",")[0]).t;
      _loc2_.color = this.api.lang.getTitle(_loc3_.split(",")[0]).c;
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
_loc1.change = function(oEvent)
{
   var _loc0_;
   if((_loc0_ = oEvent.target) === this._csColors)
   {
      this.setColors(oEvent.value);
   }
};
_loc1.setColors = function(oColors)
{
   this._nColor = Number(oColors.color1);
   this._txtTitulo.textColor = this._nColor;
};
_loc1.itemSelected = function(oEvent)
{
   var _loc2_ = oEvent.target._name;
   var _loc0_;
   var _loc3_;
   if((_loc0_ = _loc2_) === "_dgLogros")
   {
      _loc3_ = this._dgLogros.selectedItem.id;
      this._nColor = -1;
      this._txtTitulo.text = this._dgLogros.selectedItem.name;
      this._txtTitulo.selectable = false;
      this._txtTitulo.textColor = this._dgLogros.selectedItem.color;
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
         this.api.network.send("ZT" + this._dgLogros.selectedItem.id + ";" + this._nColor);
         this.gapi.unloadUIComponent("Titulos");
         this.unloadThis();
         break;
      case this._btnNo:
         this.api.network.send("ZT0;0");
         this.unloadThis();
         break;
      case this._btnClose:
         this.gapi.unloadUIComponent("Titulos");
         this.unloadThis();
         break;
      case this._btnAura:
         this.api.network.send("we");
         this.api.ui.unloadUIComponent("Titulos");
         break;
      case this._btnCerrar:
         this.gapi.unloadUIComponent("Titulos");
         this.unloadThis();
         break;
      case this._btnServi:
         this.api.network.send("ZoC");
         break;
      case this._btnCompra:
         if(!this.api.datacenter.Game.isFight)
         {
            this.gapi.loadUIAutoHideComponent("Panelcompras","Panelcompras",{nombre:this._sNombre});
         }
         break;
      case this._btnAlmanax:
         this.api.network.send("ZA");
         break;
      case this._btnOrnaments:
         if(!this.api.datacenter.Game.isFight)
         {
            this.api.network.send("Zn");
            break;
         }
   }
};
_loc1.addProperty("titulos",function()
{
}
,_loc1.__set__Titulos);
_loc1._sNombre = "";
_loc1._aTitulos = "";
_loc1._aLogros = new Array();
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.Titulos.CLASS_NAME = "Titulos";
#endinitclip