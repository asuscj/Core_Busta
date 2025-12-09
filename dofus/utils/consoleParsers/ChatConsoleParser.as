#initclip 93
var _loc1 = dofus["\x1e\n\x07"]["\x12\x05"]["\x12\x1c"].prototype;
_loc1.process = function(sCmd, oParams)
{
   if(!this.api.datacenter.Basics.inGame)
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("SRV_MSG_7"),"ERROR_CHAT");
      return undefined;
   }
   super.process(sCmd,oParams);
   sCmd = this.parseSpecialDatas(sCmd);
   var _loc4_;
   var _loc18_;
   var _loc21_;
   var _loc12_;
   var _loc5_;
   var _loc23_;
   var _loc39_;
   var _loc37_;
   var _loc35_;
   var _loc31_;
   var _loc19_;
   var _loc33_;
   var _loc40_;
   var _loc44_;
   var _loc10_;
   var _loc26_;
   var _loc24_;
   var _loc25_;
   var _loc17_;
   var _loc15_;
   var _loc16_;
   var _loc6_;
   var _loc7_;
   var _loc8_;
   var _loc38_;
   var _loc22_;
   var _loc11_;
   var _loc20_;
   var _loc9_;
   var _loc14_;
   var _loc32_;
   var _loc41_;
   var _loc42_;
   var _loc34_;
   var _loc27_;
   var _loc29_;
   var _loc36_;
   if(sCmd.charAt(0) == "/")
   {
      _loc4_ = sCmd.split(" ");
      _loc18_ = _loc4_[0].substr(1).toUpperCase();
      _loc21_ = "/" + _loc18_.toLowerCase();
      _loc4_.splice(0,1);
      while(_loc4_[0].length == 0)
      {
         _loc4_.splice(0,1);
      }
      switch(_loc18_)
      {
         case "ALL":
            this.api.network.Chat.send(_loc4_.join(" "),"~",oParams);
            return;
         case "HELP":
         case "H":
         case "?":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("COMMANDS_HELP"),"COMMANDS_CHAT");
            return;
         case "ROLL":
            _loc12_ = this.api.lang.getText("CHAT_COMMAND_INVALID",[_loc21_]);
            _loc5_ = 1;
            while(_loc5_ <= 3)
            {
               _loc12_ += "\n- " + this.api.lang.getText("DICE_HELP_" + _loc5_,[_loc21_]);
               _loc5_ += 1;
            }
            if(_loc4_.length < 1)
            {
               this.api.kernel.showMessage(undefined,_loc12_,"COMMANDS_CHAT");
               return;
            }
            _loc23_ = _loc4_[0];
            if(_loc23_.length < 1)
            {
               this.api.kernel.showMessage(undefined,_loc12_,"COMMANDS_CHAT");
               return;
            }
            _loc39_ = false;
            if(_loc23_.charAt(0).toLowerCase() == "g")
            {
               _loc39_ = true;
               _loc23_ = _loc23_.substring(1);
            }
            if(_loc23_.indexOf("d") > -1)
            {
               _loc37_ = _loc23_.split("d");
               _loc35_ = Number(_loc37_[0]);
               _loc31_ = Number(_loc37_[1]);
            }
            else
            {
               _loc35_ = 1;
               _loc31_ = Number(_loc23_);
            }
            if(_global.isNaN(_loc35_))
            {
               this.api.kernel.showMessage(undefined,_loc12_,"COMMANDS_CHAT");
               return;
            }
            if(_global.isNaN(_loc31_))
            {
               this.api.kernel.showMessage(undefined,_loc12_,"COMMANDS_CHAT");
               return;
            }
            this.api.network.Evenemential.sendRollDice(_loc35_,_loc31_,_loc39_ ? "%" : "*");
            return;
            break;
         case "VERSION":
         case "VER":
         case "ABOUT":
            _loc19_ = "--------------------------------------------------------------\n";
            _loc19_ += "<b>DOFUS RETRO Client v" + dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION + "</b>";
            if(dofus.Constants.BETAVERSION > 0)
            {
               _loc19_ += " <b><font color=\"#FF0000\">BETA VERSION " + dofus.Constants.BETAVERSION + "</font></b>";
            }
            _loc19_ += "\n(c) ANKAMA GAMES (" + dofus.Constants.VERSIONDATE + ")\n";
            _loc19_ += "Flash player " + System.capabilities.version + "\n";
            _loc19_ += "--------------------------------------------------------------";
            this.api.kernel.showMessage(undefined,_loc19_,"COMMANDS_CHAT");
            return;
         case "S":
            this.api.network.Chat.send(_loc4_.join(" "),"*",oParams);
            return;
         case "T":
            this.api.network.Chat.send(_loc4_.join(" "),"#",oParams);
            return;
         case "G":
            if(this.api.datacenter.Player.guildInfos != undefined)
            {
               this.api.network.Chat.send(_loc4_.join(" "),"%",oParams);
               return;
            }
            return;
            break;
         case "P":
            if(this.api.ui.getUIComponent("Party") != undefined)
            {
               this.api.network.Chat.send(_loc4_.join(" "),"$",oParams);
               return;
            }
            return;
            break;
         case "A":
            this.api.network.Chat.send(_loc4_.join(" "),"!",oParams);
            return;
         case "R":
            this.api.network.Chat.send(_loc4_.join(" "),"?",oParams);
            return;
         case "B":
            this.api.network.Chat.send(_loc4_.join(" "),":",oParams);
            return;
         case "I":
            this.api.network.Chat.send(_loc4_.join(" "),"^",oParams);
            return;
         case "Q":
            this.api.network.Chat.send(_loc4_.join(" "),"@",oParams);
            return;
         case "M":
            this.api.network.Chat.send(_loc4_.join(" "),"¤",oParams);
            return;
         case "W":
         case "MSG":
         case "WHISPER":
            if(_loc4_.length < 2)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /w &lt;" + this.api.lang.getText("NAME") + "&gt; &lt;" + this.api.lang.getText("MSG") + "&gt;"]),"ERROR_CHAT");
               return;
            }
            _loc33_ = _loc4_[0];
            if(_loc33_.length < 2)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /w &lt;" + this.api.lang.getText("NAME") + "&gt; &lt;" + this.api.lang.getText("MSG") + "&gt;"]),"ERROR_CHAT");
               return;
            }
            _loc4_.shift();
            _loc40_ = _loc4_.join(" ");
            this.pushWhisper("/w " + _loc33_ + " ");
            this.api.network.Chat.send(_loc40_,_loc33_,oParams);
            return;
            break;
         case "WHOAMI":
            this.api.network.Basics.whoAmI();
            return;
         case "WHOIS":
            if(_loc4_.length == 0)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /whois &lt;" + this.api.lang.getText("NAME") + "&gt;"]),"ERROR_CHAT");
               return;
            }
            this.api.network.Basics.whoIs(_loc4_[0]);
            return;
            break;
         case "F":
         case "FRIEND":
         case "FRIENDS":
            switch(_loc4_[0].toUpperCase())
            {
               case "A":
               case "+":
                  this.api.network.Friends.addFriend(_loc4_[1]);
                  return;
               case "D":
               case "R":
               case "-":
                  this.api.network.Friends.removeFriend(_loc4_[1]);
                  return;
               case "L":
                  this.api.network.Friends.getFriendsList();
                  return;
               default:
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /f &lt;A/D/L&gt; &lt;" + this.api.lang.getText("NAME") + "&gt;"]),"ERROR_CHAT");
                  return;
            }
            break;
         case "IGNORE":
         case "ENEMY":
            switch(_loc4_[0].toUpperCase())
            {
               case "A":
               case "+":
                  this.api.network.Enemies.addEnemy(_loc4_[1]);
                  return;
               case "D":
               case "R":
               case "-":
                  this.api.network.Enemies.removeEnemy(_loc4_[1]);
                  return;
               case "L":
                  this.api.network.Enemies.getEnemiesList();
                  return;
               default:
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /f &lt;A/D/L&gt; &lt;" + this.api.lang.getText("NAME") + "&gt;"]),"ERROR_CHAT");
                  return;
            }
            break;
         case "PING":
            this.api.network.ping();
            return;
         case "GOD":
         case "GODMODE":
            _loc44_ = Math.random();
            _loc10_ = [];
            _loc26_ = "Retro Legacy";
            _loc24_ = "Hall des Valeureux du Dieu Iop";
            _loc25_ = "Retro 1.30+";
            _loc17_ = ["Bill","Tyn","Nyx","Lichen","Simsoft"];
            _loc15_ = ["Sastip","Papinaut","Iotam"];
            _loc16_ = ["Kam","ToT","LeLag","Sannho","Treuff","Artand","Ekyn","Simeth","Asthenis","Oopah","Seydlex","Eknelis"];
            _loc6_ = 0;
            while(_loc6_ < _loc17_.length)
            {
               _loc10_.push({pseudo:_loc17_[_loc6_],godtype:_loc26_});
               _loc6_ += 1;
            }
            _loc7_ = 0;
            while(_loc7_ < _loc15_.length)
            {
               _loc10_.push({pseudo:_loc15_[_loc7_],godtype:_loc24_});
               _loc7_ += 1;
            }
            _loc8_ = 0;
            while(_loc8_ < _loc16_.length)
            {
               _loc10_.push({pseudo:_loc16_[_loc8_],godtype:_loc25_});
               _loc8_ += 1;
            }
            _loc10_.push({pseudo:"DUSK",godtype:"Retro & Retro Remastered 1.30+, Swiss Made"});
            _loc10_.push({pseudo:"Lakha",godtype:"Retro 1.30+, Détentrice du cahier de l\'annulation suprême"});
            _loc10_.push({pseudo:"Logan",godtype:"Retro 1.30+, Ch\'pécialiste de la divulgach\'"});
            _loc38_ = _loc10_[Math.floor(Math.random() * _loc10_.length)];
            this.api.kernel.showMessage(undefined,"God : <u>" + _loc38_.pseudo + "</u> (<b>" + _loc38_.godtype + "</b>)","COMMANDS_CHAT");
            return;
         case "APING":
            this.api.kernel.showMessage(undefined,"Average ping : " + this.api.network.getAveragePing() + "ms (on " + this.api.network.getAveragePingPacketsCount() + " packets)","COMMANDS_CHAT");
            return;
         case "MAPID":
            this.api.kernel.showMessage(undefined,"MAP ID : " + this.api.datacenter.Map.id,"COMMANDS_CHAT");
            if(this.api.datacenter.Player.isAuthorized)
            {
               this.api.kernel.showMessage(undefined,"Area : " + this.api.datacenter.Map.area,"COMMANDS_CHAT");
               this.api.kernel.showMessage(undefined,"Sub area : " + this.api.datacenter.Map.subarea,"COMMANDS_CHAT");
               this.api.kernel.showMessage(undefined,"Super Area : " + this.api.datacenter.Map.superarea,"COMMANDS_CHAT");
               return;
            }
            return;
            break;
         case "CELLID":
            this.api.kernel.showMessage(undefined,"CELL ID : " + this.api.datacenter.Player.data.cellNum,"COMMANDS_CHAT");
            return;
         case "TIME":
            this.api.kernel.showMessage(undefined,this.api.kernel.NightManager.date + " - " + this.api.kernel.NightManager.time,"COMMANDS_CHAT");
            return;
         case "LIST":
         case "PLAYERS":
            if(!this.api.datacenter.Game.isFight)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_DO_COMMAND_HERE",[_loc18_]),"ERROR_CHAT");
               return undefined;
            }
            _loc22_ = [];
            _loc11_ = this.api.datacenter.Sprites.getItems();
            for(var _loc30_ in _loc11_)
            {
               if(_loc11_[_loc30_] instanceof dofus.datacenter["\x13\x01"])
               {
                  _loc22_.push("- " + _loc11_[_loc30_].name);
               }
            }
            this.api.kernel.showMessage(undefined,this.api.lang.getText("PLAYERS_LIST") + " :\n" + _loc22_.join("\n"),"COMMANDS_CHAT");
            return;
            break;
         case "KICK":
            if(!this.api.datacenter.Game.isFight || this.api.datacenter.Game.isRunning)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_DO_COMMAND_HERE",[_loc18_]),"ERROR_CHAT");
               return undefined;
            }
            _loc20_ = String(_loc4_[0]);
            _loc9_ = this.api.datacenter.Sprites.getItems();
            for(_loc30_ in _loc9_)
            {
               if(_loc9_[_loc30_] instanceof dofus.datacenter["\x13\x01"] && _loc9_[_loc30_].name == _loc20_)
               {
                  _loc14_ = _loc9_[_loc30_].id;
                  break;
               }
            }
            if(_loc14_ != undefined)
            {
               this.api.network.Game.leave(_loc14_);
               return;
            }
            this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_KICK_A",[_loc20_]),"ERROR_CHAT");
            return;
            break;
         case "SPECTATOR":
         case "SPEC":
            if(!this.api.datacenter.Game.isRunning || this.api.datacenter.Game.isSpectator)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_DO_COMMAND_HERE",[_loc18_]),"ERROR_CHAT");
               return undefined;
            }
            this.api.network.Fights.blockSpectators();
            return;
            break;
         case "AWAY":
            this.api.network.Basics.away();
            return;
         case "INVISIBLE":
            this.api.network.Basics.invisible();
            return;
         case "INVITE":
            _loc32_ = String(_loc4_[0]);
            if(_loc32_.length == 0 || _loc32_ == undefined)
            {
               return;
            }
            this.api.network.Party.invite(_loc32_);
            return;
            break;
         case "CONSOLE":
            if(this.api.datacenter.Player.isAuthorized)
            {
               // Instrumentation: record origin of Debug UI load from chat console
               this.api.ui.loadUIComponent("Debug","Debug",undefined,{bAlwaysOnTop:true});
               return;
            }
            this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc18_]),"ERROR_CHAT");
            return;
            break;
         case "DEBUG":
            if(this.api.datacenter.Player.isAuthorized)
            {
               this.api.kernel.DebugManager.toggleDebug();
               return;
            }
            return;
            break;
         case "CHANGECHARACTER":
            this.api.kernel.changeServer();
            return;
         case "LOGOUT":
            this.api.kernel.disconnect();
            return;
         case "QUIT":
            this.api.kernel.quit();
            return;
         case "THINK":
         case "METHINK":
         case "PENSE":
         case "TH":
            if(_loc4_.length < 1)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /" + _loc18_.toLowerCase() + " &lt;" + this.api.lang.getText("TEXT_WORD") + "&gt;"]),"ERROR_CHAT");
               return;
            }
            _loc41_ = "!THINK!" + _loc4_.join(" ");
            if(this.api.datacenter.Player.canChatToAll)
            {
               this.api.network.Chat.send(_loc41_,"*",oParams);
               return;
            }
            return;
            break;
         case "ME":
         case "EM":
         case "MOI":
         case "EMOTE":
            if(!this.api.lang.getConfigText("EMOTES_ENABLED"))
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc18_]),"ERROR_CHAT");
               return;
            }
            if(_loc4_.length < 1)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /" + _loc18_.toLowerCase() + " &lt;" + this.api.lang.getText("TEXT_WORD") + "&gt;"]),"ERROR_CHAT");
               return;
            }
            _loc42_ = _loc4_.join(" ");
            if(this.api.datacenter.Player.canChatToAll)
            {
               this.api.network.Chat.send(dofus.Constants.EMOTE_CHAR + _loc42_ + dofus.Constants.EMOTE_CHAR,"*",oParams);
               return;
            }
            return;
            break;
         case "KB":
            this.api.ui.loadUIComponent("KnownledgeBase","KnownledgeBase");
            return;
         case "RELEASE":
            if(this.api.datacenter.Player.data.isTomb)
            {
               this.api.network.Game.freeMySoul();
               return;
            }
            if(this.api.datacenter.Player.data.isSlow)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_ALREADY_A_GHOST"),"ERROR_CHAT");
               return;
            }
            this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_NOT_DEAD_AT_LEAST_FOR_NOW"),"ERROR_CHAT");
            return;
            break;
         case "SELECTION":
            if(_loc4_[0] == "enable" || _loc4_[0] == "on")
            {
               this.api.ui.getUIComponent("Banner").setSelectable(true);
               return;
            }
            if(_loc4_[0] == "disable" || _loc4_[0] == "off")
            {
               this.api.ui.getUIComponent("Banner").setSelectable(false);
               return;
            }
            this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",["/selection [enable|on|disable|off]"]),"ERROR_CHAT");
            return;
            break;
         case "AUTOSCROLL":
            if(_loc4_[0] == "enable" || _loc4_[0] == "on")
            {
               this.api.kernel.showMessage(undefined,"Autoscroll du chat réactivé","INFO_CHAT");
               this.api.ui.getUIComponent("Banner").setChatAutoScroll(true);
               return;
            }
            if(_loc4_[0] == "disable" || _loc4_[0] == "off")
            {
               this.api.kernel.showMessage(undefined,"Autoscroll du chat désactivé","INFO_CHAT");
               this.api.ui.getUIComponent("Banner").setChatAutoScroll(false);
               return;
            }
            this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",["/autoscroll [enable|on|disable|off]"]),"ERROR_CHAT");
            return;
            break;
         case "WTF":
         case "DOFUS2":
            this.api.kernel.showMessage(undefined,"(°~°)","ERROR_BOX");
            return;
         case "TACTIC":
            if(this.api.datacenter.Player.isAuthorized || this.api.datacenter.Game.isFight)
            {
               _loc34_ = !this.api.datacenter.Game.isTacticMode;
               this.api.datacenter.Game.isTacticMode = _loc34_;
               this.api.gfx.activateTacticMode(this.api,_loc34_);
               this.api.ui.getUIComponent("FightOptionButtons")._btnTactic.selected = _loc34_;
               return;
            }
            return;
            break;
         case "RETROCHAT":
         case "CHATOUTPUT":
            if(!this.api.electron.enabled)
            {
               this.api.kernel.showMessage(undefined,"Does not work on a Flash Projector","ERROR_CHAT");
               return;
            }
            dofus.Electron.retroChatOpen();
            return;
            break;
         case "FILEOUTPUT":
            if(this.api.electron.enabled)
            {
               _loc27_ = Number(_loc4_[0]);
               if(_loc4_[0] == undefined || (_global.isNaN(_loc27_) || (_loc27_ < 0 || _loc27_ > 2)))
               {
                  this.api.kernel.showMessage(undefined,"/fileoutput &lt;0 (disabled) | 1 (enabled) | 2 (full)&gt;","ERROR_CHAT");
                  return undefined;
               }
               _loc29_ = "";
               switch(_loc27_)
               {
                  case 0:
                     _loc29_ = "Disabled";
                     break;
                  case 1:
                     _loc29_ = "Enabled";
                     break;
                  case 2:
                     _loc29_ = "Enabled (full)";
               }
               this.api.kernel.ChatManager.fileOutput = _loc27_;
               this.api.kernel.showMessage(undefined,"File Output (Chat) : " + _loc29_,"COMMANDS_CHAT");
               return;
            }
            this.api.kernel.showMessage(undefined,"Does not work on a Flash Projector","COMMANDS_CHAT");
            return;
            break;
         case "CLS":
         case "CLEAR":
            this.api.electron.retroChatClear();
            this.api.kernel.ChatManager.clear();
            this.api.kernel.ChatManager.refresh(true);
            return;
         case "SPEAKINGITEM":
            if(this.api.datacenter.Player.isAuthorized)
            {
               this.api.kernel.showMessage(undefined,"Count : " + this.api.kernel.SpeakingItemsManager.nextMsgDelay,"ERROR_CHAT");
               return;
            }
      }
      _loc36_ = this.api.lang.getEmoteID(_loc18_.toLowerCase());
      if(_loc36_ != undefined)
      {
         this.api.network.Emotes.useEmote(_loc36_);
      }
      else
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc18_]),"ERROR_CHAT");
      }
   }
   else if(this.api.datacenter.Player.canChatToAll)
   {
      this.api.network.Chat.send(sCmd,"*",oParams);
   }
};
#endinitclip