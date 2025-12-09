#initclip 57
var _loc1 = dofus["\r\x14"].gapi.ui.Banner.prototype;
_loc1.__set__data = function(oData)
{
   var _loc2_ = this.initialized && this._oData.ID != oData.ID;
   if(_loc2_)
   {
      this._oData.data.removeEventListener("lpChanged",this);
      this._oData.data.removeEventListener("apChanged",this);
      this._oData.data.removeEventListener("mpChanged",this);
      this._oData.removeEventListener("lpChanged",this);
      this._oData.removeEventListener("lpMaxChanged",this);
      this._oData.SpellsManager.removeEventListener("spellLaunched",this);
      this._oData.SpellsManager.removeEventListener("nextTurn",this);
      this._oData.Spells.removeEventListener("modelChanged",this);
      this._oData.Inventory.removeEventListener("modelChanged",this);
   }
   this._oData = oData;
   if(_loc2_)
   {
      this._oData.data.addEventListener("lpChanged",this);
      this._oData.data.addEventListener("apChanged",this);
      this._oData.data.addEventListener("mpChanged",this);
      this._oData.addEventListener("lpChanged",this);
      this._oData.addEventListener("lpMaxChanged",this);
      this._oData.SpellsManager.addEventListener("spellLaunched",this);
      this._oData.SpellsManager.addEventListener("nextTurn",this);
      this._oData.Spells.addEventListener("modelChanged",this);
      this._oData.Inventory.addEventListener("modelChanged",this);
   }
   if(this.initialized)
   {
      this.showPoints(this._pvAP._visible);
      this.updateArtwork(true);
      this.shortcuts.setCurrentTab("Spells");
      this._oData.InteractionsManager.setState(this.api.datacenter.Game.isFight);
      this.api.electron.updateWindowTitle(this._oData.Name);
   }
};
_loc1.createChildren = function()
{
   this._ldrVisual._visible = false;
   this._txtVisual._visible = false;
   this._btnVisual._visible = false;
   this._btnFights._visible = false;
   this.addToQueue({object:this,method:this.hideEpisodicContent});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
   this.showPoints(false);
   this._btnRecompensas._visible = false;
   this.showNextTurnButton(false);
   this.showGiveUpButton(false);
   this._mcRightPanelPlacer._visible = false;
   this._mcCircleXtraPlacer._visible = false;
   this.api.ui.unloadUIComponent("FightOptionButtons");
   this.api.kernel.KeyManager.addShortcutsListener("onShortcut",this);
   this.api.kernel.KeyManager.addKeysListener("onKeys",this);
   this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_ON_CONNECT);
   this.api.network.Game.nLastMapIdReceived = -1;
   this._txtConsole.text = "";
   this._txtConsole.onSetFocus = function()
   {
      this._parent.onSetFocus();
   };
   this._txtConsole.onKillFocus = function()
   {
      this._parent.onKillFocus();
   };
   this._txtConsole.maxChars = dofus.Constants.MAX_MESSAGE_LENGTH + dofus.Constants.MAX_MESSAGE_LENGTH_MARGIN;
   ank.battlefield["\x1c\n"].useCacheAsBitmapOnStaticAnim = this.api.lang.getConfigText("USE_CACHEASBITMAP_ON_STATICANIM");
   k = 0;
   while(k < 10)
   {
      duplicateMovieClip(this.snow,"snow" + k,16384 + k);
      k++;
   }
   this.addToQueue({object:this,method:this.Cargo});
};
_loc1.Cargo = function()
{
   var _loc0_;
   if((_loc0_ = _global.ANKAMARETRO) === "Astra")
   {
      this._btnObje._visible = false;
      this._btnTPwar._visible = false;
      this.api.network.send("wb");
   }
};
_loc1.displayMovableBar = function(_loc2_)
{
   if(_loc2_ == undefined)
   {
      _loc2_ = this._mcbMovableBar == undefined;
   }
   var _loc3_;
   var _loc4_;
   var _loc2_;
   if(_loc2_)
   {
      if(this._mcbMovableBar._name != undefined)
      {
         return undefined;
      }
      this._mcbMovableBar = this.api.ui.loadUIComponent("MovableContainerBar","MovableBar",[],{bAlwaysOnTop:true});
      this._mcbMovableBar.addEventListener("drawBar",this);
      this._mcbMovableBar.addEventListener("drop",this);
      this._mcbMovableBar.addEventListener("dblClick",this);
      _loc3_ = {left:0,top:0,right:this.gapi.screenWidth,bottom:this.gapi.screenHeight};
      _loc4_ = this.api.kernel.OptionsManager.getOption("MovableBarSize");
      _loc2_ = this.api.kernel.OptionsManager.getOption("MovableBarCoord");
      _loc2_ = _loc2_ ? _loc2_ : {x:0,y:(this.gapi.screenHeight - this._mcbMovableBar._height) / 2};
      this.addToQueue({object:this._mcbMovableBar,method:this._mcbMovableBar.setOptions,params:[14,20,_loc3_,_loc4_,_loc2_]});
   }
   else
   {
      this.api.ui.unloadUIComponent("MovableBar");
   }
};
_loc1.drop = function(_loc2_)
{
   var _loc7_ = _loc2_.target;
   var _loc4_;
   var _loc8_;
   var _loc11_;
   var _loc3_;
   var _loc6_;
   var _loc5_;
   var _loc9_;
   if(_loc7_ !== this._mcbMovableBar)
   {
      _loc7_ = this._msShortcuts.currentTab;
      if(this._msShortcuts.currentTab !== "Spells")
      {
         if(_loc7_ === "Items")
         {
            if(this.gapi.getUIComponent("Inventory") == undefined && !Key.isDown(16))
            {
               return undefined;
            }
            _loc4_ = this.gapi.getCursor();
            if(_loc4_ == undefined)
            {
               return undefined;
            }
            if(!_loc4_.canMoveToShortut)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_MOVE_ITEM_HERE"),"ERROR_BOX");
               return undefined;
            }
            this.gapi.removeCursor();
            _loc8_ = _loc2_.target.params.position + dofus["\r\x14"].gapi.controls.MouseShortcuts.ITEM_OFFSET;
            if(_loc4_.position == _loc8_)
            {
               return undefined;
            }
            if(_loc4_.Quantity > 1)
            {
               _loc11_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:_loc4_.Quantity,max:_loc4_.Quantity,useAllStage:true,params:{type:"drop",item:_loc4_,position:_loc8_}},{bAlwaysOnTop:true});
               _loc11_.addEventListener("validate",this);
            }
            else
            {
               this.api.network.Items.movement(_loc4_.ID,_loc8_,1);
            }
         }
      }
      else
      {
         if(this.gapi.getUIComponent("Spells") == undefined && !Key.isDown(16))
         {
            return undefined;
         }
         _loc3_ = this.gapi.getCursor();
         if(_loc3_ == undefined)
         {
            return undefined;
         }
         this.gapi.removeCursor();
         _loc6_ = _loc3_.position;
         _loc5_ = _loc2_.target.params.position;
         if(_loc6_ == _loc5_)
         {
            return undefined;
         }
         if(_loc6_ != undefined)
         {
            this._msShortcuts.getContainer(_loc6_).contentData = undefined;
            this._oData.SpellsUsed.removeItemAt(_loc6_);
         }
         _loc9_ = this._msShortcuts.getContainer(_loc5_).contentData;
         if(_loc9_ != undefined)
         {
            _loc9_.position = undefined;
         }
         _loc3_.position = _loc5_;
         _loc2_.target.contentData = _loc3_;
         this._oData.SpellsUsed.addItemAt(_loc5_,_loc3_);
         _global.HERO_ID = _loc3_.heroID;
         trace("drop banner " + _loc3_.heroID);
         this.api.network.Spells.moveToUsed(_loc3_.ID,_loc5_);
         this.addToQueue({object:this._msShortcuts,method:this._msShortcuts.setSpellStateOnAllContainers});
      }
   }
   else
   {
      this.api.kernel.OptionsManager.setOption("MovableBarCoord",{x:this._mcbMovableBar._x,y:this._mcbMovableBar._y,v:this._mcbMovableBar._bVertical});
   }
};
_loc1.setMovableBarSize = function(_loc2_)
{
   this._mcbMovableBar.size = _loc2_;
   this._mcbMovableBar.forceHorizontal();
};
_loc1.activarRecompensa = function()
{
   this._btnRecompensas._visible = true;
};
_loc1.ocultarRecompensa = function()
{
   this._btnRecompensas._visible = false;
};
_loc1.botones = function(sDate)
{
   this._btnOgrina._visible = sDate;
   this._btnPase._visible = sDate;
   this._btnLogin._visible = sDate;
   this._btnRuleta._visible = sDate;
   this._btnPrestigio._visible = sDate;
};
_loc1.botonesnormal = function(sDate)
{
   this._btnStatsJob._visible = sDate;
   this._btnSpells._visible = sDate;
   this._btnInventory._visible = sDate;
   this._btnQuests._visible = sDate;
   this._btnMap._visible = sDate;
   this._btnFriends._visible = sDate;
   this._btnGuild._visible = sDate;
   this._btnMount._visible = sDate;
   this._btnPvP._visible = sDate;
};
_loc1.addListeners = function()
{
   this._btnTacticoMaitre.addEventListener("click",this);
   this._btnAntiLagTp.addEventListener("click",this);
   this._btnOneWindows.addEventListener("click",this);
   this._btnHardcore.addEventListener("click",this);
   this._btnStart.addEventListener("click",this);
   this._btnTemporis.addEventListener("click",this);
   this.objetivodesc._visible = false;
   this.objetivodesc.btncompletar.addEventListener("click",this);
   this.objetivodesc.btnentregar.addEventListener("click",this);
   this.panelobjev.generalObjetivos.Obj.addEventListener("click",this);
   this.panelobjev.generalObjetivos.Obj.addEventListener("click",this);
   this.panelobjev.generalObjetivos.btnCompletarObj.addEventListener("click",this);
   this.panelobjev.generalObjetivos.btnCompletarObj.label = this.api.lang.getText("OBJETIVOS_ACCEPT");
   this.objetivodesc.btnentregar.label = "Livrer";
   this._btnVisual.label = this.api.lang.getText("CLOSE");
   this.objetivodesc.btncompletar.label = this.api.lang.getText("OBJETIVOS_COMPLET");
   this._btnObjetivos._visible = true;
   this._btnPanel.addEventListener("click",this);
   this._btnObje.addEventListener("click",this);
   this._btnExtraB.addEventListener("click",this);
   this._btnObjetivos.addEventListener("click",this);
   this.objetivodesc.cerrar.addEventListener("click",this);
   this._btnPvP.addEventListener("click",this);
   this._btnMount.addEventListener("click",this);
   this._btnGuild.addEventListener("click",this);
   this._btnStatsJob.addEventListener("click",this);
   this._btnSpells.addEventListener("click",this);
   this._btnInventory.addEventListener("click",this);
   this._btnQuests.addEventListener("click",this);
   this._btnMap.addEventListener("click",this);
   this._btnFriends.addEventListener("click",this);
   this._btnFights.addEventListener("click",this);
   this._btnHelp.addEventListener("click",this);
   this._btnPvP.addEventListener("over",this);
   this._btnMount.addEventListener("over",this);
   this._btnGuild.addEventListener("over",this);
   this._btnStatsJob.addEventListener("over",this);
   this._btnSpells.addEventListener("over",this);
   this._btnInventory.addEventListener("over",this);
   this._btnQuests.addEventListener("over",this);
   this._btnMap.addEventListener("over",this);
   this._btnFriends.addEventListener("over",this);
   this._btnFights.addEventListener("over",this);
   this._btnHelp.addEventListener("over",this);
   this._btnPvP.addEventListener("out",this);
   this._btnMount.addEventListener("out",this);
   this._btnGuild.addEventListener("out",this);
   this._btnStatsJob.addEventListener("out",this);
   this._btnSpells.addEventListener("out",this);
   this._btnInventory.addEventListener("out",this);
   this._btnQuests.addEventListener("out",this);
   this._btnMap.addEventListener("out",this);
   this._btnFriends.addEventListener("out",this);
   this._btnFights.addEventListener("out",this);
   this._btnHelp.addEventListener("out",this);
   this._btnStatsJob.tabIndex = 0;
   this._btnSpells.tabIndex = 1;
   this._btnInventory.tabIndex = 2;
   this._btnQuests.tabIndex = 3;
   this._btnMap.tabIndex = 4;
   this._btnFriends.tabIndex = 5;
   this._btnGuild.tabIndex = 6;
   this._ccChrono.addEventListener("finalCountDown",this);
   this._ccChrono.addEventListener("beforeFinalCountDown",this);
   this._ccChrono.addEventListener("tictac",this);
   this._ccChrono.addEventListener("finish",this);
   this._cChat.addEventListener("filterChanged",this);
   this._cChat.addEventListener("selectSmiley",this);
   this._cChat.addEventListener("selectEmote",this);
   this._cChat.addEventListener("href",this);
   this._oData.addEventListener("lpChanged",this);
   this._oData.addEventListener("lpMaxChanged",this);
   this._btnNextTurn.addEventListener("click",this);
   this._btnNextTurn.addEventListener("over",this);
   this._btnNextTurn.addEventListener("out",this);
   this._btnGiveUp.addEventListener("click",this);
   this._btnGiveUp.addEventListener("over",this);
   this._btnGiveUp.addEventListener("out",this);
   this._oData.SpellsManager.addEventListener("spellLaunched",this);
   this._oData.SpellsManager.addEventListener("nextTurn",this);
   this._pvAP.addEventListener("over",this);
   this._pvAP.addEventListener("out",this);
   this._pvMP.addEventListener("over",this);
   this._pvMP.addEventListener("out",this);
   this._oData.Spells.addEventListener("modelChanged",this);
   this._oData.Inventory.addEventListener("modelChanged",this);
   this._oData.MovableSpells.addEventListener("modelChanged",this);
   this.notify._mcNotif4._btnOpen.addEventListener("click",this);
   this.notify._mcNotif4.cerrarNot.addEventListener("click",this);
   this._btnVisual.addEventListener("click",this);
   this._btnBonus.addEventListener("click",this);
   this._btnBonus.addEventListener("over",this);
   this._btnBonus.addEventListener("out",this);
   this._btnComd.addEventListener("click",this);
   this._btnComd.addEventListener("over",this);
   this._btnComd.addEventListener("out",this);
   this._btnServicio6.addEventListener("click",this);
   this._btnFinaccion.addEventListener("click",this);
   this._btnDeblo.addEventListener("click",this);
   this._hHeart.onRollOver = function()
   {
      this._parent.over({target:this});
   };
   this._hHeart.onRollOut = function()
   {
      this._parent.out({target:this});
   };
   this._hHeart.onRelease = function()
   {
      this.toggleDisplay();
   };
   this.SubMenu._visible = false;
   this._btnAlmanax._visible = false;
   this._btnBigStore._visible = false;
   this._btnKoli._visible = false;
   this._btnDailyDash._visible = false;
   this.mostrarBotones();
};
_loc1.activarRecompensa = function()
{
   this._btnRecompensas._visible = true;
};
_loc1.visualizar = function(nombre, b)
{
   if(b == 1)
   {
      b = true;
   }
   else
   {
      b = false;
   }
   this._ldrVisual._visible = b;
   this._txtVisual._visible = b;
   this._btnVisual._visible = b;
   this._txtVisual.text = this.api.lang.getText("VISUALIZANDO") + " " + nombre;
};
_loc1.ocultarRecompensa = function()
{
   this._btnRecompensas._visible = false;
};
_loc1.ActualizarBarras = function()
{
   this._msShortcuts.Actualizar();
};
_loc1.removerData = function()
{
   this._oData.data.removeEventListener("lpChanged",this);
   this._oData.data.removeEventListener("apChanged",this);
   this._oData.data.removeEventListener("mpChanged",this);
};
_loc1.actualizarData = function()
{
   this._oData.data.addEventListener("lpChanged",this);
   this._oData.data.addEventListener("apChanged",this);
   this._oData.data.addEventListener("mpChanged",this);
   this.apChanged({value:Math.max(0,this._oData.data.AP)});
   this.mpChanged({value:Math.max(0,this._oData.data.MP)});
};
_loc1.mostrarBotones = function()
{
   this._btnOneWindows._visible = this.api.datacenter.Game.isFight == false;
   this._btnTactico._visible = this.api.datacenter.Game.isFight == true;
   this._btnAntiLag._visible = this.api.datacenter.Game.isFight == true;
   this._btnCriatura._visible = this.api.datacenter.Game.isFight == true;
   this._btnTacticoMaitre._visible = this.api.datacenter.Game.isFight == false;
   this._btnAntiLagTp._visible = this.api.datacenter.Game.isFight == false;
   this._btnOneWindow._visible = this.api.datacenter.Game.isFight == false;
   this._btnHardcore._visible = this.api.datacenter.Game.isFight == false;
   this._btnShow._visible = this.api.datacenter.Game.isFight == false;
   this._btnOgrinas._visible = this.api.datacenter.Game.isFight == false;
   this.HdV._visible = this.api.datacenter.Game.isFight == false;
   this.logros._visible = this.api.datacenter.Game.isFight == false;
   this.Pase._visible = this.api.datacenter.Game.isFight == false;
   this.Ladder._visible = this.api.datacenter.Game.isFight == false;
   this._btnTemporis._visible = this.api.datacenter.Game.isFight == false;
   this._btnObjetivos._visible = this.api.datacenter.Game.isFight == false;
   this._cChat.Ladder._visible = this.api.datacenter.Game.isFight == false;
   this._cChat._btnOgrinas._visible = this.api.datacenter.Game.isFight == false;
   this._cChat.HdV._visible = this.api.datacenter.Game.isFight == false;
   this._cChat.Pase._visible = this.api.datacenter.Game.isFight == false;
   this._cChat.logros._visible = this.api.datacenter.Game.isFight == false;
   this._cChat._btnBestiario._visible = this.api.datacenter.Game.isFight == false;
   this._cChat._btnFightPos._visible = this.api.datacenter.Game.isFight == false;
   this._cChat._btnOrnamentos._visible = this.api.datacenter.Game.isFight == false;
   this._btnFinaccion._visible = this.api.datacenter.Game.isFight == true;
   this._btnDeblo._visible = this.api.datacenter.Game.isFight == false;
};
_loc1.getCurrentPercent = function()
{
   var _loc2_ = Math.floor((this.api.datacenter.Player.XP - this.api.datacenter.Player.XPlow) / (this.api.datacenter.Player.XPhigh - this.api.datacenter.Player.XPlow) * 100) + "%";
   return _loc2_;
};
_loc1.over = function(_loc2_)
{
   if(!this.gapi.isCursorHidden())
   {
      return undefined;
   }
   var _loc6_;
   var _loc10_;
   var _loc8_;
   var _loc9_;
   var _loc7_;
   var _loc5_;
   var _loc4_;
   var _loc3_;
   switch(_loc2_.target._name)
   {
      case "_btnTemporis":
         this.gapi.showTooltip(this.api.lang.getText("TEMPORIS"),_loc2_.target,-20,{bXLimit:false,bYLimit:false});
         return;
      case "_btnBonus":
         this.gapi.showTooltip(this.api.lang.getText("BONUS_PANEL"),_loc2_.target,-20,{bXLimit:false,bYLimit:false});
         return;
      case "_btnHelp":
         this.gapi.showTooltip(this.api.lang.getText("CHAT_MENU"),_loc2_.target,-20,{bXLimit:false,bYLimit:false});
         return;
      case "_btnGiveUp":
         if(this.api.datacenter.Game.isSpectator)
         {
            _loc6_ = this.api.lang.getText("GIVE_UP_SPECTATOR");
         }
         else if(this.api.datacenter.Game.fightType == dofus["\x0b\b"].GameManager.FIGHT_TYPE_CHALLENGE || !this.api.datacenter.Basics.aks_current_server.isHardcore())
         {
            _loc6_ = this.api.lang.getText("GIVE_UP");
         }
         else
         {
            _loc6_ = this.api.lang.getText("SUICIDE");
         }
         this.gapi.showTooltip(_loc6_,_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnPvP":
         this.gapi.showTooltip(this.api.lang.getText("CONQUEST_WORD"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnMount":
         this.gapi.showTooltip(this.api.lang.getText("MY_MOUNT"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnGuild":
         this.gapi.showTooltip(this.api.lang.getText("YOUR_GUILD"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnStatsJob":
         this.gapi.showTooltip(this.api.lang.getText("YOUR_STATS_JOB"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         if(this.api.datacenter.Player.Level == 200)
         {
            this.gapi.showTooltip(this.api.lang.getText("YOUR_STATS_JOB"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
            return;
         }
         _loc10_ = this.api.datacenter.Player.XPhigh - this.api.datacenter.Player.XPlow;
         _loc8_ = this.getCurrentPercent();
         _loc9_ = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc10_).addMiddleChar(" ",3);
         this.gapi.showTooltip(this.api.lang.getText("YOUR_STATS_JOB") + "\n\n" + this.api.lang.getText("NEXT_LEVEL") + " " + _loc8_ + "\n" + this.api.lang.getText("REQUIRED") + " " + _loc9_ + " " + this.api.lang.getText("WORD_XP"),_loc2_.target,-54,{bXLimit:true,bYLimit:false});
         return;
         break;
      case "_btnSpells":
         this.gapi.showTooltip(this.api.lang.getText("YOUR_SPELLS"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnQuests":
         this.gapi.showTooltip(this.api.lang.getText("YOUR_QUESTS"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnInventory":
         _loc10_ = new ank["\x1e\n\x07"]["\x0e\x1c"](this.api.datacenter.Player.currentWeight).addMiddleChar(" ",3);
         _loc8_ = new ank["\x1e\n\x07"]["\x0e\x1c"](this.api.datacenter.Player.maxWeight).addMiddleChar(" ",3);
         _loc9_ = this.api.lang.getText("PLAYER_WEIGHT",[_loc10_,_loc8_]);
         this.gapi.showTooltip(this.api.lang.getText("YOUR_INVENTORY") + "\n\n" + _loc9_,_loc2_.target,-43,{bXLimit:true,bYLimit:false});
         return;
      case "_btnMap":
         this.gapi.showTooltip(this.api.lang.getText("YOUR_BOOK"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnFriends":
         this.gapi.showTooltip(this.api.lang.getText("YOUR_FRIENDS"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnFights":
         if(this._nFightsCount != 0)
         {
            this.gapi.showTooltip(ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("FIGHTS_ON_SERVER",[this._nFightsCount]),"m",this._nFightsCount < 2),_loc2_.target,-20,{bYLimit:false});
            return;
         }
         return;
         break;
      case "_btnNextTurn":
         this.gapi.showTooltip(this.api.lang.getText("NEXT_TURN"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_pvAP":
         this.gapi.showTooltip(this.api.lang.getText("ACTIONPOINTS"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_pvMP":
         this.gapi.showTooltip(this.api.lang.getText("MOVEPOINTS"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_mcXtra":
         switch(this._sCurrentCircleXtra)
         {
            case "compass":
               _loc7_ = _loc2_.target.targetCoords;
               if(_loc7_ == undefined)
               {
                  this.gapi.showTooltip(this.api.lang.getText("BANNER_SET_FLAG"),_loc2_.target,0,{bXLimit:true,bYLimit:false});
                  break;
               }
               this.gapi.showTooltip(_loc7_[0] + ", " + _loc7_[1],_loc2_.target,0,{bXLimit:true,bYLimit:false});
               break;
            case "clock":
               this.gapi.showTooltip(this.api.kernel.NightManager.time + "\n" + this.api.kernel.NightManager.getCurrentDateString(),_loc2_.target,0,{bXLimit:true,bYLimit:false});
         }
         if(!this.api.datacenter.Game.isFight)
         {
            this.setXtraMask(this._mcCircleXtraMaskBig);
            this.moveHeart(true);
            dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].showGaugeMode(this);
            return;
         }
         return;
         break;
      case "_hHeart":
         this.gapi.showTooltip(this.api.lang.getText("HELP_LIFE"),_loc2_.target,-20);
         return;
      default:
         switch(this._msShortcuts.currentTab)
         {
            case "Spells":
               _loc5_ = _loc2_.target.contentData;
               if(_loc5_ != undefined)
               {
                  this.gapi.showTooltip(_loc5_.name + " (" + _loc5_.apCost + " " + this.api.lang.getText("AP") + (_loc5_.actualCriticalHit > 0 ? ", " + this.api.lang.getText("ACTUAL_CRITICAL_CHANCE") + ": 1/" + _loc5_.actualCriticalHit : "") + ")",_loc2_.target,-20,{bXLimit:true,bYLimit:false});
               }
               break;
            case "Items":
               _loc4_ = _loc2_.target.contentData;
               if(_loc4_ != undefined)
               {
                  _loc3_ = _loc4_.name;
                  if(this.gapi.getUIComponent("Inventory") == undefined)
                  {
                     if(_loc4_.canUse && _loc4_.canTarget)
                     {
                        _loc3_ += "\n" + this.api.lang.getText("HELP_SHORTCUT_DBLCLICK_CLICK");
                     }
                     else
                     {
                        if(_loc4_.canUse)
                        {
                           _loc3_ += "\n" + this.api.lang.getText("HELP_SHORTCUT_DBLCLICK");
                        }
                        if(_loc4_.canTarget)
                        {
                           _loc3_ += "\n" + this.api.lang.getText("HELP_SHORTCUT_CLICK");
                        }
                     }
                  }
                  this.gapi.showTooltip(_loc3_,_loc2_.target,-30,{bXLimit:true,bYLimit:false});
               }
            default:
               return;
         }
   }
};
_loc1.SubCerrado = false;
_loc1.click = function(oEvent)
{
   this.api.kernel.GameManager.signalFightActivity();
   var _loc6_;
   var _loc8_;
   var _loc3_;
   var _loc5_;
   var _loc10_;
   switch(oEvent.target._name)
   {
      case "_btnTemporis":
         this.api.network.send("wY");
         break;
      case "_btnServicio6":
         this.gapi.showTooltip(this.api.lang.getText("SERVICIO_6"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnComd":
         _loc6_ = this.api.ui.createPopupMenu();
         _loc6_.addStaticItem("ZONAS DE TRANSPORTE");
         _loc6_.addItem("Start",this.api.network,this.api.network.send,["BM*|.start|"]);
         _loc6_.addStaticItem("COMANDOS");
         _loc6_.addItem("Finalizar Acción",this.api.network,this.api.network.send,["BM*|.finaccion|"]);
         _loc6_.addItem("Deblo",this.api.network,this.api.network.send,["BM*|.Deblo|"]);
         _loc6_.addItem("Guardar",this.api.network,this.api.network.send,["BM*|.salvar|"]);
         _loc6_.show(_root._xmouse,_root._ymouse);
         break;
      case "_btnFinaccion":
         this.api.sounds.events.onBannerRoundButtonClick();
         this.api.network.send("BM*|.finaccion|");
         break;
      case "_btnDeblo":
         this.api.sounds.events.onBannerRoundButtonClick();
         this.api.network.send("BM*|.Deblo|");
         break;
      case "_btnVisual":
         this.api.network.send("AMx");
         this.visualizar("Jeimar",0);
         break;
      case "_btnBonus":
         this.api.network.send("Apb");
         break;
      case "_btnOneWindows":
         this.gapi.loadUIAutoHideComponent("PanelMaitre","PanelMaitre");
         this.api.network.send("kS");
         break;
      case "_btnHardcore":
         this.api.network.send("XDJ");
         break;
      case "_btnAntiLagTp":
         this.api.network.send("XD2");
         break;
      case "_btnTacticoMaitre":
         this.api.network.send("XD1");
         break;
      case "_btnStart":
         this.api.network.send("XDJ");
         break;
      case "_btnObjetivos":
         this.api.sounds.events.onBannerRoundButtonClick();
         this.showSmileysEmotesPanel(false);
         if(this.Objetivos == false)
         {
            this.api.network.send("wr");
            break;
         }
         this.panelobjev.gotoAndPlay(19);
         this.Objetivos = false;
         this.CompruebaCerro();
         break;
      case "_btnOpen":
         this.api.network.send("wC");
         if(this.Notificacion == true)
         {
            this.notify.gotoAndPlay(8);
            this.Notificacion = false;
         }
         break;
      case "cerrarNot":
         if(this.Notificacion == true)
         {
            this.notify.gotoAndPlay(8);
            this.Notificacion = false;
         }
         break;
      case "_btnMore":
         this.gapi.loadUIAutoHideComponent("BannerMenuIco","BannerMenuIco");
         break;
      case "_btnPvP":
         this.api.sounds.events.onBannerRoundButtonClick();
         if(this.api.datacenter.Player.data.alignment.index == 0)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("NEED_ALIGNMENT"),"ERROR_CHAT");
            break;
         }
         this.showSmileysEmotesPanel(false);
         this.gapi.loadUIAutoHideComponent("Conquest","Conquest",{currentTab:"Stats"});
         break;
      case "_btnMount":
         this.api.sounds.events.onBannerRoundButtonClick();
         if(this._oData.isMutant)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_U_ARE_MUTANT"),"ERROR_CHAT");
            return undefined;
         }
         if(this._oData.mount != undefined)
         {
            this.showSmileysEmotesPanel(false);
            if(this.gapi.getUIComponent("MountAncestorsViewer") != undefined)
            {
               this.gapi.unloadUIComponent("MountAncestorsViewer");
               this.gapi.unloadUIComponent("Mount");
               break;
            }
            this.gapi.loadUIAutoHideComponent("Mount","Mount");
            break;
         }
         this.api.kernel.showMessage(undefined,this.api.lang.getText("UI_ONLY_FOR_MOUNT"),"ERROR_CHAT");
         break;
      case "cerrar":
         this.objetivodesc._visible = false;
         break;
      case "_btnShow":
         if(this.SubCerrado == false)
         {
            this._SubMenu._visible = true;
            this._btnAlmanax._visible = true;
            this._btnBigStore._visible = true;
            this._btnKoli._visible = true;
            this.SubCerrado = true;
            this._btnDailyDash._visible = true;
            break;
         }
         this._SubMenu._visible = false;
         this._btnAlmanax._visible = false;
         this._btnBigStore._visible = false;
         this._btnKoli._visible = false;
         this.SubCerrado = false;
         this._btnDailyDash._visible = false;
         break;
      case "_btnObje":
         this.api.sounds.events.onBannerRoundButtonClick();
         this.showSmileysEmotesPanel(false);
         if(this.Objetivos == false)
         {
            this.api.network.send("wr");
            break;
         }
         this.panelobjev.gotoAndPlay(19);
         this.Objetivos = false;
         this.CompruebaCerro();
         break;
      case "btnCompletarObj":
         this.api.network.send("wX");
         if(this.Objetivos == true)
         {
            this.panelobjev.gotoAndPlay(19);
            this.Objetivos = false;
            this.objetivodesc._visible = false;
         }
         break;
      case "btnentregar":
         this.api.network.send("wP" + this.Posicion);
         if(this.Objetivos == true)
         {
            this.panelobjev.gotoAndPlay(19);
            this.Objetivos = false;
            this.objetivodesc._visible = false;
         }
         break;
      case "_btnGuild":
         this.api.sounds.events.onBannerRoundButtonClick();
         if(this._oData.isMutant && !this.api.datacenter.Player.isAuthorized)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_U_ARE_MUTANT"),"ERROR_CHAT");
            return undefined;
         }
         if(this._oData.guildInfos != undefined)
         {
            this.showSmileysEmotesPanel(false);
            this.api.network.send("wg");
            break;
         }
         this.api.kernel.showMessage(undefined,this.api.lang.getText("UI_ONLY_FOR_GUILD"),"ERROR_CHAT");
         break;
      case "_btnStatsJob":
         this.api.sounds.events.onBannerRoundButtonClick();
         if(this._oData.isMutant)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_U_ARE_MUTANT"),"ERROR_CHAT");
            return undefined;
         }
         this.showSmileysEmotesPanel(false);
         this.gapi.loadUIAutoHideComponent("StatsJob","StatsJob");
         break;
      case "_btnSpells":
         this.api.sounds.events.onBannerRoundButtonClick();
         if(this._oData.isMutant)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_U_ARE_MUTANT"),"ERROR_CHAT");
            return undefined;
         }
         this.showSmileysEmotesPanel(false);
         this.gapi.loadUIAutoHideComponent("Spells","Spells");
         break;
      case "_btnInventory":
         this.api.sounds.events.onBannerRoundButtonClick();
         this.showSmileysEmotesPanel(false);
         this.gapi.loadUIAutoHideComponent("Inventory","Inventory");
         break;
      case "_btnQuests":
         this.api.sounds.events.onBannerRoundButtonClick();
         this.showSmileysEmotesPanel(false);
         this.gapi.loadUIAutoHideComponent("Quests","Quests");
         break;
      case "_btnMap":
         this.api.sounds.events.onBannerRoundButtonClick();
         this.showSmileysEmotesPanel(false);
         this.gapi.loadUIAutoHideComponent("MapExplorer","MapExplorer");
         break;
      case "_btnFriends":
         this.api.sounds.events.onBannerRoundButtonClick();
         this.showSmileysEmotesPanel(false);
         this.gapi.loadUIAutoHideComponent("Friends","Friends");
         break;
      case "_btnFights":
         if(!this.api.datacenter.Game.isFight)
         {
            this.gapi.loadUIComponent("FightsInfos","FightsInfos",null,{bAlwaysOnTop:true});
         }
         break;
      case "_btnHelp":
         _loc8_ = this.api.lang.getConfigText("CHAT_FILTERS");
         _loc3_ = this.api.ui.createPopupMenu();
         _loc3_.addStaticItem(this.api.lang.getText("CHAT_PREFIX"));
         _loc3_.addItem(this.api.lang.getText("DEFAUT"),this,this.setChatPrefix,[""]);
         _loc3_.addItem(this.api.lang.getText("TEAM") + " (/t)",this,this.setChatPrefix,["/t"],this.api.datacenter.Game.isFight);
         _loc3_.addItem(this.api.lang.getText("PARTY") + " (/p)",this,this.setChatPrefix,["/p"],this.api.ui.getUIComponent("Party") != undefined);
         _loc3_.addItem(this.api.lang.getText("GUILD") + " (/g)",this,this.setChatPrefix,["/g"],this.api.datacenter.Player.guildInfos != undefined);
         if(_loc8_[4])
         {
            _loc3_.addItem(this.api.lang.getText("ALIGNMENT") + " (/a)",this,this.setChatPrefix,["/a"],this.api.datacenter.Player.alignment.index != 0);
         }
         if(_loc8_[5])
         {
            _loc3_.addItem(this.api.lang.getText("RECRUITMENT") + " (/r)",this,this.setChatPrefix,["/r"]);
         }
         if(_loc8_[6])
         {
            _loc3_.addItem(this.api.lang.getText("TRADE") + " (/b)",this,this.setChatPrefix,["/b"]);
         }
         if(_loc8_[7])
         {
            _loc3_.addItem(this.api.lang.getText("MEETIC") + " (/i)",this,this.setChatPrefix,["/i"]);
         }
         if(this.api.datacenter.Player.isAuthorized)
         {
            _loc3_.addItem(this.api.lang.getText("PRIVATE_CHANNEL") + " (/q)",this,this.setChatPrefix,["/q"]);
         }
         _loc4_.addItem("Naeris (.all)",this,this.setChatPrefix,[".all"]);
         _loc3_.addItem(this.api.lang.getText("HELP"),this,this.displayChatHelp,[]);
         _loc3_.show(this._btnHelp._x,this._btnHelp._y,true);
         break;
      case "_btnNextTurn":
         if(this.api.datacenter.Game.isFight)
         {
            this.api.network.Game.prepareTurnEnd();
         }
         break;
      case "_btnGiveUp":
         if(this.api.datacenter.Game.isFight)
         {
            if(this.api.datacenter.Game.isSpectator)
            {
               this.api.network.Game.leave();
               break;
            }
            this.api.kernel.GameManager.giveUpGame();
         }
         break;
      case "_mcXtra":
         if(!this.api.datacenter.Player.isAuthorized || this.api.datacenter.Player.isAuthorized && !Key.isDown(16))
         {
            if(this._sCurrentCircleXtra == "helper" && dofus["\x0b\b"].TipsManager.getInstance().hasNewTips())
            {
               dofus["\x0b\b"].TipsManager.getInstance().displayNextTips();
               break;
            }
            _loc5_ = this.api.ui.createPopupMenu();
            _loc5_.addItem(this.api.lang.getText("SHOW") + " >>",dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"],dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].showGaugeModeSelectMenu,[this]);
            if(this._sCurrentCircleXtra == "helper")
            {
               _loc5_.addStaticItem(this.api.lang.getText("HELP_ME"));
               _loc5_.addItem(this.api.lang.getText("KB_TITLE"),this.api.ui,this.api.ui.loadUIComponent,["KnownledgeBase","KnownledgeBase"],true);
               _loc5_.addStaticItem(this.api.lang.getText("OTHER_DISPLAY_OPTIONS"));
            }
            _loc5_.addItem(this.api.lang.getText("BANNER_ARTWORK"),this,this.showCircleXtra,["artwork",true,{bMask:true,bUpdateGauge:true}],this._sCurrentCircleXtra != "artwork");
            _loc5_.addItem(this.api.lang.getText("BANNER_CLOCK"),this,this.showCircleXtra,["clock",true,{bMask:true,bUpdateGauge:true}],this._sCurrentCircleXtra != "clock");
            _loc5_.addItem(this.api.lang.getText("BANNER_COMPASS"),this,this.showCircleXtra,["compass",true,{bUpdateGauge:true}],this._sCurrentCircleXtra != "compass");
            _loc5_.addItem(this.api.lang.getText("BANNER_HELPER"),this,this.showCircleXtra,["helper",true,{bUpdateGauge:true}],this._sCurrentCircleXtra != "helper");
            _loc5_.addItem(this.api.lang.getText("BANNER_MAP"),this,this.showCircleXtra,["map",true,{bMask:true,bUpdateGauge:true}],this._sCurrentCircleXtra != "map");
            _loc5_.show(_root._xmouse,_root._ymouse,true);
            break;
         }
         this.api.kernel.GameManager.showPlayerPopupMenu(undefined,this.api.datacenter.Player.Name);
         break;
      default:
         if(this._msShortcuts.currentTab != "Spells")
         {
            break;
         }
         this.api.sounds.events.onBannerSpellSelect();
         if(this.api.kernel.TutorialManager.isTutorialMode)
         {
            this.api.kernel.TutorialManager.onWaitingCase({code:"SPELL_CONTAINER_SELECT",params:[Number(oEvent.target._name.substr(4))]});
            break;
         }
         if(this.gapi.getUIComponent("Spells") != undefined)
         {
            return undefined;
         }
         _loc10_ = oEvent.target.contentData;
         if(_loc10_ == undefined)
         {
            return undefined;
         }
         this.api.kernel.GameManager.switchToSpellLaunch(_loc10_,true);
   }
   this.api.ui.unloadUIComponent("TiendaDung");
};
_loc1.href = function(oEvent)
{
   var _loc2_ = oEvent.params.split(",");
   var _loc3_;
   switch(_loc2_[0])
   {
      case "showEndPanel":
         this.addToQueue({object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.showEndPanel,params:[_loc2_[1]]});
         break;
      case "OpenGuildTaxCollectors":
         this.addToQueue({object:this.gapi,method:this.gapi.loadUIAutoHideComponent,params:["Guild","Guild",{currentTab:"TaxCollectors"},{bStayIfPresent:true}]});
         break;
      case "OpenPayZoneDetails":
         this.addToQueue({object:this.gapi,method:this.gapi.loadUIComponent,params:["PayZoneDialog2","PayZoneDialog2",{name:"El Pemy",gfx:"9059",dialogID:dofus["\r\x14"].gapi.ui.PayZoneDialog.PAYZONE_DETAILS},{bForceLoad:true}]});
         break;
      case "ShowPlayerPopupMenu":
         if(_loc2_[2] != undefined && (String(_loc2_[2]).length > 0 && _loc2_[2] != ""))
         {
            this.addToQueue({object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.showPlayerPopupMenu,params:[undefined,_loc2_[1],null,null,null,_loc2_[2],this.api.datacenter.Player.isAuthorized]});
         }
         else
         {
            this.addToQueue({object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.showPlayerPopupMenu,params:[undefined,_loc2_[1]]});
         }
         break;
      case "ShowItemViewer":
         _loc3_ = this.api.kernel.ChatManager.getItemFromBuffer(Number(_loc2_[1]));
         if(_loc3_ == undefined)
         {
            this.addToQueue({object:this.api.kernel,method:this.api.kernel.showMessage,params:[this.api.lang.getText("ERROR_WORD"),this.api.lang.getText("ERROR_ITEM_CANT_BE_DISPLAYED"),"ERROR_BOX"]});
         }
         else
         {
            this.addToQueue({object:this.api.ui,method:this.api.ui.loadUIComponent,params:["ItemViewer","ItemViewer",{item:_loc3_},{bAlwaysOnTop:true}]});
         }
         break;
      case "updateCompass":
         this.api.kernel.GameManager.updateCompass(Number(_loc2_[1]),Number(_loc2_[2]));
         break;
      case "ShowLinkWarning":
         this.addToQueue({object:this.api.ui,method:this.api.ui.loadUIComponent,params:["AskLinkWarning","AskLinkWarning",{text:this.api.lang.getText(_loc2_[1])}]});
      default:
         return;
   }
};
_loc1.addProperty("data",function()
{
}
,_loc1.__set__data);
ASSetPropFlags(_loc1,null,1);
_loc1.Notificacion = false;
_loc1.Objetivos = false;
#endinitclip