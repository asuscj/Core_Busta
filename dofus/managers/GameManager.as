#initclip 128
var _loc1 = dofus["\x0b\b"].GameManager.prototype;
_global.dofus["\x0b\b"].GameManager.MINIMAL_SPELL_LAUNCH_DELAY = 0;
_loc1.showPlayerPopupMenu = function(_loc2_, _loc3_, _loc4_, _loc5_, _loc6_, _loc7_, _loc8_, _loc9_, _loc10_)
{
   if(!_loc10_)
   {
      this._sLastClickedMessage = undefined;
   }
   if(_loc9_ == undefined)
   {
      _loc9_ = false;
   }
   var _loc13_ = null;
   var _loc14_;
   var _loc15_;
   if(_loc2_ != undefined)
   {
      _loc13_ = _loc2_;
   }
   else
   {
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      _loc14_ = this.api.datacenter.Sprites.getItems();
      for(var _loc16_ in _loc14_)
      {
         _loc15_ = _loc14_[_loc16_];
         if(_loc15_.name.toUpperCase() == _loc3_.toUpperCase())
         {
            _loc13_ = _loc15_;
            break;
         }
      }
   }
   var _loc17_ = this.api.datacenter.Game.isFight;
   var _loc12_ = _loc13_.id;
   var _loc18_ = _loc3_ == undefined ? _loc13_.name : _loc3_;_;
   var _loc11_;
   var _loc19_;
   if(Key.isDown(16) && _loc18_ != this.api.datacenter.Player.Name && !_loc17_ && !this.api.datacenter.Game.isRunning)
   {
      _loc11_ = this.api.ui.getUIComponent("Banner");
      _loc11_.txtConsole = "/w " + _loc18_ + " ";
      _loc11_.placeCursorAtTheEnd();
   }
   else if(Key.isDown(16) && _loc18_ != this.api.datacenter.Player.Name && _loc17_ && !this.api.datacenter.Game.isRunning)
   {
      this.api.network.Game.cambiarPosN(_loc12_);
   }
   else
   {
      if(this.api.datacenter.Player.isAuthorized && !_loc9_ && Key.isDown(16))
      {
         _loc19_ = this.api.kernel.AdminManager.getAdminPopupMenu(_loc18_,false);
         _loc19_.addItem(_loc18_ + " >>",this,this.showPlayerPopupMenu,[_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,true],true);
         _loc19_.items.unshift(_loc19_.items.pop());
      }
      else
      {
         _loc19_ = this.getPlayerPopupMenu(_loc13_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
      }
      if(_loc19_.items.length > 0)
      {
         _loc19_.show(_root._xmouse,_root._ymouse,true);
      }
   }
};
_loc1.inactivityCheck = function()
{
   return undefined;
};
_loc1.getPlayerPopupMenu = function(_loc2_, _loc3_, _loc4_, _loc5_, _loc6_, _loc7_, _loc8_)
{
   var _loc12_ = this.api.datacenter.Game.isFight;
   var _loc11_ = _loc2_.id;
   var _loc10_ = _loc3_ == undefined ? _loc2_.name : _loc3_;
   var _loc15_ = this.api.ui.createPopupMenu();
   _loc15_.addStaticItem(_loc10_);
   var _loc14_ = this.api.kernel.ChatManager.isBlacklisted(_loc10_);
   if(_loc14_)
   {
      _loc15_.addStaticItem("(" + this.api.lang.getText("IGNORED_WORD") + ")");
   }
   if(_loc12_)
   {
      if(!this.api.datacenter.Game.isRunning && (!this.api.datacenter.Player.isMutant || this.api.datacenter.Player.canAttackDungeonMonstersWhenMutant))
      {
         if(_loc2_ != null && _loc11_ != this.api.datacenter.Player.ID)
         {
            if(Key.isDown(16))
            {
               this.api.network.Game.cambiarPosN(_loc11_);
            }
            else
            {
               _loc15_.addItem(this.api.lang.getText("KICK"),this.api.network.Game,this.api.network.Game.leave,[_loc11_]);
               _loc15_.addItem(this.api.lang.getText("SWITCH"),this.api.network.Game,this.api.network.Game.cambiarPosN,[_loc11_]);
            }
         }
      }
   }
   var _loc20_;
   var _loc13_;
   var _loc16_;
   var _loc19_;
   var _loc17_;
   var _loc18_;
   var _loc21_;
   var _loc22_;
   var _loc9_;
   if(_loc11_ == this.api.datacenter.Player.ID)
   {
      _loc15_.addItem(this.api.lang.getText("SERVICES"),this.api.kernel.GameManager,this.api.kernel.GameManager.Comandos);
      _loc15_.addItem(this.api.lang.getText("HIT_HIMSELF"),this.api.network.Chat,this.api.network.Chat.send,[this.api.lang.getText("SLAP_SENTENCE"),"*"]);
      if(!_loc12_ && (this.api.datacenter.Player.restrictions & 0x20) == 32)
      {
         _loc15_.addItem(this.api.lang.getText("ORGANIZE_SHOP"),this.api.kernel.GameManager,this.api.kernel.GameManager.startExchange,[6]);
         _loc15_.addItem(this.api.lang.getText("MERCHANT_MODE"),this.api.kernel.GameManager,this.api.kernel.GameManager.offlineExchange);
      }
      if(this.api.datacenter.Player.data.isTomb)
      {
         _loc15_.addItem(this.api.lang.getText("FREE_MY_SOUL"),this.api.network.Game,this.api.network.Game.freeMySoul);
      }
      else if(!_loc12_)
      {
         _loc20_ = _loc2_.animation == "static";
         _loc15_.addItem(this.api.lang.getText("CHANGE_DIRECTION"),this.api.ui,this.api.ui.loadUIComponent,["DirectionChooser","DirectionChooser",{allDirections:this.api.datacenter.Player.canMoveInAllDirections,target:this.api.datacenter.Player.data.mc}]);
      }
   }
   else
   {
      if(_loc7_ != undefined && (_loc7_.length > 0 && (_loc7_ != "" && !_loc14_)))
      {
         _loc13_ = false;
         _loc16_ = 0;
         while(_loc16_ < this.api.lang.getConfigText("ENABLED_SERVER_REPORT_LIST").length)
         {
            if(this.api.lang.getConfigText("ENABLED_SERVER_REPORT_LIST")[_loc16_] == this.api.datacenter.Basics.aks_current_server.id)
            {
               _loc13_ = true;
               break;
            }
            _loc16_ += 1;
         }
         if(_loc13_)
         {
            _loc15_.addItem(this.api.lang.getText("REPORT_SENTANCE"),this.api.kernel.GameManager,this.api.kernel.GameManager.reportSentance,[_loc10_,_loc11_,_loc7_,_loc2_]);
         }
      }
      if(!this.api.kernel.ChatManager.isBlacklisted(_loc10_) && !_loc12_)
      {
         _loc15_.addItem(this.api.lang.getText("BLACKLIST_TEMPORARLY"),this.api.kernel.GameManager,this.api.kernel.GameManager.reportSentance,[_loc10_,_loc11_,undefined,_loc2_]);
      }
      else
      {
         _loc15_.addItem(this.api.lang.getText("BLACKLIST_REMOVE"),this.api.kernel.ChatManager,this.api.kernel.ChatManager.removeToBlacklist,[_loc10_]);
      }
      if(!_loc12_ || _loc12_ && _loc3_ != undefined)
      {
         _loc15_.addItem(this.api.lang.getText("WHOIS"),this.api.network.Basics,this.api.network.Basics.whoIs,[_loc10_]);
         if(_loc5_ != true)
         {
            _loc15_.addItem(this.api.lang.getText("ADD_TO_FRIENDS"),this.api.network.Friends,this.api.network.Friends.addFriend,[_loc10_]);
         }
         if(_loc5_ != true)
         {
            _loc15_.addItem(this.api.lang.getText("ADD_TO_ENEMY"),this.api.network.Enemies,this.api.network.Enemies.addEnemy,[_loc10_]);
         }
         _loc15_.addItem(this.api.lang.getText("WISPER_MESSAGE"),this.api.kernel.GameManager,this.api.kernel.GameManager.askPrivateMessage,[_loc10_]);
         if(_loc4_ == undefined)
         {
            _loc15_.addItem(this.api.lang.getText("ADD_TO_PARTY"),this.api.network.Party,this.api.network.Party.invite,[_loc10_]);
         }
         if(this.api.datacenter.Player.guildInfos != undefined)
         {
            if(_loc6_ != true)
            {
               if(_loc2_ == null || (_loc2_ != null && _loc2_.guildName == undefined || _loc2_.guildName.length == 0))
               {
                  if(this.api.datacenter.Player.guildInfos.playerRights.canInvite)
                  {
                     _loc15_.addItem(this.api.lang.getText("INVITE_IN_GUILD"),this.api.network.Guild,this.api.network.Guild.invite,[_loc10_]);
                  }
               }
            }
         }
         if(_loc8_)
         {
            if(this.api.datacenter.Player.isAuthorized)
            {
               _loc15_.addItem(this.api.lang.getText("JOIN_SMALL"),this.api.kernel.AdminManager,this.api.kernel.AdminManager.sendCommand,["join " + _loc10_]);
            }
            else if(this.api.datacenter.Map.superarea == 3)
            {
               _loc15_.addItem(this.api.lang.getText("JOIN_SMALL"),this.api.network.Friends,this.api.network.Friends.joinFriend,[_loc10_]);
            }
         }
      }
      if(_loc2_ != null && (_loc2_.gfxID != "999" && !_loc5_))
      {
         if(this.api.datacenter.Player.isAtHome(this.api.datacenter.Map.id))
         {
            _loc15_.addItem(this.api.lang.getText("KICKOFF"),this.api.network.Houses,this.api.network.Houses.kick,[_loc11_]);
         }
         if(this.api.datacenter.Player.canExchange && _loc2_.canExchange)
         {
            _loc15_.addItem(this.api.lang.getText("EXCHANGE"),this.api.kernel.GameManager,this.api.kernel.GameManager.startExchange,[1,_loc11_]);
         }
         if(this.api.datacenter.Player.canChallenge && _loc2_.canBeChallenge)
         {
            this.api.kernel.debug(this.api.datacenter.Map.bCanChallenge);
            _loc15_.addItem(this.api.lang.getText("CHALLENGE"),this.api.network.GameActions,this.api.network.GameActions.challenge,[_loc11_],this.api.datacenter.Map.bCanChallenge);
         }
         if(this.api.datacenter.Player.canAssault && !_loc2_.showIsPlayer)
         {
            _loc19_ = this.api.datacenter.Player.data.alignment.index;
            if(this.api.lang.getAlignmentCanAttack(_loc19_,_loc2_.alignment.index))
            {
               _loc15_.addItem(this.api.lang.getText("ASSAULT"),this.api.kernel.GameManager,this.api.kernel.GameManager.askAttack,[[_loc11_]],this.api.datacenter.Map.bCanAttack);
            }
         }
         if(this.api.datacenter.Player.canAttack && (_loc2_.canBeAttack && !_loc2_.showIsPlayer))
         {
            _loc15_.addItem(this.api.lang.getText("ATTACK"),this.api.network.GameActions,this.api.network.GameActions.mutantAttack,[_loc2_.id]);
         }
         _loc17_ = _loc2_.multiCraftSkillsID;
         if(_loc17_ != undefined && _loc17_.length > 0)
         {
            _loc18_ = 0;
            while(_loc18_ < _loc17_.length)
            {
               _loc21_ = Number(_loc17_[_loc18_]);
               _loc15_.addItem(this.api.lang.getText("ASK_TO") + " " + this.api.lang.getSkillText(_loc21_).d,this.api.network.Exchange,this.api.network.Exchange.request,[13,_loc2_.id,_loc21_]);
               _loc18_ += 1;
            }
         }
         else
         {
            _loc17_ = this.api.datacenter.Player.data.multiCraftSkillsID;
            if(_loc17_ != undefined && _loc17_.length > 0)
            {
               _loc22_ = 0;
               while(_loc22_ < _loc17_.length)
               {
                  _loc9_ = Number(_loc17_[_loc22_]);
                  _loc15_.addItem(this.api.lang.getText("INVITE_TO") + " " + this.api.lang.getSkillText(_loc9_).d,this.api.network.Exchange,this.api.network.Exchange.request,[12,_loc2_.id,_loc9_]);
                  _loc22_ += 1;
               }
            }
         }
      }
   }
   if(_loc4_ != undefined)
   {
      _loc4_.addPartyMenuItems(_loc15_);
   }
   if(_loc2_ != null && (_loc2_.gfxID != "999" && (_loc2_.isVisible && (this.api.ui.getUIComponent("Zoom") == undefined && !_loc12_))))
   {
      _loc15_.addItem(this.api.lang.getText("ZOOM"),this.api.ui,this.api.ui.loadUIAutoHideComponent,["Zoom","Zoom",{sprite:_loc2_}]);
   }
   return _loc15_;
};
_loc1.useRessource = function(_loc2_, _loc3_, _loc4_)
{
   if(this.api.gfx.onCellRelease(_loc2_))
   {
      this.api.network.GameActions.sendActions(500,[_loc3_,_loc4_]);
   }
};
_loc1.cleanPlayer = function(_loc2_)
{
   var _loc3_;
   if(_loc2_ != this.api.datacenter.Game.currentPlayerID)
   {
      _loc3_ = this.api.datacenter.Sprites.getItemAt(_loc2_);
      _loc3_.EffectsManager.nextTurn();
      _loc3_.CharacteristicsManager.nextTurn();
      _loc3_.GameActionsManager.clear();
   }
};
_loc1.forceCleanPlayer = function(_loc2_)
{
   var _loc2_ = this.api.datacenter.Sprites.getItemAt(_loc2_);
   _loc2_.EffectsManager.nextTurn();
   _loc2_.CharacteristicsManager.nextTurn();
   _loc2_.GameActionsManager.clear();
};
_loc1.terminateFight = function()
{
   if(!this.api.datacenter.Basics.isLogged)
   {
      return undefined;
   }
   this.api.sounds.events.onGameEnd();
   this.api.sounds.playMusic(this.api.datacenter.Map.musicID);
   this.api.kernel.showMessage(undefined,ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("GAME_END"),"m",this.api.datacenter.Basics.exp_lastGained > 0 || this.api.datacenter.Basics.kamas_lastGained > 0),"INFO_CHAT");
   if(!this.api.datacenter.Game.isSpectator)
   {
      this.printFightResultInfo(8,this.api.datacenter.Basics.exp_lastGained);
      this.printFightResultInfo(45,this.api.datacenter.Basics.kamas_lastGained);
      this.printFightResultInfo(209,this.api.datacenter.Basics.guildExp_lastGained);
      this.printFightResultInfo(210,this.api.datacenter.Basics.mountExp_lastGained);
   }
   if(!this.api.datacenter.Player.isSkippingLootPanel)
   {
      if(this.api.kernel.OptionsManager.getOption("UseLightEndFightUI") && this.api.datacenter.Game.results.currentPlayerInfos.length != 0)
      {
         this.api.ui.loadUIComponent("GameResultLight","GameResultLight",{data:this.api.datacenter.Game.results},{bAlwaysOnTop:true});
      }
      else
      {
         this.api.ui.loadUIComponent("GameResult","GameResult",{data:this.api.datacenter.Game.results},{bAlwaysOnTop:true});
      }
   }
   this.api.gfx.cleanMap();
   this.api.network.Game.onLeave();
};
_loc1.showEndPanel = function(nID, bInputIsIndex)
{
   var _loc4_ = this.api.datacenter.Game.resultsArray;
   var _loc3_ = nID == -1 || nID == undefined;
   var _loc2_;
   if(!bInputIsIndex)
   {
      if(!_loc3_)
      {
         _loc2_ = _loc4_.findFirstItem("id",nID).index;
         if(_loc2_ == -1)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("FIGHT_HISTORY_EXPIRED"),"ERROR_CHAT");
            return undefined;
         }
      }
   }
   else
   {
      _loc2_ = nID;
   }
   if(this.api.kernel.OptionsManager.getOption("UseLightEndFightUI") && this.api.datacenter.Game.results.currentPlayerInfos.length != 0)
   {
      this.api.ui.loadUIComponent("GameResultLight","GameResultLight",{data:(!_loc3_ ? _loc4_[_loc2_] : this.api.datacenter.Game.results)},{bAlwaysOnTop:true});
   }
   else
   {
      this.api.ui.loadUIComponent("GameResult","GameResult",{data:(!_loc3_ ? _loc4_[_loc2_] : this.api.datacenter.Game.results)},{bAlwaysOnTop:true});
   }
};
_loc1.printFightResultInfo = function(_loc2_, nResultValue)
{
   if(nResultValue > 0)
   {
      this.api.kernel.showMessage(undefined," - " + this.api.lang.getText("INFOS_" + _loc2_,[new ank["\x1e\n\x07"]["\x0e\x1c"](nResultValue).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3)]),"INFO_CHAT");
   }
};
_loc1.Comandos = function()
{
   var _loc3_ = this.api.ui.createPopupMenu();
   _loc3_.addStaticItem(this.api.lang.getText("SERVICE"));
   _loc3_.addItem(this.api.lang.getText("SERIVES_PANEL"),this.api.network,this.api.network.send,["ZOC"]);
   _loc3_.addItem(this.api.lang.getText("SELECT_ORNAMENT"),this.api.network,this.api.network.send,["Zñ"]);
   _loc3_.addItem(this.api.lang.getText("SELECT_TITLE"),this.api.network,this.api.network.send,["Zt"]);
   _loc3_.show(_root._xmouse,_root._ymouse);
};
#endinitclip