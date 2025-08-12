#initclip 97
var _loc1 = dofus.aks.GameActions.prototype;
_loc1.onModoCriatura = function()
{
   var _loc3_ = this.api.datacenter.Sprites.getItems();
   var _loc2_;
   for(var _loc4_ in _loc3_)
   {
      _loc2_ = _loc3_[_loc4_];
      if(!(_loc2_ == undefined || _loc2_.isClear))
      {
         _loc2_.CharacteristicsManager.modoCriaturas();
      }
   }
};
_loc1.onActionsStart = function(_loc2_)
{
   var _loc3_ = _loc2_;
   if(_loc3_ != this.api.datacenter.Player.ID)
   {
      return undefined;
   }
   _loc2_ = this.api.datacenter.Game.data;
   _loc2_.GameActionsManager.m_bNextAction = true;
   var _loc4_;
   if(this.api.datacenter.Game.isFight)
   {
      _loc4_ = _loc2_.sequencer;
      _loc4_.execute();
   }
};
_loc1.onActionsFinish = function(sExtraData)
{
   var _loc5_ = sExtraData.split("|");
   var _loc6_ = Number(_loc5_[0]);
   var _loc3_ = _loc5_[1];
   var _loc4_ = this.api.datacenter.Player.data;
   var _loc2_ = _loc4_.sequencer;
   _loc4_.GameActionsManager.m_bNextAction = false;
   if(this.api.datacenter.Game.isFight)
   {
      _loc2_.addAction(32,false,this.api.kernel.GameManager,this.api.kernel.GameManager.setEnabledInteractionIfICan,[ank.battlefield.Constants.INTERACTION_CELL_RELEASE_OVER_OUT]);
      if(_loc3_ != undefined)
      {
         _loc2_.addAction(33,false,this,this.actionAck,[_loc3_]);
      }
      _loc2_.addAction(34,false,this.api.kernel.GameManager,this.api.kernel.GameManager.cleanPlayer,[_loc6_]);
      this.api.gfx.mapHandler.resetEmptyCells();
      this.api.gfx.clearZoneLayer("spell");
      this.api.gfx.clearPointer();
      _loc2_.execute();
      if(_loc3_ == 2)
      {
         this.api.kernel.TipsManager.showNewTip(dofus["\x0b\b"].TipsManager.TIP_FIGHT_ENDMOVE);
      }
   }
};
_loc1.alternativeGameAction = function(_loc2_)
{
   var _loc24_ = _loc2_;
   var _loc4_ = _loc2_.indexOf(";");
   var _loc8_ = Number(_loc2_.substring(0,_loc4_));
   if(dofus.Constants.SAVING_THE_WORLD)
   {
      if(_loc2_ == ";0")
      {
         dofus["\x1e\x14\x10"].getInstance().nextActionIfOnSafe();
      }
   }
   _loc2_ = _loc2_.substring(_loc4_ + 1);
   _loc4_ = _loc2_.indexOf(";");
   var _loc6_ = Number(_loc2_.substring(0,_loc4_));
   _loc2_ = _loc2_.substring(_loc4_ + 1);
   _loc4_ = _loc2_.indexOf(";");
   var _loc5_ = _loc2_.substring(0,_loc4_);
   var _loc11_ = _loc2_.substring(_loc4_ + 1);
   if(_loc5_.length == 0)
   {
      _loc5_ = this.api.datacenter.Player.ID;
   }
   var _loc18_ = this.api.datacenter.Game.currentPlayerID;
   var _loc12_;
   if(this.api.datacenter.Game.isFight && _loc18_ != undefined)
   {
      _loc12_ = _loc18_;
   }
   else
   {
      _loc12_ = _loc5_;
   }
   var _loc22_ = this.api.datacenter.Sprites.getItemAt(_loc12_);
   var _loc9_ = _loc22_.sequencer;
   var _loc7_ = _loc22_.GameActionsManager;
   var _loc16_ = true;
   var _loc10_ = false;
   var _loc15_;
   var _loc26_;
   var _loc17_;
   var _loc25_;
   var _loc23_;
   var _loc20_;
   var _loc19_;
   var _loc21_;
   switch(_loc6_)
   {
      case 117:
      case 116:
      case 115:
      case 122:
      case 112:
      case 142:
      case 145:
      case 138:
      case 160:
      case 161:
      case 114:
      case 182:
      case 118:
      case 157:
      case 123:
      case 152:
      case 126:
      case 155:
      case 119:
      case 154:
      case 124:
      case 156:
      case 125:
      case 153:
      case 160:
      case 161:
      case 162:
      case 163:
      case 606:
      case 607:
      case 608:
      case 609:
      case 610:
      case 611:
      case 186:
      case 210:
      case 211:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 240:
      case 241:
      case 242:
      case 243:
      case 244:
      case 245:
      case 246:
      case 247:
      case 248:
      case 249:
      case 178:
      case 179:
      case 2008:
      case 2009:
      case 2010:
         _loc10_ = true;
         _loc15_ = _loc11_.split(",");
         _loc26_ = _loc15_[0];
         _loc17_ = this.api.datacenter.Sprites.getItemAt(_loc26_);
         _loc25_ = Number(_loc15_[1]);
         _loc23_ = Number(_loc15_[2]);
         _loc20_ = _loc17_.CharacteristicsManager;
         _loc19_ = new dofus.datacenter["\x0f\r"](undefined,_loc6_,_loc25_,undefined,undefined,undefined,_loc23_);
         _loc9_.addAction(79,false,_loc20_,_loc20_.addEffect,[_loc19_]);
         _loc9_.addAction(80,false,this.api.kernel,this.api.kernel.showMessage,[undefined,"<b>" + _loc17_.name + "</b> : " + _loc19_.description,"INFO_FIGHT_CHAT"]);
         break;
      case 180:
      case 181:
         _loc10_ = true;
         _loc7_.onServerResponse(_loc8_);
         _loc21_ = _loc11_.split(";")[3];
         if(this.api.datacenter.Player.hero != undefined && _loc5_ == this.api.datacenter.Player.hero.sprite.id)
         {
            this.api.datacenter.Player.hero.SummonedCreatures++;
            this.api.datacenter.Player.hero.summonedCreaturesID[_loc21_] = true;
         }
         else if(_loc5_ == this.api.datacenter.Player.ID)
         {
            this.api.datacenter.Player.SummonedCreatures++;
            this.api.datacenter.Player.summonedCreaturesID[_loc21_] = true;
         }
         this.aks.Game.onMovement(_loc11_,true);
         break;
      case 999:
         this.aks;
         this.aks.processCommand(_loc11_);
   }
   if(!_loc10_)
   {
      this.api.kernel.debug("canCancel : " + _loc7_.canCancel(_loc6_));
      this.onActions(_loc24_);
   }
   var _loc13_;
   var _loc14_;
   if(this.api.datacenter.Game.isHeroCurrentPlayer && _loc12_ == this.api.datacenter.Game.heroPlaying.id)
   {
      _loc13_ = this.api.datacenter.Player.data.sequencer;
      _loc14_ = this.api.datacenter.Player.data.GameActionsManager;
      if(!_global.isNaN(_loc8_))
      {
         _loc13_.addAction(117,false,_loc14_,_loc14_.ack,[_loc8_]);
      }
      else
      {
         _loc14_.end(true);
      }
      if(!_loc13_.isPlaying() && _loc16_)
      {
         _loc13_.execute(true);
      }
   }
   else if((_loc6_ == 150 || _loc6_ == 180 || _loc6_ == 181) && !this.api.datacenter.Game.isHeroCurrentPlayer && _loc10_)
   {
      if(!_global.isNaN(_loc8_) && _loc5_ == this.api.datacenter.Player.ID)
      {
         _loc9_.addAction(false,_loc7_,_loc7_.ack,[_loc8_]);
      }
      else
      {
         _loc7_.end(_loc12_ == this.api.datacenter.Player.ID);
      }
      if(!_loc9_.isPlaying() && _loc16_)
      {
         _loc9_.execute(true);
      }
   }
};
_loc1.isOverideEffect = function(aEffect)
{
   switch(aEffect)
   {
      case 2008:
      case 2010:
      case 2011:
      case 1200:
      case 907:
      case 180:
      case 181:
      case 150:
      case 103:
      case 127:
      case 129:
      case 128:
      case 78:
      case 169:
      case 101:
      case 102:
      case 111:
      case 120:
      case 168:
      case 100:
      case 108:
      case 110:
      case 117:
      case 116:
      case 115:
      case 122:
      case 112:
      case 142:
      case 145:
      case 138:
      case 160:
      case 161:
      case 114:
      case 182:
      case 118:
      case 157:
      case 123:
      case 152:
      case 126:
      case 155:
      case 119:
      case 154:
      case 124:
      case 156:
      case 125:
      case 153:
      case 160:
      case 161:
      case 162:
      case 163:
      case 606:
      case 607:
      case 608:
      case 609:
      case 610:
      case 611:
      case 186:
      case 210:
      case 211:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 240:
      case 241:
      case 242:
      case 243:
      case 244:
      case 245:
      case 246:
      case 247:
      case 248:
      case 249:
      case 178:
      case 179:
      case 2008:
      case 2009:
      case 2010:
   }
};
_loc1.onActions = function(_loc2_)
{
   var _loc13_ = _loc2_.indexOf(";");
   var _loc57_ = Number(_loc2_.substring(0,_loc13_));
   if(dofus.Constants.SAVING_THE_WORLD)
   {
      if(_loc2_ == ";0")
      {
         dofus["\x1e\x14\x0f"].getInstance().nextActionIfOnSafe();
      }
   }
   _loc2_ = _loc2_.substring(_loc13_ + 1);
   _loc13_ = _loc2_.indexOf(";");
   var _loc6_ = Number(_loc2_.substring(0,_loc13_));
   _loc2_ = _loc2_.substring(_loc13_ + 1);
   _loc13_ = _loc2_.indexOf(";");
   var _loc4_ = _loc2_.substring(0,_loc13_);
   var _loc5_ = _loc2_.substring(_loc13_ + 1);
   if(_loc4_.length == 0)
   {
      _loc4_ = this.api.datacenter.Player.ID;
   }
   var _loc90_ = this.api.datacenter.Game.currentPlayerID;
   var _loc53_;
   if(this.api.datacenter.Game.isFight && _loc90_ != undefined)
   {
      _loc53_ = _loc90_;
   }
   else
   {
      _loc53_ = _loc4_;
   }
   var _loc74_ = this.api.datacenter.Sprites.getItemAt(_loc53_);
   var _loc3_ = _loc74_.sequencer;
   var _loc42_ = _loc74_.GameActionsManager;
   var _loc18_ = true;
   _loc42_.onServerResponse(_loc57_);
   var _loc11_;
   var _loc36_;
   var _loc87_;
   var _loc75_;
   var _loc102_;
   var _loc106_;
   var _loc143_;
   var _loc136_;
   var _loc194_;
   var _loc107_;
   var _loc70_;
   var _loc215_;
   var _loc205_;
   var _loc84_;
   var _loc151_;
   var _loc216_;
   var _loc79_;
   var _loc137_;
   var _loc110_;
   var _loc76_;
   var _loc24_;
   var _loc67_;
   var _loc51_;
   var _loc44_;
   var _loc117_;
   var _loc20_;
   var _loc8_;
   var _loc22_;
   var _loc183_;
   var _loc104_;
   var _loc206_;
   var _loc195_;
   var _loc152_;
   var _loc114_;
   var _loc144_;
   var _loc99_;
   var _loc47_;
   var _loc207_;
   var _loc230_;
   var _loc145_;
   var _loc103_;
   var _loc130_;
   var _loc184_;
   var _loc77_;
   var _loc111_;
   var _loc88_;
   var _loc217_;
   var _loc153_;
   var _loc196_;
   var _loc100_;
   var _loc185_;
   var _loc231_;
   var _loc32_;
   var _loc236_;
   var _loc243_;
   var _loc232_;
   var _loc65_;
   var _loc172_;
   var _loc138_;
   var _loc91_;
   var _loc247_;
   var _loc112_;
   var _loc223_;
   var _loc63_;
   var _loc173_;
   var _loc224_;
   var _loc124_;
   var _loc161_;
   var _loc71_;
   var _loc154_;
   var _loc38_;
   var _loc131_;
   var _loc68_;
   var _loc174_;
   var _loc113_;
   var _loc208_;
   var _loc85_;
   var _loc146_;
   var _loc80_;
   var _loc31_;
   var _loc17_;
   var _loc233_;
   var _loc43_;
   var _loc241_;
   var _loc66_;
   var _loc139_;
   var _loc218_;
   var _loc12_;
   var _loc239_;
   var _loc225_;
   var _loc186_;
   var _loc226_;
   var _loc132_;
   var _loc133_;
   var _loc25_;
   var _loc14_;
   var _loc237_;
   var _loc209_;
   var _loc197_;
   var _loc210_;
   var _loc125_;
   var _loc198_;
   var _loc30_;
   var _loc7_;
   var _loc234_;
   var _loc49_;
   var _loc69_;
   var _loc162_;
   var _loc101_;
   var _loc187_;
   var _loc81_;
   var _loc78_;
   var _loc126_;
   var _loc29_;
   var _loc199_;
   var _loc227_;
   var _loc175_;
   var _loc253_;
   var _loc200_;
   var _loc188_;
   var _loc120_;
   var _loc127_;
   var _loc219_;
   var _loc121_;
   var _loc35_;
   var _loc96_;
   var _loc108_;
   var _loc163_;
   var _loc201_;
   var _loc23_;
   var _loc244_;
   var _loc64_;
   var _loc189_;
   var _loc211_;
   var _loc27_;
   var _loc176_;
   var _loc248_;
   var _loc220_;
   var _loc140_;
   var _loc212_;
   var _loc202_;
   var _loc118_;
   var _loc21_;
   var _loc221_;
   var _loc164_;
   var _loc213_;
   var _loc190_;
   var _loc191_;
   var _loc86_;
   var _loc134_;
   var _loc177_;
   var _loc19_;
   var _loc39_;
   var _loc61_;
   var _loc240_;
   var _loc155_;
   var _loc128_;
   var _loc178_;
   var _loc179_;
   var _loc192_;
   var _loc109_;
   var _loc165_;
   var _loc166_;
   var _loc72_;
   var _loc180_;
   var _loc167_;
   var _loc37_;
   var _loc203_;
   var _loc62_;
   var _loc168_;
   var _loc222_;
   var _loc48_;
   var _loc34_;
   var _loc93_;
   var _loc181_;
   var _loc45_;
   var _loc204_;
   var _loc147_;
   var _loc122_;
   var _loc156_;
   var _loc9_;
   var _loc41_;
   var _loc97_;
   var _loc157_;
   var _loc158_;
   var _loc58_;
   var _loc55_;
   var _loc193_;
   var _loc214_;
   var _loc119_;
   var _loc56_;
   var _loc73_;
   var _loc15_;
   var _loc60_;
   var _loc50_;
   var _loc148_;
   var _loc16_;
   var _loc129_;
   var _loc159_;
   var _loc228_;
   var _loc169_;
   var _loc149_;
   var _loc182_;
   var _loc229_;
   var _loc115_;
   var _loc123_;
   var _loc46_;
   var _loc116_;
   var _loc82_;
   var _loc150_;
   var _loc170_;
   var _loc94_;
   var _loc98_;
   var _loc92_;
   var _loc160_;
   var _loc33_;
   var _loc54_;
   var _loc171_;
   var _loc89_;
   var _loc59_;
   var _loc40_;
   var _loc141_;
   var _loc52_;
   var _loc142_;
   var _loc28_;
   var _loc26_;
   var _loc135_;
   var _loc95_;
   var _loc105_;
   var _loc83_;
   if(_loc6_ !== 0)
   {
      switch(_loc6_)
      {
         case 1:
            _loc11_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
            if(!this.api.gfx.isMapBuild)
            {
               return undefined;
            }
            if(dofus.Constants.USE_JS_LOG && (_global.CONFIG.isNewAccount && !this.api.datacenter.Basics.first_movement))
            {
               getUrl("JavaScript:WriteLog(\'Mouvement\')", "_self");
               this.api.datacenter.Basics.first_movement = true;
            }
            if(_loc4_ == this.api.datacenter.Player.ID && (this.api.datacenter.Game.isFight && this.api.datacenter.Game.isRunning))
            {
               _loc3_.addAction(35,false,this.api.gfx,this.api.gfx.setInteraction,[ank.battlefield.Constants.INTERACTION_CELL_NONE]);
            }
            _loc36_ = ank.battlefield["\x1e\n\x07"]["\x12\r"].extractFullPath(this.api.gfx.mapHandler,_loc5_);
            if(_loc11_.hasCarriedParent() && !_loc11_.uncarryingSprite)
            {
               _loc11_.uncarryingSprite = true;
               _loc36_.shift();
               _loc3_.addAction(174,false,this.api.gfx,this.api.gfx.uncarriedSprite,[_loc4_,_loc36_[0],true,_loc3_]);
               _loc3_.addAction(36,false,this.api.gfx,this.api.gfx.addSpriteExtraClip,[_loc4_,dofus.Constants.CIRCLE_FILE,dofus.Constants.TEAMS_COLOR[_loc11_.Team]]);
            }
            _loc87_ = _loc11_.forceRun;
            _loc75_ = _loc11_.forceWalk;
            _loc102_ = this.api.datacenter.Game.isFight ? (_loc11_ instanceof dofus.datacenter["\x13\x01"] ? 3 : 4) : (_loc11_ instanceof dofus.datacenter["\x13\x01"] ? 3 : 6);
            if(this.api.datacenter.Game.isRunning)
            {
               _loc3_.addAction(37,false,this.api.gfx,this.api.gfx.unSelect,[true]);
               _loc3_.addAction(175,false,this.api.gfx,this.api.gfx.moveSpriteWithUncompressedPath,[_loc4_,_loc36_,_loc3_,false,_loc87_,_loc75_,_loc102_]);
            }
            else
            {
               this.api.gfx.moveSpriteWithUncompressedPath(_loc4_,_loc36_,_loc3_,true,_loc87_,_loc75_,_loc102_);
            }
            break;
         case 2:
            if(_loc3_ == undefined)
            {
               this.api.gfx.clear();
               this.api.datacenter.clearGame();
               if(!this.api.kernel.TutorialManager.isTutorialMode)
               {
                  this.api.ui.loadUIComponent("CenterText","CenterTextMap",{text:this.api.lang.getText("LOADING_MAP"),timer:40000},{bForceLoad:true});
               }
            }
            else
            {
               _loc3_.addAction(38,false,this.api.gfx,this.api.gfx.clear);
               _loc3_.addAction(39,false,this.api.datacenter,this.api.datacenter.clearGame);
               if(_loc5_.length == 0)
               {
                  _loc3_.addAction(40,true,this.api.ui,this.api.ui.loadUIComponent,["CenterText","CenterTextMap",{text:this.api.lang.getText("LOADING_MAP"),timer:40000},{bForceLoad:true}]);
               }
               else
               {
                  _loc3_.addAction(41,true,this.api.ui,this.api.ui.loadUIComponent,["Cinematic","Cinematic",{file:dofus.Constants.CINEMATICS_PATH + _loc5_ + ".swf",sequencer:_loc3_}]);
               }
            }
            break;
         case 4:
            _loc106_ = _loc5_.split(",");
            _loc143_ = _loc106_[0];
            _loc136_ = Number(_loc106_[1]);
            _loc194_ = this.api.datacenter.Sprites.getItemAt(_loc143_);
            _loc107_ = _loc194_.mc;
            _loc3_.addAction(42,false,_loc107_,_loc107_.setPosition,[_loc136_]);
            break;
         case 5:
            _loc70_ = _loc5_.split(",");
            _loc215_ = _loc70_[0];
            _loc205_ = Number(_loc70_[1]);
            this.api.gfx.slideSprite(_loc215_,_loc205_,_loc3_);
            break;
         case 11:
            _loc84_ = _loc5_.split(",");
            _loc151_ = _loc84_[0];
            _loc216_ = Number(_loc84_[1]);
            _loc3_.addAction(43,false,this.api.gfx,this.api.gfx.setSpriteDirection,[_loc151_,_loc216_]);
            break;
         case 50:
            _loc79_ = _loc5_;
            _loc3_.addAction(44,false,this.api.gfx,this.api.gfx.carriedSprite,[_loc79_,_loc4_]);
            _loc3_.addAction(45,false,this.api.gfx,this.api.gfx.removeSpriteExtraClip,[_loc79_]);
            break;
         case 51:
            _loc137_ = Number(_loc5_);
            _loc110_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
            _loc76_ = _loc110_.carriedChild;
            _loc24_ = new ank.battlefield.datacenter["\x1e\n\x01"]();
            _loc24_.file = dofus.Constants.SPELLS_PATH + "1200.swf";
            _loc24_.level = 1;
            _loc24_.bInFrontOfSprite = true;
            _loc24_.bTryToBypassContainerColor = false;
            this.api.gfx.spriteLaunchCarriedSprite(_loc4_,_loc24_,_loc137_,31,10);
            _loc3_.addAction(46,false,this.api.gfx,this.api.gfx.addSpriteExtraClip,[_loc76_.id,dofus.Constants.CIRCLE_FILE,dofus.Constants.TEAMS_COLOR[_loc76_.Team]]);
            break;
         case 52:
            _loc67_ = _loc5_.split(",");
            _loc51_ = _loc67_[0];
            _loc44_ = this.api.datacenter.Sprites.getItemAt(_loc51_);
            _loc117_ = Number(_loc67_[1]);
            if(_loc44_.hasCarriedParent() && !_loc44_.uncarryingSprite)
            {
               _loc44_.uncarryingSprite = true;
               _loc3_.addAction(47,false,this.api.gfx,this.api.gfx.uncarriedSprite,[_loc51_,_loc117_,true,_loc3_]);
               _loc3_.addAction(48,false,this.api.gfx,this.api.gfx.addSpriteExtraClip,[_loc51_,dofus.Constants.CIRCLE_FILE,dofus.Constants.TEAMS_COLOR[_loc44_.Team]]);
            }
            break;
         case 110:
         case 120:
         case 168:
         case 78:
         case 169:
         case 103:
            _loc20_ = _loc5_;
            _loc8_ = this.api.datacenter.Sprites.getItemAt(_loc20_);
            _loc22_ = _loc8_.mc;
            if(_loc22_ == undefined)
            {
               return undefined;
            }
            _loc8_.isPendingClearing = true;
            _loc183_ = _loc8_.sex == 1 ? "f" : "m";
            _loc3_.addAction(57,false,this.api.kernel,this.api.kernel.showMessage,[undefined,ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("DIE",[_loc8_.name]),_loc183_,true),"INFO_FIGHT_CHAT"]);
            _loc104_ = this.api.ui.getUIComponent("Timeline");
            _loc3_.addAction(58,false,_loc104_,_loc104_.hideItem,[_loc20_]);
            _loc3_.addAction(176,false,this.api.gfx,this.api.gfx.removeEffectsByCasterID,[_loc20_]);
            this.warning("You\'re not allowed to change the behaviour of the game animations. Please play legit !");
            this.warning("Toute modification du comportement des animations est détectée et sanctionnée car c\'est considéré comme de la triche, merci de jouer legit !");
            if(!this.api.datacenter.Player.isSkippingFightAnimations)
            {
               _loc3_.addAction(59,true,_loc22_,_loc22_.setAnim,["Die"],1500,true);
            }
            this.warning("Vous n\'êtes même pas sensé pouvoir lire ce message, mais un rappel de plus n\'est pas de trop pour certains : modification du client = ban ;)");
            _loc3_.addAction(61,false,_loc22_,_loc22_.clear);
            if(_loc8_.hasCarriedChild() && !_loc8_.uncarryingSprite)
            {
               _loc8_.uncarryingSprite = true;
               _loc3_.addAction(172,false,this.api.gfx,this.api.gfx.uncarriedSprite,[_loc8_.carriedSprite.id,_loc8_.cellNum,false,_loc3_]);
               _loc3_.addAction(60,false,this.api.gfx,this.api.gfx.addSpriteExtraClip,[_loc8_.carriedChild.id,dofus.Constants.CIRCLE_FILE,dofus.Constants.TEAMS_COLOR[_loc8_.carriedChild.Team]]);
            }
            if(this.api.datacenter.Player.summonedCreaturesID[_loc20_])
            {
               this.api.datacenter.Player.SummonedCreatures--;
               delete this.api.datacenter.Player.summonedCreaturesID.register56;
               this.api.ui.getUIComponent("Banner").shortcuts.setSpellStateOnAllContainers();
            }
            if(_loc20_ == this.api.datacenter.Player.ID)
            {
               if(_loc4_ == this.api.datacenter.Player.ID)
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_KILLED_HIMSELF);
               }
               else
               {
                  _loc206_ = this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Player.ID).Team;
                  _loc195_ = this.api.datacenter.Sprites.getItemAt(_global.parseInt(_loc4_)).Team;
                  if(_loc206_ == _loc195_)
                  {
                     this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_KILLED_BY_ALLY);
                  }
                  else
                  {
                     this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_KILLED_BY_ENEMY);
                  }
               }
            }
            else if(_loc4_ == this.api.datacenter.Player.ID)
            {
               _loc152_ = this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Player.ID).Team;
               _loc114_ = this.api.datacenter.Sprites.getItemAt(_global.parseInt(_loc20_)).Team;
               if(_loc152_ == _loc114_)
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_KILL_ALLY);
               }
               else
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_KILL_ENEMY);
               }
            }
            break;
         case 104:
            _loc144_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
            _loc99_ = _loc144_.mc;
            _loc3_.addAction(62,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("CANT_MOVEOUT"),"INFO_FIGHT_CHAT"]);
            if(!this.api.datacenter.Player.isSkippingFightAnimations && this.api.electron.isWindowFocused)
            {
               _loc3_.addAction(63,false,_loc99_,_loc99_.setAnim,["Hit"]);
            }
            break;
         case 105:
         case 164:
            _loc47_ = _loc5_.split(",");
            _loc207_ = _loc47_[0];
            _loc230_ = _loc6_ == 164 ? _loc47_[1] + "%" : _loc47_[1];
            _loc145_ = this.api.datacenter.Sprites.getItemAt(_loc207_);
            _loc3_.addAction(64,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("REDUCE_DAMAGES",[_loc145_.name,_loc230_]),"INFO_FIGHT_CHAT"]);
            break;
         case 106:
            _loc103_ = _loc5_.split(",");
            _loc130_ = _loc103_[0];
            _loc184_ = _loc103_[1] == "1";
            _loc77_ = this.api.datacenter.Sprites.getItemAt(_loc130_);
            _loc111_ = _loc184_ ? this.api.lang.getText("RETURN_SPELL_OK",[_loc77_.name]) : this.api.lang.getText("RETURN_SPELL_NO",[_loc77_.name]);
            _loc3_.addAction(65,false,this.api.kernel,this.api.kernel.showMessage,[undefined,_loc111_,"INFO_FIGHT_CHAT"]);
            break;
         case 107:
            _loc88_ = _loc5_.split(",");
            _loc217_ = _loc88_[0];
            _loc153_ = _loc88_[1];
            _loc196_ = this.api.datacenter.Sprites.getItemAt(_loc217_);
            _loc3_.addAction(66,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("RETURN_DAMAGES",[_loc196_.name,_loc153_]),"INFO_FIGHT_CHAT"]);
            break;
         case 130:
            _loc100_ = Number(_loc5_);
            _loc185_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
            _loc3_.addAction(67,false,this.api.kernel,this.api.kernel.showMessage,[undefined,ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("STEAL_GOLD",[_loc185_.name,_loc100_]),"m",_loc100_ < 2),"INFO_FIGHT_CHAT"]);
            break;
         case 132:
            _loc231_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
            _loc32_ = this.api.datacenter.Sprites.getItemAt(_loc5_);
            _loc3_.addAction(68,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("REMOVE_ALL_EFFECTS",[_loc231_.name,_loc32_.name]),"INFO_FIGHT_CHAT"]);
            _loc3_.addAction(69,false,_loc32_.CharacteristicsManager,_loc32_.CharacteristicsManager.terminateAllEffects);
            _loc3_.addAction(70,false,_loc32_.EffectsManager,_loc32_.EffectsManager.terminateAllEffects);
            break;
         case 140:
            _loc236_ = Number(_loc5_);
            _loc243_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
            _loc232_ = this.api.datacenter.Sprites.getItemAt(_loc5_);
            _loc3_.addAction(71,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("A_PASS_NEXT_TURN",[_loc232_.name]),"INFO_FIGHT_CHAT"]);
            break;
         case 151:
            _loc65_ = Number(_loc5_);
            _loc172_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
            _loc138_ = _loc65_ == -1 ? this.api.lang.getText("CANT_DO_INVISIBLE_OBSTACLE") : this.api.lang.getText("INVISIBLE_OBSTACLE",[_loc172_.name,this.api.lang.getSpellText(_loc65_).n]);
            _loc3_.addAction(72,false,this.api.kernel,this.api.kernel.showMessage,[undefined,_loc138_,"ERROR_CHAT"]);
            break;
         case 166:
            _loc91_ = _loc5_.split(",");
            _loc247_ = Number(_loc91_[0]);
            _loc112_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
            _loc223_ = Number(_loc91_[1]);
            _loc3_.addAction(73,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("RETURN_AP",[_loc112_.name,_loc223_]),"INFO_FIGHT_CHAT"]);
            break;
         case 164:
            _loc63_ = _loc5_.split(",");
            var _loc243 = Number(_loc63_[0]);
            _loc173_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
            _loc224_ = Number(_loc63_[1]);
            _loc3_.addAction(74,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("REDUCE_LP_DAMAGES",[_loc173_.name,_loc224_]),"INFO_FIGHT_CHAT"]);
            break;
         case 780:
            if(_loc4_ == this.api.datacenter.Player.ID)
            {
               this.api.datacenter.Player.SummonedCreatures++;
               _loc124_ = _global.parseInt(_loc5_.split(";")[3]);
               this.api.datacenter.Player.summonedCreaturesID[_loc124_] = true;
            }
            break;
         case 147:
            _loc161_ = _loc5_.split(";")[3];
            _loc71_ = this.api.ui.getUIComponent("Timeline");
            _loc3_.addAction(75,false,_loc71_,_loc71_.showItem,[_loc161_]);
            _loc3_.addAction(76,false,this.aks.Game,this.aks.Game.onMovement,[_loc5_,true]);
            break;
         case 180:
         case 181:
            _loc154_ = _loc5_.split(";")[3];
            if(_loc4_ == this.api.datacenter.Player.ID)
            {
               this.api.datacenter.Player.SummonedCreatures++;
               this.api.datacenter.Player.summonedCreaturesID[_loc154_] = true;
            }
            _loc3_.addAction(77,false,this.aks.Game,this.aks.Game.onMovement,[_loc5_,true]);
            break;
         case 185:
            _loc3_.addAction(78,false,this.aks.Game,this.aks.Game.onMovement,[_loc5_]);
            break;
         case 611:
            break;
         case 149:
            _loc38_ = _loc5_.split(",");
            _loc131_ = _loc38_[0];
            _loc68_ = this.api.datacenter.Sprites.getItemAt(_loc131_);
            _loc174_ = Number(_loc38_[1]);
            _loc113_ = Number(_loc38_[2]);
            _loc208_ = Number(_loc38_[3]);
            _loc3_.addAction(81,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("GFX",[_loc68_.name]),"INFO_FIGHT_CHAT"]);
            _loc85_ = _loc68_.CharacteristicsManager;
            _loc146_ = new dofus.datacenter["\x0f\r"](undefined,_loc6_,_loc174_,_loc113_,undefined,undefined,_loc208_);
            _loc3_.addAction(82,false,_loc85_,_loc85_.addEffect,[_loc146_]);
            break;
         case 150:
            _loc80_ = _loc5_.split(",");
            _loc31_ = _loc80_[0];
            _loc17_ = this.api.datacenter.Sprites.getItemAt(_loc31_);
            _loc233_ = Number(_loc80_[1]);
            if(_loc233_ > 0)
            {
               _loc3_.addAction(83,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("INVISIBILITY",[_loc17_.name]),"INFO_FIGHT_CHAT"]);
               if(_loc31_ == this.api.datacenter.Player.ID)
               {
                  _loc3_.addAction(84,false,_loc17_.mc,_loc17_.mc.setAlpha,[40]);
               }
               else
               {
                  _loc3_.addAction(85,false,_loc17_.mc,_loc17_.mc.setVisible,[false]);
               }
            }
            else
            {
               _loc3_.addAction(86,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("VISIBILITY",[_loc17_.name]),"INFO_FIGHT_CHAT"]);
               this.api.gfx.hideSprite(_loc31_,false);
               if(_loc17_.allowGhostMode && this.api.gfx.bGhostView)
               {
                  this.api.gfx.setSpriteAlpha(_loc31_,ank.battlefield.Constants.GHOSTVIEW_SPRITE_ALPHA);
               }
               else
               {
                  this.api.gfx.setSpriteAlpha(_loc31_,100);
               }
            }
            break;
         case 165:
            _loc43_ = _loc5_.split(",");
            var _loc244 = _loc43_[0];
            _loc241_ = Number(_loc43_[1]);
            var _loc124_ = Number(_loc43_[2]);
            var _loc125_ = Number(_loc43_[3]);
            break;
         case 200:
            _loc66_ = _loc5_.split(",");
            _loc139_ = Number(_loc66_[0]);
            _loc218_ = Number(_loc66_[1]);
            _loc3_.addAction(87,false,this.api.gfx,this.api.gfx.setObject2Frame,[_loc139_,_loc218_]);
            break;
         case 208:
            _loc12_ = _loc5_.split(",");
            _loc239_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
            _loc225_ = Number(_loc12_[0]);
            _loc186_ = _loc12_[1];
            _loc226_ = Number(_loc12_[2]);
            _loc132_ = _global.isNaN(Number(_loc12_[3])) ? String(_loc12_[3]).split("~") : "anim" + _loc12_[3];
            _loc133_ = _loc12_[4] != undefined ? Number(_loc12_[4]) : 1;
            _loc25_ = new ank.battlefield.datacenter["\x1e\n\x01"]();
            _loc25_.file = dofus.Constants.SPELLS_PATH + _loc186_ + ".swf";
            _loc25_.level = _loc133_;
            _loc25_.bInFrontOfSprite = true;
            _loc25_.bTryToBypassContainerColor = true;
            this.api.gfx.spriteLaunchVisualEffect(_loc4_,_loc25_,_loc225_,_loc226_,_loc132_);
            break;
         case 228:
            _loc14_ = _loc5_.split(",");
            _loc237_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
            _loc209_ = Number(_loc14_[0]);
            _loc197_ = _loc14_[1];
            _loc210_ = Number(_loc14_[2]);
            _loc125_ = _global.isNaN(Number(_loc14_[3])) ? String(_loc14_[3]).split("~") : "anim" + _loc14_[3];
            _loc198_ = _loc14_[4] != undefined ? Number(_loc14_[4]) : 1;
            _loc30_ = new ank.battlefield.datacenter["\x1e\n\x01"]();
            _loc30_.file = dofus.Constants.SPELLS_PATH + _loc197_ + ".swf";
            _loc30_.level = _loc198_;
            _loc30_.bInFrontOfSprite = true;
            _loc30_.bTryToBypassContainerColor = false;
            this.api.gfx.spriteLaunchVisualEffect(_loc4_,_loc30_,_loc209_,_loc210_,_loc125_);
            break;
         case 300:
            _loc7_ = _loc5_.split(",");
            _loc234_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
            _loc49_ = Number(_loc7_[0]);
            _loc69_ = Number(_loc7_[1]);
            _loc162_ = _loc7_[2];
            _loc101_ = Number(_loc7_[3]);
            _loc187_ = Number(_loc7_[4]);
            _loc81_ = _global.isNaN(Number(_loc7_[5])) ? String(_loc7_[5]).split("~") : (_loc7_[5] == "-1" || _loc7_[5] == "-2" ? undefined : "anim" + _loc7_[5]);
            _loc78_ = false;
            if(Number(_loc7_[5]) == -2)
            {
               _loc78_ = true;
            }
            _loc126_ = _loc7_[6] == "1" ? true : false;
            _loc29_ = new ank.battlefield.datacenter["\x1e\n\x01"]();
            _loc29_.file = dofus.Constants.SPELLS_PATH + _loc162_ + ".swf";
            _loc29_.level = _loc101_;
            _loc29_.bInFrontOfSprite = _loc126_;
            _loc29_.params = new dofus.datacenter["\x1e\x0e\x1c"](_loc49_,_loc101_).elements;
            _loc3_.addAction(88,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("HAS_LAUNCH_SPELL",[_loc234_.name,this.api.lang.getSpellText(_loc49_).n]),"INFO_FIGHT_CHAT"]);
            if(_loc81_ != undefined || _loc78_)
            {
               if(!this.api.datacenter.Player.isSkippingFightAnimations)
               {
                  this.api.gfx.spriteLaunchVisualEffect(_loc4_,_loc29_,_loc69_,_loc187_,_loc81_);
               }
            }
            if(_loc4_ == this.api.datacenter.Player.ID)
            {
               _loc199_ = this.api.datacenter.Player.SpellsManager;
               _loc227_ = this.api.gfx.mapHandler.getCellData(_loc69_).spriteOnID;
               _loc175_ = new dofus.datacenter["\x0b\x18"](_loc49_,_loc227_);
               _loc199_.addLaunchedSpell(_loc175_);
            }
            break;
         case 301:
            _loc253_ = Number(_loc5_);
            _loc3_.addAction(89,false,this.api.sounds.events,this.api.sounds.events.onGameCriticalHit,[]);
            _loc3_.addAction(90,false,this.api.kernel,this.api.kernel.showMessage,[undefined,"(" + this.api.lang.getText("CRITICAL_HIT") + ")","INFO_FIGHT_CHAT"]);
            if(!this.api.datacenter.Player.isSkippingFightAnimations && this.api.electron.isWindowFocused)
            {
               _loc3_.addAction(91,false,this.api.gfx,this.api.gfx.addSpriteExtraClipOnTimer,[_loc4_,dofus.Constants.CRITICAL_HIT_XTRA_FILE,undefined,true,dofus.Constants.CRITICAL_HIT_DURATION]);
            }
            if(_loc4_ == this.api.datacenter.Player.ID)
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_CC_OWNER);
            }
            else
            {
               _loc200_ = this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Player.ID).Team;
               _loc188_ = this.api.datacenter.Sprites.getItemAt(_global.parseInt(_loc4_)).Team;
               if(_loc200_ == _loc188_)
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_CC_ALLIED);
               }
               else
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_CC_ENEMY);
               }
            }
            break;
         case 302:
            _loc120_ = Number(_loc5_);
            _loc127_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
            _loc3_.addAction(92,false,this.api.sounds.events,this.api.sounds.events.onGameCriticalMiss,[]);
            _loc3_.addAction(93,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("HAS_LAUNCH_SPELL",[_loc127_.name,this.api.lang.getSpellText(_loc120_).n]),"INFO_FIGHT_CHAT"]);
            _loc3_.addAction(94,false,this.api.kernel,this.api.kernel.showMessage,[undefined,"(" + this.api.lang.getText("CRITICAL_MISS") + ")","INFO_FIGHT_CHAT"]);
            _loc3_.addAction(95,false,this.api.gfx,this.api.gfx.addSpriteBubble,[_loc4_,this.api.lang.getText("CRITICAL_MISS")]);
            if(_loc4_ == this.api.datacenter.Player.ID)
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_EC_OWNER);
            }
            else
            {
               _loc219_ = this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Player.ID).Team;
               _loc121_ = this.api.datacenter.Sprites.getItemAt(_global.parseInt(_loc4_)).Team;
               if(_loc219_ == _loc121_)
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_EC_ALLIED);
               }
               else
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_EC_ENEMY);
               }
            }
            break;
         case 303:
            _loc35_ = _loc5_.split(",");
            _loc96_ = Number(_loc35_[0]);
            _loc108_ = _loc35_[1];
            _loc163_ = Number(_loc35_[2]);
            _loc201_ = _loc35_[3] == "1" ? true : false;
            _loc23_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
            _loc244_ = _loc23_.mc;
            _loc64_ = _loc23_.ToolAnimation;
            _loc3_.addAction(96,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("HAS_ATTACK_CC",[_loc23_.name]),"INFO_FIGHT_CHAT"]);
            if(_loc108_ == undefined)
            {
               _loc3_.addAction(97,false,this.api.gfx,this.api.gfx.autoCalculateSpriteDirection,[_loc4_,_loc96_]);
               _loc3_.addAction(98,true,this.api.gfx,this.api.gfx.setSpriteAnim,[_loc4_,_loc64_]);
            }
            else
            {
               _loc189_ = _loc23_.accessories[0].unicID;
               _loc211_ = _loc23_.Guild;
               _loc27_ = new ank.battlefield.datacenter["\x1e\n\x01"]();
               _loc27_.file = dofus.Constants.SPELLS_PATH + _loc108_ + ".swf";
               _loc27_.level = 1;
               _loc27_.bInFrontOfSprite = _loc201_;
               _loc27_.params = new dofus.datacenter["\x12\x18"](new dofus.datacenter["\f\f"](undefined,_loc189_),_loc211_).elements;
               this.api.gfx.spriteLaunchVisualEffect(_loc4_,_loc27_,_loc96_,_loc163_,_loc64_);
            }
            break;
         case 304:
            _loc176_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
            _loc248_ = _loc176_.mc;
            _loc3_.addAction(99,false,this.api.sounds.events,this.api.sounds.events.onGameCriticalHit,[]);
            _loc3_.addAction(100,false,this.api.kernel,this.api.kernel.showMessage,[undefined,"(" + this.api.lang.getText("CRITICAL_HIT") + ")","INFO_FIGHT_CHAT"]);
            if(!this.api.datacenter.Player.isSkippingFightAnimations && this.api.electron.isWindowFocused)
            {
               _loc3_.addAction(101,false,this.api.gfx,this.api.gfx.addSpriteExtraClipOnTimer,[_loc4_,dofus.Constants.CRITICAL_HIT_XTRA_FILE,undefined,true,dofus.Constants.CRITICAL_HIT_DURATION]);
            }
            if(_loc4_ == this.api.datacenter.Player.ID)
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_CC_OWNER);
            }
            else
            {
               _loc220_ = this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Player.ID).Team;
               _loc140_ = this.api.datacenter.Sprites.getItemAt(_global.parseInt(_loc4_)).Team;
               if(_loc220_ == _loc140_)
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_CC_ALLIED);
               }
               else
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_CC_ENEMY);
               }
            }
            break;
         case 305:
            _loc212_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
            _loc3_.addAction(102,false,this.api.sounds.events,this.api.sounds.events.onGameCriticalMiss,[]);
            _loc3_.addAction(103,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("HAS_ATTACK_CC",[_loc212_.name]),"INFO_FIGHT_CHAT"]);
            _loc3_.addAction(104,false,this.api.kernel,this.api.kernel.showMessage,[undefined,"(" + this.api.lang.getText("CRITICAL_MISS") + ")","INFO_FIGHT_CHAT"]);
            _loc3_.addAction(105,false,this.api.gfx,this.api.gfx.addSpriteBubble,[_loc4_,this.api.lang.getText("CRITICAL_MISS")]);
            if(_loc4_ == this.api.datacenter.Player.ID)
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_EC_OWNER);
            }
            else
            {
               _loc202_ = this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Player.ID).Team;
               _loc118_ = this.api.datacenter.Sprites.getItemAt(_global.parseInt(_loc4_)).Team;
               if(_loc202_ == _loc118_)
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_EC_ALLIED);
               }
               else
               {
                  this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_EC_ENEMY);
               }
            }
            break;
         case 306:
            _loc21_ = _loc5_.split(",");
            _loc221_ = Number(_loc21_[0]);
            _loc164_ = Number(_loc21_[1]);
            _loc213_ = _loc21_[2];
            _loc190_ = Number(_loc21_[3]);
            _loc191_ = _loc21_[4] == "1" ? true : false;
            _loc86_ = Number(_loc21_[5]);
            _loc134_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
            _loc177_ = this.api.datacenter.Sprites.getItemAt(_loc86_);
            _loc19_ = new ank.battlefield.datacenter["\x1e\n\x01"]();
            _loc19_.id = _loc221_;
            _loc19_.file = dofus.Constants.SPELLS_PATH + _loc213_ + ".swf";
            _loc19_.level = _loc190_;
            _loc19_.bInFrontOfSprite = _loc191_;
            _loc3_.addAction(106,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("HAS_START_TRAP",[_loc134_.name,this.api.lang.getSpellText(_loc19_.id).n,_loc177_.name]),"INFO_FIGHT_CHAT"]);
            _loc3_.addAction(107,false,this.api.gfx,this.api.gfx.addVisualEffectOnSprite,[_loc86_,_loc19_,_loc164_,11],1000);
            break;
         case 307:
            _loc39_ = _loc5_.split(",");
            _loc61_ = Number(_loc39_[0]);
            _loc240_ = Number(_loc39_[1]);
            _loc155_ = Number(_loc39_[3]);
            _loc128_ = Number(_loc39_[5]);
            _loc178_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
            _loc179_ = this.api.datacenter.Sprites.getItemAt(_loc128_);
            _loc192_ = new dofus.datacenter["\x1e\x0e\x1c"](_loc61_,_loc155_);
            _loc3_.addAction(108,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("HAS_START_GLIPH",[_loc178_.name,_loc192_.name,_loc179_.name]),"INFO_FIGHT_CHAT"]);
            switch(_loc61_)
            {
               case 65:
               case 79:
               case 71:
               case 69:
               case 80:
               case 77:
                  _global.API.kernel.AudioManager.playSound("fx_528.mp3");
                  break;
               case 73:
                  _global.API.kernel.AudioManager.playSound("fx_425.mp3");
            }
            break;
         case 308:
            _loc109_ = _loc5_.split(",");
            _loc165_ = this.api.datacenter.Sprites.getItemAt(Number(_loc109_[0]));
            _loc166_ = Number(_loc109_[1]);
            _loc3_.addAction(109,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("HAS_DODGE_AP",[_loc165_.name,_loc166_]),"INFO_FIGHT_CHAT"]);
            break;
         case 309:
            _loc72_ = _loc5_.split(",");
            _loc180_ = this.api.datacenter.Sprites.getItemAt(Number(_loc72_[0]));
            _loc167_ = Number(_loc72_[1]);
            _loc3_.addAction(110,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("HAS_DODGE_MP",[_loc180_.name,_loc167_]),"INFO_FIGHT_CHAT"]);
            break;
         case 501:
            _loc37_ = _loc5_.split(",");
            _loc203_ = _loc37_[0];
            _loc62_ = Number(_loc37_[1]);
            _loc168_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
            _loc222_ = _loc37_[2] == undefined ? _loc168_.ToolAnimation : "anim" + _loc37_[2];
            _loc3_.addAction(111,false,this.api.gfx,this.api.gfx.autoCalculateSpriteDirection,[_loc4_,_loc203_]);
            _loc3_.addAction(112,_loc4_ == this.api.datacenter.Player.ID,this.api.gfx,this.api.gfx.setSpriteLoopAnim,[_loc4_,_loc222_,_loc62_],_loc62_,true);
            break;
         case 617:
            _loc18_ = false;
            _loc48_ = _loc5_.split(",");
            _loc34_ = this.api.datacenter.Sprites.getItemAt(Number(_loc48_[0]));
            _loc93_ = this.api.datacenter.Sprites.getItemAt(Number(_loc48_[1]));
            _loc181_ = _loc48_[2];
            this.api.gfx.addSpriteBubble(_loc181_,this.api.lang.getText("A_ASK_MARRIAGE_B",[_loc34_.name,_loc93_.name]));
            if(_loc34_.id == this.api.datacenter.Player.ID)
            {
               this.api.kernel.showMessage(this.api.lang.getText("MARRIAGE"),this.api.lang.getText("A_ASK_MARRIAGE_B",[_loc34_.name,_loc93_.name]),"CAUTION_YESNO",{name:"Marriage",listener:this,params:{spriteID:_loc34_.id,refID:_loc4_}});
            }
            break;
         case 618:
         case 619:
            _loc18_ = false;
            _loc45_ = _loc5_.split(",");
            _loc204_ = this.api.datacenter.Sprites.getItemAt(Number(_loc45_[0]));
            _loc147_ = this.api.datacenter.Sprites.getItemAt(Number(_loc45_[1]));
            _loc122_ = _loc45_[2];
            _loc156_ = _loc6_ == 618 ? "A_MARRIED_B" : "A_NOT_MARRIED_B";
            this.api.gfx.addSpriteBubble(_loc122_,this.api.lang.getText(_loc156_,[_loc204_.name,_loc147_.name]));
            break;
         case 900:
            _loc18_ = false;
            _loc9_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
            _loc41_ = this.api.datacenter.Sprites.getItemAt(Number(_loc5_));
            if(_loc9_ == undefined || (_loc41_ == undefined || (this.api.ui.getUIComponent("AskCancelChallenge") != undefined || this.api.ui.getUIComponent("AskYesNoIgnoreChallenge") != undefined)))
            {
               this.refuseChallenge(_loc4_);
               return undefined;
            }
            this.api.kernel.showMessage(undefined,this.api.lang.getText("A_CHALENGE_B",[this.api.kernel.ChatManager.getLinkName(_loc9_.name),this.api.kernel.ChatManager.getLinkName(_loc41_.name)]),"INFO_CHAT");
            if(_loc9_.id == this.api.datacenter.Player.ID)
            {
               this.api.kernel.showMessage(this.api.lang.getText("CHALENGE"),this.api.lang.getText("YOU_CHALENGE_B",[_loc41_.name]),"INFO_CANCEL",{name:"Challenge",listener:this,params:{spriteID:_loc9_.id}});
            }
            if(_loc41_.id == this.api.datacenter.Player.ID)
            {
               if(this.api.kernel.ChatManager.isBlacklisted(_loc9_.name))
               {
                  this.refuseChallenge(_loc9_.id);
                  return undefined;
               }
               this.api.electron.makeNotification(this.api.lang.getText("A_CHALENGE_YOU",[_loc9_.name]));
               this.api.kernel.showMessage(this.api.lang.getText("CHALENGE"),this.api.lang.getText("A_CHALENGE_YOU",[_loc9_.name]),"CAUTION_YESNOIGNORE",{name:"Challenge",player:_loc9_.name,listener:this,params:{spriteID:_loc9_.id,player:_loc9_.name}});
               this.api.sounds.events.onGameInvitation();
            }
            break;
         case 901:
            _loc18_ = false;
            if(_loc4_ == this.api.datacenter.Player.ID || Number(_loc5_) == this.api.datacenter.Player.ID)
            {
               this.api.ui.unloadUIComponent("AskCancelChallenge");
            }
            break;
         case 902:
            _loc18_ = false;
            this.api.ui.unloadUIComponent("AskYesNoIgnoreChallenge");
            this.api.ui.unloadUIComponent("AskCancelChallenge");
            break;
         case 903:
            _loc18_ = false;
            switch(_loc5_)
            {
               case "c":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CHALENGE_FULL"),"ERROR_CHAT");
                  break;
               case "t":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("TEAM_FULL"),"ERROR_CHAT");
                  break;
               case "a":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("TEAM_DIFFERENT_ALIGNMENT"),"ERROR_CHAT");
                  break;
               case "g":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_DO_BECAUSE_GUILD"),"ERROR_CHAT");
                  break;
               case "l":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_DO_TOO_LATE"),"ERROR_CHAT");
                  break;
               case "m":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_U_ARE_MUTANT"),"ERROR_CHAT");
                  break;
               case "p":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_BECAUSE_MAP"),"ERROR_CHAT");
                  break;
               case "r":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_BECAUSE_ON_RESPAWN"),"ERROR_CHAT");
                  break;
               case "o":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_YOU_R_OCCUPED"),"ERROR_CHAT");
                  break;
               case "z":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_YOU_OPPONENT_OCCUPED"),"ERROR_CHAT");
                  break;
               case "h":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_FIGHT"),"ERROR_CHAT");
                  break;
               case "i":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_FIGHT_NO_RIGHTS"),"ERROR_CHAT");
                  break;
               case "s":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_21"),"ERROR_CHAT");
                  break;
               case "n":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("SUBSCRIPTION_OUT"),"ERROR_CHAT");
                  break;
               case "b":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("A_NOT_SUBSCRIB"),"ERROR_CHAT");
                  break;
               case "f":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("TEAM_CLOSED"),"ERROR_CHAT");
                  break;
               case "d":
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("NO_ZOMBIE_ALLOWED"),"ERROR_CHAT");
            }
            break;
         case 905:
            this.api.ui.loadUIComponent("CenterText","CenterText",{text:this.api.lang.getText("YOU_ARE_ATTAC"),background:true,timer:2000},{bForceLoad:true});
            break;
         case 906:
            _loc97_ = _loc5_;
            _loc157_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
            _loc158_ = this.api.datacenter.Sprites.getItemAt(_loc97_);
            _loc58_ = _loc157_.name;
            _loc55_ = _loc158_.name;
            if(_loc58_ == undefined || _loc55_ == undefined)
            {
               break;
            }
            this.api.kernel.showMessage(undefined,this.api.lang.getText("A_ATTACK_B",[this.api.kernel.ChatManager.getLinkName(_loc58_),this.api.kernel.ChatManager.getLinkName(_loc55_)]),"INFO_CHAT");
            if(_loc97_ == this.api.datacenter.Player.ID)
            {
               this.api.electron.makeNotification(this.api.lang.getText("A_ATTACK_B",[_loc58_,_loc55_]));
               this.api.ui.loadUIComponent("CenterText","CenterText",{text:this.api.lang.getText("YOU_ARE_ATTAC"),background:true,timer:2000},{bForceLoad:true});
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_AGRESSED);
            }
            else
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_AGRESS);
            }
            break;
         case 909:
            _loc193_ = _loc5_;
            _loc214_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
            _loc119_ = this.api.datacenter.Sprites.getItemAt(_loc193_);
            this.api.kernel.showMessage(undefined,this.api.lang.getText("A_ATTACK_B",[_loc214_.name,_loc119_.name]),"INFO_CHAT");
            break;
         case 950:
            _loc56_ = _loc5_.split(",");
            _loc73_ = _loc56_[0];
            _loc15_ = this.api.datacenter.Sprites.getItemAt(_loc73_);
            _loc60_ = Number(_loc56_[1]);
            _loc50_ = Number(_loc56_[2]) == 1 ? true : false;
            if(_loc60_ == 8 && (!_loc50_ && (_loc15_.hasCarriedParent() && !_loc15_.uncarryingSprite)))
            {
               _loc15_.uncarryingSprite = true;
               _loc3_.addAction(173,false,this.api.gfx,this.api.gfx.uncarriedSprite,[_loc4_,_loc15_.cellNum,false,_loc3_]);
               _loc3_.addAction(113,false,this.api.gfx,this.api.gfx.addSpriteExtraClip,[_loc73_,dofus.Constants.CIRCLE_FILE,dofus.Constants.TEAMS_COLOR[_loc15_.Team]]);
            }
            _loc3_.addAction(114,false,_loc15_,_loc15_.setState,[_loc60_,_loc50_]);
            _loc148_ = this.api.lang.getText(_loc50_ ? "ENTER_STATE" : "EXIT_STATE",[_loc15_.name,this.api.lang.getStateText(_loc60_)]);
            _loc3_.addAction(115,false,this.api.kernel,this.api.kernel.showMessage,[undefined,_loc148_,"INFO_FIGHT_CHAT"]);
            break;
         case 998:
            _loc16_ = _loc2_.split(",");
            _loc129_ = _loc16_[0];
            _loc159_ = _loc16_[1];
            _loc228_ = _loc16_[2];
            _loc169_ = _loc16_[3];
            _loc149_ = _loc16_[4];
            _loc182_ = _loc16_[6];
            _loc229_ = _loc16_[7];
            _loc115_ = new dofus.datacenter["\x0f\r"](undefined,Number(_loc159_),Number(_loc228_),Number(_loc169_),Number(_loc149_),"",Number(_loc182_),Number(_loc229_));
            _loc123_ = this.api.datacenter.Sprites.getItemAt(_loc129_);
            _loc123_.EffectsManager.addEffect(_loc115_);
            break;
         case 999:
            _loc3_.addAction(116,false,this.aks,this.aks.processCommand,[_loc5_]);
            break;
         case 606:
         case 607:
         case 608:
         case 609:
         case 610:
         case 153:
         case 160:
         case 161:
         case 162:
         case 163:
         case 119:
         case 154:
         case 124:
         case 156:
         case 125:
         case 123:
         case 152:
         case 126:
         case 155:
         case 161:
         case 114:
         case 182:
         case 118:
         case 157:
         case 112:
         case 142:
         case 145:
         case 138:
         case 160:
         case 117:
         case 116:
         case 115:
         case 186:
         case 210:
         case 211:
         case 212:
         case 213:
         case 214:
         case 215:
         case 216:
         case 217:
         case 218:
         case 219:
         case 122:
            _loc46_ = _loc5_.split(",");
            _loc116_ = _loc46_[0];
            _loc82_ = this.api.datacenter.Sprites.getItemAt(_loc116_);
            _loc150_ = Number(_loc46_[1]);
            _loc170_ = Number(_loc46_[2]);
            _loc94_ = _loc82_.CharacteristicsManager;
            _loc98_ = new dofus.datacenter["\x0f\r"](undefined,_loc6_,_loc150_,undefined,undefined,undefined,_loc170_);
            _loc3_.addAction(79,false,_loc94_,_loc94_.addEffect,[_loc98_]);
            _loc3_.addAction(81,false,this.api.kernel,this.api.kernel.showMessage,[undefined,"<b>" + _loc82_.name + "</b> : " + _loc98_.description,"INFO_FIGHT_CHAT"]);
            break;
         case 127:
         case 129:
         case 128:
            _loc92_ = _loc5_.split(",");
            _loc160_ = _loc92_[0];
            _loc33_ = Number(_loc92_[1]);
            _loc54_ = this.api.datacenter.Sprites.getItemAt(_loc160_);
            if(_loc33_ == 0)
            {
               break;
            }
            if(_loc6_ == 127 || (_loc6_ == 128 || (_loc6_ == 169 || _loc6_ == 78)))
            {
               _loc171_ = _loc33_ < 0 ? "LOST_MP" : "WIN_MP";
               _loc3_.addAction(55,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText(_loc171_,[_loc54_.name,Math.abs(_loc33_)]),"INFO_FIGHT_CHAT"]);
            }
            _loc3_.addAction(56,false,_loc54_,_loc54_.updateMP,[_loc33_,_loc6_ == 129]);
            break;
         case 101:
         case 102:
         case 111:
            _loc89_ = _loc5_.split(",");
            _loc59_ = this.api.datacenter.Sprites.getItemAt(_loc89_[0]);
            _loc40_ = Number(_loc89_[1]);
            if(_loc40_ == 0)
            {
               break;
            }
            if(_loc6_ == 101 || (_loc6_ == 111 || (_loc6_ == 120 || _loc6_ == 168)))
            {
               _loc141_ = _loc40_ < 0 ? "LOST_AP" : "WIN_AP";
               _loc3_.addAction(53,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText(_loc141_,[_loc59_.name,Math.abs(_loc40_)]),"INFO_FIGHT_CHAT"]);
            }
            _loc3_.addAction(54,false,_loc59_,_loc59_.updateAP,[_loc40_,_loc6_ == 102]);
            break;
         case 100:
         case 108:
            _loc52_ = _loc5_.split(",");
            _loc142_ = _loc52_[0];
            _loc28_ = this.api.datacenter.Sprites.getItemAt(_loc142_);
            _loc26_ = Number(_loc52_[1]);
            if(_loc26_ != 0)
            {
               _loc135_ = Number(_loc52_[2]);
               _loc95_ = dofus.Constants.getElementColorById(_loc135_);
               _loc105_ = _loc26_ < 0 ? "LOST_LP" : "WIN_LP";
               if(_loc95_ != undefined && this.api.kernel.OptionsManager.getOption("SeeDamagesColor"))
               {
                  _loc83_ = this.api.lang.getText(_loc105_,[_loc28_.name,"<font color=\"#" + _loc95_ + "\">" + Math.abs(_loc26_) + "</font>"]);
               }
               else
               {
                  _loc83_ = this.api.lang.getText(_loc105_,[_loc28_.name,Math.abs(_loc26_)]);
               }
               _loc3_.addAction(49,false,this.api.kernel,this.api.kernel.showMessage,[undefined,_loc83_,"INFO_FIGHT_CHAT"]);
               _loc3_.addAction(50,false,_loc28_,_loc28_.updateLP,[_loc26_]);
               _loc3_.addAction(51,false,this.api.ui.getUIComponent("Timeline").timelineControl,this.api.ui.getUIComponent("Timeline").timelineControl.updateCharacters);
               break;
            }
            _loc3_.addAction(52,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("NOCHANGE_LP",[_loc28_.name]),"INFO_FIGHT_CHAT"]);
            break;
      }
      if(!_global.isNaN(_loc57_) && _loc4_ == this.api.datacenter.Player.ID)
      {
         _loc3_.addAction(117,false,_loc42_,_loc42_.ack,[_loc57_]);
      }
      else
      {
         _loc42_.end(_loc53_ == this.api.datacenter.Player.ID);
      }
      if(!_loc3_.isPlaying() && _loc18_)
      {
         _loc3_.execute(true);
      }
   }
   return undefined;
};
#endinitclip