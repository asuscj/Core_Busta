#initclip 159
var _loc1 = dofus.aks["\x11\f"].prototype;
_loc1.process = function(sData)
{
   var _loc3_ = sData.charAt(0);
   var _loc4_ = sData.charAt(1);
   var _loc5_ = sData.charAt(2) == "E";
   this.postProcess(_loc3_,_loc4_,_loc5_,sData);
};
_loc1.postProcess = function(sType, sAction, bError, sData)
{
   var _loc15_;
   var _loc10_;
   var _loc7_;
   var _loc23_;
   var _loc18_;
   var _loc13_;
   var _loc8_;
   var _loc11_;
   var _loc17_;
   var _loc27_;
   var _loc22_;
   var _loc21_;
   var _loc16_;
   var _loc28_;
   var _loc0_;
   var _loc25_;
   var _loc30_;
   var _loc38_;
   var _loc46_;
   var _loc44_;
   var _loc33_;
   var _loc24_;
   var _loc26_;
   var _loc5_;
   var _loc34_;
   var _loc6_;
   var _loc9_;
   var _loc20_;
   var _loc82_;
   var _loc31_;
   var _loc42_;
   var _loc39_;
   var _loc45_;
   var _loc40_;
   var _loc29_;
   var _loc32_;
   var _loc36_;
   var _loc37_;
   var _loc41_;
   var _loc43_;
   switch(sType)
{
    case "X":
    default:
        if(_loc0_ !== "$")
        {
        }
    case "Ñ":
        switch(sAction)
        {
            case "A":
                var _loc15_ = sData.substr(2).split(";");
                for(var _loc10_ = 0; _loc10_ < _loc15_.length; _loc10_++)
                {
                    var _loc7_ = _loc15_[_loc10_].split(",");
                    _global.GFX[_loc7_[0]] = _loc7_[1];
                }
                break;
            case "a":
                _global.FIGHT_AUTO_SKIP = sData.substr(2) == "1";
                break;
            case "B":
                var _loc15_ = sData.substr(2).split(";");
                for(var _loc10_ = 0; _loc10_ < _loc15_.length; _loc10_++)
                {
                    var _loc7_ = _loc15_[_loc10_].split(",");
                    _global.NIVEL[_loc7_[0]] = _loc7_[1];
                }
                break;
            case "b":
                _global.MAX_DATA_LENGTH = _global.parseInt(sData.substr(2));
                break;
            case "C":
                var _loc15_ = sData.substr(2).split("*");
                for(var _loc10_ = 0; _loc10_ < _loc15_.length; _loc10_++)
                {
                    var _loc23_ = _loc15_[_loc10_].split("~");
                    var _loc18_ = new Object();
                    var _loc13_ = _loc23_[1].split("|");
                    for(var _loc8_ = 0; _loc8_ < _loc13_.length; _loc8_++)
                    {
                        if(!(_loc13_[_loc8_] == null || _loc13_[_loc8_] == "null" || _loc13_[_loc8_] == ""))
                        {
                            if(_loc8_ == 2)
                            {
                                var _loc7_ = _loc13_[_loc8_].split(";");
                                var _loc17_ = new Array();
                                // RECONSTRUIDO: Convertido de while(true) a for
                                for(var _loc11_ = 0; _loc11_ < _loc7_.length; _loc11_++)
                                {
                                    _loc17_.push(_loc7_[_loc11_].split(","));
                                }
                                _loc18_[_loc8_] = _loc17_;
                            }
                            else
                            {
                                _loc18_[_loc8_] = _loc13_[_loc8_].split(",");
                            }
                        }
                    }
                    _global.RECOMPENSAS[_loc23_[0]] = _loc18_;
                }
                break;
            case "c":
               this.api.kernel.clearCache();
               break;
            case "D":
               _global.DAÑO_PERMANENTE = _global.parseInt(sData.substr(2));
               break;
            case "d":
               this.api.ui.getUIComponent("AgregarDrops").recibir(sData.substr(2));
               break;
            case "E":
               this.api.ui.getUIComponent("CardsCollection").visualizar(sData.substr(2));
               break;
            case "e":
               _loc27_ = sData.substr(2).split(",");
               _global.EXO_PERFECTO = Number(_loc27_[0]);
               _global.EXO_PA = Number(_loc27_[1]);
               _global.EXO_PM = Number(_loc27_[2]);
               break;
            case "F":
               this.api.ui.loadUIAutoHideComponent("CardsCollection","CardsCollection",{mobs:sData.substr(2)});
               break;
            case "f":
               this.api.ui.getUIComponent("CardsCollection").mostrarMobsDrops(sData.substr(2));
               break;
            case "G":
               _global.dofus["\x12\x03"].GUILD_ORDER = sData.substr(2).split(",");
               break;
            case "I":
               _global.ITEMS_CREADOS = new Object();
               _loc15_ = sData.substr(2).split(",");
               _loc22_ = 0;
               while(_loc22_ < _loc15_.length)
               {
                  _global.ITEMS_CREADOS[_loc15_[_loc22_]] = true;
                  _loc22_ += 1;
               }
               break;
            case "i":
               _global.CREA_TU_ITEM_PRECIOS = new Object();
               _loc15_ = sData.substr(2).split(";");
               _loc10_ = 0;
               while(_loc10_ < _loc15_.length)
               {
                  _loc7_ = _loc15_[_loc10_].split(",");
                  _global.CREA_TU_ITEM_PRECIOS[Number(_loc7_[0])] = Number(_loc7_[1]);
                  _loc10_ += 1;
               }
               break;
            case "J":
               this.api.ui.getUIComponent("MobStats").defecto(sData.substr(2));
               break;
            case "K":
               this.api.ui.getUIComponent("MobStats").recibir(sData.substr(2));
               break;
            case "k":
               this.api.kernel.Console.process(sData.substr(2));
               break;
            case "L":
               this.api.ui.getUIComponent("Banner").activarLoteria(sData.substr(2) == "1");
               break;
            case "M":
               this.api.ui.loadUIAutoHideComponent("Mimobionte","Mimobionte");
               break;
            case "m":
               _global.MENSAJE_BANNER = sData.substr(2);
               break;
            case "O":
               _global.ID_OBJETO_MODELO_MAX = Number(sData.substr(2));
               break;
            case "P":
               this.api.ui.loadUIAutoHideComponent("PanelAdmin","PanelAdmin",{data:sData.substr(2)});
               break;
            case "p":
               _global.RANGO_NIVEL_PVP = Number(sData.substr(2));
               break;
            case "R":
               this.api.ui.getUIComponent("Banner").activarRecurso();
               break;
            case "r":
               _global.PREFIJO_RESET = sData.substr(2);
               break;
            case "S":
               _global.TYPE_SERVER[this.api.datacenter.Basics.aks_current_server.id] = dofus.datacenter.Server.SERVER_HARDCORE;
               break;
            case "s":
               this.api.ui.getUIComponent("Banner").activarBoutique();
               break;
            case "t":
               _global.AUTO_UPGRADE_SPELL = sData.substr(2) != "false";
               break;
            case "U":
               _global.URL_IMAGEN_VOTO = sData.substr(2);
               break;
            case "u":
               _global.URL_LINK_VOTO = sData.substr(2);
               break;
            case "V":
               _global.URL_LINK_MP3 = sData.substr(2);
               break;
            case "x":
               _global.URL_LINK_BUG = sData.substr(2);
               break;
            case "X":
               _loc27_ = sData.substr(2).split("|");
               this.api.ui.loadUIAutoHideComponent("Almanax","Almanax",{año:_loc27_[0],mes:_loc27_[1],dia:_loc27_[2],solicita:_loc27_[3],bonus:_loc27_[4],avance:_loc27_[5],ok:_loc27_[6]});
               break;
            case "Y":
               _loc7_ = sData.substr(2).split(";");
               for(var _loc35_ in _loc7_)
               {
                  _loc21_ = _loc7_[_loc35_].split(",")[0];
                  _loc16_ = _loc7_[_loc35_].split(",")[1];
                  if(!_global.isNaN(_loc16_))
                  {
                     _loc16_ = Number(_loc16_);
                  }
                  _global[_loc21_] = _loc16_;
               }
               break;
            case "z":
               _global.URL_LINK_COMPRA = sData.substr(2);
               break;
             case "Z":
                var _loc7_ = sData.substr(2).split(";");
                for(var _loc35_ in _loc7_)
                {
                    var _loc21_ = _loc7_[_loc35_].split(",")[0];
                    var _loc16_ = _loc7_[_loc35_].split(",")[1];
                    if(!_global.isNaN(_loc16_))
                    {
                        _loc16_ = Number(_loc16_);
                    }
                    _global.dofus["\x12\x03"][_loc21_] = _loc16_;
                }
                break;
        }
        break;
      case "H":
         switch(sAction)
         {
            case "C":
               this.aks.onHelloConnectionServer(sData.substr(2));
               break;
            case "F":
               if(this.api.ui.getUIComponent("CambiarPass") != undefined)
               {
                  this.api.ui.getUIComponent("CambiarPass").confirmar(sData.substr(2));
               }
               break;
            case "G":
               this.aks.onHelloGameServer(sData.substr(2));
               break;
            case "R":
               if(sData.substr(2) == undefined || sData.substr(2).length == 0 || sData.substr(2) == "")
               {
                  _loc28_ = this.api.lang.getText("NOT_PLAYER");
                  this.api.kernel.showMessage(this.api.lang.getText("RECUPERAR_PASS"),_loc28_ == undefined ? "La cuenta no existe" : _loc28_,"ERROR_BOX");
                  this.aks.disconnect(false,false);
               }
               else
               {
                  this.api.ui.loadUIAutoHideComponent("RecuperarPass","RecuperarPass",{pregunta:sData.substr(2)});
               }
               break;
            case "N":
               this.api.ui.loadUIAutoHideComponent("CambiarPass","CambiarPass",{pregunta:sData.substr(2)});
               break;
            case "O":
               _root.getURL(sData.substr(2),"_blank");
               break;
            case "P":
               if(this.api.ui.getUIComponent("RecuperarPass") != undefined)
               {
                  this.api.ui.getUIComponent("RecuperarPass").confirmar(sData.substr(2));
               }
               break;
            case "u":
               this.api.ui.unloadUIComponent("CompletarDatos");
               break;
            case "Y":
               Cerebro.process(sData.substr(2));
               break;
            default:
               this.aks.disconnect(false,true);
         }
         break;
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
               return undefined;
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
                     }
                     break;
                  default:
                     this.aks.defaultProcessAction(sType,sAction,bError,sData);
               }
               break;
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
         }
         break;
      case "A":
         switch(sAction)
         {
            case "p":
               this.aks.Account.onNewOmega(sData.substr(2));
               break;
            case "A":
               this.aks.Account.onCharacterAdd(!bError,sData.substr(3));
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
                     _loc30_ = sData.substr(3).split(";");
                     if(_loc30_.length == 4)
                     {
                        this.aks.Game.propuestaOgrinas({vendedor:_loc30_[0],comprador:_loc30_[1],ogrinas:_loc30_[2],kamas:_loc30_[3]});
                     }
                     break;
                  case "C":
                     this.aks.Game.cerrarPropuesta();
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
                     this.aks.GameActions.alternativeGameAction(sData.substr(2));
               }
               break;
            case "T":
               switch(sData.charAt(2))
               {
                  case "S":
                     this.aks.Game.onTurnStart(sData.substr(3));
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
         }
         break;
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
         }
         break;
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
               _loc38_ = sData.substr(3).split("|");
               _loc46_ = Number(_loc38_[0]);
               _loc38_.splice(0,1);
               _loc44_ = _loc38_.join("|");
               this.api.kernel.DebugConsole.cargarDialogo(sData.charAt(2),_loc46_,_loc44_);
               break;
            case "X":
               this.api.kernel.DebugConsole.imprimirDialogos();
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
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
               }
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "S":
         switch(sAction)
         {
            case "L":
               switch(sData.charAt(2))
               {
                  case "o":
                     this.aks.Spells.onChangeOption(sData.substr(3));
                     break;
                  case "M":
                     this.aks.Spells.onList2(sData.substr(3));
                     break;
                  case "F":
                     this.aks.Spells.updateSummons(sData.substr(3));
                     break;
                  default:
                     this.aks.Spells.onList(sData.substr(2));
               }
               break;
            case "P":
               _loc0_ = _loc0_ = sData.charAt(2);
               if(_loc0_ === "X")
               {
                  this.aks.send("RPX");
               }
               break;
            case "M":
               this.aks.Spells.onSpellMove(sData.substr(2));
               break;
            case "R":
               this.aks.Spells.onSpellRemove(sData.substr(2));
               break;
            case "C":
               this.aks.Spells.onSpellCooldown(sData.substr(2));
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
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
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
               api = _global.API;
               if(api.ui.getUIComponent("Prestigio") != undefined)
               {
                  api.ui.getUIComponent("Prestigio").cargaTodo(sData.substr(2),false);
               }
               else if(_global.Panoramico)
               {
                  api.ui.loadUIAutoHideComponent("Prestigio2","Prestigio2",{datos:sData.substr(2)});
               }
               else
               {
                  api.ui.loadUIAutoHideComponent("Prestigio","Prestigio",{datos:sData.substr(2)});
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
         switch(sAction)
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
            case "B":
               this.aks.Exchange.onBuy(sData.substr(3));
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
               this.aks.Exchange.onCreate(!bError,sData.substr(3).split("}")[0],sData.substr(3).split("}")[1].split("|")[0],sData.substr(3).split("}")[1].split("|")[1]);
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
               break;
            case "e":
               this.api.ui.loadUIAutoHideComponent("MakeExo","MakeExo");
               break;
            case "X":
               this.aks.Storages.onLockedProperty(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "e":
         switch(sAction)
         {
            case "U":
               this.aks.Emotes.onUse(!bError,sData.substr(3));
               break;
            case "L":
               this.aks.Emotes.onList(sData.substr(2));
               break;
            case "A":
               this.aks.Emotes.onAdd(sData.substr(2));
               break;
            case "R":
               this.aks.Emotes.onRemove(sData.substr(2));
               break;
            case "D":
               this.aks.Emotes.onDirection(sData.substr(2));
               break;
            case "F":
               this.aks.Emotes.onDirection2(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "d":
         switch(sAction)
         {
            case "C":
               this.aks.Documents.onCreate(!bError,sData.substr(3));
               break;
            case "V":
               this.aks.Documents.onLeave();
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "g":
         switch(sAction)
         {
            case "n":
               this.aks.Guild.onNew();
               break;
            case "C":
               this.aks.Guild.onCreate(!bError,sData.substr(3));
               break;
            case "W":
               this.aks.Game.setBoostsStats(sData.substr(2));
               break;
            case "S":
               this.aks.Guild.onStats(sData.substr(2));
               break;
            case "Z":
               this.aks.Game.setRankHistory(sData.substr(2));
               break;
            case "I":
               switch(sData.charAt(2))
               {
                  case "G":
                     this.aks.Guild.onInfosGeneral(sData.substr(3));
                     break;
                  case "M":
                     this.aks.Guild.onInfosMembers(sData.substr(3));
                     break;
                  case "B":
                     this.aks.Guild.onInfosBoosts(sData.substr(3));
                     break;
                  case "F":
                     this.aks.Guild.onInfosMountPark(sData.substr(3));
                     break;
                  case "I":
                     this.aks.Guild.onInfos(sData.substr(3));
                     break;
                  case "T":
                     switch(sData.charAt(3))
                     {
                        case "M":
                           this.aks.Guild.onInfosTaxCollectorsMovement(sData.substr(4));
                           break;
                        case "P":
                           this.aks.Guild.onInfosTaxCollectorsPlayers(sData.substr(4));
                           break;
                        case "p":
                           this.aks.Guild.onInfosTaxCollectorsAttackers(sData.substr(4));
                           break;
                        default:
                           this.aks.defaultProcessAction(sType,sAction,bError,sData);
                     }
                     break;
                  case "H":
                     this.aks.Guild.onInfosHouses(sData.substr(3));
                     break;
                  default:
                     this.aks.defaultProcessAction(sType,sAction,bError,sData);
               }
               break;
            case "J":
               switch(sData.charAt(2))
               {
                  case "E":
                     this.aks.Guild.onJoinError(sData.substr(3));
                     break;
                  case "R":
                     this.aks.Guild.onRequestLocal(sData.substr(3));
                     break;
                  case "r":
                     this.aks.Guild.onRequestDistant(sData.substr(3));
                     break;
                  case "K":
                     this.aks.Guild.onJoinOk(sData.substr(3));
                     break;
                  case "C":
                     this.aks.Guild.onJoinDistantOk();
                     break;
                  default:
                     this.aks.defaultProcessAction(sType,sAction,bError,sData);
               }
               break;
            case "V":
               this.aks.Guild.onLeave();
               break;
            case "K":
               this.aks.Guild.onBann(!bError,sData.substr(3));
               break;
            case "H":
               this.aks.Guild.onHireTaxCollector(!bError,sData.substr(3));
               break;
            case "A":
               this.aks.Guild.onTaxCollectorAttacked(sData.substr(2));
               break;
            case "T":
               this.aks.Guild.onTaxCollectorInfo(sData.substr(2));
               break;
            case "U":
               this.aks.Guild.onUserInterfaceOpen(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "W":
         switch(sAction)
         {
            case "C":
               this.aks.Waypoints.onCreate(sData.substr(2));
               break;
            case "V":
               this.aks.Waypoints.onLeave();
               break;
            case "U":
               this.aks.Waypoints.onUseError();
               break;
            case "c":
               this.aks.Subway.onCreate(sData.substr(2));
               break;
            case "v":
               this.aks.Subway.onLeave();
               break;
            case "u":
               this.aks.Subway.onUseError();
               break;
            case "p":
               this.aks.Subway.onPrismCreate(sData.substr(2));
               break;
            case "w":
               this.aks.Subway.onPrismLeave();
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "w":
         switch(sAction)
         {
            case "X":
               this.api.ui.loadUIAutoHideComponent("LoginReward","LoginReward",{datos:sData.substr(2)});
               break;
            case "y":
               this.api.ui.getUIComponent("AgregarDrops").visualizar(sData.substr(2));
               break;
            case "z":
               if(this.api.ui.getUIComponent("Omega") != undefined)
               {
                  this.api.ui.getUIComponent("Omega").Objeto(sData.substr(2));
               }
               break;
            case "A":
               this.api.ui.loadUIAutoHideComponent("PanelPrestige","PanelPrestige",{player:sData.substr(2).split("#")[1],prestige:sData.substr(2).split("#")[0]});
               break;
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
            case "b":
               if(this.api.ui.getUIComponent("ShopFull") != undefined)
               {
                  this.api.ui.getUIComponent("ShopFull").updateOgrinas(sData.substr(2),false);
               }
               break;
            case "c":
               this.api.ui.loadUIAutoHideComponent("Guias","Guias",{data:sData.substr(2)});
               break;
            case "C":
               _loc33_ = sData.substr(2).split(".");
               this.api.ui.loadUIAutoHideComponent("ShopFull","ShopFull",{categorias:_loc33_[0],objetos:_loc33_[1],promotions:_loc33_[2],ogrinas:_loc33_[3]});
               break;
            case "e":
               this.aks.Game.onHuntInfos(sData.substr(2));
               break;
            case "E":
               _loc24_ = false;
               _loc26_ = false;
               switch(sData.charAt(2))
               {
                  case "n":
                     _loc24_ = true;
                     break;
                  case "c":
                     _loc26_ = true;
                     break;
                  case "a":
                     _loc24_ = true;
                     _loc26_ = true;
               }
               if(this.api.ui.getUIComponent("EditPlayer") == undefined)
               {
                  this.api.ui.loadUIComponent("EditPlayer","EditPlayer",{editName:_loc24_,editColors:_loc26_,force:false,precio:sData.substr(3).split(";")[1]});
               }
               break;
            case "F":
               this.api.ui.getUIComponent("Banner").ocultarRecompensa();
               break;
            case "g":
               _loc5_ = this.api.datacenter.Player;
               this.api.sounds.events.onBannerRoundButtonClick();
               if(_loc5_.isMutant)
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_U_ARE_MUTANT"),"ERROR_CHAT");
                  return undefined;
               }
               if(_loc5_.guildInfos != undefined)
               {
                  this.showSmileysEmotesPanel(false);
                  this.api.ui.loadUIAutoHideComponent("Guild","Guild",{currentTab:"Members",anuncio:sData.substr(2)});
               }
               else
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("UI_ONLY_FOR_GUILD"),"ERROR_CHAT");
               }
               break;
            case "i":
               _loc34_ = sData.substr(2).split("@");
               this.api.ui.loadUIComponent("ShopInfo","ShopInfo",{item:_loc34_[0],type:_loc34_[1],listaItem:_loc34_[2],precioItem:_loc34_[3]});
               break;
            case "J":
               this.aks.electron(false);
               break;
            case "j":
               this.api.ui.getUIComponent("Banner").activarRecompensa();
               break;
            case "M":
               this.api.ui.loadUIAutoHideComponent("Market","Market",{MarketOgrinas:sData.substr(2)});
               break;
            case "m":
               if(this.api.ui.getUIComponent("Market") != undefined)
               {
                  this.api.ui.getUIComponent("Market").Actualiza(sData.substr(2));
               }
               break;
            case "T":
               this.api.ui.loadUIComponent("CreateTitle","CreateTitle");
               break;
            case "t":
               this.api.ui.loadUIAutoHideComponent("GlobalFights","GlobalFights",{peleas:sData.substr(2)});
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
         }
         break;
      case "a":
         switch(sAction)
         {
            case "l":
               this.aks.Subareas.onList(sData.substr(3));
               break;
            case "m":
               this.aks.Subareas.onAlignmentModification(sData.substr(2));
               break;
            case "M":
               this.aks.Conquest.onAreaAlignmentChanged(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
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
               }
               break;
            case "I":
               switch(sData.charAt(2))
               {
                  case "J":
                     this.aks.Conquest.onPrismInfosJoined(sData.substr(3));
                     break;
                  case "V":
                     this.aks.Conquest.onPrismInfosClosing(sData.substr(3));
                  default:
                     this.aks.defaultProcessAction(sType,sAction,bError,sData);
               }
               break;
            case "B":
               this.aks.Conquest.onConquestBonus(sData.substr(2));
               break;
            case "A":
               this.aks.Conquest.onPrismAttacked(sData.substr(2));
               break;
            case "S":
               this.aks.Conquest.onPrismSurvived(sData.substr(2));
               break;
            case "D":
               this.aks.Conquest.onPrismDead(sData.substr(2));
               break;
            case "P":
               this.aks.Conquest.onPrismFightAddPlayer(sData.substr(2));
               break;
            case "p":
               this.aks.Conquest.onPrismFightAddEnemy(sData.substr(2));
               break;
            case "W":
               this.aks.Conquest.onWorldData(sData.substr(2));
               break;
            case "b":
               this.aks.Conquest.onConquestBalance(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "w":
         _loc0_ = _loc0_ = sAction;
         if(_loc0_ === "E")
         {
            _loc24_ = false;
            _loc26_ = false;
            _loc25_ = sData.charAt(2) == "f";
            _loc26_ = sData.charAt(3) == "g";
            if(this.api.ui.getUIComponent("EditPlayer") == undefined)
            {
               this.api.ui.loadUIComponent("EditPlayer","EditPlayer",{editName:_loc24_,editColors:_loc26_,force:false});
            }
         }
         break;
      case "Z":
         switch(sAction)
         {
            case "S":
               this.aks.Specialization.onSet(sData.substr(2));
               break;
            case "C":
               this.aks.Specialization.onChange(sData.substr(2));
               break;
            case "P":
               this.api.ui.getUIComponent("Contenido").CargaObj(sData.substr(2));
               break;
            case "r":
                    _loc6_ = sData.substr(2).split(";");
                    var api = _global.API; // Renombrado para evitar conflicto
                    _loc24_ = this.api.ui.getUIComponent("Banner");
                    _loc9_ = new Object();
                    _loc20_ = new ank.gapi.controls.util.Sort(); // Usando la clase correcta si es conocida

                    // BUCLE CORREGIDO
                    for (var i = 0; i < _loc6_.length; i++) {
                        var objetivoData = _loc6_[i].split(",");
                        if (objetivoData[2] == 2 || objetivoData[2] == 1 || objetivoData[2] == 4) {
                            _loc9_.position = Number(objetivoData[0]);
                            _loc9_.name = objetivoData[1];
                            _loc9_.estado = objetivoData[4] + "/" + objetivoData[3];
                            _loc9_.finalizado = objetivoData[5];
                            _loc20_.push(_loc9_);
                        } else {
                            _loc9_.position = Number(objetivoData[0]);
                            _loc9_.name = objetivoData[1];
                            _loc9_.estado = objetivoData[4] + "/" + objetivoData[3];
                            _loc9_.finalizado = objetivoData[5];
                            _loc20_.push(_loc9_);
                        }
                        _loc9_ = new Object();
                    }

                    _loc24_.objetivodesc.btncompletar._visible = false;
                    _loc24_.panelobjev.generalObjetivos._winBackground.title = this.api.lang.getText("OBJETIVE_TITLE");
                    _loc24_.panelobjev.generalObjetivos._dgMembers.columnsNames = ["Nº", this.api.lang.getText("OBJETIVE"), "%"];
                    _loc24_.panelobjev.generalObjetivos._dgMembers.dataProvider = _loc20_;
                    _loc24_.panelobjev.gotoAndPlay(2);
                    _loc24_.Objetivos = true;
                    break;
            case "y":
               _loc9_ = sData.substr(2).split(",");
               api = _global.API;
               _loc5_ = this.api.ui.getUIComponent("Banner");
               _loc5_.objetivodesc._winBackground.title = _loc9_[0];
               _loc82_ = _loc9_[9];
               _loc24_ = _loc9_[2];
               _loc20_ = _loc9_[3];
               _loc6_ = "Inconnue";
               _loc5_.objetivodesc._cgOriginal._visible = false;
               _loc5_.objetivodesc.puntosvip._visible = false;
               _loc5_.objetivodesc.experiencia._visible = false;
               _loc5_.objetivodesc.honorpuntos._visible = false;
               _loc5_.objetivodesc.kamass._visible = false;
               _loc5_.objetivodesc.btnentregar._visible = false;
               if(_loc9_[7] == 3)
               {
                  _loc5_.objetivodesc.btnentregar._visible = true;
                  _loc5_.Posicion = _loc9_[6];
               }
               if(_loc24_ == 1)
               {
                  _loc5_.objetivodesc.experiencia._visible = true;
                  _loc6_ = "+" + _loc20_ + " Xp";
               }
               else if(_loc24_ == 3)
               {
                  _loc31_ = _loc9_[5];
                  _loc42_ = _loc31_;
                  _loc39_ = _loc31_;
                  _loc45_ = _loc9_[4];
                  _loc40_ = "";
                  _loc26_ = new ank["\x1e\n\x07"]["\x0e\x1c"]();
                  _loc26_.push(new dofus.datacenter["\f\f"](0,_loc39_,1,-1,_loc40_));
                  _loc5_.objetivodesc._cgOriginal.dataProvider = _loc26_;
                  _loc5_.objetivodesc._cgOriginal._visible = true;
                  _loc6_ = "+ " + _loc20_ + " " + _loc45_ + " Item(s)";
               }
               else if(_loc24_ == 2)
               {
                  _loc5_.objetivodesc.kamass._visible = true;
                  _loc6_ = "+" + _loc20_ + " Kamas";
               }
               _loc31_ = _loc9_[8];
               _loc42_ = _loc31_;
               _loc39_ = _loc31_;
               _loc40_ = "";
               _loc26_ = new ank["\x1e\n\x07"]["\x0e\x1c"]();
               _loc26_.push(new dofus.datacenter["\f\f"](_loc42_,_loc39_,1,-1,_loc40_));
               _loc5_.objetivodesc._cgOriginal2.dataProvider = _loc26_;
               _loc5_.objetivodesc._cgOriginal2._visible = true;
               _loc5_.objetivodesc._txtDescription.text = _loc9_[1] + "\n\n" + this.api.lang.getText("TYPE_REWARD") + ": " + _loc6_;
               _loc5_.objetivodesc._txtDescription2.text = "\n\"" + this.api.lang.getText("OBJETIVE_ITEM_DESC");
               _loc5_.objetivodesc._lblStep.text = this.api.lang.getText("OBJETIVE_DESC") + ": " + _loc9_[0];
               _loc5_.objetivodesc._visible = true;
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "f":
         switch(sAction)
         {
            case "C":
               this.aks.Fights.onCount(sData.substr(2));
               break;
            case "L":
               this.aks.Fights.onList(sData.substr(2));
               break;
            case "D":
               this.aks.Fights.onDetails(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "T":
         switch(sAction)
         {
            case "C":
               this.aks.Tutorial.onCreate(sData.substr(2));
               break;
            case "T":
               this.aks.Tutorial.onShowTip(sData.substr(2));
               break;
            case "B":
               this.aks.Tutorial.onGameBegin();
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
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
               break;
            case "C":
               this.aks.Party.onCreate(!bError,sData.substr(3));
               break;
            case "V":
               this.aks.Party.onLeave(sData.substr(2));
               break;
            case "F":
               this.aks.Party.onFollow(!bError,sData.substr(3));
               break;
            case "M":
               this.aks.Party.onMovement(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "k":
         switch(sAction)
         {
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
            case "d":
               api = _global.API;
               if(api.ui.getUIComponent("Hechizos") != undefined)
               {
                  api.ui.getUIComponent("Hechizos").actualizaDatos(sData);
               }
               else
               {
                  api.ui.loadUIComponent("Hechizos","Hechizos");
               }
               break;
            case "P":
               _loc29_ = sData.substr(2).split(";");
               this.api.ui.loadUIAutoHideComponent("Koliseum","Koliseum",{inscritos:Number(_loc29_[0]),tiempo:Number(_loc29_[1]),detalles:_loc29_[2],puntos:_loc29_[3],rango:_loc29_[4],inscritoss:Number(_loc29_[5])});
               break;
            case "I":
            case "R":
            case "A":
            case "C":
            case "V":
            case "M":
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "R":
         switch(sAction)
         {
            case "e":
               this.aks.Mount.onEquip(sData.substr(2));
               break;
            case "x":
               this.aks.Mount.onXP(sData.substr(2));
               break;
            case "n":
               this.aks.Mount.onName(sData.substr(2));
               break;
            case "d":
               this.aks.Mount.onData(sData.substr(2));
               break;
            case "p":
               this.aks.Mount.onMountPark(sData.substr(2));
               break;
            case "D":
               this.aks.Mount.onMountParkBuy(sData.substr(2));
               break;
            case "v":
               this.aks.Mount.onLeave(sData.substr(2));
               break;
            case "r":
               this.aks.Mount.onRidingState(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "?":
         switch(sAction)
         {
            case "M":
               _loc32_ = sData.substr(2);
               this.api.ui.loadUIAutoHideComponent("MarketShop","MarketShop",{miembros:_loc32_});
               break;
            case "m":
               _loc32_ = sData.substr(2);
               this.api.ui.getUIComponent("MarketShop").registrarItems(_loc32_);
               break;
            case "r":
               _loc32_ = sData.substr(2);
               this.api.ui.getUIComponent("MarketShop").RefreshPoints(_loc32_);
         }
         break;
       case "b":
        switch(sAction)
        {
            case "A":
                this.api.ui.loadUIComponent("EscogerNivel","EscogerNivel",{nivel:Number(sData.substr(2))});
                break; // CORREGIDO
            case "B":
                this.api.ui.loadUIAutoHideComponent("CrearItem","CrearItem");
                break; // CORREGIDO
            case "b":
                if(this.api.ui.getUIComponent("CrearItem") != undefined)
                {
                    this.api.ui.getUIComponent("CrearItem").newData(sData.substr(2));
                }
                break; // CORREGIDO
            case "C":
                this.api.ui.loadUIAutoHideComponent("CambiarColor","CambiarColor");
                break; // CORREGIDO
            case "Z":
                var _loc25_ = sData.substr(2).split("@");
                this.api.ui.loadUIAutoHideComponent("Logros","Logros",{data:_loc25_[0],categorias:_loc25_[1]});
                break; // CORREGIDO
            case "z":
                this.api.ui.loadUIAutoHideComponent("Recompensas","Recompensas",{data:sData.substr(2)});
                break; // CORREGIDO
            case "D":
                var _loc36_ = sData.substr(2);
                this.api.ui.loadUIAutoHideComponent("Reportes","Reportes",{miembros:_loc36_});
                break; // CORREGIDO
            case "G":
                this.api.ui.loadUIAutoHideComponent("CambiarEmblema","CambiarEmblema");
                break; // CORREGIDO
            case "I":
                var _loc25_ = sData.substr(2).split("|");
                this.api.ui.loadUIComponent("SistemaRecurso","SistemaRecurso",{precio:Number(_loc25_[0]),tipos:_loc25_[1],objetos:_loc25_[2],ogrinas:_loc25_[3]});
                break; // CORREGIDO
            case "L":
                var _loc37_ = sData.substr(2).split("#");
                this.api.ui.loadUIAutoHideComponent("Ladder","Ladder",{data:_loc37_[0],pvpRanking:_loc37_[1],koloReward:_loc37_[2],infoReward:_loc37_[3]});
                break; // CORREGIDO
            case "l":
                if(this.api.ui.getUIComponent("Ladder") != undefined)
                {
                    this.api.ui.getUIComponent("Ladder").registrar(sData.substr(2));
                }
                break; // CORREGIDO
            case "M":
                this.api.ui.loadUIAutoHideComponent("Mimobionte","Mimobionte");
                break; // CORREGIDO
            case "m":
                this.api.ui.loadUIAutoHideComponent("TransformarMontura","TransformarMontura",{data:sData.substr(2)});
                break; // CORREGIDO
            case "N":
                this.api.ui.loadUIAutoHideComponent("CambiarNombre","CambiarNombre",{color:sData.substr(2)});
                break; // CORREGIDO
            case "n":
                this.api.datacenter.Player.Name(sData.substr(2));
                if(this.api.ui.getUIComponent("CambiarNombre") != undefined)
                {
                    this.api.ui.getUIComponent("CambiarNombre").close();
                }
                break; // CORREGIDO
            case "ñ":
                this.api.ui.loadUIAutoHideComponent("Ornamento","Ornamento",{ornamentos:sData.substr(2)});
                break; // CORREGIDO
            case "Ñ":
                this.api.ui.loadUIAutoHideComponent("CreateTitle","CreateTitle");
                break; // CORREGIDO
            case "o":
                _global.RESTRINGIR_COLOR_DIA = sData.charAt(2) == "1";
                break; // CORREGIDO
            case "O":
                switch(sData.charAt(2))
                {
                    case "C":
                        var _loc28_ = sData.substr(3).split("^");
                        this.api.ui.loadUIAutoHideComponent("Servicios","Servicios",{creditos:_global.parseInt(_loc28_[0]),ogrinas:_global.parseInt(_loc28_[1]),data:_loc28_[2]});
                        break;
                    case "b":
                        var _loc28_ = sData.substr(3).split("^");
                        this.api.ui.loadUIAutoHideComponent("ServiciosCl","ServiciosCl",{ogrinas:_global.parseInt(_loc28_[0]),data:_loc28_[1]});
                }
                break; // CORREGIDO
            case "P":
                var _loc41_ = sData.substr(2).split(",");
                this.api.ui.getUIComponent("Banner").tiempoRPG(Number(_loc41_[0]),_loc41_[1] == "1");
                break; // CORREGIDO
            case "w":
                this.api.ui.loadUIAutoHideComponent("Auras","Auras",{auras:sData.substr(2)});
                break; // CORREGIDO
            case "p":
                this.api.ui.getUIComponent("PanelNPC").refrescar(sData.substr(2));
                break; // CORREGIDO
            case "R":
                switch(sData.charAt(2))
                {
                    case "I":
                        if(this.api.ui.getUIComponent("Banner") != undefined)
                        {
                            this.api.ui.getUIComponent("Banner").iniciarCronometro(sData.substring(3));
                        }
                        break;
                    case "S":
                        if(this.api.ui.getUIComponent("Banner") != undefined)
                        {
                            this.api.ui.getUIComponent("Banner").pararCronometro();
                            break;
                        }
                }
                break; // CORREGIDO
            case "r":
                switch(sData.charAt(2))
                {
                    case "P":
                        var _loc43_ = sData.substr(3).split(";");
                        this.api.ui.loadUIComponent("Ruleta","Ruleta",{premios:_loc43_[0],ficha:Number(_loc43_[1])});
                        break;
                    case "G":
                        this.api.ui.getUIComponent("Ruleta").ganador(sData.substr(3));
                }
                break; // CORREGIDO
            case "S":
                switch(sData.charAt(2))
                {
                    case "P":
                        this.api.ui.loadUIComponent("SistemaItems","SistemaItems",{tipos:sData.substr(4),icono:(sData.charAt(3) == "K" ? "Kamas" : "Ogrinas")});
                        break;
                    case "O":
                        this.api.ui.getUIComponent("SistemaItems").setObjetos(sData.substr(3));
                }
                break; // CORREGIDO
            case "t":
                this.api.ui.loadUIAutoHideComponent("Titulos","Titulos",{titulos:sData.substr(2)});
                break; // CORREGIDO
            case "T":
                var _loc36_ = sData.substr(2).split(";");
                this.api.ui.loadUIComponent("Loteria","Loteria",{coste:_loc36_[0],premio:_loc36_[1]});
                break; // CORREGIDO
            case "v":
                this.api.ui.getUIComponent("Loteria").updatePrice(sData.substr(2));
                break; // CORREGIDO
            case "V":
                this.api.ui.unloadUIComponent("Panel");
                this.api.ui.unloadLastUIAutoHideComponent();
        }
}
};
#endinitclip