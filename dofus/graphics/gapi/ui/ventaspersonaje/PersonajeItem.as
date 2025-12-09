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
if(!dofus["\r\x14"].gapi.ui.ventaspersonaje)
{
   _global.dofus["\r\x14"].gapi.ui.ventaspersonaje = new Object();
}
_global.dofus["\r\x14"].gapi.ui.ventaspersonaje.PersonajeItem = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.ventaspersonaje.PersonajeItem.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.ventaspersonaje.PersonajeItem.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   var _loc11_;
   var _loc12_;
   var _loc3_;
   var _loc9_;
   var _loc5_;
   var _loc4_;
   var _loc10_;
   var _loc7_;
   var _loc6_;
   var _loc8_;
   if(bUsed)
   {
      this._oItem = oItem;
      _loc11_ = oItem.id;
      _loc12_ = oItem.idPersonaje;
      _loc3_ = oItem.colores;
      _loc9_ = oItem.accesorios;
      _loc5_ = oItem.ogrinas;
      _loc4_ = oItem.claseID;
      _loc10_ = oItem.nombre;
      _loc7_ = oItem.nivel;
      _loc6_ = oItem.sexo;
      this._svPersonaje._visible = true;
      this._svPersonaje.zoom = 150;
      this._svPersonaje.spriteAnims = ["StaticR"];
      this._svPersonaje.refreshDelay = 50;
      this._oColors = {color1:_loc3_.split("*")[0],color2:_loc3_.split("*")[1],color3:_loc3_.split("*")[2]};
      this._svPersonaje.useSingleLoader = true;
      this._csColors.breed = _loc4_;
      this._csColors.sex = _loc6_;
      this._csColors.colors = {color1:_loc3_.split("*")[0],color2:_loc3_.split("*")[1],color3:_loc3_.split("*")[2]};
      _loc8_ = _loc4_ + "" + _loc6_;
      this._svPersonaje.spriteData = new ank.battlefield.datacenter["\x1e\x0e\x10"](undefined,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc8_ + ".swf",undefined,5);
      this._svPersonaje.enableBlur = true;
      this._svPersonaje.refreshAccessories = true;
      this._svPersonaje.sourceSpriteData = _loc3;
      this._svPersonaje.setColors(this._oColors);
      this._svPersonaje._capa._visible = false;
      this.api.kernel.CharactersManager.setSpriteAccessories(this._svPersonaje.spriteData,_loc9_);
      this._lblNombre.text = _loc10_;
      this._lblNivel.text = _loc7_;
      this._lblOgrinas.text = _loc5_;
      this._txtNvl.text = this.api.lang.getText("LEVEL_SMALL");
      this._lblOgrinas.text = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc5_).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
      this._iconOgr._visible = true;
      this._lblClase.text = this.api.lang.getClassText(_loc4_).ln;
   }
   else if(Number(oItem.cantidad) < 1)
   {
      this._lblName.text = "";
      this._txtNvl.text = "";
      this._lblNivel.text = "";
      this._ldrIcon.contentPath = "";
      this._lblOgrinas.text = "";
      this._iconOgr._visible = false;
      this._lblClase.text = "";
      this._svPersonaje._visible = false;
   }
};
_loc1.init = function()
{
   super.init(false);
   this._iconOgr._visible = false;
   this._svPersonaje._visible = false;
};
loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
_loc1._sColors = "";
_loc1._sRopa = "";
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
