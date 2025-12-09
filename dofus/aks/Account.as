#initclip 111
var _loc1 = _global.dofus.aks.Account.prototype;
_loc1.onMoveToPosition = function(nX, nY, nSubareaId)
{
   this.aks.send("IP" + nX + "," + nY + "," + nSubareaId);
};
_loc1.setCurrentHeroOverView = function(sData)
{
   this.api.network.send("BM*|.swapchef|" + sData.name);
   this.aks.send("AEA" + sData.id);
};
_loc1.getSpells = function(sData)
{
   this.aks.send("AEa" + sData);
};
_loc1.addCharacterHero = function(_loc2_, _loc3_, _loc4_, _loc5_, _loc6_, _loc7_)
{
   // Params: nombre, clase, color1, color2, color3, sexo
   // Protocol: AA<nombre>|<clase>|<sexo>|<c1>|<c2>|<c3>|1
   this.aks.send("AA" + _loc2_ + "|" + _loc3_ + "|" + _loc7_ + "|" + _loc4_ + "|" + _loc5_ + "|" + _loc6_ + "|1");
};
_loc1.onInventory = function(sExtraData)
{

   
   var _loc6_ = this.api.datacenter.Player;
   _loc6_.Inventory = new _global.palmad.ank.utils.ExtendedArray();
   var _loc8_ = sExtraData.split("|");
   var _loc7_ = _loc8_[0].split(";");
   var _loc3_ = 0;
   var _loc4_;
   var _loc5_;
   while(_loc3_ < _loc7_.length)
   {
      _loc4_ = _loc7_[_loc3_];
      if(_loc4_.length != 0)
      {
         _loc5_ = this.api.kernel.CharactersManager.getItemObjectFromData(_loc4_);
         if(_loc5_ != undefined)
         {
            _loc6_.addItem(_loc5_);
         }
      }
      _loc3_ = _loc3_ + 1;
   }
   this.api.kernel.CharactersManager.setSpriteAccessories(_loc6_,_loc8_[1]);
   _loc6_.currentWeight = Number(_loc8_[2]);
   _loc6_.maxWeight = Number(_loc8_[3]);
   _loc6_.Kama = Number(_loc8_[4]);
   _loc6_.updateCloseCombat();
};
_loc1.onAddHero = function(sExtraData)
{
   var _loc2_ = sExtraData.split("|");
   var _loc4_ = Number(_loc2_[0]);
   var _loc3_ = this.api.datacenter.getHero(_loc4_);
   this.api.ui.unloadUIComponent("CreateCharacter");
   _loc3_.ID = _loc4_;
   _loc3_.Name = _loc2_[1];
   _loc3_.Level = _loc2_[2];
   _loc3_.Guild = _loc2_[3];
   _loc3_.Sex = _loc2_[4];
   _loc3_.gfxID = _loc2_[5];
   _loc3_.gfxFile = dofus.Constants.CLIPS_PERSOS_PATH + _loc2_[5] + ".swf";
   _loc3_.color1 = _loc2_[6] == -1 ? _loc2_[6] : Number("0x" + _loc2_[6]);
   _loc3_.color2 = _loc2_[7] == -1 ? _loc2_[7] : Number("0x" + _loc2_[7]);
   _loc3_.color3 = _loc2_[8] == -1 ? _loc2_[8] : Number("0x" + _loc2_[8]);
   this.api.kernel.CharactersManager.setSpriteAccessories(_loc3_,_loc2_[9]);
   _loc3_.inParty = _loc2_[10] == "1";
   _loc3_.sabiduria = _loc2_[11];
   _loc3_.iniciativa = _loc2_[12];
   this.api.ui.getUIComponent("HeroesPanel").updateCharactersList();
};
_loc1.prepareHeroList = function(_loc2_)
{
   this.api.datacenter.Player.clearHeroes();
   if(_loc2_ == undefined || _loc2_ == "")
   {
      return undefined;
   }
   var _loc4_ = _loc2_.split("|");
   var _loc5_ = 0;
   var _loc3_;
   var _loc2_;
   for(_loc5_ in _loc4_)
   {
      _loc3_ = _loc4_[_loc5_];
      _loc2_ = new Object();
      var _parts = _loc3_.split("~");
      // Nuevo formato: id~name~guild~sex~gfxId~c1~c2~c3~acc~level~selected
      _loc2_.id = _parts[0];
      _loc2_.name = _parts[1];
      _loc2_.guild = _parts[2];
      _loc2_.sex = _parts[3];
      _loc2_.gfxID = _parts[4];
      _loc2_.gfxFile = dofus.Constants.CLIPS_PERSOS_PATH + _parts[4] + ".swf";
      // Colores: "-1" o HEX sin 0x
      var _c1 = _parts[5];
      var _c2 = _parts[6];
      var _c3 = _parts[7];
      _loc2_.color1 = _c1 == "-1" || _c1 == -1 ? -1 : Number("0x" + _c1);
      _loc2_.color2 = _c2 == "-1" || _c2 == -1 ? -1 : Number("0x" + _c2);
      _loc2_.color3 = _c3 == "-1" || _c3 == -1 ? -1 : Number("0x" + _c3);
      this.api.kernel.CharactersManager.setSpriteAccessories(_loc2_,_parts[8]);
      _loc2_.Level = _parts[9];
      _loc2_.selected = _parts[10] != "1" ? false : true;
      this.api.datacenter.Player.addHeroe(_loc2_);
      _loc5_ = _loc5_ + 1;
   }
};
_loc1.onLogin = function(_loc2_, _loc3_)
{
   ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this.WaitQueueTimer,"WaitQueue");
   this.api.ui.unloadUIComponent("CenterText");
   this.api.ui.unloadUIComponent("WaitingMessage");
   this.api.ui.unloadUIComponent("WaitingQueue");
   var _loc9_;
   var _loc7_;
   var _loc6_;
   var _loc5_;
   var _loc4_;
   var _loc10_;
   if(_loc2_)
   {
      this.api.datacenter.Basics.isLogged = true;
      this.api.ui.unloadUIComponent("Login");
      this.api.ui.unloadUIComponent("ChooseNickName");
      this.api.datacenter.Player.isAuthorized = _loc3_ == "1";
      _parent._parent._loader.loadXtra();
   }
   else
   {
      _loc9_ = _loc3_.charAt(0);
      _loc7_ = false;
      switch(_loc9_)
      {
         case "g":
            _loc6_ = this.api.lang.getText("SRV_MSG_49");
            break;
         case "n":
            _loc6_ = this.api.lang.getText("CONNECT_NOT_FINISHED");
            break;
         case "a":
            _loc6_ = this.api.lang.getText("ALREADY_LOGGED");
            break;
         case "c":
            _loc6_ = this.api.lang.getText("ALREADY_LOGGED_GAME_SERVER");
            break;
         case "v":
            _loc6_ = this.api.lang.getText("BAD_VERSION",[dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION + (dofus.Constants.BETAVERSION > 0 ? " Beta " + dofus.Constants.BETAVERSION : ""),_loc3_.substr(1)]);
            _loc7_ = true;
            break;
         case "p":
            _loc6_ = this.api.lang.getText("NOT_PLAYER");
            break;
         case "b":
            _loc6_ = this.api.lang.getText("BANNED");
            break;
         case "d":
            _loc6_ = this.api.lang.getText("U_DISCONNECT_ACCOUNT");
            break;
         case "k":
            _loc5_ = _loc3_.substr(1).split("|");
            _loc4_ = 0;
            while(_loc4_ < _loc5_.length)
            {
               if(_loc5_[_loc4_] == 0)
               {
                  _loc5_[_loc4_] = undefined;
               }
               _loc4_ += 1;
            }
            _loc6_ = _global.ank.utils.PatternDecoder.getDescription(this.api.lang.getText("KICKED"),_loc5_);
            break;
         case "w":
            _loc6_ = this.api.lang.getText("SERVER_FULL");
            break;
         case "o":
            _loc6_ = this.api.lang.getText("OLD_ACCOUNT",[this.api.datacenter.Basics.login]);
            break;
         case "e":
            _loc6_ = this.api.lang.getText("OLD_ACCOUNT_USE_NEW",[this.api.datacenter.Basics.login]);
            break;
         case "m":
            _loc6_ = this.api.lang.getText("MAINTAIN_ACCOUNT");
            break;
         case "r":
            this.api.ui.loadUIComponent("ChooseNickName","ChooseNickName");
            return undefined;
         case "s":
            this.api.ui.getUIComponent("ChooseNickName").nickAlreadyUsed = true;
            return undefined;
         case "i":
            _loc6_ = this.api.lang.getText("LOGIN_ERROR_ANONYMOUS_IP");
            break;
         case "f":
            if(this.api.config.isStreaming)
            {
               _loc6_ = this.api.lang.getText("ACCESS_DENIED_MINICLIP");
               break;
            }
         default:
            _loc6_ = this.api.lang.getText("ACCESS_DENIED");
      }
      if(_global.dofus.Constants.USE_JS_LOG && _global.CONFIG.isNewAccount)
      {
         getURL("JavaScript:WriteLog(\'LoginError;" + _loc6_ + "\')","_self");
      }
      this.aks.disconnect(false,false);
      _loc10_ = this.api.ui.loadUIComponent("AskOk",_loc7_ ? "AskOkOnLoginCloseClient" : "AskOkOnLogin",{title:this.api.lang.getText("LOGIN"),text:_loc6_});
      _loc10_.addEventListener("ok",this);
      this.api.kernel.manualLogon();
   }
};
_loc1.logon = function(_loc2_, _loc3_, _loc4_)
{
   if(this.api.datacenter.Basics.connexionKey == undefined)
   {
      this.onLogin(false,"n");
      return undefined;
   }
   if(_loc2_ == undefined)
   {
      _loc2_ = this.api.datacenter.Basics.login;
   }
   else
   {
      this.api.datacenter.Basics.login = _loc2_;
   }
   if(_loc3_ == undefined)
   {
      _loc3_ = this.api.datacenter.Basics.password;
   }
   else
   {
      this.api.datacenter.Basics.password = _loc3_;
   }
   this.aks.send(dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION + (dofus.Constants.BETAVERSION > 0 ? "." + dofus.Constants.BETAVERSION : ""),true,this.api.lang.getText("CONNECTING"));
   var _loc6_;
   var _loc7_;
   if(_loc4_)
   {
      this.aks.send(_loc2_ + "\n" + _loc3_);
   }
   else if(this.api.lang.getConfigText("CRYPTO_METHOD") == 2)
   {
      _loc6_ = new ank["\x1e\n\x07"]["\n\t"]();
      _loc7_ = "#2" + _loc6_.hex_md5(_loc6_.hex_md5(_loc3_) + this.api.datacenter.Basics.connexionKey);
      this.aks.send(_loc2_ + "\n" + _loc7_);
   }
   else
   {
      this.aks.send(_loc2_ + "\n" + ank["\x1e\n\x07"]["\x11\x17"].cryptPassword(_loc3_,this.api.datacenter.Basics.connexionKey));
   }
   dofus.managers.UIdManager.getInstance().update();
   var _loc8_ = this.api.datacenter.Basics.aks_identity;
   var _loc5_ = SharedObject.getLocal(dofus.Constants.GLOBAL_SO_IDENTITY_NAME);
   var _loc2_ = _loc5_.data.identity;
   if(!this.api.network.isValidNetworkKey(_loc2_))
   {
      _loc2_ = this.api.network.getRandomNetworkKey();
      _loc5_.data.identity = _loc2_;
      _loc5_.flush();
   }
   else if(_loc8_ != _loc2_)
   {
      this.api.datacenter.Basics.aks_identity = _loc2_;
      this.aks.send("Ai" + this.api.datacenter.Basics.aks_identity,false);
   }
};
_loc1.getCharacters = function()
{
   this.aks.send("VZ" + dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION,false);
   this.aks.send("AL",true,this.api.lang.getText("CONNECTING"));
};
_loc1.cambiarID = function(nID)
{
   this.api.ui.getUIComponent("Banner").removerData();
   this.api.datacenter.Player.ID = Number(nID);
   this.api.ui.getUIComponent("Banner").actualizarData();
   // Force spells tab when switching active hero (same as onTurnStart for main char)
   var _loc2_ = this.api.ui.getUIComponent("Banner");
   if(_loc2_ != undefined)
   {
      _loc2_.shortcuts.setCurrentTab("Spells");
      _loc2_.shortcuts.updateCurrentTabInformations();
   }
};
_loc1.cambiarClase = function(nID)
{
   this.api.datacenter.Player.Guild = Number(nID);
};
_loc1.onCharacterSelectedLeader = function(_loc3_)
{
   this.api.ui.getUIComponent("Banner").removerData();
   this.api.datacenter.Player.SpellsManager.clear();
   this.api.ui.getUIComponent("Banner").shortcuts.setCurrentTab("Items");
   var _loc2_ = _loc3_.split("|");
   _loc3_ = new Object();
   var _loc5_ = Number(_loc2_[0]);
   var _loc4_ = _loc2_[1];
   _loc3_.level = _loc2_[2];
   _loc3_.guild = _loc2_[3];
   _loc3_.sex = _loc2_[4];
   _loc3_.gfxID = _loc2_[5];
   _loc3_.color1 = _loc2_[6];
   _loc3_.color2 = _loc2_[7];
   _loc3_.color3 = _loc2_[8];
   _loc3_.items = _loc2_[9];
   this.api.kernel.CharactersManager.setLocalPlayerDataLeader(_loc5_,_loc4_,_loc3_);
   this.api.electron.updateWindowTitle(_loc4_);
   this.api.electron.setIngameDiscordActivity();
   this.api.ui.getUIComponent("Banner").actualizarData();
   this.api.ui.getUIComponent("Banner").shortcuts.updateCurrentTabInformations();
};
_loc1.onStats2 = function(sExtraData)
{
   this.api.ui.unloadUIComponent("WaitingMessage");
   var _loc4_ = sExtraData.split("|");
   var _loc2_ = this.api.datacenter.Player;
   var _loc3_ = _loc4_[0].split(",");
   _loc2_.XPlow = _loc3_[0];
   _loc2_.XP = _loc3_[1];
   _loc2_.XPhigh = _loc3_[2];
   _loc2_.Kama = _loc4_[1].split("#")[0];
   _loc2_.Ogrine = _loc4_[1].split("#")[1];
   _loc2_.BonusPoints = _loc4_[2];
   _loc2_.BonusPointsSpell = _loc4_[3];
   _loc3_ = _loc4_[4].split(",");
   var _loc9_ = 0;
   var _loc5_;
   if(_loc3_[0].indexOf("~"))
   {
      _loc5_ = _loc3_[0].split("~");
      _loc2_.haveFakeAlignment = _loc5_[0] != _loc5_[1];
      _loc3_[0] = _loc5_[0];
      _loc9_ = Number(_loc5_[1]);
   }
   var _loc13_ = Number(_loc3_[0]);
   var _loc8_ = Number(_loc3_[1]);
   _loc2_.alignment = new dofus.datacenter["\x1e\f"](_loc13_,_loc8_);
   _loc2_.fakeAlignment = new dofus.datacenter["\x1e\f"](_loc9_,_loc8_);
   _loc2_.data.alignment = _loc2_.alignment.clone();
   var _loc12_ = Number(_loc3_[2]);
   var _loc11_ = Number(_loc3_[3]);
   var _loc6_ = Number(_loc3_[4]);
   var _loc10_ = _loc3_[5] != "1" ? false : true;
   var _loc7_ = _loc2_.rank.disgrace;
   _loc2_.rank = new dofus.datacenter.Rank(_loc12_,_loc11_,_loc6_,_loc10_);
   _loc2_.data.rank = _loc2_.rank.clone();
   if(_loc7_ != undefined && (_loc7_ != _loc6_ && _loc6_ > 0))
   {
      this.api.kernel.GameManager.showDisgraceSanction();
   }
   _loc3_ = _loc4_[5].split(",");
   _loc2_.LP = _loc3_[0];
   _loc2_.data.LP = _loc3_[0];
   _loc2_.LPmax = _loc3_[1];
   _loc2_.data.LPmax = _loc3_[1];
   _loc3_ = _loc4_[6].split(",");
   _loc2_.Energy = _loc3_[0];
   _loc2_.EnergyMax = _loc3_[1];
};
_loc1.onCharactersList = function(bSuccess, sExtraData, bIsMigration)
{
   this.api.ui.unloadUIComponent("WaitingMessage");
   this.api.ui.unloadUIComponent("WaitingQueue");
   var _loc13_ = new Array();
   var _loc12_ = sExtraData.split("|");
   var _loc15_ = Number(_loc12_[0]);
   var _loc14_ = Number(_loc12_[1]);
   var _loc9_ = new Array();
   this.api.datacenter.Sprites.clear();
   var _loc5_ = 2;
   var _loc2_;
   var _loc3_;
   var _loc7_;
   var _loc11_;
   var _loc10_;
   while(_loc5_ < _loc12_.length)
   {
      _loc2_ = _loc12_[_loc5_].split(";");
      _loc3_ = new Object();
      _loc7_ = _loc2_[0];
      _loc11_ = _loc2_[1];
      _loc3_.level = _loc2_[2];
      _loc3_.gfxID = _loc2_[3];
      _loc3_.color1 = _loc2_[4];
      _loc3_.color2 = _loc2_[5];
      _loc3_.color3 = _loc2_[6];
      _loc3_.accessories = _loc2_[7];
      _loc3_.merchant = _loc2_[8];
      _loc3_.serverID = _loc2_[9];
      _loc3_.isDead = _loc2_[10];
      _loc3_.deathCount = _loc2_[11];
      _loc3_.lvlMax = _loc2_[12];
      _loc3_.venta = _loc2_[15];
      _loc10_ = this.api.kernel.CharactersManager.createCharacter(_loc7_,_loc11_,_loc3_);
      _loc10_.sortID = Number(_loc7_);
      _loc13_.push(_loc10_);
      _loc9_.push(Number(_loc7_));
      _loc5_ += 1;
   }
   _loc13_.sortOn("sortID",Array.NUMERIC);
   this.api.ui.unloadUIComponent("CreateCharacter");
   this.api.ui.unloadUIComponent("ChooseServer");
   this.api.ui.unloadUIComponent("AutomaticServer");
   ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this.WaitQueueTimer,"WaitQueue");
   this.api.ui.getUIComponent("MainMenu").quitMode = "menu";
   var _loc6_;
   var _loc8_;
   var _loc4_;
   if(this.api.datacenter.Basics.hasCreatedCharacter)
   {
      this.api.datacenter.Basics.hasCreatedCharacter = false;
      if(this.api.datacenter.Basics.oldCharList == undefined && _loc9_.length == 1 || this.api.datacenter.Basics.oldCharList.length + 1 == _loc9_.length)
      {
         _loc6_ = 0;
         while(true)
         {
            if(_loc6_ < _loc9_.length)
            {
               _loc8_ = false;
               _loc4_ = 0;
               while(_loc4_ < this.api.datacenter.Basics.oldCharList.length)
               {
                  if(_loc9_[_loc6_] == this.api.datacenter.Basics.oldCharList[_loc4_])
                  {
                     _loc8_ = true;
                     break;
                  }
                  _loc4_ += 1;
               }
               if(!_loc8_)
               {
                  break;
               }
               _loc6_ += 1;
            }
         }
         this.setCharacter(_loc9_[_loc6_]);
         return undefined;
      }
   }
   this.api.datacenter.Basics.oldCharList = _loc9_;
   if((!bIsMigration || this.api.datacenter.Basics.ignoreMigration) && ((this.api.datacenter.Basics.createCharacter || !_loc14_) && !this.api.datacenter.Basics.ignoreCreateCharacter))
   {
      this.api.ui.loadUIComponent("CreateCharacter","CreateCharacter",{remainingTime:_loc15_});
   }
   else
   {
      this.api.ui.unloadUIComponent("CharactersMigration");
      if(!bIsMigration || this.api.datacenter.Basics.ignoreMigration)
      {
         this.api.datacenter.Basics.createCharacter = false;
         this.api.ui.loadUIComponent("ChooseCharacter","ChooseCharacter",{spriteList:_loc13_,remainingTime:_loc15_,characterCount:_loc14_,personajes:sExtraData.split("*")[1]},{bForceLoad:true});
      }
      else
      {
         this.api.datacenter.Basics.ignoreMigration = false;
         this.api.datacenter.Basics.createCharacter = false;
         this.api.ui.loadUIComponent("CharactersMigration","CharactersMigration",{spriteList:_loc13_,remainingTime:_loc15_,characterCount:_loc14_},{bForceLoad:true});
      }
   }
   if(this.api.datacenter.Basics.aks_gifts_stack.length != 0 && _loc13_.length > 0)
   {
      this.api.ui.getUIComponent("CreateCharacter")._visible = false;
      this.api.ui.getUIComponent("ChooseCharacter")._visible = false;
      this.api.ui.loadUIComponent("Gifts","Gifts",{gift:this.api.datacenter.Basics.aks_gifts_stack.shift(),spriteList:_loc13_,personajes:sExtraData.split("*")[1]},{bForceLoad:true});
   }
};
_loc1.onNewOmega = function(sExtraData)
{
   var _loc3_ = sExtraData.split(",");
   var _loc2_ = _loc3_[0];
   var _loc4_ = _loc3_[1];
   this.api.datacenter.Player.Omega = _loc2_;
   this.api.datacenter.Player.data.Omega = _loc2_;
   this.api.kernel.TipsManager.showNewTip(dofus["\x0b\b"].TipsManager.TIP_GAIN_LEVEL);
   this.api.ui.loadUIComponent("Omega","Omega",{omega:_loc2_,clase:_loc4_});
   SOMA.playSound("fx_802.mp3");
};
_loc1.onStats = function(sExtraData)
{
   this.api.ui.unloadUIComponent("WaitingMessage");
   var _loc12_ = sExtraData.split("|");
   // Usar el Player del contexto actual (puede ser héroe o jugador principal)
   var _loc9_ = this.api.datacenter.Player;
   _global.trace("[ACCOUNT onStats] Updating Player ID=" + _loc9_.ID + " Name=" + _loc9_.Name);
   var _loc10_ = _loc12_[0].split(",");
   _loc9_.XPlow = _loc10_[0];
   _loc9_.XP = _loc10_[1];
   _loc9_.XPhigh = _loc10_[2];
   _loc9_.Kama = _loc12_[1].split("#")[0];
   _loc9_.Ogrine = _loc12_[1].split("#")[1];
   _loc9_.BonusPoints = _loc12_[2];
   _loc9_.BonusPointsSpell = _loc12_[3];
   _loc10_ = _loc12_[4].split(",");
   var _loc24_ = 0;
   var _loc21_;
   if(_loc10_[0].indexOf("~"))
   {
      _loc21_ = _loc10_[0].split("~");
      _loc9_.haveFakeAlignment = _loc21_[0] != _loc21_[1];
      _loc10_[0] = _loc21_[0];
      _loc24_ = Number(_loc21_[1]);
   }
   var _loc26_ = Number(_loc10_[0]);
   var _loc25_ = Number(_loc10_[1]);
   _loc9_.alignment = new dofus.datacenter["\x1e\f"](_loc26_,_loc25_);
   _loc9_.fakeAlignment = new dofus.datacenter["\x1e\f"](_loc24_,_loc25_);
   _loc9_.data.alignment = _loc9_.alignment.clone();
   var _loc27_ = Number(_loc10_[2]);
   var _loc28_ = Number(_loc10_[3]);
   var _loc22_ = Number(_loc10_[4]);
   var _loc29_ = _loc10_[5] != "1" ? false : true;
   var _loc23_ = _loc9_.rank.disgrace;
   _loc9_.rank = new dofus.datacenter.Rank(_loc27_,_loc28_,_loc22_,_loc29_);
   _loc9_.data.rank = _loc9_.rank.clone();
   if(_loc23_ != undefined && (_loc23_ != _loc22_ && _loc22_ > 0))
   {
      this.api.kernel.GameManager.showDisgraceSanction();
   }
   _loc10_ = _loc12_[5].split(",");
   _loc9_.LP = _loc10_[0];
   _loc9_.data.LP = _loc10_[0];
   _loc9_.LPmax = _loc10_[1];
   _loc9_.data.LPmax = _loc10_[1];
   _loc10_ = _loc12_[6].split(",");
   _loc9_.Energy = _loc10_[0];
   _loc9_.EnergyMax = _loc10_[1];
   _loc9_.Initiative = _loc12_[7];
   _loc9_.Discernment = _loc12_[8];
   var _loc8_ = new Array();
   var _loc11_ = 4;
   while(true)
   {
      _loc11_ = _loc11_ - 1;
      if(_loc11_ <= -1)
      {
         break;
      }
      _loc8_[_loc11_] = new Array();
   }
   var _loc5_ = 8;
   var _loc2_;
   var _loc3_;
   var _loc4_;
   var _loc7_;
   var _loc6_;
   while(true)
   {
      _loc5_ = _loc5_ + 1;
      if(_loc5_ >= 59)
      {
         break;
      }
      _loc10_ = _loc12_[_loc5_].split(",");
      _loc2_ = Number(_loc10_[0]);
      _loc3_ = Number(_loc10_[1]);
      _loc4_ = Number(_loc10_[2]);
      _loc7_ = Number(_loc10_[3]);
      _loc6_ = Number(_loc10_[4]);
      switch(_loc5_)
      {
         case 9:
            _loc8_[0].push({id:_loc5_,o:7,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"Star"});
            if(!this.api.datacenter.Game.isFight)
            {
               _loc9_.AP = _loc2_ + _loc3_ + _loc4_;
            }
            break;
         case 10:
            _loc8_[0].push({id:_loc5_,o:8,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconMP"});
            if(!this.api.datacenter.Game.isFight)
            {
               _loc9_.MP = _loc2_ + _loc3_ + _loc4_;
            }
            break;
         case 11:
            _loc8_[0].push({id:_loc5_,o:3,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconEarthBonus"});
            _loc9_.Force = _loc2_;
            _loc9_.ForceXtra = _loc3_ + _loc4_;
            break;
         case 12:
            _loc8_[0].push({id:_loc5_,o:1,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconVita"});
            _loc9_.Vitality = _loc2_;
            _loc9_.VitalityXtra = _loc3_ + _loc4_;
            break;
         case 13:
            _loc8_[0].push({id:_loc5_,o:2,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconWisdom"});
            _loc9_.Wisdom = _loc2_;
            _loc9_.WisdomXtra = _loc3_ + _loc4_;
            break;
         case 14:
            _loc8_[0].push({id:_loc5_,o:5,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconWaterBonus"});
            _loc9_.Chance = _loc2_;
            _loc9_.ChanceXtra = _loc3_ + _loc4_;
            break;
         case 15:
            _loc8_[0].push({id:_loc5_,o:6,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconAirBonus"});
            _loc9_.Agility = _loc2_;
            _loc9_.AgilityXtra = _loc3_ + _loc4_;
            _loc9_.AgilityTotal = _loc6_;
            break;
         case 16:
            _loc8_[0].push({id:_loc5_,o:4,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconFireBonus"});
            _loc9_.Intelligence = _loc2_;
            _loc9_.IntelligenceXtra = _loc3_ + _loc4_;
            break;
         case 17:
            _loc8_[0].push({id:_loc5_,o:9,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconAlcance"});
            _loc9_.RangeModerator = _loc2_ + _loc3_ + _loc4_;
            break;
         case 18:
            _loc8_[0].push({id:_loc5_,o:10,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconSummons"});
            _loc9_.MaxSummonedCreatures = _loc2_ + _loc3_ + _loc4_;
            break;
         case 19:
            _loc8_[1].push({id:_loc5_,o:1,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_});
            break;
         case 20:
            _loc8_[1].push({id:_loc5_,o:2,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_});
            break;
         case 21:
            _loc8_[1].push({id:_loc5_,o:3,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_});
            break;
         case 22:
            _loc8_[1].push({id:_loc5_,o:4,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_});
            break;
         case 23:
            _loc8_[1].push({id:_loc5_,o:7,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_});
            break;
         case 24:
            _loc8_[1].push({id:_loc5_,o:5,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_});
            break;
         case 25:
            _loc8_[1].push({id:_loc5_,o:6,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_});
            break;
         case 26:
            _loc8_[1].push({id:_loc5_,o:8,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_});
            break;
         case 27:
            _loc8_[1].push({id:_loc5_,o:9,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_});
            _loc9_.CriticalHitBonus = _loc6_;
            break;
         case 28:
            _loc8_[1].push({id:_loc5_,o:10,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_});
            break;
         case 29:
            _loc8_[1].push({id:_loc5_,o:11,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"Star"});
            break;
         case 30:
            _loc8_[1].push({id:_loc5_,o:12,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconMP"});
            break;
         case 31:
            _loc8_[2].push({id:_loc5_,o:1,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconNeutral"});
            break;
         case 32:
            _loc8_[2].push({id:_loc5_,o:2,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconNeutral"});
            break;
         case 33:
            _loc8_[3].push({id:_loc5_,o:11,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconNeutral"});
            break;
         case 34:
            _loc8_[3].push({id:_loc5_,o:12,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconNeutral"});
            break;
         case 35:
            _loc8_[2].push({id:_loc5_,o:3,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconEarth"});
            break;
         case 36:
            _loc8_[2].push({id:_loc5_,o:4,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconEarth"});
            break;
         case 37:
            _loc8_[3].push({id:_loc5_,o:13,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconEarth"});
            break;
         case 38:
            _loc8_[3].push({id:_loc5_,o:14,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconEarth"});
            break;
         case 39:
            _loc8_[2].push({id:_loc5_,o:7,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconWater"});
            break;
         case 40:
            _loc8_[2].push({id:_loc5_,o:8,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconWater"});
            break;
         case 41:
            _loc8_[3].push({id:_loc5_,o:17,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconWater"});
            break;
         case 42:
            _loc8_[3].push({id:_loc5_,o:18,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconWater"});
            break;
         case 43:
            _loc8_[2].push({id:_loc5_,o:9,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconAir"});
            break;
         case 44:
            _loc8_[2].push({id:_loc5_,o:10,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconAir"});
            break;
         case 45:
            _loc8_[3].push({id:_loc5_,o:19,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconAir"});
            break;
         case 46:
            _loc8_[3].push({id:_loc5_,o:20,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconAir"});
            break;
         case 47:
            _loc8_[2].push({id:_loc5_,o:5,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconFire"});
            break;
         case 48:
            _loc8_[2].push({id:_loc5_,o:6,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconFire"});
            break;
         case 49:
            _loc8_[3].push({id:_loc5_,o:15,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconFire"});
            break;
         case 50:
            _loc8_[3].push({id:_loc5_,o:16,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconFire"});
            break;
         case 51:
            _loc8_[0].push({id:_loc5_,o:16,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconHuida"});
            break;
         case 52:
            _loc8_[0].push({id:_loc5_,o:16,s:_loc2_,i:_loc3_,d:_loc4_,b:_loc7_,t:_loc6_,p:"IconPlacaje"});
      }
   }
   _loc9_.FullStats = _loc8_;
   this.api.network.Basics.getDate();
};
_loc1.onRegionalVersion = function(_loc2_)
{
   var _loc4_ = this.api.lang.getConfigText("MAXIMUM_ALLOWED_VERSION");
   var _loc3_ = Number(_loc2_);
   var _loc5_;
   if(_loc4_ > 0)
   {
      if((_loc3_ <= 0 || _loc3_ > _loc4_) && !this.api.datacenter.Player.isAuthorized)
      {
         _loc5_ = {name:"SwitchToEnglish",listener:this};
         this.api.kernel.showMessage(undefined,this.api.lang.getText("SWITCH_TO_ENGLISH"),"CAUTION_YESNO",_loc5_);
         return undefined;
      }
   }
   this.api.datacenter.Basics.aks_current_regional_version = _loc3_ > 0 && !_global.isNaN(_loc3_) ? _loc3_ : 1.7976931348623157e+308;
   this.getGifts();
   _global.clearInterval(this._nIdentityTimer);
   this.sendIdentity();
   this.setVersion();
   this.getCharacters();
   this.api.network.Account.getQueuePosition();
};
#endinitclip