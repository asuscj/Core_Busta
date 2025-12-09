#initclip 207
_loc1 = _global.dofus.datacenter["\x11\r"].prototype;
_loc1.initialize = function(oAPI)
{
   trace("DATACENTER INITIALIZE");
   this._oAPI = oAPI;
   this.Player = new dofus.datacenter["\x0b\r"](oAPI);
   this.Basics = new dofus.datacenter.Basics();
   this.Challenges = new ank["\x1e\n\x07"]["\x0e\x1d"]();
   this.Sprites = new ank["\x1e\n\x07"]["\x0e\x1d"]();
   this.Houses = new ank["\x1e\n\x07"]["\x0e\x1d"]();
   this.Storages = new ank["\x1e\n\x07"]["\x0e\x1d"]();
   this.Game = new dofus.datacenter.Game();
   this.Conquest = new dofus.datacenter.Conquest();
   this.Subareas = new ank["\x1e\n\x07"]["\x0e\x1d"]();
   this.Map = new dofus.datacenter["\x10\x15"]();
   this.Temporary = new Object();
   this.PlayerReal = this.Player;
   this.Heroes = new Object();
   // MODO HEROES: Lista compartida de héroes para todas las instancias
   this.SharedHeroesList = new _global.palmad.ank.utils.ExtendedArray();
   this.Player.HeroesList = this.SharedHeroesList;
};
_loc1.clear = function()
{
   trace("DATACENTER CLEAR");
   this.Player = new dofus.datacenter["\x0b\r"](this._oAPI);
   this.Basics.initialize();
   this.Challenges = new ank["\x1e\n\x07"]["\x0e\x1d"]();
   this.Sprites = new ank["\x1e\n\x07"]["\x0e\x1d"]();
   this.Houses = new ank["\x1e\n\x07"]["\x0e\x1d"]();
   this.Storages = new ank["\x1e\n\x07"]["\x0e\x1d"]();
   this.Game = new dofus.datacenter.Game();
   this.Conquest = new dofus.datacenter.Conquest();
   this.Subareas = new ank["\x1e\n\x07"]["\x0e\x1d"]();
   this.Map = new dofus.datacenter["\x10\x15"]();
   this.Temporary = new Object();
   delete this.Exchange;
   this.PlayerReal = this.Player;
   this.Heroes = new Object();
   // MODO HEROES: Lista compartida de héroes para todas las instancias
   this.SharedHeroesList = new _global.palmad.ank.utils.ExtendedArray();
   this.Player.HeroesList = this.SharedHeroesList;
};
_loc1.setPlayerReal = function(id)
{
   _global.trace("DEBUG setPlayerReal: cambiando Player a heroId=" + id + ", nombre=" + (this.Heroes[id] != undefined ? this.Heroes[id].Name : "undefined"));
   if(this.Heroes[id] == undefined)
   {
      return undefined;
   }
   this.PlayerReal = this.Heroes[id];
   this.Player = this.PlayerReal;
   // Reordenar la pila de héroes para que el líder actual quede primero
   try{ this.Player.arrangeHeroes(); } catch(e) {}
};
_loc1.setPlayerReal = function(id)
{
   if(this.Heroes[id] == undefined)
   {
      return false;
   }
   this.PlayerReal = this.Heroes[id];
   this.Player = this.PlayerReal;
   return true;
};
_loc1.refresh = function()
{
   // No restaurar contexto si hay un panel de inventario de héroe abierto Y visible
   var inventoryPanel = _global.API.ui.getUIComponent("Inventory");
   if(inventoryPanel != undefined && inventoryPanel.heroID != undefined && inventoryPanel._visible == true) {
      return;
   }
   this.Player = this.PlayerReal;
};
_loc1.change = function(id)
{
   // Convertir id a number para comparación correcta
   var numId = Number(id);
   if(id == undefined || this.Player.ID == numId)
   {
      return false;
   }
   this.Player = this.getHero(numId);
   return true;
};
_loc1.getHero = function(id)
{
   if(id == undefined)
   {
      return this.Player;
   }
   if(this.Heroes[id] == undefined)
   {
      this.Heroes[id] = new dofus.datacenter["\x0b\r"](this._oAPI);
      // MODO HEROES: Compartir la lista de héroes entre todas las instancias
      if(this.SharedHeroesList != undefined)
      {
         this.Heroes[id].HeroesList = this.SharedHeroesList;
      }
   }
   return this.Heroes[id];
};
_loc1.getPlayerS = function(id)
{
   if(id == undefined || id == this.api.datacenter.Player.ID)
   {
      return this.api.datacenter.Player;
   }
   return null;
};
#endinitclip