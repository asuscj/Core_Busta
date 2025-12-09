#initclip 161
var _loc1 = dofus["\r\x14"].gapi.ui.FightChallenge.prototype;
_loc1.removeChallenge = function(nID)
{
   // Server sends challenge ID (not unicID) in Gd- packets during reload
   _global.trace("FightChallenge.removeChallenge() - Removing challenge ID:" + nID);
   var _loc3_ = this._aChallengeList.findFirstItem("id", nID);
   if(_loc3_.index != -1)
   {
      _global.trace("FightChallenge.removeChallenge() - Found at index " + _loc3_.index + ", removing");
      this._aChallengeList.removeItems(_loc3_.index, 1);
      // Rebuild icon list after removing challenge
      this.updateList();
   }
   else
   {
      _global.trace("FightChallenge.removeChallenge() - ID not found in list");
   }
};
_loc1.cleanChallenge = function()
{
   var _loc2_ = 0;
   while(_loc2_ < this._aChallengeIcon.length)
   {
      this._aChallengeIcon[_loc2_].unloadMovie();
      this._aChallengeIcon[_loc2_].removeMovieClip();
      _loc2_ += 1;
   }
   this._aChallengeIcon = [];
   this._aChallengeList = new ank["\x1e\n\x07"]["\x0f\x01"]();
   this.challenges = this._aChallengeList; // expose public collection expected by Game.onFightChallenge
   if(this._mcViewer != undefined)
   {
      this._mcViewer.removeMovieClip();
      delete this._mcViewer;
   }
   this._btnChallengeReload._visible = true;
   this._visible = false;
};
_loc1.addListeners = function()
{
   this._btnOpenClose.addEventListener("click",this);
   this._btnOpenClose.addEventListener("over",this);
   this._btnOpenClose.addEventListener("out",this);
   this._btnChallengeReload.addEventListener("click",this);
   this._btnChallengeReload.addEventListener("over",this);
   this._btnChallengeReload.addEventListener("out",this);
};
_loc1.updateList = function(immediate)
{
   // Throttle todas las llamadas a updateList excepto si immediate=true
   if(!immediate)
   {
      var now = getTimer();
      if(this._lastUpdateList != undefined && (now - this._lastUpdateList) < 200)
      {
         // Ya hay actualización reciente, programar una sola vez
         if(this._updateListTimer == undefined)
         {
            var self = this;
            this._updateListTimer = setInterval(function(){
               clearInterval(self._updateListTimer);
               delete self._updateListTimer;
               self.updateList(true); // llamada inmediata
            }, 250);
         }
         return undefined;
      }
      this._lastUpdateList = now;
   }
   
   // Limpiar timer pendiente si existe
   if(this._updateListTimer != undefined)
   {
      clearInterval(this._updateListTimer);
      delete this._updateListTimer;
   }
   
   _global.trace("FightChallenge.updateList() - EXECUTING (challenges:" + this._aChallengeList.length + ")");
   
   // Limpiar iconos existentes antes de crear nuevos
   if(this._aChallengeIcon != undefined && this._aChallengeIcon.length > 0)
   {
      var _loc4_ = 0;
      while(_loc4_ < this._aChallengeIcon.length)
      {
         this._aChallengeIcon[_loc4_].unloadMovie();
         this._aChallengeIcon[_loc4_].removeMovieClip();
         _loc4_ += 1;
      }
   }
   this._aChallengeIcon = new Array();
   this._visible = this._aChallengeList.length > 0;
   this._aChallengeList.sort(function(a, b)
   {
      return a.special - b.special;
   }
   );
   var _loc2_ = 0;
   var _loc3_;
   while(_loc2_ < this._aChallengeList.length)
   {
      // Ensure state property exists (default 0) now that server sends explicit state (0,1,2)
      if(this._aChallengeList[_loc2_].state == undefined)
      {
         this._aChallengeList[_loc2_].state = 0;
      }
      _global.trace("FightChallenge.updateList() - Creating icon " + _loc2_ + " ID:" + this._aChallengeList[_loc2_].id + " state:" + this._aChallengeList[_loc2_].state);
      _loc3_ = this.attachMovie("FightChallengeIcon","FightChallengeIcon" + _loc2_,_loc2_ + 1,{challenge:this._aChallengeList[_loc2_]});
      _loc3_._x = this._btnChallengeReload._x;
      _loc3_._y = this._btnChallengeReload._y + 20 + (6 + _loc3_._height) * _loc2_;
      _loc3_.addEventListener("over",this);
      _loc3_.addEventListener("out",this);
      _loc3_.addEventListener("click",this);
      this._aChallengeIcon.push(_loc3_);
      _loc3_._visible = !this._btnOpenClose.selected;
      // Always call update to draw overlay if state > 0
      if(_loc3_.update != undefined)
      {
         _loc3_.update();
      }
      _loc2_ += 1;
   }
};
_loc1.actualizarPrecio = function(nPrecio)
{
   this.nPrecio = nPrecio;
};
_loc1.ogrinas = 0;
_loc1.actualizarOgrinas = function(b)
{
   this.ogrinas = b;
};
_loc1.actualizarRetos = function()
{
   var _loc2_ = 0;
   while(_loc2_ < this._aChallengeIcon.length)
   {
      this._aChallengeIcon[_loc2_].unloadMovie();
      this._aChallengeIcon[_loc2_].removeMovieClip();
      _loc2_ += 1;
   }
   this._aChallengeIcon = [];
   this._aChallengeList = new ank["\x1e\n\x07"]["\x0f\x01"]();
   this.challenges = this._aChallengeList; // keep public alias in sync
   if(this._mcViewer != undefined)
   {
      this._mcViewer.removeMovieClip();
      delete this._mcViewer;
   }
   this._visible = false;
};
_loc1.startToPlay = function()
{
   this._btnChallengeReload._visible = false;
   // Mostrar recarga sólo en el primer turno (turno tabla == 0). El servidor valida líder y costo.
   var esPrimerTurno = this.api.datacenter.Game.currentTableTurn == 0;
   this._btnChallengeReload._visible = esPrimerTurno;
   var _loc2_ = 0;
   var _loc3_;
   while(_loc2_ < this._aChallengeList.length)
   {
      _loc3_ = this["FightChallengeIcon" + _loc2_];
      if(_loc3_ != undefined)
      {
         _loc3_._y = this._btnChallengeReload._y + 20 + (6 + _loc3_.height) * _loc2_;
      }
      _loc2_ += 1;
   }
};
_loc1.valid = function(noConfirm, precio)
{
   if(!noConfirm)
   {
      if(this.ogrinas == 0)
      {
         this.api.kernel.showMessage("ATTENTION","Se descontarÃ¡n x" + this.nPrecio + " kamas para actualizar los retos, Â¿Desea continuar?","CAUTION_YESNO",{name:"Confirm",listener:this});
      }
      else if(this.ogrinas == 1)
      {
         this.api.kernel.showMessage("ATTENTION","Se descontarÃ¡n x" + this.nPrecio + " ogrinas para actualizar los retos, Â¿Desea continuar?","CAUTION_YESNO",{name:"Confirm",listener:this});
      }
      return undefined;
   }
   var _loc0_;
   if((_loc0_ = this._oEvent.target) === this._btnChallengeReload)
   {
      this.api.network.Game.reloadChallenges(this.nPrecio);
   }
};
_loc1.yes = function(oEvent)
{
   var _loc0_;
   if((_loc0_ = oEvent.target._name) === "AskYesNoConfirm")
   {
      this.valid(true,this.nPrecio);
   }
};
// Abre (o cierra si ya está visible para el mismo reto) el panel FightChallengeViewer
_loc1.openViewerForChallenge = function(ch)
{
   if(ch == undefined)
   {
      return undefined;
   }
   // Intentar usar clip fijo en timeline, si no existe lo adjunta dinámicamente
   var viewer = this.FightChallengeViewer;
   var needsCreation = (viewer == undefined);
   // Detectar si el viewer fue destruido o cerrado externamente (cerrado con X)
   if(viewer != undefined)
   {
      _global.trace("FightChallenge.openViewerForChallenge() - Checking viewer state: _parent=" + (viewer._parent != undefined) + " _name=" + viewer._name + " _visible=" + viewer._visible + " _width=" + viewer._width);
      // Verificar múltiples señales de destrucción/invalidación (_width=0 cuando se cierra con X)
      if(viewer._parent == undefined || viewer._name == undefined || viewer._width == undefined || viewer._width == 0)
      {
         _global.trace("FightChallenge.openViewerForChallenge() - Viewer invalid/destroyed (width=" + viewer._width + "), destroying and recreating");
         // Destruir completamente la instancia corrupta antes de recrear
         viewer.removeMovieClip();
         delete this.FightChallengeViewer;
         viewer = undefined;
         needsCreation = true;
      }
   }
   if(needsCreation)
   {
      // Centrar en pantalla: Stage.width/height o fallback a 800x600
      var sw = (Stage.width != undefined) ? Stage.width : 800;
      var sh = (Stage.height != undefined) ? Stage.height : 600;
      viewer = this.attachMovie("FightChallengeViewer", "FightChallengeViewer", this.getNextHighestDepth());
      this.FightChallengeViewer = viewer;
      // Posicionar centrado pero más arriba (restar 160px para evitar banner inferior)
      if(viewer != undefined)
      {
         var vw = (viewer._width > 0) ? viewer._width : 200;
         var vh = (viewer._height > 0) ? viewer._height : 150;
         viewer._x = ((sw - vw) / 2) - 310;
         viewer._y = ((sh - vh) / 2) - 120;
         _global.trace("FightChallenge.openViewerForChallenge() - CREATED viewer at x=" + viewer._x + " y=" + viewer._y);
      }
   }
   if(viewer == undefined)
   {
      _global.trace("FightChallenge.openViewerForChallenge() - NO VIEWER INSTANCE");
      return undefined;
   }
   // Guardar el último unicID/id en una propiedad del viewer para toggle consistente
   if(viewer._lastChallengeUnicID == undefined)
   {
      viewer._lastChallengeUnicID = null;
   }
   // Determinar si es el mismo reto que la última vez mostrada (solo si NO fue recreado)
   var same = false;
   if(!needsCreation && ch.unicID != undefined && viewer._lastChallengeUnicID != null)
   {
      same = (String(viewer._lastChallengeUnicID) == String(ch.unicID));
   }
   else if(!needsCreation && ch.id != undefined && viewer._lastChallengeID != null)
   {
      same = (viewer._lastChallengeID == ch.id);
   }
   // Toggle: si es el mismo reto, invertir visibilidad
   if(same)
   {
      if(viewer._visible)
      {
         // Ocultar
         viewer._visible = false;
         _global.trace("FightChallenge.openViewerForChallenge() - TOGGLE OFF unicID=" + ch.unicID);
      }
      else
      {
         // Mostrar de nuevo: asignar challenge, actualizar, traer al frente y hacer visible
         viewer.challenge = ch;
         if(viewer.update != undefined)
         {
            viewer.update();
         }
         viewer.swapDepths(this.getNextHighestDepth());
         viewer._visible = true;
         _global.trace("FightChallenge.openViewerForChallenge() - TOGGLE ON unicID=" + ch.unicID + " depth=" + viewer.getDepth());
      }
      return undefined;
   }
   // Mostrar reto diferente: asignar nuevo reto, guardar referencia y hacer visible
   viewer.challenge = ch;
   viewer._lastChallengeUnicID = ch.unicID;
   viewer._lastChallengeID = ch.id;
   if(viewer.update != undefined)
   {
      viewer.update();
   }
   viewer._visible = true;
   _global.trace("FightChallenge.openViewerForChallenge() - SHOW (new challenge) unicID=" + ch.unicID + " id=" + ch.id);
};
_loc1.click = function(e)
{
   var _loc0_;
   var _loc2_;
   if((_loc0_ = e.target) === this._btnOpenClose)
   {
      _loc2_ = 0;
      while(_loc2_ < this._aChallengeIcon.length)
      {
         this._aChallengeIcon[_loc2_]._visible = !this._btnOpenClose.selected;
         _loc2_ += 1;
      }
      this._btnChallengeReload._visible = !this._btnOpenClose.selected;
   }
   else if((_loc0_ = e.target) === this._btnChallengeReload)
   {
      this._oEvent = e;
      this.valid(false,this.nPrecio);
   }
   else
   {
      // Delegar apertura en helper dedicado
      if(e.target.challenge != undefined)
      {
         this.openViewerForChallenge(e.target.challenge);
      }
   }
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnOpenClose:
         this.gapi.showTooltip(this.api.lang.getText("PARTY_OPEN_CLOSE"),oEvent.target,20);
         break;
      case this._btnChallengeReload:
         this.gapi.showTooltip(this.api.lang.getText("RETO_RECARGAR") + " " + this.nPrecio,oEvent.target,20);
         break;
      default:
         // If target is a FightChallengeIcon, show challenge name and description
         if(oEvent.target.challenge != undefined && oEvent.target.challenge.id != undefined)
         {
            var c = oEvent.target.challenge;
            var challengeData = this.api.lang.getFightChallenge(c.id);
            var text = challengeData.n + "\n" + challengeData.d;
            
            // Agregar información de bonus (XP y Botín)
            var bonusXP = Number(c.basicXpBonus || 0) + Number(c.teamXpBonus || 0);
            var bonusDrop = Number(c.basicDropBonus || 0) + Number(c.teamDropBonus || 0);
            
            text += "\n";
            if(bonusDrop > 0)
            {
               text += "\nBotín: +" + bonusDrop + "%";
            }
            if(bonusXP > 0)
            {
               text += "\nXP: +" + bonusXP + "%";
            }
            
            // Agregar estado del reto (0=actual, 1=logrado, 2=no alcanzado)
            var estadoTexto = "";
            if(c.state == 1)
            {
               estadoTexto = "Estado: Reto logrado";
            }
            else if(c.state == 2)
            {
               estadoTexto = "Estado: Reto no alcanzado";
            }
            else
            {
               estadoTexto = "Estado: Reto actual";
            }
            text += "\n" + estadoTexto;
            
            this.gapi.showTooltip(text,oEvent.target,20);
         }
         return;
   }
};
_loc1.out = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.updateChallengeData = function(eChallengeData)
{
   for(var _loc3_ in this._aChallengeIcon)
   {
      if(this._aChallengeIcon[_loc3_].challenge.unicID == eChallengeData.unicID)
      {
         this._aChallengeIcon[_loc3_].challenge = eChallengeData;
      }
   }
};
// Missing from decompiled source: addChallenge logic used by Game.onFightChallenge
// Adds or updates a challenge and rebuilds the icon list.
_loc1.addChallenge = function(oChallenge)
{
   if(this._aChallengeList == undefined)
   {
      this._aChallengeList = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this.challenges = this._aChallengeList; // initialize public alias
   }
   // Si el reto viene marcado como parte de un reload (nueva carga), limpiar lista primero
   if(oChallenge.isReload)
   {
      this._aChallengeList = new ank["\x1e\n\x07"]["\x0f\x01"]();
      this.challenges = this._aChallengeList;
      delete oChallenge.isReload; // limpiar flag
   }
   var _loc3_ = this._aChallengeList.findFirstItem("unicID", oChallenge.unicID);
   if(_loc3_.index != -1)
   {
      this._aChallengeList.updateItem(_loc3_.index, oChallenge);
   }
   else
   {
      this._aChallengeList.push(oChallenge);
   }
   // Usar throttling centralizado de updateList
   this.updateList();
};
// Missing from decompiled source: updateChallenge called by Game.onFightChallengeUpdate
// Parameters: challenge id (NOT unicID) and success boolean (true=done, false=failed)
_loc1.updateChallenge = function(nID, bSuccess)
{
   if(this._aChallengeList == undefined)
   {
      return undefined;
   }
   var _loc3_ = this._aChallengeList.findFirstItem("id", nID);
   if(_loc3_.index == -1)
   {
      return undefined;
   }
   _loc3_.item.state = bSuccess ? 1 : 2; // 1 done, 2 failed
   _global.trace("FightChallenge.updateChallenge() - ID:" + nID + " success:" + bSuccess + " state set to:" + _loc3_.item.state);
   
   // Actualizar el icono específico ANTES de reconstruir la lista completa
   for(var i in this._aChallengeIcon)
   {
      if(this._aChallengeIcon[i].challenge != undefined && this._aChallengeIcon[i].challenge.id == nID)
      {
         // Actualizar la referencia del challenge en el icono
         this._aChallengeIcon[i].challenge.state = _loc3_.item.state;
         // Forzar redibujar overlay inmediatamente
         if(this._aChallengeIcon[i].update != undefined)
         {
            _global.trace("FightChallenge.updateChallenge() - Forcing update on icon index " + i);
            this._aChallengeIcon[i].update();
         }
         break;
      }
   }
   
   // Refresh viewer if it's showing this challenge
   if(this._mcViewer != undefined && this._mcViewer.challenge != undefined && this._mcViewer.challenge.id == nID && this._mcViewer.update != undefined)
   {
      this._mcViewer.challenge = _loc3_.item;
      this._mcViewer.update();
   }
};
_loc1.nPrecio = 0;
// Ensure public property exists even before any reset/add operations (AS2 runtime guard)
if(_loc1.challenges == undefined)
{
   _loc1.challenges = new ank["\x1e\n\x07"]["\x0f\x01"]();
   _loc1._aChallengeList = _loc1.challenges;
}
#endinitclip