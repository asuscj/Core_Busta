#initclip 33

var _loc1 = dofus["\r\x14"].gapi.ui.Banner.prototype;
_loc1.createChildren = function()
{
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
   var k = 0;
   while(k < 10)
   {
      duplicateMovieClip(this.snow,"snow" + k,16384 + k);
      k++;
   }
   this._btnOgrina._visible = false;
   this._btnPase._visible = false;
   this._btnLogin._visible = false;
   this._btnPrestigio._visible = false;
   this._btnRuleta._visible = false;
};
_loc1.__get__currentOverItem = function()
{
   return this._msShortcuts.currentOverItem;
};
_loc1.createSpellActionPopupMenu = function(_loc2_)
{
   var _loc3_ = this.api.ui.createPopupMenu();
   _loc3_.addItem(this.api.lang.getText("REMOVE_SPELL"),this.api.network.Spells,this.api.network.Spells.spellRemove,[_loc2_.position],!_loc2_.isUndeletable);
   _loc3_.show(_root._xmouse,_root._ymouse,true);
};
_loc1.createInventoryShortcutItemActionPopupMenu = function(oInventoryShortcut)
{
   var _loc3_ = this.api.ui.createPopupMenu();
   _loc3_.addItem(this.api.lang.getText("REMOVE_ITEM"),this.api.network.InventoryShortcuts,this.api.network.InventoryShortcuts.sendInventoryShortcutRemove,[oInventoryShortcut.position],false);
   _loc3_.show(_root._xmouse,_root._ymouse,true);
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
_loc1.updatePvPButtonState = function()
{
   var _loc2_ = this.api.datacenter.Player.huntMatchmakingStatus;
   if(_loc2_ == undefined)
   {
      return undefined;
   }
   var _loc3_ = _loc2_.currentStatus;
   switch(_loc3_)
   {
      case "WAITING_FOR_TARGET":
         this._btnPvP.backgroundDown = "ButtonBannerRoundInSearchDown";
         this._btnPvP.backgroundUp = "ButtonBannerRoundInSearchUp";
         break;
      case "WAITING_FOR_START_CONFIRMATION":
         this._btnPvP.backgroundDown = "ButtonBannerRoundWaitResponseDown";
         this._btnPvP.backgroundUp = "ButtonBannerRoundWaitResponseUp";
         break;
      case "WAITING_FOR_CONFIRMATION_HURRY":
         this._btnPvP.backgroundDown = "ButtonBannerRoundWaitResponseDown";
         this._btnPvP.backgroundUp = "ButtonBannerRoundWaitResponseUp";
         break;
      case "WAITING_FOR_START_CONFIRMATION_TIMEOUT":
      case "PLAYER_LEFT_MATCHMAKING":
      case "HUNT_STARTED":
         this._btnPvP.backgroundDown = "ButtonBannerRoundDown";
         this._btnPvP.backgroundUp = "ButtonBannerRoundUp";
   }

};
_loc1.huntMatchmakingStatusChanged = function()
{
   this.updatePvPButtonState();
};
_loc1.href = function(_loc2_)
{
   var _loc3_ = _loc2_.params.split(",");
   var _loc4_;

   switch(_loc3_[0])
   {
      case "HunterAcceptPvPHunt":
         this.addToQueue({object:this.api.network.Game,method:this.api.network.Game.hunterAcceptPvPHunt});
         break;
      case "OpenPayZoneDetails":
         this.addToQueue({object:this.gapi,method:this.gapi.loadUIComponent,params:["PayZoneDialog2","PayZoneDialog2",{name:"El Pemy",gfx:"9059",dialogID:dofus["\r\x14"].gapi.ui.PayZoneDialog.PAYZONE_DETAILS},{bForceLoad:true}]});
         break;
      case "ShowPlayerPopupMenu":
         if(_loc3_[2] != undefined && (String(_loc3_[2]).length > 0 && _loc3_[2] != ""))
         {
            this.addToQueue({object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.showPlayerPopupMenu,params:[undefined,_global.unescape(_loc3_[1]),null,null,null,_loc3_[2],this.api.datacenter.Player.isAuthorized]});
         }
         else
         {
            this.addToQueue({object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.showPlayerPopupMenu,params:[undefined,_global.unescape(_loc3_[1]),null,null,null,null,this.api.datacenter.Player.isAuthorized]});
         }
         break;
      case "ShowMessagePopupMenu":
         if(_loc3_[3] != undefined && (String(_loc3_[3]).length > 0 && _loc3_[3] != ""))
         {
            this.addToQueue({object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.showMessagePopupMenu,params:[_loc3_[1],_global.unescape(_loc3_[2]),_loc3_[3]]});
         }
         else
         {
            this.addToQueue({object:this.api.kernel.GameManager,method:this.api.kernel.GameManager.showMessagePopupMenu,params:[_loc3_[1],_global.unescape(_loc3_[2])]});
         }
         break;
      case "ShowItemViewer":
         _loc4_ = this.api.kernel.ChatManager.getItemFromBuffer(Number(_loc3_[1]));
         if(_loc4_ == undefined)
         {
            this.addToQueue({object:this.api.kernel,method:this.api.kernel.showMessage,params:[this.api.lang.getText("ERROR_WORD"),this.api.lang.getText("ERROR_ITEM_CANT_BE_DISPLAYED"),"ERROR_BOX"]});
            break;
         }
         this.addToQueue({object:this.api.ui,method:this.api.ui.loadUIComponent,params:["ItemViewer","ItemViewer",{item:_loc4_},{bAlwaysOnTop:true}]});
         break;
      case "updateCompass":
         this.api.kernel.GameManager.updateCompass(Number(_loc3_[1]),Number(_loc3_[2]));
         break;
      case "OpenGuildTaxCollectors":
         this.addToQueue({object:this.gapi,method:this.gapi.loadUIAutoHideComponent,params:["Guild","Guild",{currentTab:"TaxCollectors"},{bStayIfPresent:true}]});
         break;
      case "ShowLinkWarning":
         this.addToQueue({object:this.api.ui,method:this.api.ui.loadUIComponent,params:["AskLinkWarning","AskLinkWarning",{text:this.api.lang.getText(_loc3_[1])}]});
   }
};
_loc1.displayMovableBar = function(bShow)
{
   if(bShow == undefined)
   {
      bShow = this._mcbMovableBar == undefined;
   }
   var _loc4_;
   var _loc5_;
   var _loc2_;
   if(bShow)
   {
      if(this._mcbMovableBar._name != undefined)
      {
         return undefined;
      }
      this._mcbMovableBar = this.api.ui.loadUIComponent("MovableContainerBar","MovableBar",[],{bAlwaysOnTop:true});
      this._mcbMovableBar.addEventListener("drawBar",this);
      this._mcbMovableBar.addEventListener("drop",this);
      this._mcbMovableBar.addEventListener("dblClick",this);
      _loc4_ = {left:0,top:0,right:this.gapi.screenWidth,bottom:this.gapi.screenHeight};
      _loc5_ = this.api.kernel.OptionsManager.getOption("MovableBarSize");
      _loc2_ = this.api.kernel.OptionsManager.getOption("MovableBarCoord");
      _loc2_ = _loc2_ ? _loc2_ : {x:0,y:(this.gapi.screenHeight - this._mcbMovableBar._height) / 2};
      this._mcbMovableBar.forceHorizontal();
      this.addToQueue({object:this._mcbMovableBar,method:this._mcbMovableBar.setOptions,params:[16,20,_loc4_,_loc5_,_loc2_]});
   }
   else
   {
      this.api.ui.unloadUIComponent("MovableBar");
   }
};
_loc1.Cargo = function()
{
   this.api.network.send("wb");
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
   this._btnOneWindow.addEventListener("click",this);
   this._btnTacticoMaitre.addEventListener("click",this);
   this._btnAntiLagTp.addEventListener("click",this);
   this._btnFeedUp.addEventListener("click",this);
   this._btnIpDrop.addEventListener("click",this);
   this._btnTemporis.addEventListener("click",this);
   this._btnTPwar.addEventListener("click",this);
   this._btnShow.addEventListener("click",this);
   this._btnPass.addEventListener("click",this);
   this._btnTacticoMaitre.addEventListener("click",this);
   this._btnAntiLagTp.addEventListener("click",this);
   this._btnLeaderIP.addEventListener("click",this);
   this._btnGrupo.addEventListener("click",this);
   this._btnIpDrop.addEventListener("click",this);
   this.objetivodesc._visible = false;
   this.objetivodesc.btncompletar.addEventListener("click",this);
   this.objetivodesc.btnentregar.addEventListener("click",this);
   this.panelobjev.generalObjetivos.Obj.addEventListener("click",this);
   this.panelobjev.generalObjetivos.Obj.addEventListener("click",this);
   this.panelobjev.generalObjetivos.btnCompletarObj.addEventListener("click",this);
   this.panelobjev.generalObjetivos.btnCompletarObj.label = this.api.lang.getText("OBJETIVOS_ACCEPT");
   this.objetivodesc.btnentregar.label = this.api.lang.getText("OBJETIVOS_DELIVER");
   this.objetivodesc.btncompletar.label = this.api.lang.getText("OBJETIVOS_COMPLET");
   this._btnObjetivos2._visible = false;
   this._btnObjetivos._visible = true;
   this._btnPanel.addEventListener("click",this);
   this._btnObje.addEventListener("click",this);
   this._btnObjetivos.addEventListener("click",this);
   this._btnObjetivos2.addEventListener("click",this);
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
   this.api.datacenter.Player.addEventListener("huntMatchmakingStatusChanged",this);
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
   this._btnObjeGlobalFight.addEventListener("click",this);
   this._btnGiveUp.addEventListener("out",this);
   this._oData.SpellsManager.addEventListener("spellLaunched",this);
   this._oData.SpellsManager.addEventListener("nextTurn",this);
   this._pvAP.addEventListener("over",this);
   this._pvAP.addEventListener("out",this);
   this._pvMP.addEventListener("over",this);
   this._pvMP.addEventListener("out",this);
   this._oData.Spells.addEventListener("modelChanged",this);
   this._oData.Inventory.addEventListener("modelChanged",this);
   this.notify._mcNotif4._btnOpen.addEventListener("click",this);
   this.notify._mcNotif4.cerrarNot.addEventListener("click",this);
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
   this.addToQueue({object:this,method:this.Cargo});
};
_loc1.activarRecompensa = function()
{
   this._btnRecompensas._visible = true;
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
   this._btnTactico._visible = this.api.datacenter.Game.isFight == true;
   this._btnAntiLag._visible = this.api.datacenter.Game.isFight == true;
   this._btnCriatura._visible = this.api.datacenter.Game.isFight == true;
   this._btnTacticoMaitre._visible = this.api.datacenter.Game.isFight == false;
   this._btnAntiLagTp._visible = this.api.datacenter.Game.isFight == false;
   this._btnOneWindow._visible = this.api.datacenter.Game.isFight == false;
   this._btnIpDrop._visible = this.api.datacenter.Game.isFight == false;
   this._btnTPwar._visible = this.api.datacenter.Game.isFight == false;
   this._btnFeedUp._visible = this.api.datacenter.Game.isFight == false;
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
   var _loc9_;
   var _loc6_;
   var _loc8_;
   var _loc7_;
   var _loc10_;
   var _loc5_;
   var _loc4_;
   var _loc3_;
   switch(_loc2_.target._name) // ✅ ETIQUETA ELIMINADA
   {
      case "_btnHelp":
         this.gapi.showTooltip(this.api.lang.getText("CHAT_MENU"),_loc2_.target,-20,{bXLimit:false,bYLimit:false});
         break;
      case "_btnGiveUp":
         if(this.api.datacenter.Game.isSpectator)
         {
            _loc9_ = this.api.lang.getText("GIVE_UP_SPECTATOR");
         }
         else if(this.api.datacenter.Game.fightType == dofus["\x0b\b"].GameManager.FIGHT_TYPE_CHALLENGE || !this.api.datacenter.Basics.aks_current_server.isHardcore())
         {
            _loc9_ = this.api.lang.getText("GIVE_UP");
         }
         else
         {
            _loc9_ = this.api.lang.getText("SUICIDE");
         }
         this.gapi.showTooltip(_loc9_,_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         break;
      case "_btnPvP":
         this.gapi.showTooltip(this.api.lang.getText("CONQUEST_WORD"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         break;
      case "_btnMount":
         this.gapi.showTooltip(this.api.lang.getText("MY_MOUNT"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         break;
      case "_btnGuild":
         this.gapi.showTooltip(this.api.lang.getText("YOUR_GUILD"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         break;
      case "_btnStatsJob":
         this.gapi.showTooltip(this.api.lang.getText("YOUR_STATS_JOB"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         if(this.api.datacenter.Player.Level == 200)
         {
            this.gapi.showTooltip(this.api.lang.getText("YOUR_STATS_JOB"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
            break;
         }
         _loc6_ = this.api.datacenter.Player.XPhigh - this.api.datacenter.Player.XPlow;
         _loc8_ = this.getCurrentPercent();
         _loc7_ = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc6_).addMiddleChar(" ",3);
         this.gapi.showTooltip(this.api.lang.getText("YOUR_STATS_JOB") + "\n\n" + this.api.lang.getText("NEXT_LEVEL") + " " + _loc8_ + "\n" + this.api.lang.getText("REQUIRED") + " " + _loc7_ + " " + this.api.lang.getText("WORD_XP"),_loc2_.target,-54,{bXLimit:true,bYLimit:false});
         break;
      case "_btnSpells":
         this.gapi.showTooltip(this.api.lang.getText("YOUR_SPELLS"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         break;
      case "_btnQuests":
         this.gapi.showTooltip(this.api.lang.getText("YOUR_QUESTS"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         break;
      case "_btnInventory":
         _loc6_ = new ank["\x1e\n\x07"]["\x0e\x1c"](this.api.datacenter.Player.currentWeight).addMiddleChar(" ",3);
         _loc8_ = new ank["\x1e\n\x07"]["\x0e\x1c"](this.api.datacenter.Player.maxWeight).addMiddleChar(" ",3);
         _loc7_ = this.api.lang.getText("PLAYER_WEIGHT",[_loc6_,_loc8_]);
         this.gapi.showTooltip(this.api.lang.getText("YOUR_INVENTORY") + "\n\n" + _loc7_,_loc2_.target,-43,{bXLimit:true,bYLimit:false});
         break;
      case "_btnMap":
         this.gapi.showTooltip(this.api.lang.getText("YOUR_BOOK"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         break;
      case "_btnFriends":
         this.gapi.showTooltip(this.api.lang.getText("YOUR_FRIENDS"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         break;
      case "_btnFights":
         if(this._nFightsCount != 0)
         {
            this.gapi.showTooltip(ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("FIGHTS_ON_MAP",[this._nFightsCount]),"m",this._nFightsCount < 2),_loc2_.target,-20,{bYLimit:false});
         }
         break;
      case "_btnNextTurn":
         this.gapi.showTooltip(this.api.lang.getText("NEXT_TURN"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         break;
      case "_pvAP":
         this.gapi.showTooltip(this.api.lang.getText("ACTIONPOINTS"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         break;
      case "_pvMP":
         this.gapi.showTooltip(this.api.lang.getText("MOVEPOINTS"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         break;
      case "_mcXtra":
         switch(this._sCurrentCircleXtra)
         {
            case "compass":
               _loc10_ = _loc2_.target.targetCoords;
               if(_loc10_ == undefined)
               {
                  this.gapi.showTooltip(this.api.lang.getText("BANNER_SET_FLAG"),_loc2_.target,0,{bXLimit:true,bYLimit:false});
               }
               else
               {
                  this.gapi.showTooltip(_loc10_[0] + ", " + _loc10_[1],_loc2_.target,0,{bXLimit:true,bYLimit:false});
               }
               break;
            case "clock":
               this.gapi.showTooltip(this.api.kernel.NightManager.time + "\n" + this.api.kernel.NightManager.getCurrentDateString(),_loc2_.target,0,{bXLimit:true,bYLimit:false});
         }
         if(!this.api.datacenter.Game.isFight)
         {
            this.setXtraMask(this._mcCircleXtraMaskBig);
            this.moveHeart(true);
            dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].showGaugeMode(this);
         }
         break;
      case "_hHeart":
         this.gapi.showTooltip(this.api.lang.getText("HELP_LIFE"),_loc2_.target,-20);
         break;
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
               break;
         }
   }
};
_loc1.SubCerrado = false;
_loc1.click = function(oEvent)
{
   this.api.kernel.GameManager.signalFightActivity();
   var _loc7_;
   var _loc3_;
   var _loc4_;
   var _loc8_;
   switch(oEvent.target._name)
   {
      case "_btnTemporis":
         this.api.network.send("wY");
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
         }
         else
         {
            this.showSmileysEmotesPanel(false);
            this.gapi.loadUIAutoHideComponent("Conquest","Conquest",{currentTab:"Stats"});
         }
         break;
      case "_btnIpDrop":
         this.api.kernel.Console.process(".ipdrop");
         break;
      case "_btnFeedUp":
         this.api.kernel.Console.process(".heal");
         break;
      case "_btnAntiLagTp":
         this.api.kernel.Console.process(".tp");
         break;
      case "_btnPass":
         this.api.kernel.Console.process(".maitre");
         break;
      case "_btnObjeGlobalFight":
         this.api.network.send("wD");
         break;
      case "_btnLeaderIP":
         this.api.kernel.Console.process(".liderip");
         break;
      case "_btnGrupo":
         this.api.kernel.Console.process(".grupo");
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
            }
            else
            {
               this.gapi.loadUIAutoHideComponent("Mount","Mount");
            }
         }
         else
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("UI_ONLY_FOR_MOUNT"),"ERROR_CHAT");
         }
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
         }
         else
         {
            this._SubMenu._visible = false;
            this._btnAlmanax._visible = false;
            this._btnBigStore._visible = false;
            this._btnKoli._visible = false;
            this.SubCerrado = false;
            this._btnDailyDash._visible = false;
         }
         break;
      case "_btnObje":
         this.api.sounds.events.onBannerRoundButtonClick();
         this.showSmileysEmotesPanel(false);
         if(this.Objetivos == false)
         {
            this.api.network.send("wr");
         }
         else
         {
            this.panelobjev.gotoAndPlay(19);
            this.Objetivos = false;
            this.CompruebaCerro();
         }
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
         this.api.network.send("wR" + this.Posicion);
         if(this.Objetivos == true)
         {
            this.panelobjev.gotoAndPlay(19);
            this.Objetivos = false;
            this.objetivodesc._visible = false;
         }
         break;
      case "_btnGuild":
         this.api.sounds.events.onBannerRoundButtonClick();
         if(this._oData.isMutant)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_U_ARE_MUTANT"),"ERROR_CHAT");
            return undefined;
         }
         if(this._oData.guildInfos != undefined)
         {
            this.showSmileysEmotesPanel(false);
            this.api.network.send("wg");
            this.api.network.send("gIM");
            this.gapi.loadUIAutoHideComponent("Guild","Guild",{currentTab:"Members"});
            this.api.network.send("!G");
         }
         else
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("UI_ONLY_FOR_GUILD"),"ERROR_CHAT");
         }
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
         if(this._oData.isMutant)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_U_ARE_MUTANT"),"ERROR_CHAT");
            return undefined;
         }
         this.api.sounds.events.onBannerRoundButtonClick();
         this.showSmileysEmotesPanel(false);
         this.gapi.loadUIAutoHideComponent("Inventory","Inventory");
         break;
      case "_btnQuests":
         if(this._oData.isMutant)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_U_ARE_MUTANT"),"ERROR_CHAT");
            return undefined;
         }
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
            this.gapi.loadUIComponent("FightsInfos","FightsInfos");
         }
         break;
      case "_btnHelp":
         _loc7_ = this.api.lang.getConfigText("CHAT_FILTERS");
         _loc3_ = this.api.ui.createPopupMenu();
         _loc3_.addStaticItem(this.api.lang.getText("CHAT_PREFIX"));
         _loc3_.addItem(this.api.lang.getText("DEFAUT"),this,this.setChatPrefix,[""]);
         _loc3_.addItem(this.api.lang.getText("TEAM") + " (/t)",this,this.setChatPrefix,["/t"],this.api.datacenter.Game.isFight);
         _loc3_.addItem(this.api.lang.getText("PARTY") + " (/p)",this,this.setChatPrefix,["/p"],this.api.ui.getUIComponent("Party") != undefined);
         _loc3_.addItem(this.api.lang.getText("GUILD") + " (/g)",this,this.setChatPrefix,["/g"],this.api.datacenter.Player.guildInfos != undefined);
         if(_loc7_[4])
         {
            _loc3_.addItem(this.api.lang.getText("ALIGNMENT") + " (/a)",this,this.setChatPrefix,["/a"],this.api.datacenter.Player.alignment.index != 0);
         }
         if(_loc7_[5])
         {
            _loc3_.addItem(this.api.lang.getText("RECRUITMENT") + " (/r)",this,this.setChatPrefix,["/r"]);
         }
         if(_loc7_[6])
         {
            _loc3_.addItem(this.api.lang.getText("TRADE") + " (/b)",this,this.setChatPrefix,["/b"]);
         }
         if(_loc7_[7])
         {
            _loc3_.addItem(this.api.lang.getText("MEETIC") + " (/i)",this,this.setChatPrefix,["/i"]);
         }
         if(this.api.datacenter.Player.isAuthorized)
         {
            _loc3_.addItem(this.api.lang.getText("PRIVATE_CHANNEL") + " (/q)",this,this.setChatPrefix,["/q"]);
         }
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
            }
            else
            {
               this.api.kernel.GameManager.giveUpGame();
            }
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
            _loc4_ = this.api.ui.createPopupMenu();
            _loc4_.addItem(this.api.lang.getText("SHOW") + " >>",dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"],dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].showGaugeModeSelectMenu,[this]);
            if(this._sCurrentCircleXtra == "helper")
            {
               _loc4_.addStaticItem(this.api.lang.getText("HELP_ME"));
               _loc4_.addItem(this.api.lang.getText("KB_TITLE"),this.api.ui,this.api.ui.loadUIComponent,["KnownledgeBase","KnownledgeBase"],true);
               _loc4_.addStaticItem(this.api.lang.getText("OTHER_DISPLAY_OPTIONS"));
            }
            _loc4_.addItem(this.api.lang.getText("BANNER_ARTWORK"),this,this.showCircleXtra,["artwork",true,{bMask:true,bUpdateGauge:true}],this._sCurrentCircleXtra != "artwork");
            _loc4_.addItem(this.api.lang.getText("BANNER_CLOCK"),this,this.showCircleXtra,["clock",true,{bMask:true,bUpdateGauge:true}],this._sCurrentCircleXtra != "clock");
            _loc4_.addItem(this.api.lang.getText("BANNER_COMPASS"),this,this.showCircleXtra,["compass",true,{bUpdateGauge:true}],this._sCurrentCircleXtra != "compass");
            _loc4_.addItem(this.api.lang.getText("BANNER_HELPER"),this,this.showCircleXtra,["helper",true,{bUpdateGauge:true}],this._sCurrentCircleXtra != "helper");
            _loc4_.addItem(this.api.lang.getText("BANNER_MAP"),this,this.showCircleXtra,["map",true,{bMask:true,bUpdateGauge:true}],this._sCurrentCircleXtra != "map");
            _loc4_.show(_root._xmouse,_root._ymouse,true);
         }
         else
         {
            this.api.kernel.GameManager.showPlayerPopupMenu(undefined,this.api.datacenter.Player.Name);
         }
         break;
      default:
         if(this._msShortcuts.currentTab !== "Spells")
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
         _loc8_ = oEvent.target.contentData;
         if(_loc8_ == undefined)
         {
            return undefined;
         }
         this.api.kernel.GameManager.switchToSpellLaunch(_loc8_,true);
         break;
   }
};
_loc1.addProperty("currentOverItem",_loc1.__get__currentOverItem,function()
{
}
);
_loc1.Notificacion = false;
_loc1.Objetivos = false;
#endinitclip