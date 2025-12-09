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
_global.dofus["\r\x14"].gapi.ui.VentasPersonaje = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.VentasPersonaje.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.VentasPersonaje.prototype;
_loc1.__set__Data = function(sValue)
{
   this._sData = sValue.split(";");
};
_loc1.__set__Perso = function(sValue)
{
   this._sPerso = sValue.split(";");
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.VentasPersonaje.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._dgVentas.addEventListener("itemSelected",this);
   this._btnClose.addEventListener("click",this);
   this._btnVisualizar.addEventListener("click",this);
   this._btnComprar.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._dgVentas.columnsNames = ["",""];
   this._lbInfoPerso.text = this.api.lang.getText("INFO_PERSO");
   this._lblNombre.text = this.api.lang.getText("NAME_BIG") + ":";
   this._lblNivel.text = this.api.lang.getText("LEVEL") + ":";
   this._lblLogros.text = this.api.lang.getText("LOGROS") + ":";
   this._lblPrestigio.text = this.api.lang.getText("PRESTIGIO") + ":";
   this._lblKamas.text = this.api.lang.getText("KAMAS") + ":";
   this._lblOrnamentos.text = this.api.lang.getText("ORNAMENTOS") + ":";
   this._btnVisualizar.label = this.api.lang.getText("VER");
   this._winBg.title = this.api.lang.getText("LISTA_PERSONAJES_VENTA");
   this._btnComprar.label = this.api.lang.getText("BUY");
};
_loc1.infoPerso = function(b)
{
   this._lblNombre._visible = b;
   this._lblNivel._visible = b;
   this._lblLogros._visible = b;
   this._lblPrestigio._visible = b;
   this._lblKamas._visible = b;
   this._lblOrnamentos._visible = b;
   this._txtNombre._visible = b;
   this._txtNivel._visible = b;
   this._txtLogros._visible = b;
   this._txtPrestigio._visible = b;
   this._txtKamas._visible = b;
   this._txtOrnamentos._visible = b;
   this._btnVisualizar._visible = b;
   this._iconKama._visible = b;
   this._svPersonaje._visible = b;
   this._btnComprar._visible = b;
};
_loc1.initData = function()
{
   this.infoPerso(false);
   this._aVentas = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc4_ = this._sData;
   var _loc6_ = true;
   var _loc5_ = 0;
   var _loc3_;
   var _loc2_;
   for(_loc5_ in _loc4_)
   {
      _loc3_ = _loc4_[_loc5_];
      _loc2_ = new Object();
      _loc2_.id = _loc3_.split("~")[0];
      _loc2_.idPersonaje = _loc3_.split("~")[1];
      _loc2_.colores = _loc3_.split("~")[2];
      _loc2_.accesorios = _loc3_.split("~")[3];
      _loc2_.ogrinas = _loc3_.split("~")[4];
      _loc2_.claseID = _loc3_.split("~")[5];
      _loc2_.nombre = _loc3_.split("~")[6];
      _loc2_.nivel = _loc3_.split("~")[7];
      _loc2_.sexo = _loc3_.split("~")[8];
      _loc2_.logros = _loc3_.split("~")[9];
      _loc2_.prestigio = _loc3_.split("~")[10];
      _loc2_.kamas = _loc3_.split("~")[11];
      _loc2_.ornamentos = _loc3_.split("~")[12];
      this._aVentas.push(_loc2_);
   }
   this._dgVentas.dataProvider = this._aVentas;
};
_loc1.itemSelected = function(oEvent)
{
   var _loc4_ = oEvent.target._name;
   var _loc0_;
   var _loc2_;
   var _loc3_;
   if((_loc0_ = _loc4_) === "_dgVentas")
   {
      this.infoPerso(true);
      _loc2_ = this._dgVentas.selectedItem;
      this._txtNombre.text = _loc2_.nombre;
      this._txtNivel.text = _loc2_.nivel;
      this._txtLogros.text = _loc2_.logros;
      this._txtPrestigio.text = _loc2_.prestigio;
      this._txtKamas.text = _loc2_.kamas;
      this._txtKamas.text = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_.kamas).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
      this._txtOrnamentos.text = _loc2_.ornamentos;
      this._svPersonaje._visible = true;
      this._svPersonaje.zoom = 200;
      this._svPersonaje.spriteAnims = ["StaticR"];
      this._svPersonaje.refreshDelay = 50;
      this._svPersonaje.useSingleLoader = true;
      this._csColors.breed = _loc2_.claseID;
      this._csColors.sex = _loc2_.sexo;
      this._oColors = {color1:_loc2_.colores.split("*")[0],color2:_loc2_.colores.split("*")[1],color3:_loc2_.colores.split("*")[2]};
      _loc3_ = _loc2_.claseID + "" + _loc2_.sexo;
      this._svPersonaje.spriteData = new ank.battlefield.datacenter["\x1e\x0e\x10"](undefined,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc3_ + ".swf",undefined,5);
      this._svPersonaje.enableBlur = true;
      this._svPersonaje.refreshAccessories = true;
      this._svPersonaje.setColors(this._oColors);
      this.api.kernel.CharactersManager.setSpriteAccessories(this._svPersonaje.spriteData,_loc2_.accesorios);
      this._persoNombre = _loc2_.nombre;
      this._persoID = _loc2_.idPersonaje;
      this._nOgrinas = _loc2_.ogrinas;
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnClose:
         this.api.ui.unloadUIComponent("VentasPersonaje");
         break;
      case this._btnVisualizar:
         if(this._persoNombre == "")
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_NO_PERSO"),"ERROR_BOX");
            return undefined;
         }
         this.api.network.send("AMV" + this._persoNombre);
         break;
      case this._btnComprar:
         if(this._persoNombre == "")
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_NO_PERSO"),"ERROR_BOX");
            return undefined;
         }
         this._oEvent = oEvent;
         this.valid(false);
      default:
         return;
   }
};
_loc1.valid = function(noConfirm)
{
   if(!noConfirm)
   {
      this.api.kernel.showMessage(this.api.lang.getText("ATTENTION"),this.api.lang.getText("COMPRAR_PERSO",[this._persoNombre,this._nOgrinas]),"CAUTION_YESNO",{name:"Confirm",listener:this});
      return undefined;
   }
   var _loc0_;
   if((_loc0_ = this._oEvent.target) === this._btnComprar)
   {
      this.api.network.send("AMc" + this._persoID + "," + this._nOgrinas);
   }
   this.gapi.unloadUIComponent("VentasPersonaje");
};
_loc1.yes = function(oEvent)
{
   var _loc0_;
   if((_loc0_ = oEvent.target._name) === "AskYesNoConfirm")
   {
      this.valid(true);
   }
};
_loc1.addProperty("data",function()
{
}
,_loc1.__set__Data);
_loc1.addProperty("perso",function()
{
}
,_loc1.__set__Perso);
_loc1._persoID = -1;
_loc1._persoNombre = "";
_loc1._nOgrinas = 0;
_loc1._aVentas = new Array();
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
_global.dofus["\r\x14"].gapi.ui.VentasPersonaje.CLASS_NAME = "VentasPersonaje";
