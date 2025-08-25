#initclip 120
var _loc1 = _global.dofus.aks.Game.prototype;
_loc1.getRankHistoryInfo = function()
{
   this.aks.send("gZ",false);
};
_loc1.getInformationsGuild = function()
{
   this.aks.send("gII",true);
};
_loc1.setRankHistory = function(_loc2_)
{
   var _loc2_ = _loc2_.split("~");
   var _loc3_ = _loc2_[0];
   var _loc4_ = _loc2_[1];
   this.api.datacenter.Player.guildInfos.setRankHistory(_loc3_,_loc4_);
};
_loc1.prepareTurnEnd = function()
{
   if(!this.api.datacenter.Game.isRunning || (!this.api.datacenter.Game.isFight || !this.api.datacenter.Player.isCurrentPlayer))
   {
      this.api.kernel.debug("1");
      return undefined;
   }
   var _loc2_ = this.api.datacenter.Player.data.sequencer;
   if(_loc2_.containsAction(this,this.turnEnd))
   {
      this.api.kernel.debug("2");
      return undefined;
   }
   _loc2_.addAction(24,false,this,this.turnEnd,[]);
   _loc2_.execute();
};
_loc1.onTeam = function(_loc2_)
{
   var _loc12_ = _loc2_.split("|");
   var _loc14_ = Number(_loc12_.shift());
   var _loc13_ = this.api.datacenter.Sprites.getItemAt(_loc14_);
   var _loc4_ = 0;
   var _loc6_;
   var _loc11_;
   var _loc7_;
   var _loc3_;
   var _loc10_;
   var _loc8_;
   var _loc9_;
   var _loc5_;
   while(_loc4_ < _loc12_.length)
   {
      _loc6_ = _loc12_[_loc4_].split(";");
      _loc11_ = _loc6_[0].charAt(0) == "+";
      _loc7_ = _loc6_[0].substr(1);
      _loc3_ = _loc6_[1];
      _loc10_ = _loc6_[2];
      _loc8_ = _loc3_.split(",");
      _loc9_ = Number(_loc3_);
      if(_loc8_.length > 1)
      {
         _loc3_ = this.api.lang.getFullNameText(_loc8_);
      }
      else if(!_global.isNaN(_loc9_))
      {
         _loc3_ = this.api.lang.getMonstersText(_loc9_).n;
      }
      if(_loc11_)
      {
         _loc5_ = new Object();
         _loc5_.id = _loc7_;
         _loc5_.name = _loc3_;
         _loc5_.level = _loc10_;
         _loc13_.addPlayer(_loc5_);
      }
      else
      {
         _loc13_.removePlayer(_loc7_);
      }
      _loc4_ += 1;
   }
   _loc13_.refreshSwordSprite();
};
_loc1.sendPacketCFP = function()
{
   this.aks.send("CFP");
};
_loc1.onClearAllEffect = function(sExtraData)
{
   var _loc4_ = sExtraData.split(";");
   var _loc2_ = 0;
   var _loc3_;
   while(_loc2_ < _loc4_.length)
   {
      _loc3_ = this.api.datacenter.Sprites.getItemAt(Number(_loc4_[_loc2_]));
      _loc3_.EffectsManager.terminateAllEffects();
      _loc2_ = _loc2_ + 1;
   }
};
_loc1.ReturnPrestigeOptions = function()
{
   var _loc2_ = this.api.kernel.OptionsManager.getOption("hidePrestige");
   this.aks.send("wZ" + _loc2_);
};
_loc1.getInfosBoostsStats = function()
{
   this.aks.send("gW",false);
};
_loc1.setBoostsStats = function(_loc2_)
{
   var _loc2_ = _loc2_.split("|");
   var _loc5_ = Number(_loc2_[0]);
   var _loc6_ = Number(_loc2_[1]);
   var _loc3_ = _loc2_[2];
   var _loc4_ = _loc2_[3];
   this.api.datacenter.Player.guildInfos.setBoostsStatsNew(_loc5_,_loc6_,_loc3_,_loc4_);
};
_loc1.linkItem = function(sItemId)
{
   this.aks.send("wW" + sItemId);
};
_loc1.ReturnResetOptions = function()
{
   var _loc2_ = this.api.kernel.OptionsManager.getOption("hideReset");
   this.aks.send("wz" + _loc2_);
};
_loc1.ReturnPrestigeOptions = function()
{
   var _loc2_ = this.api.kernel.OptionsManager.getOption("hidePrestige");
   this.aks.send("wZ" + _loc2_);
};
_loc1.onJoin = function(_loc2_)
{
    this.api.ui.getUIComponent("Zoom").callClose();
    this.api.datacenter.Player.guildInfos.defendedTaxCollectorID = undefined;
    var _loc3_ = _loc2_.split("|");
    var _loc9_ = Number(_loc3_[0]);
    var _loc10_ = _loc3_[1] == "0" ? false : true;
    var _loc7_ = _loc3_[2] == "0" ? false : true;
    var _loc5_ = _loc3_[3] == "0" ? false : true;
    var _loc6_ = Number(_loc3_[4]);
    var _loc8_ = Number(_loc3_[5]);
    this.api.datacenter.Game = new dofus.datacenter.Game();
    this.api.datacenter.Game.state = _loc9_;
    this.api.datacenter.Game.fightType = _loc8_;
    var _loc4_ = this.api.ui.getUIComponent("Banner");
    _loc4_.redrawChrono();
    _loc4_.updateEye();
    this.api.datacenter.Game.isSpectator = _loc5_;
    if(!_loc5_)
    {
        this.api.datacenter.Player.data.initAP(false);
        this.api.datacenter.Player.data.initMP(false);
        this.api.datacenter.Player.SpellsManager.clear();
    }
    _loc4_.mostrarBotones();
    this.api.gfx.cleanMap(1);

    // --- INICIO DE LA LÓGICA CORRECTA PARA EL MODO TÁCTICO ---
    // Revisa la opción del jugador y activa el modo táctico SOLO para este combate.
    if (this.api.kernel.OptionsManager.getOption("tactico"))
    {
        this.api.datacenter.Game.isTacticMode = true;
    }
    if(_loc7_)
    {
        this.api.ui.loadUIComponent("ChallengeMenu","ChallengeMenu",{labelReady:this.api.lang.getText("READY"),labelCancel:this.api.lang.getText("CANCEL_SMALL"),cancelButton:_loc10_,ready:false},{bStayIfPresent:true});
    }
    if(!_global.isNaN(_loc6_))
    {
        _loc4_.startTimer(_loc6_ / 1000);
    }
    this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_OBJECT_NONE);
    this.api.ui.unloadLastUIAutoHideComponent();
    this.api.ui.unloadUIComponent("FightsInfos");
    switch(this.api.datacenter.Map.subarea)
    {
        case 320:
        case 321:
            this.bSubareaHasWhiteFloor = true;
            break;
        default:
            this.bSubareaHasWhiteFloor = false;
    }
    this.api.ui.unloadUIComponent("GameResult");
    this.api.ui.unloadUIComponent("GameResultLight");
};
_loc1.onMapLoaded = function()
{
   this.api.gfx.showContainer(true);
   this.api.kernel.GameManager.applyCreatureMode();
   if(dofus.Constants.SAVING_THE_WORLD)
   {
      dofus["\x1e\x14\x0f"].getInstance().nextAction();
   }
   if(_global.COLOR_TRIGGER != undefined)
   {
      this.api.ui.getUIComponent("Triggers").activar();
   }
   else if(_global.COLOR_POS_PELEA != undefined)
   {
      this.api.ui.getUIComponent("PosPelea").activar();
   }
};
_loc1.onTurnLider = function(_loc2_)
{
   var _loc2_;
   if(this.api.datacenter.Game.isFirstTurn)
   {
      this.api.datacenter.Game.isFirstTurn = false;
      _loc2_ = this.api.gfx.spriteHandler.getSprites().getItems();
      for(var _loc3_ in _loc2_)
      {
         this.api.gfx.removeSpriteExtraClip(_loc3_,true);
      }
   }
   var _loc5_ = _loc2_.split("|");
   var _loc4_ = _loc5_[0];
   var _loc6_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
   _loc6_.GameActionsManager.clear();
   this.api.gfx.unSelect(true);
   this.api.datacenter.Game.currentPlayerID = _loc4_;
   this.api.ui.getUIComponent("Banner").shortcuts.setCurrentTab("Spells");
   this.api.gfx.mapHandler.resetEmptyCells();
   this.api.ui.getUIComponent("Banner").shortcuts.updateCurrentTabInformations();
   this.api.kernel.GameManager.cleanUpGameArea(true);
};
_loc1.onTurnMiddle = function(sExtraData)
{
   if(!this.api.datacenter.Game.isRunning)
   {
      ank.utils.Logger.err("[innerOnTurnMiddle] on est pas en combat");
      return undefined;
   }
   var _loc17_ = sExtraData.split("|");
   var _loc18_ = new Object();
   var _loc6_ = 0;
   var _loc4_;
   var _loc5_;
   var _loc15_;
   var _loc9_;
   var _loc8_;
   var _loc11_;
   var _loc7_;
   var _loc19_;
   var _loc14_;
   var _loc10_;
   var _loc12_;
   var _loc13_;
   var _loc3_;
   while(_loc6_ < _loc17_.length)
   {
      _loc4_ = _loc17_[_loc6_].split(";");
      if(_loc4_.length != 0)
      {
         _loc5_ = _loc4_[0];
         _loc15_ = _loc4_[1] != "1" ? false : true;
         _loc9_ = Number(_loc4_[2]);
         _loc8_ = Number(_loc4_[3]);
         _loc11_ = Number(_loc4_[4]);
         _loc7_ = Number(_loc4_[5]);
         _loc19_ = Number(_loc4_[6]);
         _loc14_ = Number(_loc4_[7]);
         _loc10_ = Number(_loc4_[8]);
         _loc12_ = Number(_loc4_[9]);
         _loc13_ = _loc4_[10].split(",");
         _loc18_[_loc5_] = true;
         _loc3_ = this.api.datacenter.Sprites.getItemAt(_loc5_);
         if(_loc3_ != undefined)
         {
            _loc3_.sequencer.clearAllNextActions();
            if(_loc15_)
            {
               _loc3_.mc.clear();
               this.api.gfx.removeSpriteOverHeadLayer(_loc5_,"text");
            }
            else
            {
               _loc3_.LP = _loc9_;
               _loc3_.LPmax = _loc14_;
               _loc3_.AP = _loc8_;
               _loc3_.MP = _loc11_;
               _loc3_.Huida = _loc10_;
               _loc3_.Placaje = _loc12_;
               _loc3_.Resistencias = _loc13_;
               if(!_global.isNaN(_loc7_) && !_loc3_.hasCarriedParent())
               {
                  this.api.gfx.setSpritePosition(_loc5_,_loc7_);
               }
               if(_loc3_.hasCarriedChild())
               {
                  _loc3_.carriedChild.updateCarriedPosition();
               }
            }
         }
         else
         {
            ank.utils.Logger.err("[onTurnMiddle] le sprite n\'existe pas");
         }
      }
      _loc6_ = _loc6_ + 1;
   }
   var _loc16_ = this.api.datacenter.Sprites.getItems();
   for(var _loc20_ in _loc16_)
   {
      if(!_loc18_[_loc20_])
      {
         _loc16_[_loc20_].mc.clear();
         this.api.datacenter.Sprites.removeItemAt(_loc20_);
      }
   }
   this.api.ui.getUIComponent("Timeline").timelineControl.updateCharacters();
};
_loc1.onTurnStart = function(_loc2_)
{
   var _loc3_;
   if(this.api.datacenter.Game.isFirstTurn)
   {
      this.api.datacenter.Game.isFirstTurn = false;
      _loc3_ = this.api.gfx.spriteHandler.getSprites().getItems();
      for(var _loc6_ in _loc3_)
      {
         this.api.gfx.removeSpriteExtraClip(_loc6_,true);
      }
   }
   var _loc8_ = _loc2_.split("|");
   var _loc4_ = _loc8_[0];
   var _loc7_ = Number(_loc8_[1]) / 1000;
   var _loc9_ = Number(_loc8_[2]);
   this.api.datacenter.Game.currentTableTurn = _loc9_;
   var _loc2_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
   _loc2_.GameActionsManager.clear();
   this.api.gfx.unSelect(true);
   this.api.datacenter.Game.currentPlayerID = _loc4_;
   this.api.kernel.GameManager.cleanPlayer(this.api.datacenter.Game.lastPlayerID);
   this.api.ui.getUIComponent("Timeline").nextTurn(_loc4_);
   if(this.api.datacenter.Player.isCurrentPlayer)
   {
      this.api.electron.makeNotification(this.api.lang.getText("PLAYER_TURN",[this.api.datacenter.Player.Name]));
      if(this.api.kernel.OptionsManager.getOption("StartTurnSound"))
      {
         this.api.sounds.events.onTurnStart();
      }
      if(this.api.kernel.GameManager.autoSkip && this.api.datacenter.Game.isFight)
      {
         this.api.network.Game.turnEnd();
      }
      this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_RELEASE_OVER_OUT);
      this.api.datacenter.Player.SpellsManager.nextTurn();
      this.api.ui.getUIComponent("Banner").startTimer(_loc7_);
      dofus["\x10\x16"].getInstance().forceMouseOver();
      this.api.gfx.mapHandler.resetEmptyCells();
   }
   else
   {
      this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_NONE);
      this.api.ui.getUIComponent("Timeline").startChrono(_loc7_);
      if(this.api.datacenter.Game.isSpectator && this.api.kernel.OptionsManager.getOption("SpriteInfos"))
      {
         this.api.ui.getUIComponent("Banner").showRightPanel("BannerSpriteInfos",{data:_loc2_},true);
      }
   }
   var _loc5_;
   if(this.api.kernel.OptionsManager.getOption("StringCourse"))
   {
      _loc5_ = new Array();
      _loc5_[1] = _loc2_.color1;
      _loc5_[2] = _loc2_.color2;
      _loc5_[3] = _loc2_.color3;
      this.api.ui.loadUIComponent("StringCourse","StringCourse",{gfx:_loc2_.artworkFile,name:_loc2_.name,level:this.api.lang.getText("LEVEL_SMALL") + " " + _loc2_.Level,colors:_loc5_},{bForceLoad:true});
   }
   if(this.bSubareaHasWhiteFloor)
   {
      this.api.gfx.addSpriteExtraClip(_loc4_,dofus.Constants.HIGHLIGHT_FILE,0,true);
   }
   else
   {
      this.api.gfx.addSpriteExtraClip(_loc4_,dofus.Constants.HIGHLIGHT_FILE,undefined,true);
   }
   this.api.kernel.GameManager.cleanUpGameArea(true);
   ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this.api.network.Ping,"GameDecoDetect",this.api.network,this.api.network.quickPing,_loc7_ * 1000);
   this.api.kernel.TipsManager.showNewTip(dofus["\x0b\b"].TipsManager.TIP_FIGHT_START);
};
_loc1.onStartToPlay = function()
{
   this.api.ui.getUIComponent("Banner").stopTimer();
   this.aks.GameActions.onActionsFinish(this.api.datacenter.Player.ID);
   this.api.sounds.events.onGameStart(this.api.datacenter.Map.musics);
   this.api.kernel.StreamingDisplayManager.onFightStartEnd();
   var _loc4_ = this.api.ui.getUIComponent("Banner");
   _loc4_.showGiveUpButton(true);
   var _loc5_;
   if(!this.api.datacenter.Game.isSpectator)
   {
      _loc5_ = this.api.datacenter.Player.data;
      _loc5_.initAP();
      _loc5_.initMP();
      _loc5_.initLP();
      _loc4_.showPoints(true);
      _loc4_.showNextTurnButton(true);
      this.api.ui.loadUIComponent("CenterText","CenterText",{text:this.api.lang.getText("GAME_LAUNCH"),background:true,timer:2000},{bForceLoad:true});
      _loc4_.shortcuts.setCurrentTab("Spells");
   }
   if(this.api.ui.getUIComponent("FightOptionButtons") == undefined)
   {
      this.api.ui.loadUIComponent("FightOptionButtons","FightOptionButtons");
   }
   this.api.ui.loadUIComponent("Timeline","Timeline");
   this.api.ui.unloadUIComponent("ChallengeMenu");
   this.api.gfx.unSelect(true);
   this.api.gfx.mapHandler.showingFightCells = false;
   if(!this.api.gfx.gridHandler.bGridVisible)
   {
      this.api.gfx.drawGrid();
   }
   this.api.datacenter.Game.setInteractionType("move");
   this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_NONE);
   this.api.kernel.GameManager.signalFightActivity();
   this.api.datacenter.Game.isRunning = true;
   var _loc2_ = this.api.datacenter.Sprites.getItems();
   for(var _loc3_ in _loc2_)
   {
      this.api.gfx.addSpriteExtraClip(_loc3_,dofus.Constants.CIRCLE_FILE,dofus.Constants.TEAMS_COLOR[_loc2_[_loc3_].Team]);
   }
   if(this.api.datacenter.Game.isTacticMode)
   {
      this.api.datacenter.Game.isTacticMode = true;
   }
   this.api.ui.getUIComponent("FightOptionButtons").onGameRunning();
};
_loc1.onReconnect = function()
{
   this.api.ui.getUIComponent("FightOptionButtons").onGameRunning();
};
_loc1.hunterAcceptPvPHunt = function()
{
   this.api.network.send("GhA");
};
_loc1.toggleHunterMatchmakingRegister = function()
{
   if(this.api.datacenter.Player.isHuntMatchmakingActive())
   {
      this.api.network.Game.hunterMatchmakingUnregister();
   }
   else
   {
      this.api.network.Game.hunterMatchmakingRegister();
   }
};
_loc1.onHuntInfos = function(_loc2_)
{
   var _loc3_ = _loc2_.substring(1);
   var _loc6_ = _loc3_.split("|");
   var _loc7_;
   var _loc5_;
   var _loc9_;
   var _loc4_;
   var _loc2_;
   var _loc8_;
   switch(_loc2_.charAt(0))
   {
      case "I":
         if(_loc3_ == undefined || _loc3_.length == 0)
         {
            this.api.datacenter.Basics.pvpHuntedSpriteID = undefined;
         }
         else
         {
            this.api.datacenter.Basics.pvpHuntedSpriteID = _loc3_;
         }
         break;
      case "S":
         _loc7_ = _loc6_[0];
         _loc5_ = _loc6_[1];
         _loc9_ = _loc7_ != _loc5_;
         _loc4_ = true;
         switch(_loc5_)
         {
            case "WAITING_FOR_TARGET":
               if(_loc7_ == "WAITING_FOR_START_CONFIRMATION")
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("HUNT_NOT_AVAILABLE_ANYMORE"),"HUNT_CHAT");
               }
               else if(_loc7_ == "NOT_IN_MATCHMAKING")
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("HUNT_LOOKING_FOR_TARGET_ALIGN_" + this.api.datacenter.Player.alignment.index),"HUNT_CHAT");
               }
               break;
            case "WAITING_FOR_START_CONFIRMATION_TIMEOUT":
               _loc4_ = false;
               this.api.kernel.showMessage(undefined,this.api.lang.getText("HUNT_REQUEST_TIMEOUT"),"HUNT_CHAT");
               break;
            case "PLAYER_LEFT_MATCHMAKING":
               _loc4_ = false;
               this.api.kernel.showMessage(undefined,this.api.lang.getText("HUNTER_HAS_LEFT_MATCHMAKING"),"HUNT_CHAT");
               break;
            case "HUNT_STARTED":
               _loc4_ = false;
               this.api.kernel.showMessage(undefined,this.api.lang.getText("HUNT_STARTED"),"HUNT_CHAT");
               break;
            case "WAITING_FOR_START_CONFIRMATION":
               _loc2_ = this.api.lang.getText("HUNT_FOUND_PART_1_ALIGN_" + this.api.datacenter.Player.alignment.index);
               _loc8_ = Number(_loc6_[2]);
               if(_loc8_ == 1)
               {
                  _loc2_ += this.api.lang.getText("HUNT_FOUND_PART_2_AFTER_WIN");
               }
               else if(_loc8_ == 2)
               {
                  _loc2_ += this.api.lang.getText("HUNT_FOUND_PART_2_AFTER_DEFEAT");
               }
               _loc2_ += ". ";
               _loc2_ += this.api.lang.getText("HUNT_FOUND_PART_3");
               this.api.kernel.showMessage(undefined,_loc2_,"HUNT_CHAT",undefined,"START_CONFIRMATION");
               break;
            case "WAITING_FOR_CONFIRMATION_HURRY":
               _loc2_ = this.api.lang.getText("HUNT_LOOKING_FOR_TARGET_HURRY_UP_ALIGN_" + this.api.datacenter.Player.alignment.index);
               this.api.kernel.showMessage(undefined,_loc2_,"HUNT_CHAT",undefined,"START_CONFIRMATION");
         }
         this.api.datacenter.Player.huntMatchmakingStatus = new dofus.datacenter.HuntMatchmakingStatus(_loc4_,_loc5_);
   }
};
_loc1.hunterMatchmakingRegister = function()
{
   this.api.network.send("Ghr");
};
_loc1.hunterMatchmakingUnregister = function()
{
   this.api.network.send("Ghu");
};
_loc1.triggerCellFightPos = function(CFP)
{
   if(CFP.length < 2)
   {
      this.api.kernel.showMessage(undefined,"Pas de cellules de combat sur cette carte.","INFO_CHAT");
      return undefined;
   }
   var _loc8_ = CFP.split("|");
   var _loc7_ = _loc8_[0];
   var _loc6_ = _loc8_[1];
   this.api.datacenter.Basics.aks_team1_starts = new Array();
   this.api.datacenter.Basics.aks_team2_starts = new Array();
   var _loc5_ = -2;
   var _loc3_;
   while(true)
   {
      _loc5_ += 2;
      if(_loc5_ >= _loc7_.length)
      {
         break;
      }
      _loc3_ = ank["\x1e\n\x07"]["\x12\r"].decode64(_loc7_.charAt(_loc5_)) << 6;
      _loc3_ += ank["\x1e\n\x07"]["\x12\r"].decode64(_loc7_.charAt(_loc5_ + 1));
      this.api.datacenter.Basics.aks_team1_starts.push(_loc3_);
      this.api.gfx.select(_loc3_,dofus.Constants.TEAMS_COLOR[0],"startPosition");
   }
   var _loc4_ = -2;
   var _loc2_;
   while(true)
   {
      _loc4_ += 2;
      if(_loc4_ >= _loc6_.length)
      {
         break;
      }
      _loc2_ = ank["\x1e\n\x07"]["\x12\r"].decode64(_loc6_.charAt(_loc4_)) << 6;
      _loc2_ += ank["\x1e\n\x07"]["\x12\r"].decode64(_loc6_.charAt(_loc4_ + 1));
      this.api.datacenter.Basics.aks_team2_starts.push(_loc2_);
      this.api.gfx.select(_loc2_,dofus.Constants.TEAMS_COLOR[1],"startPosition");
   }
};
_loc1.onZoneData = function(sExtraData)
{
   var _loc11_ = sExtraData.split("|");
   var _loc3_ = 0;
   var _loc5_;
   var _loc8_;
   var _loc2_;
   var _loc6_;
   var _loc7_;
   var _loc4_;
   var _loc9_;
   var _loc10_;
   while(_loc3_ < _loc11_.length)
   {
      _loc5_ = _loc11_[_loc3_];
      _loc8_ = _loc5_.charAt(0) != "+" ? false : true;
      _loc2_ = _loc5_.substr(1).split(";");
      _loc6_ = Number(_loc2_[0]);
      _loc7_ = Number(_loc2_[1]);
      _loc4_ = _loc2_[2];
      _loc9_ = _loc2_[3];
      _loc10_ = _loc2_[4] != undefined ? Number(_loc2_[4]) : 0;
      if(_loc8_)
      {
         this.api.gfx.drawZone(_loc6_,_loc10_,_loc7_,_loc4_,dofus.Constants.ZONE_COLOR[_loc4_],_loc9_);
      }
      else
      {
         this.api.gfx.clearZone(_loc6_,_loc7_,_loc4_);
      }
      _loc3_ = _loc3_ + 1;
   }
};
_loc1.onCreateSolo = function()
{
   this.api.datacenter.Player.InteractionsManager.setState(false);
   this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_OBJECT_RELEASE_OVER_OUT);
   this.api.ui.removeCursor();
   this.api.ui.getUIComponent("Banner").shortcuts.setCurrentTab("Items");
   this.api.datacenter.Basics.gfx_isSpritesHidden = false;
   this.api.gfx.spriteHandler.unmaskAllSprites();
   var _loc3_;
   if(this.api.ui.getUIComponent("Banner") == undefined)
   {
      this.api.kernel.OptionsManager.applyAllOptions();
      this.api.ui.loadUIComponent("Banner","Banner",{data:this.api.datacenter.Player},{bAlwaysOnTop:true});
      this.api.ui.setScreenSize(742,432);
   }
   else
   {
      _loc3_ = this.api.ui.getUIComponent("Banner");
      _loc3_.showPoints(false);
      _loc3_.showNextTurnButton(false);
      _loc3_.showGiveUpButton(false);
      _loc3_.mostrarBotones();
      this.api.ui.unloadUIComponent("FightOptionButtons");
      this.api.ui.unloadUIComponent("ChallengeMenu");
   }
   this.api.gfx.cleanMap(2);
};
_loc1.cambiarPos = function(nID)
{
   this.api.network.send("GM" + nID);
};
_loc1.cambiarPosN = function(nID)
{
   this.api.network.send("Gm" + nID);
};
_loc1.onTurnUpdate = function(sExtraData)
{
   var _loc14_ = sExtraData.split("|");
   var _loc17_ = new Object();
   var _loc4_ = 0;
   var _loc2_;
   var _loc5_;
   var _loc9_;
   var _loc13_;
   var _loc10_;
   var _loc6_;
   var _loc15_;
   var _loc16_;
   var _loc7_;
   var _loc11_;
   var _loc12_;
   var _loc8_;
   var _loc3_;
   while(_loc4_ < _loc14_.length)
   {
      _loc2_ = _loc14_[_loc4_].split(";");
      if(_loc2_.length != 0)
      {
         _loc5_ = _loc2_[0];
         _loc9_ = _loc2_[1] == "1" ? true : false;
         _loc13_ = Number(_loc2_[2]);
         _loc10_ = Number(_loc2_[3]);
         _loc6_ = Number(_loc2_[4]);
         _loc15_ = Number(_loc2_[5]);
         _loc16_ = Number(_loc2_[6]);
         _loc7_ = Number(_loc2_[7]);
         _loc11_ = Number(_loc2_[8]);
         _loc12_ = Number(_loc2_[9]);
         _loc8_ = _loc2_[10].split(",");
         _loc17_[_loc5_] = true;
         _loc3_ = this.api.datacenter.Sprites.getItemAt(_loc5_);
         if(_loc3_ != undefined)
         {
            if(_loc9_)
            {
               _loc3_.mc.clear();
               this.api.gfx.removeSpriteOverHeadLayer(_loc5_,"text");
            }
            else
            {
               _loc3_.LP = _loc13_;
               _loc3_.LPmax = _loc7_;
               _loc3_.AP = _loc10_;
               _loc3_.MP = _loc6_;
               _loc3_.Huida = _loc11_;
               _loc3_.Placaje = _loc12_;
               _loc3_.Resistencias = _loc8_;
            }
         }
      }
      _loc4_ += 1;
   }
};
_loc1.onMapData = function(sExtraData)
{
   var _loc3_ = sExtraData.split("|");
   var _loc5_ = _loc3_[0];
   var _loc6_ = _loc3_[1];
   var _loc7_ = _loc3_[2];
   if(Number(_loc5_) == this.api.datacenter.Map.id)
   {
      if(!this.api.datacenter.Map.bOutdoor)
      {
         this.api.kernel.NightManager.noEffects();
      }
      this.api.gfx.onMapLoaded();
      return undefined;
   }
   this.api.gfx.showContainer(false);
   this.nLastMapIdReceived = _global.parseInt(_loc5_,10);
   var _loc4_;
   if(_loc3_.length > 3)
   {
      _loc4_ = new Object();
      _loc4_.id = _loc5_;
      _loc4_.date = _loc6_;
      _loc4_.width = Number(_loc3_[3]);
      _loc4_.height = Number(_loc3_[4]);
      _loc4_.backgroundNum = Number(_loc3_[5]);
      _loc4_.musicId = Number(_loc3_[6]);
      _loc4_.ambianceId = Number(_loc3_[7]);
      _loc4_.bOutdoor = _loc3_[8];
      _loc4_.capabilities = Number(_loc3_[9]);
      _loc4_.mapData = _loc3_[10];
      if(_loc3_[11] == undefined || _loc3_[11] != "1")
      {
         _loc4_;
      }
   }
   this.api.kernel.MapsServersManager.parseMap2(_loc5_,_loc6_,_loc4_);
};
_loc1.onMovement = function(sExtraData, bIsSummoned)
{
   var _loc87_ = sExtraData.split("|");
   var _loc55_ = 0;
   var _loc46_;
   var _loc56_;
   var _loc37_;
   var _loc57_;
   var _loc3_;
   var _loc24_;
   var _loc27_;
   var _loc65_;
   var _loc73_;
   var _loc85_;
   var _loc8_;
   var _loc61_;
   var _loc15_;
   var _loc67_;
   var _loc80_;
   var _loc17_;
   var _loc60_;
   var _loc71_;
   var _loc42_;
   var _loc23_;
   var _loc72_;
   var _loc19_;
   var _loc63_;
   var _loc79_;
   var _loc83_;
   var _loc48_;
   var _loc69_;
   var _loc64_;
   var _loc21_;
   var _loc22_;
   var _loc43_;
   var _loc50_;
   var _loc11_;
   var _loc7_;
   var _loc5_;
   var _loc20_;
   var _loc59_;
   var _loc33_;
   var _loc74_;
   var _loc9_;
   var _loc30_;
   var _loc13_;
   var _loc31_;
   var _loc32_;
   var _loc14_;
   var _loc12_;
   var _loc10_;
   var _loc6_;
   var _loc70_;
   var _loc25_;
   var _loc26_;
   var _loc4_;
   var _loc75_;
   var _loc38_;
   var _loc66_;
   var _loc41_;
   var _loc49_;
   var _loc52_;
   var _loc54_;
   var _loc62_;
   var _loc44_;
   var _loc76_;
   var _loc51_;
   var _loc39_;
   var _loc40_;
   var _loc47_;
   var _loc68_;
   var _loc86_;
   var _loc36_;
   var _loc77_;
   var _loc78_;
   var _loc84_;
   var _loc58_;
   var _loc45_;
   var _loc34_;
   var _loc53_;
   var _loc35_;
   var _loc16_;
   var _loc28_;
   var _loc18_;
   var _loc29_;
   var _loc81_;
   var _loc82_;
   for(; _loc55_ < _loc87_.length; _loc55_ = _loc55_ + 1)
   {
      _loc46_ = _loc87_[_loc55_];
      if(_loc46_.length != 0)
      {
         _loc56_ = false;
         _loc37_ = false;
         _loc57_ = _loc46_.charAt(0);
         if(_loc57_ == "+")
         {
            _loc37_ = true;
         }
         else if(_loc57_ == "~")
         {
            _loc37_ = true;
            _loc56_ = true;
         }
         else if(_loc57_ != "-")
         {
            continue;
         }
         if(_loc37_)
         {
            _loc3_ = _loc46_.substr(1).split(";");
            _loc24_ = _loc3_[0];
            _loc27_ = _loc3_[1];
            _loc65_ = _loc3_[2].split("^");
            _loc73_ = Number(_loc65_[0]);
            _loc85_ = _loc65_[1] == "1";
            _loc8_ = _loc3_[3];
            _loc61_ = _loc3_[4].split("^");
            _loc15_ = _loc61_[0];
            _loc67_ = _loc61_[1];
            _loc80_ = _loc3_[5];
            _loc17_ = _loc3_[6];
            _loc60_ = false;
            _loc71_ = true;
            if(_loc17_.charAt(_loc17_.length - 1) == "*")
            {
               _loc17_ = _loc17_.substr(0,_loc17_.length - 1);
               _loc60_ = true;
            }
            if(_loc17_.charAt(0) == "*")
            {
               _loc71_ = false;
               _loc17_ = _loc17_.substr(1);
            }
            _loc42_ = _loc17_.split("^");
            _loc23_ = _loc42_.length != 2 ? _loc17_ : _loc42_[0];
            _loc72_ = _loc80_.split(",");
            _loc19_ = _loc72_[0];
            _loc63_ = _loc72_[1];
            if(_loc63_.length)
            {
               _loc48_ = _loc63_.split("~");
               if(_loc48_[0].length > 0)
               {
                  _loc69_ = _loc48_[0].split("*");
                  _loc79_ = new _global.palmad.dofus.datacenter.Title(_global.parseInt(_loc69_[0]),undefined,"",undefined,_loc69_[1]);
               }
               if(_loc48_[1].length > 0)
               {
                  _loc64_ = _loc48_[1].split("*");
                  _loc83_ = new _global.palmad.dofus.datacenter.Title(0,_loc64_[1],_loc64_[0],1,"");
               }
            }
            _loc21_ = 100;
            _loc22_ = 100;
            if(_loc42_.length == 2)
            {
               _loc43_ = _loc42_[1];
               if(_global.isNaN(Number(_loc43_)))
               {
                  _loc50_ = _loc43_.split("x");
                  _loc21_ = _loc50_.length != 2 ? 100 : Number(_loc50_[0]);
                  _loc22_ = _loc50_.length != 2 ? 100 : Number(_loc50_[1]);
               }
               else
               {
                  _loc22_ = Number(_loc43_);
                  _loc21_ = Number(_loc43_);
               }
            }
            if(_loc56_)
            {
               _loc11_ = this.api.datacenter.Sprites.getItemAt(_loc8_);
               this.onSpriteMovement(false,_loc11_);
            }
            switch(_loc19_)
            {
               case "-1":
               case "-2":
                  _loc7_ = new Object();
                  _loc7_.spriteType = _loc19_;
                  _loc7_.gfxID = _loc23_;
                  _loc7_.scaleX = _loc21_;
                  _loc7_.scaleY = _loc22_;
                  _loc7_.noFlip = _loc60_;
                  _loc7_.cell = _loc24_;
                  _loc7_.dir = _loc27_;
                  _loc7_.powerLevel = _loc3_[7];
                  _loc7_.color1 = _loc3_[8];
                  _loc7_.color2 = _loc3_[9];
                  _loc7_.color3 = _loc3_[10];
                  _loc7_.accessories = _loc3_[11];
                  if(this.api.datacenter.Game.isFight)
                  {
                     _loc7_.LP = _loc3_[12];
                     _loc7_.AP = _loc3_[13];
                     _loc7_.MP = _loc3_[14];
                     if(_loc3_.length > 18)
                     {
                        _loc7_.resistances = new Array(Number(_loc3_[15]),Number(_loc3_[16]),Number(_loc3_[17]),Number(_loc3_[18]),Number(_loc3_[19]),Number(_loc3_[20]),Number(_loc3_[21]));
                        _loc7_.team = _loc3_[22];
                        _loc7_.Huida = _loc3_[23];
                        _loc7_.Placaje = _loc3_[24];
                     }
                     else
                     {
                        _loc7_.team = _loc3_[15];
                     }
                     _loc7_.summoned = bIsSummoned;
                  }
                  if(_loc19_ == -1)
                  {
                     _loc11_ = this.api.kernel.CharactersManager.createCreature(_loc8_,_loc15_,_loc7_);
                     _loc11_.isClear = false;
                  }
                  else
                  {
                     _loc11_ = this.api.kernel.CharactersManager.createMonster(_loc8_,_loc15_,_loc7_);
                     _loc11_.isClear = false;
                  }
                  break;
               case "-3":
                  _loc5_ = new Object();
                  _loc5_.spriteType = _loc19_;
                  _loc5_.level = _loc3_[7];
                  _loc5_.scaleX = _loc21_;
                  _loc5_.scaleY = _loc22_;
                  _loc5_.noFlip = _loc60_;
                  _loc5_.cell = Number(_loc24_);
                  _loc5_.dir = _loc27_;
                  _loc5_.totalExp = _loc3_[8].split("@")[0];
                  _loc5_.forceali = _loc3_[8].split("@")[1];
                  _loc20_ = _loc3_[9].split(",");
                  _loc5_.color1 = _loc20_[0];
                  _loc5_.color2 = _loc20_[1];
                  _loc5_.color3 = _loc20_[2];
                  _loc5_.accessories = _loc3_[10];
                  _loc5_.bonusValue = _loc73_;
                  _loc59_ = this.sliptGfxData(_loc17_);
                  _loc33_ = _loc59_.gfx;
                  this.splitGfxForScale(_loc33_[0],_loc5_);
                  _loc11_ = this.api.kernel.CharactersManager.createMonsterGroup(_loc8_,_loc15_,_loc5_);
                  _loc11_.isClear = false;
                  if(this.api.kernel.OptionsManager.getOption("ViewAllMonsterInGroup") == true)
                  {
                     _loc74_ = _loc8_;
                     _loc9_ = 1;
                     while(_loc9_ < _loc33_.length)
                     {
                        if(_loc33_[_loc9_] != "")
                        {
                           this.splitGfxForScale(_loc33_[_loc9_],_loc5_);
                           _loc20_ = _loc3_[9 + 2 * _loc9_].split(",");
                           _loc5_.color1 = _loc20_[0];
                           _loc5_.color2 = _loc20_[1];
                           _loc5_.color3 = _loc20_[2];
                           _loc5_.dir = random(4) * 2 + 1;
                           _loc5_.accessories = _loc3_[10 + 2 * _loc9_];
                           _loc30_ = _loc8_ + "_" + _loc9_;
                           _loc13_ = this.api.kernel.CharactersManager.createMonsterGroup(_loc30_,undefined,_loc5_);
                           _loc13_.isClear = false;
                           _loc31_ = _loc74_;
                           if(random(3) != 0 && _loc9_ != 1)
                           {
                              _loc31_ = _loc8_ + "_" + (random(_loc9_ - 1) + 1);
                           }
                           _loc32_ = random(8);
                           this.api.gfx.addLinkedSprite(_loc30_,_loc31_,_loc32_,_loc13_);
                           if(!_global.isNaN(_loc13_.scaleX))
                           {
                              this.api.gfx.setSpriteScale(_loc13_.id,_loc13_.scaleX,_loc13_.scaleY);
                           }
                           switch(_loc59_.shape)
                           {
                              case "circle":
                                 _loc32_ = _loc9_;
                                 break;
                              case "line":
                                 _loc31_ = _loc30_;
                                 _loc32_ = 2;
                           }
                        }
                        _loc9_ = _loc9_ + 1;
                     }
                  }
                  break;
               case "-4":
                  _loc14_ = new Object();
                  _loc14_.spriteType = _loc19_;
                  _loc14_.gfxID = _loc23_;
                  _loc14_.scaleX = _loc21_;
                  _loc14_.scaleY = _loc22_;
                  _loc14_.cell = _loc24_;
                  _loc14_.dir = _loc27_;
                  _loc14_.sex = _loc3_[7];
                  _loc14_.color1 = _loc3_[8];
                  _loc14_.color2 = _loc3_[9];
                  _loc14_.color3 = _loc3_[10];
                  _loc14_.accessories = _loc3_[11];
                  _loc14_.extraClipID = !(_loc3_[12] != undefined && !_global.isNaN(Number(_loc3_[12]))) ? -1 : Number(_loc3_[12]);
                  _loc14_.customArtwork = Number(_loc3_[13]);
                  _loc11_ = this.api.kernel.CharactersManager.createNonPlayableCharacter(_loc8_,Number(_loc15_),_loc14_);
                  break;
               case "-5":
                  _loc12_ = new Object();
                  _loc12_.spriteType = _loc19_;
                  _loc12_.gfxID = _loc23_;
                  _loc12_.scaleX = _loc21_;
                  _loc12_.scaleY = _loc22_;
                  _loc12_.cell = _loc24_;
                  _loc12_.dir = _loc27_;
                  _loc12_.color1 = _loc3_[7];
                  _loc12_.color2 = _loc3_[8];
                  _loc12_.color3 = _loc3_[9];
                  _loc12_.accessories = _loc3_[10];
                  _loc12_.guildName = _loc3_[11];
                  _loc12_.emblem = _loc3_[12];
                  _loc12_.offlineType = _loc3_[13];
                  _loc12_.colorNombre = _loc67_;
                  _loc11_ = this.api.kernel.CharactersManager.createOfflineCharacter(_loc8_,_loc15_,_loc12_);
                  break;
               case "-6":
                  _loc10_ = new Object();
                  _loc10_.spriteType = _loc19_;
                  _loc10_.gfxID = _loc23_;
                  _loc10_.scaleX = _loc21_;
                  _loc10_.scaleY = _loc22_;
                  _loc10_.cell = _loc24_;
                  _loc10_.dir = _loc27_;
                  _loc10_.level = _loc3_[7];
                  if(this.api.datacenter.Game.isFight)
                  {
                     _loc10_.LP = _loc3_[8];
                     _loc10_.AP = _loc3_[9];
                     _loc10_.MP = _loc3_[10];
                     _loc10_.resistances = new Array(Number(_loc3_[11]),Number(_loc3_[12]),Number(_loc3_[13]),Number(_loc3_[14]),Number(_loc3_[15]),Number(_loc3_[16]),Number(_loc3_[17]));
                     _loc10_.team = _loc3_[18];
                     _loc10_.Huida = _loc3_[19];
                     _loc10_.Placaje = _loc3_[20];
                  }
                  else
                  {
                     _loc10_.guildName = _loc3_[8];
                     _loc10_.emblem = _loc3_[9];
                  }
                  _loc11_ = this.api.kernel.CharactersManager.createTaxCollector(_loc8_,_loc15_,_loc10_);
                  break;
               case "-7":
               case "-8":
                  _loc6_ = new Object();
                  _loc6_.spriteType = _loc19_;
                  _loc6_.gfxID = _loc23_;
                  _loc6_.scaleX = _loc21_;
                  _loc6_.scaleY = _loc22_;
                  _loc6_.cell = _loc24_;
                  _loc6_.dir = _loc27_;
                  _loc6_.sex = _loc3_[7];
                  _loc6_.powerLevel = _loc3_[8];
                  _loc6_.accessories = _loc3_[9];
                  if(this.api.datacenter.Game.isFight)
                  {
                     _loc6_.LP = _loc3_[10];
                     _loc6_.AP = _loc3_[11];
                     _loc6_.MP = _loc3_[12];
                     _loc6_.team = _loc3_[20];
                     _loc6_.Huida = _loc3_[21];
                     _loc6_.Placaje = _loc3_[22];
                  }
                  else
                  {
                     _loc6_.emote = _loc3_[10];
                     _loc6_.emoteTimer = _loc3_[11];
                     _loc6_.restrictions = Number(_loc3_[12]);
                  }
                  if(_loc19_ == "-8")
                  {
                     _loc6_.showIsPlayer = true;
                     _loc70_ = _loc15_.split("~");
                     _loc6_.monsterID = _loc70_[0];
                     _loc6_.playerName = _loc70_[1];
                  }
                  else
                  {
                     _loc6_.showIsPlayer = false;
                     _loc6_.monsterID = _loc15_;
                  }
                  _loc11_ = this.api.kernel.CharactersManager.createMutant(_loc8_,_loc6_);
                  break;
               case "-9":
                  _loc25_ = new Object();
                  _loc25_.spriteType = _loc19_;
                  _loc25_.gfxID = _loc23_;
                  _loc25_.scaleX = _loc21_;
                  _loc25_.scaleY = _loc22_;
                  _loc25_.cell = _loc24_;
                  _loc25_.dir = _loc27_;
                  _loc25_.ownerName = _loc3_[7];
                  _loc25_.level = _loc3_[8];
                  _loc25_.modelID = _loc3_[9];
                  _loc11_ = this.api.kernel.CharactersManager.createParkMount(_loc8_,_loc15_ == "" ? this.api.lang.getText("NO_NAME") : _loc15_,_loc25_);
                  break;
               case "-10":
                  _loc26_ = new Object();
                  _loc26_.spriteType = _loc19_;
                  _loc26_.gfxID = _loc23_;
                  _loc26_.scaleX = _loc21_;
                  _loc26_.scaleY = _loc22_;
                  _loc26_.cell = _loc24_;
                  _loc26_.dir = _loc27_;
                  _loc26_.level = _loc3_[7];
                  _loc26_.alignment = new dofus.datacenter["\x1e\f"](Number(_loc3_[9]),Number(_loc3_[8]));
                  _loc11_ = this.api.kernel.CharactersManager.createPrism(_loc8_,_loc15_,_loc26_);
                  break;
               default:
                  _loc4_ = new Object();
                  _loc4_.spriteType = _loc19_;
                  _loc4_.cell = _loc24_;
                  _loc4_.scaleX = _loc21_;
                  _loc4_.scaleY = _loc22_;
                  _loc4_.dir = _loc27_;
                  _loc4_.sex = _loc3_[7];
                  _loc4_.colorNombre = _loc67_;
                  _loc4_.esAbonado = _loc85_;
                  if(this.api.datacenter.Game.isFight)
                  {
                     _loc4_.level = _loc3_[8];
                     _loc75_ = _loc3_[9];
                     _loc4_.color1 = _loc3_[10];
                     _loc4_.color2 = _loc3_[11];
                     _loc4_.color3 = _loc3_[12];
                     _loc4_.accessories = _loc3_[13];
                     _loc4_.LP = _loc3_[14];
                     _loc4_.AP = _loc3_[15];
                     _loc4_.MP = _loc3_[16];
                     _loc4_.resistances = new Array(Number(_loc3_[17]),Number(_loc3_[18]),Number(_loc3_[19]),Number(_loc3_[20]),Number(_loc3_[21]),Number(_loc3_[22]),Number(_loc3_[23]));
                     _loc4_.team = _loc3_[24];
                     if(_loc3_[25].indexOf(",") != -1)
                     {
                        _loc38_ = _loc3_[25].split(",");
                        _loc66_ = Number(_loc38_[0]);
                        _loc41_ = _global.parseInt(_loc38_[1],16);
                        _loc49_ = _global.parseInt(_loc38_[2],16);
                        _loc52_ = _global.parseInt(_loc38_[3],16);
                        if(_loc41_ == -1 || _global.isNaN(_loc41_))
                        {
                           _loc41_ = this.api.datacenter.Player.color1;
                        }
                        if(_loc49_ == -1 || _global.isNaN(_loc49_))
                        {
                           _loc49_ = this.api.datacenter.Player.color2;
                        }
                        if(_loc52_ == -1 || _global.isNaN(_loc52_))
                        {
                           _loc52_ = this.api.datacenter.Player.color3;
                        }
                        if(!_global.isNaN(_loc66_))
                        {
                           _loc54_ = new dofus.datacenter.Mount(_loc66_,Number(_loc23_));
                           _loc54_.customColor1 = _loc41_;
                           _loc54_.customColor2 = _loc49_;
                           _loc54_.customColor3 = _loc52_;
                           _loc4_.mount = _loc54_;
                        }
                     }
                     else
                     {
                        _loc62_ = Number(_loc3_[25]);
                        if(!_global.isNaN(_loc62_))
                        {
                           _loc4_.mount = new dofus.datacenter.Mount(_loc62_,Number(_loc23_));
                        }
                     }
                     _loc4_.agilidad = Number(0);
                     _loc4_.Huida = _loc3_[26];
                     _loc4_.Placaje = _loc3_[27];
                     _loc4_.resets = !_global.isNaN(Number(_loc3_[28])) ? Number(_loc3_[28]) : 0;
                     _loc4_.omega = Number(_loc3_[30]);
                     _loc4_.subclase = Number(_loc3_[31]);
                  }
                  else
                  {
                     _loc75_ = _loc3_[8];
                     _loc4_.ornamento = _loc73_;
                     _loc4_.color1 = _loc3_[9];
                     _loc4_.color2 = _loc3_[10];
                     _loc4_.color3 = _loc3_[11];
                     _loc4_.accessories = _loc3_[12];
                     _loc4_.aura = _loc3_[13];
                     _loc4_.emote = _loc3_[14];
                     _loc4_.emoteTimer = _loc3_[15];
                     _loc4_.guildName = _loc3_[16];
                     _loc4_.emblem = _loc3_[17];
                     _loc4_.restrictions = _loc3_[18];
                     if(_loc3_[19].indexOf(",") != -1)
                     {
                        _loc44_ = _loc3_[19].split(",");
                        _loc76_ = Number(_loc44_[0]);
                        _loc51_ = _global.parseInt(_loc44_[1],16);
                        _loc39_ = _global.parseInt(_loc44_[2],16);
                        _loc40_ = _global.parseInt(_loc44_[3],16);
                        if(_loc51_ == -1 || _global.isNaN(_loc51_))
                        {
                           _loc51_ = this.api.datacenter.Player.color1;
                        }
                        if(_loc39_ == -1 || _global.isNaN(_loc39_))
                        {
                           _loc39_ = this.api.datacenter.Player.color2;
                        }
                        if(_loc40_ == -1 || _global.isNaN(_loc40_))
                        {
                           _loc40_ = this.api.datacenter.Player.color3;
                        }
                        if(!_global.isNaN(_loc76_))
                        {
                           _loc47_ = new dofus.datacenter.Mount(_loc76_,Number(_loc23_));
                           _loc47_.customColor1 = _loc51_;
                           _loc47_.customColor2 = _loc39_;
                           _loc47_.customColor3 = _loc40_;
                           _loc4_.mount = _loc47_;
                        }
                     }
                     else
                     {
                        _loc68_ = Number(_loc3_[19]);
                        if(!_global.isNaN(_loc68_))
                        {
                           _loc4_.mount = new dofus.datacenter.Mount(_loc68_,Number(_loc23_));
                        }
                     }
                     _loc4_.agilidad = !_global.isNaN(Number(_loc3_[20])) ? Number(_loc3_[20]) : 0;
                     _loc4_.resets = !_global.isNaN(Number(_loc3_[21])) ? Number(_loc3_[21]) : 0;
                     _loc4_.omega = Number(_loc3_[23]);
                     _loc4_.subclase = Number(_loc3_[24]);
                  }
                  if(_loc56_)
                  {
                     _loc86_ = [_loc8_,this.createTransitionEffect(),_loc24_,10];
                  }
                  _loc36_ = _loc75_.split(",");
                  _loc4_.alignment = new dofus.datacenter["\x1e\f"](Number(_loc36_[0]),Number(_loc36_[1]));
                  _loc4_.rank = new dofus.datacenter.Rank(Number(_loc36_[2]));
                  _loc4_.alignment.fallenAngelDemon = _loc36_[4] == 1;
                  if(_loc36_.length > 3 && _loc8_ != this.api.datacenter.Player.ID)
                  {
                     if(this.api.lang.getAlignmentCanViewPvpGain(this.api.datacenter.Player.alignment.index,Number(_loc4_.alignment.index)))
                     {
                        _loc77_ = Number(_loc36_[3]) - _global.parseInt(_loc8_);
                        _loc78_ = Number(_global.RANGO_NIVEL_PVP);
                        _loc84_ = Number(- _global.RANGO_NIVEL_PVP);
                        _loc58_ = 0;
                        if(this.api.datacenter.Player.Level - _loc77_ > _loc78_)
                        {
                           _loc58_ = -1;
                        }
                        if(this.api.datacenter.Player.Level - _loc77_ < _loc84_)
                        {
                           _loc58_ = 1;
                        }
                        _loc4_.pvpGain = _loc58_;
                     }
                  }
                  if(!this.api.datacenter.Game.isFight && (_global.parseInt(_loc8_,10) != this.api.datacenter.Player.ID && ((this.api.datacenter.Player.alignment.index == 1 || this.api.datacenter.Player.alignment.index == 2) && ((_loc4_.alignment.index == 1 || _loc4_.alignment.index == 2) && (_loc4_.alignment.index != this.api.datacenter.Player.alignment.index && (_loc4_.rank.value && this.api.datacenter.Map.bCanAttack))))))
                  {
                     if(this.api.datacenter.Player.rank.value > _loc4_.rank.value)
                     {
                        this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_NEW_ENEMY_WEAK);
                     }
                     if(this.api.datacenter.Player.rank.value < _loc4_.rank.value)
                     {
                        this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_NEW_ENEMY_STRONG);
                     }
                  }
                  _loc45_ = this.sliptGfxData(_loc17_);
                  _loc34_ = _loc45_.gfx;
                  this.splitGfxForScale(_loc34_[0],_loc4_);
                  _loc4_.title = _loc79_;
                  _loc4_.title2 = _loc83_;
                  _loc11_ = this.api.kernel.CharactersManager.createCharacter(_loc8_,_loc15_,_loc4_);
                  _loc11_.isClear = false;
                  _loc11_.allowGhostMode = _loc71_;
                  _loc53_ = _loc8_;
                  _loc35_ = _loc45_.shape != "circle" ? 2 : 0;
                  _loc16_ = 0;
                  while(true)
                  {
                     _loc16_ = _loc16_ + 1;
                     if(_loc16_ >= _loc34_.length)
                     {
                        break;
                     }
                     if(_loc34_[_loc16_] != "")
                     {
                        _loc28_ = _loc8_ + "_" + _loc16_;
                        _loc18_ = new Object();
                        this.splitGfxForScale(_loc34_[_loc16_],_loc18_);
                        _loc29_ = new ank.battlefield.datacenter["\x1e\x0e\x10"](_loc28_,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc18_.gfxID + ".swf");
                        _loc29_.allDirections = false;
                        this.api.gfx.addLinkedSprite(_loc28_,_loc53_,_loc35_,_loc29_);
                        if(!_global.isNaN(_loc18_.scaleX))
                        {
                           this.api.gfx.setSpriteScale(_loc29_.id,_loc18_.scaleX,_loc18_.scaleY);
                        }
                        switch(_loc45_.shape)
                        {
                           case "circle":
                              _loc35_ = _loc16_;
                              break;
                           case "line":
                              _loc53_ = _loc28_;
                              _loc35_ = 2;
                        }
                     }
                  }
            }
            this.onSpriteMovement(_loc37_,_loc11_,_loc86_);
         }
         else
         {
            _loc81_ = _loc46_.substr(1);
            _loc82_ = this.api.datacenter.Sprites.getItemAt(_loc81_);
            this.onSpriteMovement(_loc37_,_loc82_);
         }
      }
   }
};
_loc1.onSpriteMovement = function(_loc2_, oSprite, _loc4_)
{
   if(oSprite instanceof dofus.datacenter["\x13\x01"])
   {
      this.api.datacenter.Game.playerCount += _loc2_ ? 1 : -1;
   }
   var _loc4_;
   var _loc5_;
   if(_loc2_)
   {
      if(_loc4_ != undefined)
      {
         this.api.gfx.spriteLaunchVisualEffect.apply(this.api.gfx,_loc4_);
      }
      this.api.gfx.addSprite(oSprite.id);
      if(!_global.isNaN(oSprite.scaleX))
      {
         this.api.gfx.setSpriteScale(oSprite.id,oSprite.scaleX,oSprite.scaleY);
      }
      if(oSprite instanceof dofus.datacenter["\x1e\x19\f"])
      {
         oSprite.mc.addExtraClip(dofus.Constants.EXTRA_PATH + oSprite.offlineType + ".swf",undefined,true);
         return undefined;
      }
      if(oSprite instanceof dofus.datacenter["\x02\x01"])
      {
         if(!_global.isNaN(oSprite.extraClipID))
         {
            this.api.gfx.addSpriteExtraClip(oSprite.id,dofus.Constants.EXTRA_PATH + oSprite.extraClipID + ".swf",undefined,false);
            return undefined;
         }
      }
      if(oSprite instanceof dofus.datacenter["\x13\x01"])
      {
         if(this.api.kernel.OptionsManager.getOption("AuraAbonados") && oSprite.esAbonado)
         {
            this.api.gfx.addEstiloVIP(oSprite.id);
         }
      }
      if(this.api.datacenter.Game.isRunning)
      {
         this.api.gfx.addSpriteExtraClip(oSprite.id,dofus.Constants.CIRCLE_FILE,dofus.Constants.TEAMS_COLOR[oSprite.Team]);
      }
      else if(oSprite.Aura != 0 && (oSprite.Aura != undefined && this.api.kernel.OptionsManager.getOption("Aura")))
      {
         this.api.gfx.addSpriteExtraClip(oSprite.id,dofus.Constants.AURA_PATH + oSprite.Aura + ".swf",undefined,true);
      }
      if(oSprite.id == this.api.datacenter.Player.ID)
      {
         this.api.ui.getUIComponent("Banner").updateLocalPlayer();
      }
      else if(this.api.gfx.spriteHandler.isPlayerSpritesHidden && (oSprite instanceof dofus.datacenter["\x13\x01"] || (oSprite instanceof dofus.datacenter.PlayerShop || oSprite instanceof dofus.datacenter["\t\x1d"])))
      {
         this.api.gfx.spriteHandler.hidePlayerSprites();
      }
      else if(this.api.gfx.spriteHandler.isShowingMonstersTooltip && oSprite instanceof dofus.datacenter["\t\x1d"])
      {
         oSprite.mc._rollOver();
      }
   }
   else if(!this.api.datacenter.Game.isRunning)
   {
      this.api.gfx.removeSprite(oSprite.id);
   }
   else
   {
      _loc4_ = oSprite.sequencer;
      _loc5_ = oSprite.mc;
      _loc4_.addAction(27,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("LEAVE_GAME",[oSprite.name]),"INFO_CHAT"]);
      _loc4_.addAction(28,false,this.api.ui.getUIComponent("Timeline"),this.api.ui.getUIComponent("Timeline").hideItem,[oSprite.id]);
      _loc4_.addAction(29,true,_loc5_,_loc5_.setAnim,["Die"],1500,true);
      if(oSprite.hasCarriedChild())
      {
         this.api.gfx.uncarriedSprite(oSprite.carriedChild.id,oSprite.cellNum,false,_loc4_);
         _loc4_.addAction(30,false,this.api.gfx,this.api.gfx.addSpriteExtraClip,[oSprite.carriedChild.id,dofus.Constants.CIRCLE_FILE,dofus.Constants.TEAMS_COLOR[oSprite.carriedChild.Team]]);
      }
      _loc4_.addAction(31,false,_loc5_,_loc5_.clear);
      _loc4_.execute();
      if(this.api.datacenter.Game.currentPlayerID == oSprite.id)
      {
         this.api.ui.getUIComponent("Banner").stopTimer();
         this.api.ui.getUIComponent("Timeline").stopChrono();
      }
   }
   this.api.kernel.GameManager.applyCreatureMode();
};
 //esta función se ejecuta justo cuando termina un combate. 
 //Su trabajo es recibir los datos crudos del servidor sobre el resultado de la pelea, procesarlos y preparar toda la información para luego mostrar la ventana de resultados
_loc1.onEnd = function (_loc2_)
{
    if (this.api.kernel.MapsServersManager.isBuilding)
    {
        this.addToQueue({object: this, method: this.onEnd, params: [_loc2_]});
        return;
    } 
    this._bIsBusy = true;
    var _loc6 = this.api.ui.getUIComponent("FightChallenge");
    this.api.kernel.StreamingDisplayManager.onFightEnd();
    var _loc4 = {winners: [], loosers: [], collectors: [], challenges: _loc6.challenges.clone(), currentTableTurn: this.api.datacenter.Game.currentTableTurn, currentPlayerInfos: []};
    this.api.datacenter.Game.results = _loc4;
    _loc6.cleanChallenge();
    var _loc3 = _loc2_.split("|");
    var _loc7 = -1;
    if (!_global.isNaN(Number(_loc3[0])))
    {
        _loc4.duration = Number(_loc3[0]);
    }
    else
    {
        var _loc8 = _loc3[0].split(";");
        _loc4.duration = Number(_loc8[0]);
        _loc7 = Number(_loc8[1]);
    } 
    this.api.datacenter.Basics.aks_game_end_bonus = _loc7;
    var _loc10 = Number(_loc3[1]);
    var _loc5 = Number(_loc3[2]);
    _loc4.fightType = _loc5;
    var _loc9 = new ank["\x1e\n\x07"]["\x0f\x01"]();
    var _loc11 = 0;
    this.parsePlayerData(_loc4, 3, _loc10, _loc3, _loc5, _loc11, _loc9);
};
//Esta función es la continuación lógica de la anterior (onEnd) y es donde ocurre la mayor parte del trabajo pesado.
//la función parsePlayerData es el "motor" que procesa los datos de cada participante individual (jugador, monstruo o recaudador) uno por uno.
//Funciona como un bucle, procesando un participante y luego llamándose a sí misma para procesar el siguiente hasta que no queden más.
_loc1.parsePlayerData = function (_loc2_, _loc3_, _loc4_, _loc5_, _loc6_, _loc7_, _loc8_, bAlreadyParsed, bIsChest)
{
    var _loc16 = _loc3_;
    var dataParts = _loc5_[_loc16].split(";");
    var playerData = new Object();
    var itemDataString;

    if (Number(dataParts[0]) != 6)
    {
        playerData.id = Number(dataParts[1]);
        var nameInfo = this.api.kernel.CharactersManager.getNameFromData(dataParts[2]);
        playerData.name = nameInfo.name;
        playerData.type = nameInfo.type;
        playerData.gfx = nameInfo.gfx;
        playerData.level = Number(dataParts[3]);
        playerData.bDead = (dataParts[4] == "1");

        switch (Number(dataParts[0]))
        {
            case 1: // Ganador PVP
                playerData.minhonour = Number(dataParts[5]);
                playerData.honour = Number(dataParts[6]);
                playerData.maxhonour = Number(dataParts[7]);
                playerData.winhonour = Number(dataParts[8]);
                playerData.rank = Number(dataParts[9]);
                playerData.disgrace = Number(dataParts[10]);
                playerData.windisgrace = Number(dataParts[11]);
                itemDataString = dataParts[12].split(",");
                playerData.kama = Number(dataParts[13]);
                playerData.minxp = Number(dataParts[14]);
                playerData.xp = Number(dataParts[15]);
                playerData.maxxp = Number(dataParts[16]);
                playerData.winxp = Number(dataParts[17]);
                break;
            case 0: // Perdedor
            case 2: // Ganador PVM
                playerData.minxp = Number(dataParts[5]);
                playerData.xp = Number(dataParts[6]);
                playerData.maxxp = Number(dataParts[7]);
                playerData.winxp = Number(dataParts[8]);
                playerData.guildxp = Number(dataParts[9]);
                playerData.mountxp = Number(dataParts[10]);
                itemDataString = dataParts[11].split(",");
                playerData.kama = Number(dataParts[12]);
                break;
        }
    }
    else 
    {
        itemDataString = dataParts[1].split(",");
        playerData.kama = Number(dataParts[2]);
    }

    playerData.items = this.parseItems(itemDataString);

    switch (Number(dataParts[0]))
    {
        case 0: _loc2_.loosers.push(playerData); break;
        case 1:
        case 2: _loc2_.winners.push(playerData); break;
        case 5: _loc2_.collectors.push(playerData); break;
        case 6: _loc8_ = _loc8_.concat(playerData.items); break;
    }

    if (!bAlreadyParsed && playerData.id == this.api.datacenter.Player.ID)
    {
        _loc2_.currentPlayerInfos.push(playerData);
        bAlreadyParsed = true;
    }

    _loc16 += 1;
    if (_loc16 < _loc5_.length)
    {
        this.addToQueue({object: this, method: this.parsePlayerData, params: [_loc2_, _loc16, _loc4_, _loc5_, _loc6_, _loc7_, _loc8_, bAlreadyParsed, bIsChest]});
    }
    else
    {
        this.onParseItemEnd(_loc4_, _loc2_, _loc8_, _loc7_);
    }
};
// Es el último paso en toda la secuencia de fin de combate. Es la que se encarga de "apagar las luces" y devolver al jugador al mapa.
// Su propósito es (1) distribuir cualquier botín especial que sea compartido (como el de un cofre o un bonus de percepción).
// (2) limpiar el estado del juego para indicar que el combate ha terminado.
// (3) activar la secuencia final que cierra la interfaz de combate.
/* Es el último paso en toda la secuencia de fin de combate. Es la que se encarga de "apagar las luces" y devolver al jugador al mapa.
   Su propósito es (1) distribuir cualquier botín especial que sea compartido (como el de un cofre o un bonus de percepción).
   (2) limpiar el estado del juego para indicar que el combate ha terminado.
   (3) activar la secuencia final que cierra la interfaz de combate. */
_loc1.onParseItemEnd = function(fightInitiatorID, resultsObject, sharedLootArray, sharedKamas)
{
    /* Paso 1: Repartir el Botín Compartido
        Antes de hacer nada, realiza una comprobación de seguridad. Se asegura de que realmente haya ítems para repartir (sharedLootArray.length > 0)
        ganadores a quienes dárselos (resultsObject.winners.length > 0).
        Esto evita errores como la división por cero si nadie ganó o no hubo botín especial.*/
    if (sharedLootArray != undefined && sharedLootArray.length > 0 && resultsObject.winners.length > 0)
    {
        /*Realiza todos los cálculos de forma clara y por adelantado.
        winnerCount: Guarda cuántos ganadores hay.
        kamasPerWinner y itemsPerWinner: Calcula la porción de kamas e ítems que le corresponde a cada ganador,
        redondeando hacia arriba (Math.ceil) para asegurar que todo el botín se distribuya.*/
        var winnerCount = resultsObject.winners.length;
        var kamasPerWinner = Math.ceil(sharedKamas / winnerCount);
        var itemsPerWinner = Math.ceil(sharedLootArray.length / winnerCount);
        /*Bucle para recorrer cada ganador
        Reparto Inteligente: La línea numItemsToGive = ... es la parte clave. Para evitar problemas de redondeo, le da la porción calculada (itemsPerWinner) a todos los jugadores.
        Al último jugador de la lista (i === winnerCount - 1), le entrega todos los ítems que queden en la bolsa. Esto garantiza que ningún ítem se pierda.
        Entrega Segura: Finalmente, le da a cada currentWinner su parte de las kamas y de los ítems, usando push para añadirlos a su inventario y pop para sacarlos de la bolsa compartida.*/
        for (var i = 0; i < winnerCount; i++) 
        {
            var currentWinner = resultsObject.winners[i];
            // Asignar kamas (asegurándose de que la propiedad exista)
            if (currentWinner.kama == undefined) {
                currentWinner.kama = 0;
            }
            currentWinner.kama += kamasPerWinner;
            // Determinar cuántos ítems dar a este jugador
            // El último jugador se lleva los ítems restantes para evitar errores de redondeo
            var numItemsToGive = (i === winnerCount - 1) ? sharedLootArray.length : itemsPerWinner;

            // Bucle para dar los ítems
            for (var j = 0; j < numItemsToGive; j++) 
            {
                if (sharedLootArray.length > 0) {
                    currentWinner.items.push(sharedLootArray.pop());
                }
            }
        }
    }
    // 2. Limpieza y tareas finales del jugador
    /* Esta parte se encarga de limpiar el estado del juego.
    if(_loc2_ == ...): Comprueba si el jugador actual es quien inició el combate. Si es así, ejecuta algunas funciones de limpieza adicionales para ese personaje.
    Game.isRunning = false y _bIsBusy = false: Desactiva las banderas que indicaban que un combate estaba en curso.
    Esto es muy importante para que el juego sepa que puede volver a aceptar otras acciones del jugador (como moverse, intercambio, etc.).*/
    if (fightInitiatorID == this.api.datacenter.Player.ID)
    {
        this.aks.GameActions.onActionsFinish(String(fightInitiatorID));
        this.api.kernel.GameManager.forceCleanPlayer(fightInitiatorID);
    }
    this.api.datacenter.Game.isRunning = false;
    this._bIsBusy = false;
    // 3. Ejecutar la salida del combate usando el gestor de secuencias (sequencer)
    /*  Ejecutar la Salida del Combate
    sequencer Es el gestor de acciones y animaciones de un personaje. Funciona como una lista de tareas: "primero camina, luego ataca, luego lanza un hechizo".
    loc9_.addAction(...): Le añade una nueva tarea a la lista del personaje: "Cuando termines lo que estás haciendo, ejecuta la función terminateFight".
    La función terminateFight es la que finalmente cierra la ventana de resultados y devuelve la cámara al mapa.
    _loc9_.execute(false): Le dice al gestor: "Ok, empieza a ejecutar las tareas de la lista".
    El else con setTimer: Es un plan B. Si por alguna razón no se encuentra el "sequencer" del personaje (un bug raro).
    Simplemente espera medio segundo (500 ms) y fuerza el cierre del combate. 
    Esto evita que el jugador se quede atascado para siempre en la pantalla de combate. */
    var playerSequencer = this.api.datacenter.Sprites.getItemAt(fightInitiatorID).sequencer;
    if (playerSequencer != undefined)
    {
        playerSequencer._bPlaying = false; // Detener cualquier acción actual
        playerSequencer.addAction(26, false, this.api.kernel.GameManager, this.api.kernel.GameManager.terminateFight);
        playerSequencer.execute(false);
    }
    else
    {
        // Plan B: Si no se encuentra el sequencer, forzar la terminación tras un breve retraso
        ank.utils.Logger.err("[AKS.Game.onEnd] Impossible de trouver le sequencer");
        ank.utils.Timer.setTimer(this, "game", this.api.kernel.GameManager, this.api.kernel.GameManager.terminateFight, 500);
    }
    // 4. Mostrar un consejo
    // Solo le pide al gestor de consejos que muestre un "Tip" o consejo útil relacionado con el fin de un combate.
    this.api.kernel.TipsManager.showNewTip(dofus.managers.TipsManager.TIP_FIGHT_ENDFIGHT);
};
_loc1.parseItems = function (itemsDataString)
{
    var finalItemsArray = new Array();
    if (itemsDataString == undefined || itemsDataString.length == 0 || itemsDataString[0] == "") {
        return finalItemsArray;
    }
    for (var i = 0; i < itemsDataString.length; i = i + 1)
    {
        var itemParts = itemsDataString[i].split("~");
        var itemID = Number(itemParts[0]);
        var itemQuantity = Number(itemParts[1]);
        if (!_global.isNaN(itemID) && itemID != 0)
        {
            // La clase dofus.datacenter["\f\f"] es dofus.datacenter.Item
            var newItem = new dofus.datacenter["\f\f"](0, itemID, itemQuantity);
            finalItemsArray.push(newItem);
        }
    }
    return finalItemsArray;
};
_loc1.onFrameObject2 = function(sExtraData)
{
   var _loc9_ = sExtraData.split("|");
   var _loc3_ = 0;
   var _loc2_;
   var _loc4_;
   var _loc8_;
   var _loc6_;
   var _loc7_;
   var _loc5_;
   while(_loc3_ < _loc9_.length)
   {
      _loc2_ = _loc9_[_loc3_].split(";");
      _loc4_ = Number(_loc2_[0]);
      _loc8_ = _loc2_[1];
      _loc6_ = _loc2_[2] != undefined;
      _loc7_ = _loc2_[2] == "1" ? true : false;
      _loc5_ = _loc2_[3];
      if(_loc6_)
      {
         this.api.gfx.setObject2Interactive(_loc4_,_loc7_,2,_loc5_);
      }
      this.api.gfx.setObject2Frame(_loc4_,_loc8_);
      _loc3_ += 1;
   }
};
_loc1.bSubareaHasWhiteFloor = false;
#endinitclip