#initclip 99
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
_global.dofus["\r\x14"].gapi.ui.HeroesPanel = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.HeroesPanel.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.HeroesPanel.prototype;
_loc1.init = function()
{
   super.init(false,"HeroesPanel");
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
   var _loc2_ = 0;
   while(_loc2_ < 10)
   {
      this["_hero" + _loc2_]._visible = false;
      _loc2_ = _loc2_ + 1;
   }
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnAdd.addEventListener("click",this);
   this._btnBack.addEventListener("click",this);
   this._btnNext.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._btnAdd.label = "Crear heroe";
   this._btnTabHeroes.label = "Heroes";
   this._window.title = "Panel de heroes";
};
_loc1.mostrarN1 = function()
{
   var _loc2_ = 10;
   while(_loc2_ < 20)
   {
      this["_hero" + _loc2_]._visible = false;
      _loc2_ = _loc2_ + 1;
   }
};
_loc1.mostrarN2 = function()
{
   var _loc2_ = 0;
   while(_loc2_ < 10)
   {
      this["_hero" + _loc2_]._visible = false;
      _loc2_ = _loc2_ + 1;
   }
};
_loc1.initData = function()
{
   // Solicitar lista de héroes al servidor
   this.api.network.send("HhList", false);
   this.updateCharactersList(0,10);
};
_loc1.updateCharactersList = function(n1, n2)
{
   // Construir la lista desde Player.HeroesList y asegurar datacenter.Heroes poblado
   var _loc5_ = new Array();
   var _loc7_ = this.api.datacenter.Player.getHeroes();
   var _loc2_;
   var _loc11_;
   // Deduplicación manual (AS2 no tiene .some())
   var seenIds = {};
   for(var _loc10_ in _loc7_)
   {
      _loc11_ = _loc7_[_loc10_];
      var nId = Number(_loc11_.id != undefined ? _loc11_.id : _loc11_.ID);
      if(_global.isNaN(nId))
      {
         continue;
      }
      // Saltar duplicados
      if(seenIds[nId])
      {
         continue;
      }
      seenIds[nId] = true;
      
      // NO usar getHero() que devuelve instancias compartidas
      // En su lugar, crear un objeto de vista con los datos de _loc11_
      var hero = {};
      hero.ID = nId;
      hero.id = nId;
      hero.Name = _loc11_.name != undefined ? _loc11_.name : _loc11_.Name;
      hero.Level = _loc11_.Level != undefined ? _loc11_.Level : (_loc11_.level != undefined ? _loc11_.level : hero.Level);
      hero.Guild = _loc11_.guild != undefined ? _loc11_.guild : (_loc11_.Guild != undefined ? _loc11_.Guild : "");
      hero.Sex = _loc11_.sex != undefined ? _loc11_.sex : (_loc11_.Sex != undefined ? _loc11_.Sex : 0);
      hero.color1 = _loc11_.color1 != undefined ? _loc11_.color1 : -1;
      hero.color2 = _loc11_.color2 != undefined ? _loc11_.color2 : -1;
      hero.color3 = _loc11_.color3 != undefined ? _loc11_.color3 : -1;
      hero.selected = _loc11_.selected != undefined ? _loc11_.selected : false;
      
      // Intentar obtener gfx/accesorios del Sprite si está presente
      _loc2_ = this.api.datacenter.Sprites.getItemAt(nId);
      if(_loc2_)
      {
         // Solo sobrescribir desde Sprites si trae datos válidos
         if(_loc2_.gfxFile != undefined && _loc2_.gfxFile != "")
         {
            hero.gfxFile = _loc2_.gfxFile;
         }
         if(_loc2_.accessories != undefined && _loc2_.accessories.length > 0)
         {
            hero.accessories = _loc2_.accessories;
         }
      }
      // Si no hay sprite o no trae accesorios, usar los accesorios que vinieron en la lista HhA
      if((hero.accessories == undefined || hero.accessories.length == 0) && _loc11_.accessories != undefined)
      {
         // Set accessories from list payload
         this.api.kernel.CharactersManager.setSpriteAccessories(hero,_loc11_.accessories);
         // Also ensure we have a gfxFile source for non-leader heroes after reconnect
         if(_loc11_.gfxFile != undefined)
         {
            hero.gfxFile = _loc11_.gfxFile;
         }
         else if(_loc11_.gfxID != undefined)
         {
            hero.gfxID = _loc11_.gfxID;
            hero.gfxFile = dofus.Constants.CLIPS_PERSOS_PATH + _loc11_.gfxID + ".swf";
         }
      }
      _loc5_.push(hero);
   }
   // NO ordenar: preservar el orden de la lista del jugador, que actúa como pila
   // Rango por página
   var _loc3_ = n1 != undefined ? n1 : 0;
   var _loc9_ = n2 != undefined ? n2 : 10;
   var _loc4_;
   while(_loc3_ < _loc9_)
   {
      var hero = _loc5_[_loc3_];
      var viewer;
      if(hero != undefined)
      {
         viewer = new ank.battlefield.datacenter["\x1e\x0e\x10"]("viewer",ank.battlefield.mc["\x1e\x0e\x10"],hero.gfxFile,undefined,4);
         viewer.color1 = hero.color1;
         viewer.color2 = hero.color2;
         viewer.color3 = hero.color3;
         viewer.accessories = hero.accessories;
      }
      hero.sprite = viewer;
      _loc4_ = this["_hero" + _loc3_];
      if(_loc4_)
      {
         _loc4_.removeMovieClip();
         _loc4_.data = undefined;
      }
      this["_hero" + _loc3_].data = hero;
      _loc3_ = _loc3_ + 1;
   }
};
_loc1.actualizar = function(sData)
{
   this.api.datacenter.Player.clearHeroes();
   this.api.network.Account.prepareHeroList(sData);
   this.updateCharactersList();
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnAdd:
         this.api.ui.loadUIComponent("CreateCharacter","CreateCharacter",{modeHero:true},{bAlwaysOnTop:true});
         break;
      case this._btnClose:
         this.unloadThis();
         break;
      case this._btnBack:
         this.mostrarN1();
         this.updateCharactersList(0,10);
         break;
      case this._btnNext:
         this.mostrarN2();
         this.updateCharactersList(10,20);
      default:
         return;
   }
};
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
_global.dofus["\r\x14"].gapi.ui.HeroesPanel.CLASS_NAME = "HeroesPanel";
#endinitclip