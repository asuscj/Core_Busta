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
if(!dofus["\r\x14"].gapi.ui.recordmobs)
{
   _global.dofus["\r\x14"].gapi.ui.recordmobs = new Object();
}
_global.dofus["\r\x14"].gapi.ui.recordmobs.MobsItem = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.recordmobs.MobsItem.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.recordmobs.MobsItem.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   var _loc3_;
   var _loc4_;
   var _loc5_;
   if(bUsed)
   {
      this._oItem = oItem;
      _loc3_ = this.api.lang.getMonstersText(oItem.idMob);
      _loc4_ = _loc3_.g;
      _loc5_ = _loc3_.n;
      this._lblName.text = _loc5_;
      this._mcF._visible = true;
      this._txtCantidad.text = oItem.cantidad;
      this._svPersonaje._visible = true;
      this._svPersonaje.fondo._visible = false;
      if(oItem.idMob == 257 || oItem.idMob == 424 || oItem.idMob == 425)
      {
         this._svPersonaje.zoom = 20;
      }
      else if(oItem.idMob == 423)
      {
         this._svPersonaje.zoom = 10;
      }
      else
      {
         this._svPersonaje.zoom = 70;
      }
      this._svPersonaje.spriteAnims = ["StaticR"];
      this._svPersonaje.refreshDelay = 50;
      this._svPersonaje.useSingleLoader = true;
      this._svPersonaje.spriteData = new ank.battlefield.datacenter["\x1e\x0e\x10"](undefined,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc4_ + ".swf",undefined,5);
      this._svPersonaje.enableBlur = true;
      this._txtCantidad.text = "x " + new ank["\x1e\n\x07"]["\x0e\x1c"](oItem.cantidad).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   }
   else if(Number(oItem.cantidad) < 1)
   {
      this._lblName.text = "";
      this._txtCantidad.text = "";
      this._ldrIcon.contentPath = "";
      this._mcF._visible = false;
   }
};
_loc1.init = function()
{
   super.init(false);
   this._mcF._visible = false;
   this._svPersonaje._visible = false;
   this._lblName.text = "";
   this._txtCantidad.text = "";
};
loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
