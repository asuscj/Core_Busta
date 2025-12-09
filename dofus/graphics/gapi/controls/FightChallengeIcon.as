#initclip 206
var _loc1 = dofus["\r\x14"].gapi.controls.FightChallengeIcon.prototype;
_loc1.createChildren = function()
{
   this._lastShowAsk = 0;
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initCpt});
};
_loc1.addListeners = function()
{
   // When the base icon finishes loading, recompute the overlay with correct size
   if(this._ldr != undefined && this._ldr.addEventListener != undefined)
   {
      this._ldr.addEventListener("complete", this);
   }
   // Forward mouse events to GAPI event system for tooltips
   var self = this;
   this.useHandCursor = true;
   if(this._ldr) this._ldr.useHandCursor = true;
   this.onRollOver = function()
   {
      self.dispatchEvent({type:"over", target:self});
   };
   this.onRollOut = function()
   {
      self.dispatchEvent({type:"out", target:self});
   };
};
_loc1.initCpt = function()
{
   this._ldr.contentPath = this.challenge.iconPath;
   this._ldr.frame = this.challenge.special ? 2 : 1;
   this.update();
   // Ensure click on the icon dispatches a 'click' event to parent UI
   var self = this;
   this.onRelease = function()
   {
      _global.trace("FightChallengeIcon.onRelease unicID=" + (self.challenge != undefined ? self.challenge.unicID : "?"));
      // Llamar directamente helper de apertura si existe
      if(self._parent != undefined && self._parent.openViewerForChallenge != undefined)
      {
         self._parent.openViewerForChallenge(self.challenge);
      }
      else if(self._parent != undefined && self._parent.click != undefined)
      {
         self._parent.click({target:self});
      }
      else if(self.dispatchEvent != undefined)
      {
         self.dispatchEvent({type:"click", target:self});
      }
   };
   // Añadir unicID sintético si falta (usa id + posición) para toggle consistente
   if(this.challenge != undefined && this.challenge.unicID == undefined)
   {
      // Intentar derivar un índice desde el nombre del clip (FightChallengeIconN)
      var idx = -1;
      if(this._name != undefined && this._name.indexOf("FightChallengeIcon") == 0)
      {
         var numStr = this._name.substr(18); // "FightChallengeIcon" = 18 caracteres
         idx = parseInt(numStr, 10);
         if(isNaN(idx)) idx = -1;
      }
      this.challenge.unicID = String(this.challenge.id != undefined ? this.challenge.id : 0) + "_" + (idx >= 0 ? idx : getTimer());
   }
   if(this._ldr != undefined)
   {
      this._ldr.onRelease = function()
      {
         _global.trace("FightChallengeIcon._ldr.onRelease unicID=" + (self.challenge != undefined ? self.challenge.unicID : "?"));
         if(self._parent != undefined && self._parent.openViewerForChallenge != undefined)
         {
            self._parent.openViewerForChallenge(self.challenge);
         }
         else if(self._parent != undefined && self._parent.click != undefined)
         {
            self._parent.click({target:self});
         }
         else if(self.dispatchEvent != undefined)
         {
            self.dispatchEvent({type:"click", target:self});
         }
      };
      this._ldr.onReleaseOutside = function()
      {
         // no-op; keep from swallowing
      };
   }
};
_loc1.complete = function(oEvent)
{
   // Loader of the base icon finished: re-run update with correct dimensions for overlay
   if(oEvent.target === this._ldr)
   {
      this.update();
   }
};
// Draw state overlay (OK/KO) on top of the icon
_loc1.update = function()
{
   // Remove previous overlay if exists
   if(this._mcOverlay != undefined)
   {
      this._mcOverlay.removeMovieClip();
      delete this._mcOverlay;
   }
   // Only draw overlay for final states (done=1, failed=2)
   if(this.challenge.state == undefined || this.challenge.state == 0)
   {
      return undefined;
   }
   // Create overlay as a child of the icon so it follows visibility/layout
   this._mcOverlay = this.createEmptyMovieClip("_mcOverlay", this.getNextHighestDepth());
   // Attach library symbol overlay instead of drawing vectors
   var symbolLink = this.challenge.state == 1 ? "ChallengeOK" : "ChallengeKO";
   var depth = this._mcOverlay.getNextHighestDepth();
   var mc = this._mcOverlay.attachMovie(symbolLink, "mcState", depth);
   if(mc == undefined)
   {
      // Fallback if symbol not found: draw simple vector X/?
      var w = this._width > 0 ? this._width : 38;
      var h = this._height > 0 ? this._height : 38;
      var size = Math.min(w, h);
      var pad = Math.round(size * 0.18);
      var thick = Math.max(2, Math.round(size * 0.08));
      this._mcOverlay._alpha = 95;
      if(this.challenge.state == 2)
      {
         this._mcOverlay.lineStyle(thick, 0xCC0000, 100);
         this._mcOverlay.moveTo(pad, pad);
         this._mcOverlay.lineTo(w - pad, h - pad);
         this._mcOverlay.moveTo(w - pad, pad);
         this._mcOverlay.lineTo(pad, h - pad);
      }
      else
      {
         this._mcOverlay.lineStyle(thick, 0x2ECC71, 100);
         this._mcOverlay.moveTo(pad, h * 0.55);
         this._mcOverlay.lineTo(w * 0.42, h * 0.78);
         this._mcOverlay.lineTo(w - pad, h * 0.22);
      }
   }
   else
   {
      // Center the attached symbol over the icon
      mc._x = 0;
      mc._y = 0;
      // Scale to icon size if needed
      var w2 = this._width > 0 ? this._width : 38;
      var h2 = this._height > 0 ? this._height : 38;
      if(mc._width > 0 && mc._height > 0)
      {
         mc._xscale = (w2 / mc._width) * 100;
         mc._yscale = (h2 / mc._height) * 100;
      }
      this._mcOverlay._alpha = 95;
   }
   this._mcOverlay._x = 0;
   this._mcOverlay._y = 0;
   this._mcOverlay._visible = true;
   // Forward mouse events for tooltips
   var owner = this;
   this._mcOverlay.onRollOver = function()
   {
      owner.dispatchEvent({type:"over", target:owner});
   };
   this._mcOverlay.onRollOut = function()
   {
      owner.dispatchEvent({type:"out", target:owner});
   };
   // Also forward click from overlay so it doesn't swallow the event
   this._mcOverlay.onRelease = function()
   {
      _global.trace("FightChallengeIcon._mcOverlay.onRelease unicID=" + (owner.challenge != undefined ? owner.challenge.unicID : "?"));
      if(owner._parent != undefined && owner._parent.openViewerForChallenge != undefined)
      {
         owner._parent.openViewerForChallenge(owner.challenge);
      }
      else if(owner._parent != undefined && owner._parent.click != undefined)
      {
         owner._parent.click({target:owner});
      }
      else if(owner.dispatchEvent != undefined)
      {
         owner.dispatchEvent({type:"click", target:owner});
      }
   };
   this._mcOverlay.useHandCursor = true;
};
#endinitclip