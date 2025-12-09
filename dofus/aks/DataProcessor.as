#initclip 188
var _loc1 = dofus.aks["\x11\f"].prototype;
_loc1.proceso = function(sData)
{
   if(_global.VECES_INTERVALO >= _global.MAX_VECES_INTERVALO)
   {
      _global.clearInterval(this._nIntervalo);
      _global.MAX_VECES_INTERVALO = Number(0);
      _global.VECES_INTERVALO = Number(0);
      return undefined;
   }
   _global.VECES_INTERVALO++;
   this.process(sData);
};
_loc1.process = function(sData)
{
   var _loc4_ = sData.charAt(0);
   
   // Debug logging para todos los paquetes recibidos
   _global.trace("[DATAPROCESSOR] RAW PACKET: " + (sData.length > 50 ? sData.substring(0,50) + "..." : sData));
   
   this.api.datacenter.refresh();
   var _loc3_;
   if(_loc4_ == "-")
   {
      _global.trace("[DATAPROCESSOR] HERO PACKET detected: " + sData.substring(0, 20) + "...");
      _loc3_ = sData.substr(1).split("|");
      var heroId = _loc3_[0];
      _global.trace("[DATAPROCESSOR] Hero ID: " + heroId + ", changing datacenter");
      this.api.datacenter.change(_loc3_[0]);
      _loc3_.splice(0,1);
      sData = _loc3_.join("|");
      _global.trace("[DATAPROCESSOR] After hero processing, packet: " + sData.substring(0, 30) + "...");
      _loc4_ = sData.charAt(0);
   }
   var _loc6_ = sData.charAt(1);
   var _loc5_ = sData.charAt(2) == "E";
   this.postProcess(_loc4_,_loc6_,_loc5_,sData);
   this.api.datacenter.refresh();
};
_loc1.defaultProcessAction = function(sType, sAction, bError, sData)
{
};
_loc1.postProcess = function(sType, sAction, bError, sData)
{
   var _loc31_;
   var _loc42_;
   var _loc39_;
   var _loc38_;
   var _loc41_;
   var _loc32_;
   var _loc10_;
   var _loc28_;
   var _loc26_;
   var _loc0_;
   var _loc25_;
   var _loc17_;
   var _loc24_;
   var _loc43_;
   var _loc44_;
   var _loc16_;
   var _loc18_;
   var _loc37_;
   var _loc27_;
   var _loc11_;
   var _loc7_;
   var _loc13_;
   var _loc9_;
   var _loc6_;
   var _loc12_;
   var _loc22_;
   var _loc23_;
   var _loc19_;
   var _loc40_;
   var _loc45_;
   var _loc36_;
   var _loc30_;
   var _loc35_;
   var _loc14_;
   var _loc15_;
   var _loc20_;
   var _loc21_;
   var _loc29_;
   var _loc33_;
   var _loc34_;
   switch(sType)
   {
      case "Ñ":
         switch(sAction)
         {
            case "d":
               this.api.ui.getUIComponent("AgregarDrops").recibir(sData.substr(2));
               break; 
            case "E":
               this.api.ui.getUIComponent("CardsCollection").visualizar(sData.substr(2));
               break; 
            case "F":
               this.api.ui.loadUIAutoHideComponent("CardsCollection","CardsCollection",{mobs:sData.substr(2)});
               break; 
            case "f":
               this.api.ui.getUIComponent("CardsCollection").mostrarMobsDrops(sData.substr(2));
               break; 
            case "J":
               this.api.ui.getUIComponent("MobStats").defecto(sData.substr(2));
               break; 
            case "K":
               this.api.ui.getUIComponent("MobStats").recibir(sData.substr(2));
               break; 
            case "M":
               this.api.ui.loadUIAutoHideComponent("Mimobionte","Mimobionte");
               break; 
            case "P":
               this.api.ui.loadUIAutoHideComponent("PanelAdmin","PanelAdmin",{data:sData.substr(2)});
               break; 
            case "y":
               this.api.ui.getUIComponent("AgregarDrops").visualizar(sData.substr(2));
               break; 
            case "X":
               var _loc22 = sData.substr(2).split("|");
               this.api.ui.loadUIAutoHideComponent("Almanax","Almanax",{año:_loc22[0],mes:_loc22[1],dia:_loc22[2],solicita:_loc22[3],bonus:_loc22[4],avance:_loc22[5],ok:_loc22[6]});
               break; 
            default:
               break; 
         }
         break;
     case "H":
      switch(sAction)
      {
         case "h":
            switch(sData.charAt(2))
            {
               case "P":
                  if(sData.length == 2)
                  {
                     // HP - Cargar panel de héroes
                     this.api.ui.loadUIComponent("HeroesPanel","UI_HeroesPanel");
                  }
                  else
                  {
                     // HhP<panel> - Cargar panel específico de héroe
                     _loc31_ = sData.substr(3);
                     var heroId = this.api.datacenter.Player.ID;
                     _global.trace("[DATAPROCESSOR] Loading hero panel: " + _loc31_ + " with heroID: " + heroId);
                     this.api.ui.loadUIAutoHideComponent(_loc31_,_loc31_,{heroID:heroId});
                  }
                  break;
               case "L":
                  this.api.datacenter.setPlayerReal(sData.substr(3));
                  var banner = this.api.ui.getUIComponent("Banner");
                  if(banner != undefined)
                  {
                     banner.data = this.api.datacenter.Player;
                  }
                  break;
               case "M":
                  _loc42_ = "Waiting...";
                  _loc39_ = sData.charAt(3) == "1";
                  _loc38_ = sData.substr(4);
                  if(_loc39_)
                  {
                     this.api.ui.loadUIComponent("AskOKWait","AskOKWait",{title:_loc42_,text:_loc38_},{bForceLoad:true});
                  }
                  else
                  {
                     this.api.ui.unloadUIComponent("AskOKWait");
                  }
                  break;
               case "A":
                  var _loc41_ = sData.substr(3);
                  var heroesPanel = this.api.ui.getUIComponent("HeroesPanel");
                  if(heroesPanel != undefined)
                  {
                     heroesPanel.actualizar(_loc41_);
                  }
                  break;
               default:
                  break; 
            }
            break; // Este break es para case "h"
         case "C":
            this.aks.onHelloConnectionServer(sData.substr(2));
            break;  
         case "G":
            this.aks.onHelloGameServer(sData.substr(2));
            break;  
         case "X":
            var _loc22 = sData.substr(2).split("|");
            this.api.ui.loadUIAutoHideComponent("Almanax","Almanax",{año:_loc22[0],mes:_loc22[1],dia:_loc22[2],solicita:_loc22[3],bonus:_loc22[4],avance:_loc22[5],ok:_loc22[6]});
            break;  
         case "Y":
            Cerebro.process(sData.substr(2));
            break;  
         default:
            this.aks.disconnect(false,true);
            break;  
      }
      break; // Este break final es para case "H" y ahora SÍ se ejecuta siempre.
      case "p":
      this.aks.onPong();
      break; 
   case "q":
      this.aks.onQuickPong();
      break; 
   case "r":
      this.aks.send("rpong" + sData.substr(5),false);
      break; 
   case "M":
      this.aks.onServerMessage(sData.substr(1));
      break; 
   case "B":
      switch(sAction)
      {
         case "N":
            break;
         case "A":
            switch(sData.charAt(2))
            {
               case "T":
                  this.aks.Basics.onAuthorizedCommand(true,sData.substr(3));
                  break; 
               case "L":
                  this.aks.Basics.onAuthorizedLine(sData.substr(3));
                  break; 
               case "P":
                  this.aks.Basics.onAuthorizedCommandPrompt(sData.substr(3));
                  break; 
               case "C":
                  this.aks.Basics.onAuthorizedCommandClear();
                  break; 
               case "E":
                  this.aks.Basics.onAuthorizedCommand(false);
                  break; 
               case "I":
                  switch(sData.charAt(3))
                  {
                     case "O":
                        this.aks.Basics.onAuthorizedInterfaceOpen(sData.substr(4));
                        break; 
                     case "C":
                        this.aks.Basics.onAuthorizedInterfaceClose(sData.substr(4));
                        break; 
                     default:
                        this.aks.defaultProcessAction(sType,sAction,bError,sData);
                        break; 
                  }
                  break; // Este 'break' es de case "I" (estaba bien)
               default:
                  this.aks.defaultProcessAction(sType,sAction,bError,sData);
                  break; 
            }
            break; // Este 'break' es de case "A" (estaba bien)
         case "T":
            this.aks.Basics.onReferenceTime(sData.substr(2));
            break; 
         case "D":
            this.aks.Basics.onDate(sData.substr(2));
            break; 
         case "W":
            this.aks.Basics.onWhoIs(!bError,sData.substr(3));
            break; 
         case "P":
            this.aks.Basics.onSubscriberRestriction(sData.substr(2));
            break; 
         case "C":
            this.aks.Basics.onFileCheck(sData.substr(2));
            break; 
         case "p":
            this.aks.Basics.onAveragePing(sData.substr(2));
            break; 
         case "v":
            dofus.Sonidos.SONIDO_GENERAL.playSound(sData.substr(2));
            break; 
         default:
            this.aks.defaultProcessAction(sType,sAction,bError,sData);
            break; 
      }
      break; // Este 'break' es de case "B" (estaba bien)
      case "A":
      switch(sAction)
      {
         case "_":
            this.api.ui.loadUIAutoHideComponent("CambiarClase","CambiarClase",{data:sData.substr(2)});
            break;
         case "?":
            _loc32_ = sData.substr(2).split("~");
            _loc10_ = _global.API.ui.getUIComponent("Banner");
            _loc10_.visualizar(_loc32_[0],_loc32_[1]);
            break;
         case "-":
            switch(sData.charAt(2))
            {
               case "A":
                  this.api.ui.loadUIComponent("CambiarNombre","CambiarNombre");
                  break;
               case "E":
                  if(this.api.ui.getUIComponent("CambiarNombre") != undefined)
                  {
                     this.api.ui.getUIComponent("CambiarNombre").nombreUsado();
                  }
                  break;
               case "e":
                  if(this.api.ui.getUIComponent("CambiarNombre") != undefined)
                  {
                     this.api.ui.getUIComponent("CambiarNombre").nombreError();
                  }
                  break;
               case "a":
                  this.api.ui.loadUIComponent("EscogerNivel","EscogerNivel");
            }
            break;
         case "A":
            this.aks.Account.onCharacterAdd(!bError,sData.substr(3));
            break;
         case "E":
            var _loc22 = false;
            _loc28_ = false;
            _loc26_ = false;
            switch(sData.charAt(2))
            {
               case "n":
                  _loc22 = true;
                  break;
               case "c":
                  _loc28_ = true;
                  break;
               case "i":
                  _loc26_ = sData.charAt(3) != undefined && sData.charAt(3) == "f";
                  if(this.api.ui.getUIComponent("MakeMimibiote") == undefined)
                  {
                     this.api.ui.loadUIComponent("MakeMimibiote","MakeMimibiote");
                  }
                  break;  
               default:
                  if(this.api.ui.getUIComponent("MakeMimibiote") == undefined)
                  {
                     this.api.ui.loadUIComponent("MakeMimibiote","MakeMimibiote");
                  }
                  break;  
            }
            _loc26_ = sData.charAt(3) != undefined && sData.charAt(3) == "f";
            if(this.api.ui.getUIComponent("EditPlayer") == undefined)
            {
               this.api.ui.loadUIComponent("EditPlayer","EditPlayer",{editName:_loc22,editColors:_loc28_,force:_loc26_});
            }
            break;
         case "a":
            this.aks.Game.onTurnLider(sData.substr(2));
            break;
         case "b":
            if(this.api.ui.getUIComponent("Banner") != undefined)
            {
               this.api.ui.getUIComponent("Banner").activarCirculoXP();
            }
            break;
         case "B":
            this.aks.Account.onCharacterSelectedLeader(sData.substr(2));
            break;
         case "C":
            this.aks.Account.cambiarClase(sData.substr(2));
            break;
         case "c":
            this.aks.Account.onCommunity(sData.substr(2));
            break;
         case "d":
            this.aks.Account.onDofusPseudo(sData.substr(2));
            break;
         case "D":
            this.aks.Account.onCharacterDelete(!bError,sData.substr(3));
            break;
         case "F":
            this.aks.Account.onFriendServerList(sData.substr(2));
            break;
         case "f":
            this.aks.Account.onNewQueue(sData.substr(2));
            break;
         case "g":
            this.aks.Account.onGiftsList(sData.substr(2));
            break;
         case "G":
            this.aks.Account.onGiftStored(!bError);
            break;
         case "H":
            this.aks.Account.onHosts(sData.substr(2));
            break;
         case "h":
            this.aks.Account.onAddHero(sData.substr(2));
            break;
         case "I":
            this.aks.Account.cambiarID(sData.substr(2));
            break;
         case "k":
            this.aks.Account.onStats2(sData.substr(2));
            break;
         case "K":
            this.aks.Account.onKey(sData.substr(2));
            break;
         case "l":
            this.aks.Account.onLogin(!bError,sData.substr(3));
            break;
         case "L":
            this.aks.Account.onCharactersList(!bError,sData.substr(3));
            break;
         case "M":
            _loc0_ = _loc0_ = sData.charAt(2);
            if(_loc0_ !== "?")
            {
               this.aks.Account.onCharactersList(!bError,sData.substr(3),true);
            }
            else
            {
               this.aks.Account.onCharactersMigrationAskConfirm(sData.substr(3));
            }
            break;
         case "m":
            if(!_global.CONFIG.isStreaming)
            {
               this.aks.Account.onMiniClipInfo();
            }
            else
            {
               _loc25_ = _global.parseInt(sData.charAt(2),10);
               if(_global.isNaN(_loc25_))
               {
                  _loc25_ = 3;
               }
               fscommand("GoToCongratulation",_loc25_);
            }
            break;
         case "N":
            this.aks.Account.onNewLevel(sData.substr(2));
            break;
         case "n":
            this.aks.Account.onNewReset(sData.substr(2));
            break;
         case "o":
            this.aks.Account.onInventory(sData.substr(2));
            break;
         case "p":
            this.aks.Account.onNewOmega(sData.substr(2));
            break;
         case "P":
            this.aks.Account.onCharacterNameGenerated(!bError,sData.substr(3));
            break;
         case "q":
            this.aks.Account.onQueue(sData.substr(2));
            break;
         case "Q":
            this.aks.Account.onSecretQuestion(sData.substr(2));
            break;
         case "r":
            this.aks.Account.onRescue(!bError);
            break;
         case "R":
            this.aks.Account.onRestrictions(sData.substr(2));
            break;
         case "S":
            this.aks.Account.onCharacterSelected(!bError,sData.substr(4));
            this.aks.electron(true);
            break;
         case "s":
            _global.trace("[DATAPROCESSOR] Processing As packet, current datacenter Player ID: " + this.api.datacenter.Player.ID);
            this.aks.Account.onStats(sData.substr(2));
            break;
         case "T":
            this.aks.Account.onTicketResponse(!bError,sData.substr(3));
            break;
         case "t":
            _loc0_ = _loc0_ = sData.charAt(2);
            if(_loc0_ === "S")
            {
               this.aks.send("AtS");
            }
            break;
         case "V":
            this.aks.Account.onRegionalVersion(sData.substr(2));
            this.iniciarVoto();
            break;
         case "x":
            this.aks.Account.onServersList(!bError,sData.substr(3));
            break;
         case "X":
            this.aks.Account.onSelectServer(!bError,true,sData.substr(3));
            break;
         case "Y":
            this.aks.Account.onSelectServer(!bError,false,sData.substr(3));
         default:
            break;
      }
      break;  
      case "G":
      switch(sAction)
      {
         case "ñ":
            this.api.ui.getUIComponent("Banner").modoCriatura(sData.substr(2));
            break; 
         case "H":
            this.aks.Game.cambiarModoTactico();
            break; 
         case "Z":
            switch(sData.charAt(2))
            {
               case "A":
                  _loc17_ = sData.substr(3).split(";");
                  if(_loc17_.length == 4)
                  {
                     this.aks.Game.propuestaOgrinas({vendedor:_loc17_[0],comprador:_loc17_[1],ogrinas:_loc17_[2],kamas:_loc17_[3]});
                  }
                  break;
               case "C":
                  this.aks.Game.cerrarPropuesta();
                  break; // <-- AÑADIDO (para evitar fallthrough)
               default:
                  break; 
            }
            break;
         case "C":
            this.aks.Game.onCreate(!bError,sData.substr(4));
            break; 
         case "J":
            this.aks.Game.onJoin(sData.substr(3));
            break; 
         case "P":
            this.aks.Game.onPositionStart(sData.substr(2));
            break; 
         case "R":
            this.aks.Game.onReady(sData.substr(2));
            break; 
         case "s":
            this.aks.Game.onStopSpriteMove(sData.substr(2));
            break; 
         case "S":
            this.aks.Game.onStartToPlay();
            break; 
         case "E":
            this.aks.Game.onEnd(sData.substr(2));
            break; 
         case "M":
            this.aks.Game.onMovement(sData.substr(3));
            break; 
         case "c":
            this.aks.Game.onChallenge(sData.substr(2));
            break; 
         case "t":
            this.aks.Game.onTeam(sData.substr(2));
            break; 
         case "V":
            this.aks.Game.onLeave(true,sData.substr(2));
            break; 
         case "f":
            this.aks.Game.onFlag(sData.substr(2));
            break; 
         case "I":
            switch(sData.charAt(2))
            {
               case "C":
                  this.aks.Game.onPlayersCoordinates(sData.substr(4));
                  break; 
               case "E":
                  this.aks.Game.onEffect(sData.substr(3));
                  break; 
               case "e":
                  this.aks.Game.onClearAllEffect(sData.substr(3));
                  break; 
               case "P":
                  this.aks.Game.onPVP(sData.substr(3),false);
                  break; 
               default:
                  this.aks.defaultProcessAction(sType,sAction,bError,sData);
                  break; 
            }
            break;
         case "D":
            switch(sData.charAt(2))
            {
               case "C":
                  this.aks.Game.onCellData(sData.substr(3));
                  break; 
               case "D":
                  this.aks.Game.onDescripcion(sData.substr(3));
                  break; 
               case "E":
                  this.aks.Game.onFrameObjectExternal(sData.substring(4));
                  break; 
               case "F":
                  this.aks.Game.onFrameObject2(sData.substring(4));
                  break; 
               case "K":
                  this.aks.Game.onMapLoaded();
                  break; 
               case "M":
                  this.aks.Game.onMapData(sData.substr(4));
                  break; 
               case "O":
                  this.aks.Game.onCellObject(sData.substring(3));
                  break; 
               case "Z":
                  this.aks.Game.onZoneData(sData.substring(3));
                  break; 
               default:
                  this.aks.defaultProcessAction(sType,sAction,bError,sData);
                  break; 
            }
            break;
         case "d":
            switch(sData.charAt(3))
            {
               case "K":
                  this.aks.Game.onFightChallengeUpdate(sData.substr(4),true);
                  break; 
               case "O":
                  this.aks.Game.onFightChallengeUpdate(sData.substr(4),false);
                  break; 
               default:
                  this.aks.Game.onFightChallenge(sData.substr(2));
                  break; 
            }
            break;
         case "A":
            switch(sData.charAt(2))
            {
               case "S":
                  this.aks.GameActions.onActionsStart(sData.substr(3));
                  break; 
               case "F":
                  this.aks.GameActions.onActionsFinish(sData.substr(3));
                  break; 
               case "C":
                  this.aks.GameActions.onCleanGameActions();
                  break; 
               default:
                  this.aks.GameActions.onActions(sData.substr(2));
                  break; 
            }
            break;
         case "T":
            switch(sData.charAt(2))
            {
               case "S":
                  this.aks.Game.onTurnStart(sData.substr(3));
                  break; 
               case "C":
                  this.aks.Game.colorTurno(sData.substr(3));
                  break; 
               case "c":
                  this.aks.Game.eliminarColorTurno(sData.substr(3));
                  break; 
               case "F":
                  this.aks.Game.onTurnFinish(sData.substr(3));
                  break; 
               case "L":
                  this.aks.Game.onTurnlist(sData.substr(4));
                  break; 
               case "M":
                  this.aks.Game.onTurnMiddle(sData.substr(4));
                  break; 
               case "U":
                  this.aks.Game.onTurnUpdate(sData.substr(4));
                  break; 
               case "R":
                  this.aks.Game.onTurnReady(sData.substr(3));
                  break; 
               default:
                  this.aks.defaultProcessAction(sType,sAction,bError,sData);
                  break; 
            }
            break;
         case "X":
            this.aks.Game.onExtraClip(sData.substr(2));
            break; 
         case "o":
            this.aks.Game.onFightOption(sData.substr(2));
            break; 
         case "O":
            this.aks.Game.onGameOver();
            break; 
         default:
            this.aks.defaultProcessAction(sType,sAction,bError,sData);
            break; 
      }
      break; // Este 'break' final para case "G" está correcto
      case "c":
      switch(sAction)
      {
         case "M":
            this.aks.Chat.onMessage(!bError,sData.substr(3));
            break; 
         case "s":
            this.aks.Chat.onServerMessage(sData.substr(2));
            break; 
         case "S":
            this.aks.Chat.onSmiley(sData.substr(2));
            break; 
         case "C":
            this.aks.Chat.onSubscribeChannel(sData.substr(2));
            break; 
         default:
            this.aks.defaultProcessAction(sType,sAction,bError,sData);
            break; 
      }
      break; // Este break para case "c" (estaba bien)
     case "D":
      switch(sAction)
      {
         case "A":
            this.aks.Dialog.onCustomAction(sData.substr(2));
            break; 
         case "C":
            this.aks.Dialog.onCreate(!bError,sData.substr(3));
            break; 
         case "Q":
            this.aks.Dialog.onQuestion(sData.substr(2));
            break; 
         case "V":
            this.aks.Dialog.onLeave();
            break; 
         case "P":
            this.aks.Dialog.onPause();
            break; 
         case "B":
            this.api.kernel.DebugConsole.buscarDialogos(sData.charAt(2),sData.substr(3));
            break; 
         case "L":
            _loc24_ = sData.substr(3).split("|");
            _loc43_ = Number(_loc24_[0]);
            _loc24_.splice(0,1);
            _loc44_ = _loc24_.join("|");
            this.api.kernel.DebugConsole.cargarDialogo(sData.charAt(2),_loc43_,_loc44_);
            break; 
         case "X":
            this.api.kernel.DebugConsole.imprimirDialogos();
            break; 
         default:
            this.aks.defaultProcessAction(sType,sAction,bError,sData);
            break; 
      }
      break; // Este break 
      case "I":
      switch(sAction)
      {
         case "M":
            this.aks.Infos.onInfoMaps(sData.substr(2));
            break; 
         case "C":
            this.aks.Infos.onInfoCompass(sData.substr(2));
            break; 
         case "H":
            this.aks.Infos.onInfoCoordinatespHighlight(sData.substr(2));
            break; 
         case "m":
            this.aks.Infos.onMessage(sData.substr(2));
            break; 
         case "Q":
            this.aks.Infos.onQuantity(sData.substr(2));
            break; 
         case "O":
            this.aks.Infos.onObject(sData.substr(2));
            break; 
         case "P":
            this.aks.Infos.onPathWorld(sData.substr(2));
            break; 
         case "p":
            this.aks.Infos.onShow(sData.substr(2));
            break; 
         case "L":
            switch(sData.charAt(2))
            {
               case "S":
                  this.aks.Infos.onLifeRestoreTimerStart(sData.substr(3));
                  break; 
               case "F":
                  this.aks.Infos.onLifeRestoreTimerFinish(sData.substr(3));
                  break; 
               default:
                  this.aks.defaultProcessAction(sType,sAction,bError,sData);
                  break; 
            }
            break;
         default:
            this.aks.defaultProcessAction(sType,sAction,bError,sData);
            break; 
      }
      break;
   case "S":
      switch(sAction)
      {
         case "L":
            switch(sData.charAt(2))
            {
               case "o":
                  // Spells options change (SLo): apply option and refresh banner shortcuts
                  this.aks.Spells.onChangeOption(sData.substr(3));
                  if(this.api.ui.getUIComponent("Banner") != undefined)
                  {
                     this.api.ui.getUIComponent("Banner").shortcuts.updateCurrentTabInformations();
                  }
                  break; 
               case "M":
                  // Spells cooldown/list update (SLM): apply update and refresh banner shortcuts
                  this.aks.Spells.onList2(sData.substr(3));
                  if(this.api.ui.getUIComponent("Banner") != undefined)
                  {
                     this.api.ui.getUIComponent("Banner").shortcuts.updateCurrentTabInformations();
                  }
                  break; 
               case "F":
                  this.aks.Spells.updateSummons(sData.substr(3));
                  break; 
               case "U":
                  if(this.api.ui.getUIComponent("Banner") != undefined)
                  {
                     this.api.ui.getUIComponent("Banner")._msShortcuts.updateCurrentTabInformations();
                     // 'return' eliminado
                  }
                  // 'return' eliminado
                  break; 
               default:
                  // Full spells list (SL): update model then force a banner refresh so spells appear without opening UI
                  this.aks.Spells.onList(sData.substr(2));
                  if(this.api.ui.getUIComponent("Banner") != undefined)
                  {
                     this.api.ui.getUIComponent("Banner").shortcuts.updateCurrentTabInformations();
                  }
                  break; 
            }
            break;
         case "P":
            _loc0_ = _loc0_ = sData.charAt(2);
            if(_loc0_ === "X")
            {
               this.aks.send("RPX");
               // 'return' eliminado
            }
            // 'return' eliminado
            break; 
         case "D":
            this.aks.Spells.onDowngradeSpell(!_loc4,sData.substr(3));
            break; 
         case "M":
            this.aks.Spells.onMoveToUsed(sData.substr(2));
            break; 
         case "U":
            this.aks.Spells.onUpgradeSpell(!bError,sData.substr(3));
            break; 
         case "B":
            this.aks.Spells.onSpellBoost(sData.substr(2));
            break; 
         case "F":
            this.aks.Spells.onSpellForget(sData.substr(2));
            break; 
         case "C":
            this.aks.Spells.onSpellCooldown(sData.substr(2));
            break; 
         default:
            this.aks.defaultProcessAction(sType,sAction,bError,sData);
            break; 
      }
      break;
      case "O":
         switch(sAction)
         {
            case "a":
               this.aks.Items.onAccessories(sData.substr(2));
               break;
            case "D":
               this.aks.Items.onDrop(!bError,sData.substr(3));
               break;
            case "A":
               this.aks.Items.onAdd(!bError,sData.substr(3));
               break;
            case "C":
               this.aks.Items.onChange(sData.substr(3));
               break;
            case "R":
               this.aks.Items.onRemove(sData.substr(2));
               break;
            case "Q":
               this.aks.Items.onQuantity(sData.substr(2));
               break;
            case "M":
               this.aks.Items.onMovement(sData.substr(2));
               break;
            case "T":
               this.aks.Items.onTool(sData.substr(2));
               break;
            case "w":
               this.aks.Items.onWeight(sData.substr(2));
               break;
            case "r":
               switch(sData.charAt(2))
               {
                  case "A":
                     this.aks.InventoryShortcuts.onInventoryShortcutAdded(sData.substr(3));
                     break;
                  case "R":
                     this.aks.InventoryShortcuts.onInventoryShortcutRemoved(sData.substr(3));
               }
               break;
            case "o":
               var api = _global.API;
               if(api.ui.getUIComponent("Pase") != undefined)
               {
                  api.ui.getUIComponent("Pase").cargaTodo(sData.substr(2),false);
               }
               else if(_global.Panoramico)
               {
                  api.ui.loadUIAutoHideComponent("Pase","Pase",{datos:sData.substr(2)});
               }
               else
               {
                  api.ui.loadUIAutoHideComponent("Pase","Pase",{datos:sData.substr(2)});
               }
               break;
            case "S":
               this.aks.Items.onItemSet(sData.substr(2));
               break;
            case "s":
               this.aks.Items.setsRapidos(sData.substr(2));
               break;
            case "K":
               this.aks.Items.onItemUseCondition(sData.substr(2));
               break;
            case "F":
               this.aks.Items.onItemFound(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "F":
         switch(sAction) // aqui
         {
            case "A":
               this.aks.Friends.onAddFriend(!bError,sData.substr(3));
               break;
            case "D":
               this.aks.Friends.onRemoveFriend(!bError,sData.substr(3));
               break;
            case "L":
               this.aks.Friends.onFriendsList(sData.substr(3));
               break;
            case "S":
               this.aks.Friends.onSpouse(sData.substr(2));
               break;
            case "O":
               this.aks.Friends.onNotifyChange(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "i":
         switch(sAction)
         {
            case "A":
               this.aks.Enemies.onAddEnemy(!bError,sData.substr(3));
               break;
            case "D":
               this.aks.Enemies.onRemoveEnemy(!bError,sData.substr(3));
               break;
            case "L":
               this.aks.Enemies.onEnemiesList(sData.substr(3));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "K":
         switch(sAction)
         {
            case "C":
               this.aks.Key.onCreate(sData.substr(3));
               break;
            case "K":
               this.aks.Key.onKey(!bError);
               break;
            case "V":
               this.aks.Key.onLeave();
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "J":
         switch(sAction)
         {
            case "S":
               this.aks.Job.onSkills(sData.substr(3));
               break;
            case "X":
               this.aks.Job.onXP(sData.substr(3));
               break;
            case "N":
               this.aks.Job.onLevel(sData.substr(2));
               break;
            case "R":
               this.aks.Job.onRemove(sData.substr(2));
               break;
            case "O":
               this.aks.Job.onOptions(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "E":
         switch(sAction)
         {
            case "?":
               this.api.ui.loadUIAutoHideComponent("HistorialVentas","HistorialVentas",{data:sData.substr(2)});
               break;
            case "R":
               this.aks.Exchange.onRequest(!bError,sData.substr(3));
               break;
            case "K":
               this.aks.Exchange.onReady(sData.substr(2));
               break;
            case "V":
               this.aks.Exchange.onLeave(!bError,sData.substr(2));
               break;
            case "C":
               this.aks.Exchange.onCreate(!bError,sData.substr(3));
               break;
            case "c":
               this.aks.Exchange.onCraft(!bError,sData.substr(3));
               break;
            case "M":
               this.aks.Exchange.onLocalMovement(!bError,sData.substr(3));
               break;
            case "m":
               this.aks.Exchange.onDistantMovement(!bError,sData.substr(3));
               break;
            case "r":
               this.aks.Exchange.onCoopMovement(!bError,sData.substr(3));
               break;
            case "p":
               this.aks.Exchange.onPayMovement(!bError,sData.substr(2));
               break;
            case "s":
               this.aks.Exchange.onStorageMovement(!bError,sData.substr(3));
               break;
            case "i":
               this.aks.Exchange.onPlayerShopMovement(!bError,sData.substr(3));
               break;
            case "W":
               this.aks.Exchange.onCraftPublicMode(sData.substr(2));
               break;
            case "e":
               this.aks.Exchange.onMountStorage(sData.substr(2));
               break;
            case "f":
               this.aks.Exchange.onMountPark(sData.substr(2));
               break;
            case "w":
               this.aks.Exchange.onMountPods(sData.substr(2));
               break;
            case "L":
               this.aks.Exchange.onList(sData.substr(2));
               break;
            case "l":
               this.aks.Exchange.onList2(sData.substr(2));
               break;
            case "S":
               this.aks.Exchange.onSell(!bError);
               break;

            case "B":
               this.aks.Exchange.onBuy(!bError);
               break;
            case "q":
               this.aks.Exchange.onAskOfflineExchange(sData.substr(2));
               break;
            case "H":
               switch(sData.charAt(2))
               {
                  case "S":
                     this.aks.Exchange.onSearch(sData.substr(3));
                     break;
                  case "L":
                     this.aks.Exchange.onBigStoreTypeItemsList(sData.substr(3));
                     break;
                  case "M":
                     this.aks.Exchange.onBigStoreTypeItemsMovement(sData.substr(3));
                     break;
                  case "l":
                     this.aks.Exchange.onBigStoreItemsList(sData.substr(3));
                     break;
                  case "m":
                     this.aks.Exchange.onBigStoreItemsMovement(sData.substr(3));
                     break;
                  case "P":
                     this.aks.Exchange.onItemMiddlePriceInBigStore(sData.substr(3));
                     break;
                  default:
                     this.aks.defaultProcessAction(sType,sAction,bError,sData);
               }
               break;
            case "J":
               this.aks.Exchange.onCrafterListChanged(sData.substr(2));
               break;
            case "j":
               this.aks.Exchange.onCrafterReference(sData.substr(2));
               break;
            case "A":
               this.aks.Exchange.onCraftLoop(sData.substr(2));
               break;
            case "a":
               this.aks.Exchange.onCraftLoopEnd(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "h":
         switch(sAction)
         {
            case "L":
               this.aks.Houses.onList(sData.substr(2));
               break;
            case "P":
               this.aks.Houses.onProperties(sData.substr(2));
               break;
            case "X":
               this.aks.Houses.onLockedProperty(sData.substr(2));
               break;
            case "C":
               this.aks.Houses.onCreate(sData.substr(3));
               break;
            case "S":
               this.aks.Houses.onSell(!bError,sData.substr(3));
               break;
            case "B":
               this.aks.Houses.onBuy(!bError,sData.substr(3));
               break;
            case "V":
               this.aks.Houses.onLeave();
               break;
            case "G":
               this.aks.Houses.onGuildInfos(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "s":
         switch(sAction)
         {
            case "L":
               this.aks.Storages.onList(sData.substr(2));
               return;
            case "W":
               this.aks.Game.setBoostsStats(sData.substr(2));
               return;
            case "X":
               this.aks.Storages.onLockedProperty(sData.substr(2));
               return;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
               return;
         }
         break;
      case "e":
         switch(sAction)
         {
            case "U":
               this.aks.Emotes.onUse(!bError,sData.substr(3));
               return;
            case "L":
               this.aks.Emotes.onList(sData.substr(2));
               return;
            case "A":
               this.aks.Emotes.onAdd(sData.substr(2));
               return;
            case "R":
               this.aks.Emotes.onRemove(sData.substr(2));
               return;
            case "D":
               this.aks.Emotes.onDirection(sData.substr(2));
               return;
            case "F":
               this.aks.Emotes.onDirection2(sData.substr(2));
               return;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
               return;
         }
         break;
      case "d":
         switch(sAction)
         {
            case "C":
               this.aks.Documents.onCreate(!bError,sData.substr(3));
               return;
            case "V":
               this.aks.Documents.onLeave();
               return;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
               return;
         }
         break;
      case "g":
         switch(sAction)
         {
            case "n":
               this.aks.Guild.onNew();
               return;
            case "C":
               this.aks.Guild.onCreate(!bError,sData.substr(3));
               return;
            case "S":
               this.aks.Guild.onStats(sData.substr(2));
               return;
            case "I":
               switch(sData.charAt(2))
               {
                  case "G":
                     this.aks.Guild.onInfosGeneral(sData.substr(3));
                     return;
                  case "M":
                     this.aks.Guild.onInfosMembers(sData.substr(3));
                     return;
                  case "B":
                     this.aks.Guild.onInfosBoosts(sData.substr(3));
                     return;
                  case "F":
                     this.aks.Guild.onInfosMountPark(sData.substr(3));
                     return;
                  case "I":
                     this.aks.Guild.onInfos(sData.substr(3));
                     return;
                  case "T":
                     switch(sData.charAt(3))
                     {
                        case "M":
                           this.aks.Guild.onInfosTaxCollectorsMovement(sData.substr(4));
                           return;
                        case "P":
                           this.aks.Guild.onInfosTaxCollectorsPlayers(sData.substr(4));
                           return;
                        case "p":
                           this.aks.Guild.onInfosTaxCollectorsAttackers(sData.substr(4));
                           return;
                        default:
                           this.aks.defaultProcessAction(sType,sAction,bError,sData);
                           return;
                     }
                     break;
                  case "H":
                     this.aks.Guild.onInfosHouses(sData.substr(3));
                     return;
                  default:
                     this.aks.defaultProcessAction(sType,sAction,bError,sData);
                     return;
               }
               break;
            case "J":
               switch(sData.charAt(2))
               {
                  case "E":
                     this.aks.Guild.onJoinError(sData.substr(3));
                     return;
                  case "R":
                     this.aks.Guild.onRequestLocal(sData.substr(3));
                     return;
                  case "r":
                     this.aks.Guild.onRequestDistant(sData.substr(3));
                     return;
                  case "K":
                     this.aks.Guild.onJoinOk(sData.substr(3));
                     return;
                  case "C":
                     this.aks.Guild.onJoinDistantOk();
                     return;
                  default:
                     this.aks.defaultProcessAction(sType,sAction,bError,sData);
                     return;
               }
               break;
            case "V":
               this.aks.Guild.onLeave();
               return;
            case "K":
               this.aks.Guild.onBann(!bError,sData.substr(3));
               return;
            case "H":
               this.aks.Guild.onHireTaxCollector(!bError,sData.substr(3));
               return;
            case "A":
               this.aks.Guild.onTaxCollectorAttacked(sData.substr(2));
               return;
            case "T":
               this.aks.Guild.onTaxCollectorInfo(sData.substr(2));
               return;
            case "U":
               this.aks.Guild.onUserInterfaceOpen(sData.substr(2));
               return;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
               return;
         }
         break;
      case "W":
         switch(sAction)
         {
            case "C":
               this.aks.Waypoints.onCreate(sData.substr(2));
               return;
            case "V":
               this.aks.Waypoints.onLeave();
               return;
            case "U":
               this.aks.Waypoints.onUseError();
               return;
            case "c":
               this.aks.Subway.onCreate(sData.substr(2));
               return;
            case "v":
               this.aks.Subway.onLeave();
               return;
            case "u":
               this.aks.Subway.onUseError();
               return;
            case "p":
               this.aks.Subway.onPrismCreate(sData.substr(2));
               return;
            case "f":
               this.api.ui.loadUIAutoHideComponent("LoginReward","LoginReward",{datos:sData.substr(2)});
               return;
            case "w":
               this.aks.Subway.onPrismLeave();
               return;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
               return;
         }
         break;
      case "t":
         switch(sAction)
         {
            case "s":
               this.aks.Ttg.onList(sData.substr(2));
               break;
            case "d":
               this.aks.Ttg.onDates(sData.substr(2));
               break;
            case "a":
               this.aks.Ttg.onAdd(sData.substr(2));
               break;
            case "r":
               this.aks.Ttg.onOpenCardsRecycler();
               break;
            case "u":
               this.aks.Ttg.onOpenCardsUpgrader();
               break;
            case "o":
               this.aks.Ttg.onCreate(!_loc4_,sData.substr(2));
               break;
            case "c":
               this.aks.Ttg.onLeave(!_loc4_);
               break;
            case "i":
               this.aks.Ttg.onOpenMyCollection();
            default:
               return;
         }
         break;
      case "V":
         switch(sAction)
         {
            case "A":
               this.aks.Items.onAdd2(!bError,sData.substr(3));
               break;
            case "C":
               this.aks.Items.onChange2(sData.substr(3));
               break;
            case "R":
               this.aks.Items.onRemove2(sData.substr(2));
               break;
            case "Q":
               this.aks.Items.onQuantity2(sData.substr(2));
               break;
            default:
               return;
         }
         break;
      case "z":
         switch(sAction)
         {
            case "C":
               this.aks.Zones.onCreate(sData.substr(2));
               break;
            case "V":
               this.aks.Zones.onLeave();
               break;
            case "U":
               this.aks.Zones.onUseError();
               break;
            default:
               return;
         }
         break;
      case "a":
         switch(sAction)
         {
            case "l":
               this.aks.Subareas.onList(sData.substr(3));
               return;
            case "m":
               this.aks.Subareas.onAlignmentModification(sData.substr(2));
               return;
            case "M":
               this.aks.Conquest.onAreaAlignmentChanged(sData.substr(2));
               return;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
               return;
         }
         break;
      case "C":
         switch(sAction)
         {
            case "F":
               _loc0_ = _loc0_ = sData.charAt(2);
               if(_loc0_ === "P")
               {
                  this.api.network.Game.triggerCellFightPos(sData.substr(3));
                  return;
               }
               return;
               break;
            case "I":
               switch(sData.charAt(2))
               {
                  case "J":
                     this.aks.Conquest.onPrismInfosJoined(sData.substr(3));
                     return;
                  case "V":
                     this.aks.Conquest.onPrismInfosClosing(sData.substr(3));
               }
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
               return;
            case "B":
               this.aks.Conquest.onConquestBonus(sData.substr(2));
               return;
            case "A":
               this.aks.Conquest.onPrismAttacked(sData.substr(2));
               return;
            case "S":
               this.aks.Conquest.onPrismSurvived(sData.substr(2));
               return;
            case "D":
               this.aks.Conquest.onPrismDead(sData.substr(2));
               return;
            case "P":
               this.aks.Conquest.onPrismFightAddPlayer(sData.substr(2));
               return;
            case "p":
               this.aks.Conquest.onPrismFightAddEnemy(sData.substr(2));
               return;
            case "W":
               this.aks.Conquest.onWorldData(sData.substr(2));
               return;
            case "b":
               this.aks.Conquest.onConquestBalance(sData.substr(2));
               return;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
               return;
         }
         break;
      case "f":
         switch(sAction)
         {
            case "C":
               this.aks.Fights.onCount(sData.substr(2));
               return;
            case "L":
               this.aks.Fights.onList(sData.substr(2));
               return;
            case "D":
               this.aks.Fights.onDetails(sData.substr(2));
               return;
            case "G":
               this.api.ui.loadUIAutoHideComponent("GlobalFights","GlobalFights",{peleas:sData.substr(2)});
               return;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
               return;
         }
         break;
      case "T":
         switch(sAction)
         {
            case "C":
               this.aks.Tutorial.onCreate(sData.substr(2));
               return;
            case "T":
               this.aks.Tutorial.onShowTip(sData.substr(2));
               return;
            case "B":
               this.aks.Tutorial.onGameBegin();
               return;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
               return;
         }
         break;
      case "Q":
         switch(sAction)
         {
            case "L":
               this.aks.Quests.onList(sData.substr(3));
               break;
            case "S":
               this.aks.Quests.onStep(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
               break;
         }
         break;
      case "P":
         switch(sAction)
         {
            case "I":
               this.aks.Party.onInvite(!bError,sData.substr(3));
               break;
            case "L":
               this.aks.Party.onLeader(sData.substr(2));
               break;
            case "R":
               this.aks.Party.onRefuse(sData.substr(2));
               break;
            case "A":
               this.aks.Party.onAccept(sData.substr(2));
               return;
            case "C":
               this.aks.Party.onCreate(!bError,sData.substr(3));
               return;
            case "V":
               this.aks.Party.onLeave(sData.substr(2));
               return;
            case "F":
               this.aks.Party.onFollow(!bError,sData.substr(3));
               return;
            case "M":
               this.aks.Party.onMovement(sData.substr(2));
               return;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
               return;
         }
         break;
      case "R":
         switch(sAction)
         {
            case "e":
               this.aks.Mount.onEquip(sData.substr(2));
               return;
            case "x":
               this.aks.Mount.onXP(sData.substr(2));
               return;
            case "n":
               this.aks.Mount.onName(sData.substr(2));
               return;
            case "d":
               this.aks.Mount.onData(sData.substr(2));
               return;
            case "p":
               this.aks.Mount.onMountPark(sData.substr(2));
               return;
            case "D":
               this.aks.Mount.onMountParkBuy(sData.substr(2));
               return;
            case "v":
               this.aks.Mount.onLeave(sData.substr(2));
               return;
            case "r":
               this.aks.Mount.onRidingState(sData.substr(2));
               return;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
               return;
         }
         break;
      case "k":
         switch(sAction)
         {
            case "a":
               this.api.ui.loadUIAutoHideComponent("Market","Market",{MarketOgrinas:sData.substr(2)});
               break;
            case "A":
               if(this.api.ui.getUIComponent("Market") != undefined)
               {
                  this.api.ui.getUIComponent("Market").Actualiza(sData.substr(2));
               }
               break;
            case "n":
               api = _global.API;
               api.ui.loadUIAutoHideComponent("LootBox","LootBox",{loot:sData.substr(2)});
               break;
            case "N":
               api = _global.API;
               api.ui.getUIComponent("LootBox").updateItems(sData.substr(2));
               break;
            case "f":
               api = _global.API;
               api.ui.getUIComponent("LootBox").reiniciame();
               break;
            case "B":
               api = _global.API;
               api.ui.getUIComponent("Banner").KoloOK(sData.substr(2));
               break;
            case "M":
               this.aks.Spells.onList2(sData.substr(2));
               break;
            case "O":
               this.aks.Account.onCharacterSelectedLeader(sData.substr(2));
               break;
            case "I":
               this.aks.Account.cambiarID(sData.substr(2));
               break;
            case "i":
               if(this.api.ui.getUIComponent("StatsJob") != undefined)
               {
                  this.api.ui.getUIComponent("StatsJob").initPrestige(sData.substr(2));
               }
               break;
            case "S":
               if(this.api.ui.getUIComponent("PanelMaitre") != undefined)
               {
                  this.api.ui.getUIComponent("PanelMaitre").initPrestige(sData.substr(2));
               }
               break;
            case "H":
               this.api.ui.loadUIAutoHideComponent("PanelPrestige","PanelPrestige",{initPrestige:sData.substr(2)});
               if(this.api.ui.getUIComponent("PanelPrestige") != undefined)
               {
                  this.api.ui.getUIComponent("PanelPrestige").initPrestige(sData.substr(2));
               }
               break;
            case "U":
               this.api.ui.loadUIAutoHideComponent("PanelPrestigeDesc1","PanelPrestigeDesc1");
               break;
            case "P":
               this.api.ui.loadUIAutoHideComponent("PanelNew","PanelNew");
               break;
            case "W":
               this.api.ui.loadUIAutoHideComponent("PanelPrestigeDesc2","PanelPrestigeDesc2");
               break;
            case "p":
               _loc16_ = sData.substr(2).split(";");
               this.api.ui.loadUIAutoHideComponent("Koliseum","Koliseum",{inscritos:Number(_loc16_[0]),tiempo:Number(_loc16_[1]),detalles:_loc16_[2],puntos:_loc16_[3],rango:_loc16_[4]});
               break;
            case "T":
               if((_loc0_ = sData.charAt(2)) === "U")
               {
                  this.aks.Game.onTurnUpdate(sData.substr(4));
               }
               break;
            case "c":
               this.api.ui.loadUIAutoHideComponent("CambioNombre","CambioNombre",{puntos:sData.substr(2)});
            default:
               return;
         }
         break;
      case "?":
         switch(sAction)
         {
            case "X":
               switch(sData.charAt(2))
               {
                  case "A":
                     this.api.ui.loadUIAutoHideComponent("DungeonSelector","DungeonSelector",{data:sData.substr(3)});
                     break;
                  case "L":
                     if(this.api.ui.getUIComponent("DungeonInterface") != undefined)
                     {
                        this.api.ui.getUIComponent("DungeonInterface").recompensas(sData.substr(3));
                     }
                     break;
                  case "B":
                     if(this.api.ui.getUIComponent("DungeonSelector") != undefined)
                     {
                        this.api.ui.getUIComponent("DungeonSelector").openInterface(sData.substr(3));
                     }
               }
               break;
            case "A":
               switch(sData.charAt(2))
               {
                  case "A":
                     this.api.ui.loadUIAutoHideComponent("Bonus","Bonus");
                     break;
                  case "x":
                     if(this.api.ui.getUIComponent("Bonus") != undefined)
                     {
                        this.api.ui.getUIComponent("Bonus").tipoBonus(sData.substr(3));
                     }
               }
               break;
            case "d":
               this.api.ui.getUIComponent("AgregarDrops").recibir(sData.substr(2));
               break;
            case "D":
               this.api.ui.getUIComponent("AgregarDrops").visualizar(sData.substr(2));
               break;
            case "I":
               this.api.ui.loadUIAutoHideComponent("InfoPlayer","InfoPlayer",{data:sData.substr(2)});
               break;
            case "i":
               this.api.ui.getUIComponent("InfoPlayer").cargarDatos(sData.substr(2));
               break;
            case "J":
               this.api.ui.getUIComponent("MobStats").defecto(sData.substr(2));
               break;
            case "K":
               this.api.ui.getUIComponent("MobStats").recibir(sData.substr(2));
               break;
            case "M":
               _loc18_ = sData.substr(2);
               this.api.ui.loadUIAutoHideComponent("MarketShop","MarketShop",{miembros:_loc18_});
               break;
            case "m":
               _loc18_ = sData.substr(2);
               this.api.ui.getUIComponent("MarketShop").registrarItems(_loc18_);
               break;
            case "p":
               this.api.ui.loadUIAutoHideComponent("PanelAdmin","PanelAdmin",{data:sData.substr(2)});
               break;
            case "P":
               this.api.ui.loadUIAutoHideComponent("VentasPersonaje","VentasPersonaje",{data:sData.substr(2)});
               break;
            case "r":
               switch(sData.charAt(2))
               {
                  case "P":
                     _loc37_ = sData.substr(3).split(";");
                     this.api.ui.loadUIComponent("Ruleta","Ruleta",{premios:_loc37_[0],ficha:Number(_loc37_[1])});
                     break;
                  case "G":
                     this.api.ui.getUIComponent("Ruleta").ganador(sData.substr(3));
               }
               break;
            case "S":
               this.api.ui.loadUIAutoHideComponent("PanelSonge","PanelSonge",{data:sData.substr(2)});
               break;
            case "s":
               this.api.ui.getUIComponent("PanelSonge").cargarDatos(sData.substr(2));
               break;
            case "T":
               switch(sData.charAt(2))
               {
                  case "A":
                     this.api.ui.loadUIAutoHideComponent("Torneo","Torneo",{data:sData.substr(3)});
                     break;
                  case "M":
                     if(this.api.ui.getUIComponent("Torneo") != undefined)
                     {
                        this.api.ui.getUIComponent("Torneo").actualizar(sData.substr(3));
                     }
                     break;
                  case "U":
                     if(this.api.ui.getUIComponent("Torneo") != undefined)
                     {
                        this.api.ui.getUIComponent("Torneo").actualizarDatos(sData.substr(3));

                     }
               }
               break;
            case "r":
               _loc18_ = sData.substr(2);
               this.api.ui.getUIComponent("MarketShop").RefreshPoints(_loc18_);
            default:
               return;
         }
         break;
      case "w":
         switch(sAction)
         {
            case "a":
               if(sData.substr(2) != "")
               {
                  this.api.ui.loadUIAutoHideComponent("MapExplorer","MapExplorer",{mobs:sData.substr(2)});
               }
               else
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("UBICACION_ERROR_MOB"),"ERROR_BOX");
               }
               break;
            case "X":
               _loc27_ = sData.substr(2).split("#");
               this.api.ui.loadUIComponent("Temporis","Temporis",{temporichas:_loc27_[0],normalchallenge:_loc27_[1],exoticchallenge:_loc27_[2]});
               break;
            case "x":
               _global.TEMPORIS = true;
               break;
            case "l":
               this.api.ui.loadUIAutoHideComponent("Ornamento","Ornamento",{ornamentos:sData.substr(2)});
               break;
            case "O":
               this.api.ui.loadUIAutoHideComponent("Size","Size",{precio:sData.substr(2)});
               break;
            case "o":
               api = _global.API;
               if(api.ui.getUIComponent("Pase") != undefined)
               {
                  api.ui.getUIComponent("Pase").cargaTodo(sData.substr(2),false);
               }
               else if(_global.Panoramico)
               {
                  api.ui.loadUIAutoHideComponent("Pase","Pase",{datos:sData.substr(2)});
               }
               else
               {
                  api.ui.loadUIAutoHideComponent("Pase","Pase",{datos:sData.substr(2)});
               }
               break;
            case "E":
               this.api.ui.getUIComponent("CardsCollection").visualizar(sData.substr(2));
               break;
            case "F":
               this.api.ui.loadUIAutoHideComponent("CardsCollection","CardsCollection",{mobs:sData.substr(2)});
               break;
            case "f":
               this.api.ui.getUIComponent("CardsCollection").mostrarMobsDrops(sData.substr(2));
               break;
            case "g":
               _loc5 = this.api.datacenter.Player;
               this.api.sounds.events.onBannerRoundButtonClick();
               if(_loc5.isMutant)
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_U_ARE_MUTANT"),"ERROR_CHAT");
                  break;
               }
               if(_loc5.guildInfos != undefined)
               {
                  this.showSmileysEmotesPanel(false);
                  this.api.ui.loadUIAutoHideComponent("Guild","Guild",{currentTab:"Members",anuncio:sData.substr(2)});
               }
               else
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("UI_ONLY_FOR_GUILD"),"ERROR_CHAT");
               }
               break;
            case "P":
               this.api.ui.getUIComponent("Contenido").CargaObj(sData.substr(2));
               break;
            case "r":
               _loc11_ = sData.substr(2).split(";");
               _loc10_ = this.api.ui.getUIComponent("Banner");
               _loc7_ = new Object();
               _loc13_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
               _loc9_ = 0;
               while(_loc9_ < _loc11_.length)
               {
                  _loc6_ = _loc11_[_loc9_].split(",");
                  _loc7_.position = Number(_loc6_[0]);
                  _loc7_.name = _loc6_[1];
                  _loc7_.estado = _loc6_[4] + "/" + _loc6_[3];
                  _loc7_.finalizado = _loc6_[5];
                  _loc13_.push(_loc7_);
                  _loc7_ = new Object();
                  _loc9_ = _loc9_ + 1;
               }
               _loc10_.objetivodesc.btncompletar._visible = false;
               _loc10_.panelobjev.generalObjetivos._winBackground.title = "Misiones Diarias";
               _loc10_.panelobjev.generalObjetivos._dgMembers.columnsNames = ["Nº","Objectivos","Progreso"];
               _loc10_.panelobjev.generalObjetivos._dgMembers.dataProvider = _loc13_;
               _loc10_.panelobjev.gotoAndPlay(2);
               _loc10_.Objetivos = true;
               break;
            case "y":
               _loc12_ = sData.substr(2).split(",");
               _loc10_ = this.api.ui.getUIComponent("Banner");
               _loc10_.objetivodesc._winBackground.title = _loc12_[0];
               _loc10_.objetivodesc._cgOriginal._visible = false;
               _loc10_.objetivodesc.puntosvip._visible = false;
               _loc10_.objetivodesc.experiencia._visible = false;
               _loc10_.objetivodesc.honorpuntos._visible = false;
               _loc10_.objetivodesc.kamass._visible = false;
               _loc10_.objetivodesc.btnentregar._visible = false;
               if(Number(_loc12_[7]) == 3)
               {
                  _loc10_.objetivodesc.btnentregar._visible = true;
                  _loc10_.Posicion = Number(_loc12_[6]);
               }
               _loc22_ = Number(_loc12_[2]);
               _loc23_ = Number(_loc12_[3]);
               _loc19_ = "Inconnue";
               if(_loc22_ == 1)
               {
                  _loc10_.objetivodesc.experiencia._visible = true;
                  _loc19_ = "+" + _loc23_ + " Experiencia";
               }
               else if(_loc22_ == 2)
               {
                  _loc10_.objetivodesc.kamass._visible = true;
                  _loc19_ = "+" + _loc23_ + " Kamas";
               }
               else if(_loc22_ == 3)
               {
                  _loc40_ = Number(_loc12_[5]);
                  _loc45_ = _loc12_[4];
                  _loc36_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
                  _loc36_.push(new dofus.datacenter["\f\f"](0,_loc40_,1,-1,""));
                  _loc10_.objetivodesc._cgOriginal.dataProvider = _loc36_;
                  _loc10_.objetivodesc._cgOriginal._visible = true;
                  _loc19_ = "+ " + _loc23_ + " " + _loc45_ + " Item(s)";
               }
               _loc30_ = Number(_loc12_[8]);
               _loc35_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
               _loc35_.push(new dofus.datacenter["\f\f"](_loc30_,_loc30_,1,-1,""));
               _loc10_.objetivodesc._cgOriginal2.dataProvider = _loc35_;
               _loc10_.objetivodesc._cgOriginal2._visible = true;
               _loc10_.objetivodesc._txtDescription.text = _loc12_[1] + "\n\nTipo de recompensa:: " + _loc19_;
               _loc10_.objetivodesc._txtDescription2.text = "Al completar todos los objetivos diarios, obtendrás una cantidad de este misterioso y legendario objeto.";
               _loc10_.objetivodesc._lblStep.text = "Descripción del objetivo: " + _loc12_[0];
               _loc10_.objetivodesc._visible = true;
            default:
               return;
         }
         break;
      case "b":

         switch(sAction)
         {
            case "+":
               this.api.ui.loadUIAutoHideComponent("Mazmorra","Mazmorra",{retrato:sData.substr(2)});
               break;
            case "C":
               this.api.ui.loadUIAutoHideComponent("CambiarColor","CambiarColor");
               break;
            case "D":
               if(this.api.ui.getUIComponent("Ladder") != undefined)
               {
                  this.api.ui.getUIComponent("Ladder").updateDatas();
               }
               break;
            case "R":
               switch(sData.charAt(2))
               {
                  case "R":
                     if(this.api.ui.getUIComponent("FightChallenge") != undefined)
                     {
                        this.api.ui.getUIComponent("FightChallenge").actualizarRetos();
                     }
                     break;
                  case "O":
                     this.aks.Game.cambiarGananciasReto(sData.substr(3));
                     break;
                  case "r":
                     if(this.api.ui.getUIComponent("FightChallenge") != undefined)
                     {
                        this.api.ui.getUIComponent("FightChallenge").actualizarPrecio(sData.substr(3));
                     }
               }
               break;
            case "l":
               if(this.api.ui.getUIComponent("Ladder") != undefined)
               {
                  this.api.ui.getUIComponent("Ladder").registrar(sData.substr(2));
               }
               break;
            case "F":
               if(this.api.ui.getUIComponent("FightChallenge") != undefined)
               {
                  this.api.ui.getUIComponent("FightChallenge").actualizarOgrinas(sData.substr(2));
               }
               break;
            case "L":
               this.api.ui.loadUIAutoHideComponent("Ladder","Ladder",{data:sData.substr(2)});
               break;
            case "f":
               this.api.ui.loadUIAutoHideComponent("CreateTitle","CreateTitle");
               break;
            case "Y":
               _loc14_ = this.api.ui.getUIComponent("Titulos");
               if(_loc14_ == undefined)
               {
                  this.api.ui.loadUIAutoHideComponent("Titulos","Titulos",{titulos:sData.substr(2)});
               }
               else if(_loc14_.actualizar)
               {
                  _loc14_.actualizar(sData.substr(2));
               }
               else if(_loc14_.registrar)
               {
                  _loc14_.registrar(sData.substr(2));
               }
               else if(_loc14_.cargar)
               {
                  _loc14_.cargar(sData.substr(2));
               }
               break;
            case "y":
               _loc15_ = this.api.ui.getUIComponent("Titulos");
               if(_loc15_ != undefined)
               {
                  if(_loc15_.actualizar)
                  {
                     _loc15_.actualizar(sData.substr(2));
                  }
                  else if(_loc15_.registrar)
                  {
                     _loc15_.registrar(sData.substr(2));
                  }
                  else if(_loc15_.cargar)
                  {
                     _loc15_.cargar(sData.substr(2));
                  }
               }
               else
               {
                  this.api.ui.loadUIAutoHideComponent("Titulos","Titulos",{titulos:sData.substr(2)});
               }
               break;
            case "m":
               this.api.ui.loadUIComponent("MazmorraRecompensa","MazmorraRecompensa",{datos:sData.substr(2)});
               break;
            case "M":
               this.api.ui.loadUIComponent("TiendaDung","TiendaDung",{datos:sData.substr(2)});
               break;
            case "r":
               this.aks.ChooseReward.onData(sData.substr(2));
               break;
            case "T":
               _loc0_ = _loc0_ = sData.charAt(2);
               if(_loc0_ === "U")
               {
                  this.aks.Game.onTurnUpdate(sData.substr(4));
               }
               break;
            case "x":
               this.api.ui.loadUIComponent("LadderCard");
               break;
            case "Z":
               switch(sData.charAt(2))
               {
                  case "C":
                     if(this.api.ui.getUIComponent("ShopFull") != undefined)
                     {
                        this.api.ui.getUIComponent("ShopFull").updateOgrinas(sData.substr(3));
                     }
                     break;
                  case "I":
                     _loc20_ = sData.substr(3).split(".");
                     this.api.ui.loadUIAutoHideComponent("ShopFull","ShopFull",{categorias:_loc20_[0],objetos:_loc20_[1],promotions:_loc20_[2],ogrinas:_loc20_[3]});
                     break;
                  case "i":
                     _loc21_ = sData.substr(3).split("@");
                     this.api.ui.loadUIComponent("ShopInfo","ShopInfo",{item:_loc21_[0],type:_loc21_[1],listaItem:_loc21_[2],precioItem:_loc21_[3]});
                     break;
                  case "A":
                     _loc29_ = sData.substr(3).split("@");
                     this.api.ui.loadUIAutoHideComponent("Logros","Logros",{data:_loc29_[0],categorias:_loc29_[1]});
                     break;
                  case "L":
                     this.api.ui.getUIComponent("Logros").cargarLogros(sData.substr(3));
                     break;
                  case "O":
                     this.api.ui.getUIComponent("Logros").cargarObjetivos(sData.substr(3));
                     break;
                  case "o":
                     _loc33_ = sData.substr(3).split(",");
                     this.api.ui.getUIComponent("Logros").cargarBarra(_loc33_[0],_loc33_[1]);
                     break;
                  case "R":
                     _loc34_ = sData.substr(3).split("#");
                     this.api.ui.getUIComponent("Logros").cargarRecompensas(_loc34_[0],_loc34_[1]);
               }
            default:
               return;
         }
   }
};
#endinitclip