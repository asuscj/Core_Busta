#initclip 152
var _loc1 = _global.dofus["\x0b\b"].CharactersManager.prototype;
_loc1.setLocalPlayerData = function(_loc2_, _loc3_, _loc4_)
{
   var _loc5_ = this.api.datacenter.Player;
   _loc5_.clean();
   _loc5_.ID = _loc2_;
   _loc5_.Name = _loc3_;
   _loc5_.Guild = _loc4_.guild;
   _loc5_.Level = _loc4_.level;
   _loc5_.Sex = _loc4_.sex;
   _loc5_.color1 = _loc4_.color1 == -1 ? _loc4_.color1 : Number("0x" + _loc4_.color1);
   _loc5_.color2 = _loc4_.color2 == -1 ? _loc4_.color2 : Number("0x" + _loc4_.color2);
   _loc5_.color3 = _loc4_.color3 == -1 ? _loc4_.color3 : Number("0x" + _loc4_.color3);
   var _loc6_ = _loc4_.items.split(";");
   var _loc2_ = 0;
   var _loc3_;
   var _loc4_;
   while(_loc2_ < _loc6_.length)
   {
      _loc3_ = _loc6_[_loc2_];
      if(_loc3_.length != 0)
      {
         _loc4_ = this.getItemObjectFromData(_loc3_);
         if(_loc4_ != undefined)
         {
            _loc5_.addItem(_loc4_);
         }
      }
      _loc2_ += 1;
   }
   _loc5_.updateCloseCombat();
   this.api.datacenter.Heroes[_loc5_.ID] = _loc5_;
};
_loc1.createCharacter = function(sID, sName, oData)
{
   var _loc4_ = this.api.datacenter.Sprites.getItemAt(sID);
   if(_loc4_ == undefined)
   {
      _loc4_ = new dofus.datacenter["\x13\x01"](sID,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + oData.gfxID + ".swf",oData.cell,oData.dir,oData.gfxID,oData.title,oData.title2,oData.ornamento);
      this.api.datacenter.Sprites.addItemAt(sID,_loc4_);
   }
   _loc4_.GameActionsManager.init();
   _loc4_.cellNum = Number(oData.cell);
   _loc4_.scaleX = oData.scaleX;
   _loc4_.scaleY = oData.scaleY;
   _loc4_.name = sName;
   _loc4_.Guild = Number(oData.spriteType);
   _loc4_.Level = Number(oData.level);
   _loc4_.esOmega = Number(oData.esomega);
   _loc4_.Sex = oData.sex == undefined ? 1 : oData.sex;
   _loc4_.color1 = oData.color1 != -1 ? Number("0x" + oData.color1) : oData.color1;
   _loc4_.color2 = oData.color2 != -1 ? Number("0x" + oData.color2) : oData.color2;
   _loc4_.color3 = oData.color3 != -1 ? Number("0x" + oData.color3) : oData.color3;
   _loc4_.Aura = oData.aura == undefined ? 0 : oData.aura;
   _loc4_.Merchant = oData.merchant != "1" ? false : true;
   _loc4_.Venta = oData.venta;
   _loc4_.serverID = Number(oData.serverID);
   _loc4_.alignment = oData.alignment;
   _loc4_.rank = oData.rank;
   _loc4_.mount = oData.mount;
   _loc4_.isDead = oData.isDead == 1;
   _loc4_.deathState = Number(oData.isDead);
   _loc4_.deathCount = Number(oData.deathCount);
   _loc4_.lvlMax = Number(oData.lvlMax);
   _loc4_.pvpGain = Number(oData.pvpGain);
   _loc4_.colorNombre = Number(oData.colorNombre);
   _loc4_.esAbonado = oData.esAbonado;
   _loc4_.colorVIP = oData.colorVIP;
   this.setSpriteAccessories(_loc4_,oData.accessories);
   if(oData.Huida != undefined)
   {
      _loc4_.Huida = oData.Huida;
   }
   if(oData.Placaje != undefined)
   {
      _loc4_.Placaje = oData.Placaje;
   }
   if(oData.LP != undefined)
   {
      _loc4_.LP = oData.LP;
   }
   if(oData.LP != undefined)
   {
      _loc4_.LP = oData.LP;
   }
   if(oData.LP != undefined)
   {
      _loc4_.LPmax = oData.LP;
   }
   if(oData.AP != undefined)
   {
      _loc4_.AP = oData.AP;
   }
   if(oData.AP != undefined)
   {
      _loc4_.APinit = oData.AP;
   }
   if(oData.MP != undefined)
   {
      _loc4_.MP = oData.MP;
   }
   if(oData.MP != undefined)
   {
      _loc4_.MPinit = oData.MP;
   }
   if(oData.resistances != undefined)
   {
      _loc4_.resistances = oData.resistances;
   }
   _loc4_.Team = oData.team != undefined ? oData.team : null;
   if(oData.emote != undefined && oData.emote.length != 0)
   {
      _loc4_.direction = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].convertHeightToFourDirection(oData.dir);
      if(oData.emoteTimer != undefined && oData.emote.length != 0)
      {
         _loc4_.startAnimationTimer = oData.emoteTimer;
      }
      _loc4_.startAnimation = "EmoteStatic" + oData.emote;
   }
   if(oData.guildName != undefined)
   {
      _loc4_.guildName = oData.guildName;
   }
   _loc4_.emblem = this.createGuildEmblem(oData.emblem);
   if(oData.restrictions != undefined)
   {
      _loc4_.restrictions = _global.parseInt(oData.restrictions,36);
   }
   if(sID == this.api.datacenter.Player.ID)
   {
      if(!this.api.datacenter.Player.haveFakeAlignment)
      {
         this.api.datacenter.Player.alignment = _loc4_.alignment.clone();
      }
   }
   _loc4_.agilidad = oData.agilidad;
   _loc4_.resets = oData.resets;
   _loc4_.Omega = oData.omega;
   _loc4_.subclase = oData.subclase;
   return _loc4_;
};
_loc1.setLocalPlayerDataLeader = function(_loc2_, _loc3_, _loc4_)
{
   // Instrumentation: trace character leader switch timing and electron/debug state
   
   var _loc5_ = this.api.datacenter.Player;
   _loc5_.Inventory = new _global.palmad.ank.utils.ExtendedArray();
   _loc5_.ID = _loc2_;
   _loc5_.Name = _loc3_;
   _loc5_.Guild = _loc4_.guild;
   _loc5_.Level = _loc4_.level;
   _loc5_.Sex = _loc4_.sex;
   _loc5_.color1 = _loc4_.color1 != -1 ? Number("0x" + _loc4_.color1) : _loc4_.color1;
   _loc5_.color2 = _loc4_.color2 != -1 ? Number("0x" + _loc4_.color2) : _loc4_.color2;
   _loc5_.color3 = _loc4_.color3 != -1 ? Number("0x" + _loc4_.color3) : _loc4_.color3;
   _loc5.Omega = oData.omega;
   _loc5.isMule = true;
   var _loc6_ = _loc4_.items.split(";");
   _loc3_ = 0;
   while(_loc3_ < _loc6_.length)
   {
      _loc4_ = _loc6_[_loc3_];
      if(_loc4_.length != 0)
      {
         var _loc5 = this.getItemObjectFromData(_loc4_);
         if(_loc5 != undefined)
         {
            _loc5_.addItem(_loc5);
         }
      }
      _loc3_ += 1;
   }
   _loc5_.updateCloseCombat();
   // After we've populated the local player data, trigger a deterministic
   // restore of item shortcuts in the Banner's MouseShortcuts control so
   // per-character persisted shortcuts are applied immediately when the
   // character leader is changed (avoids timing/retry races).
   try
   {
      var _banner = this.api.ui.getUIComponent("Banner");
      if(_banner != undefined && _banner.shortcuts != undefined)
      {
         // Use the Banner's queue to schedule the restore as part of the
         // UI update cycle (safe even if Banner is still finalizing).
         _banner.addToQueue({object:_banner.shortcuts,method:_banner.shortcuts.restoreItemShortcuts});
      }
      else
      {
         // If Banner isn't available yet, skip logging (non-fatal).
      }
   }
   catch(e)
   {
   }
};
_loc1.getNameFromData = function(sData)
{
   var _loc3_ = new Object();
   var _loc5_ = sData.split(",");
   if(_loc5_.length == 2)
   {
      _loc3_.name = this.api.lang.getFullNameText(_loc5_);
      _loc3_.gfx = "clips/artworks/mini/6000.swf";
      _loc3_.type = "taxcollector";
   }
   else if(_global.isNaN(Number(sData)))
   {
      _loc3_.name = sData.split("~")[0];
      _loc3_.gfx = "clips/artworks/mini/" + sData.split("~")[1] + ".swf";
      _loc3_.type = "player";
   }
   else
   {
      _loc3_.name = this.api.lang.getMonstersText(Number(sData)).n;
      _loc3_.gfx = "clips/artworks/mini/" + this.api.lang.getMonstersText(Number(sData)).g + ".swf";
      _loc3_.type = "monster";
   }
   return _loc3_;
};
_loc1.createMonster = function(sID, sName, oData)
{
   var _loc3_ = this.api.datacenter.Sprites.getItemAt(sID);
   if(_loc3_ == undefined)
   {
      _loc3_ = new dofus.datacenter["\n\x01"](sID,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + oData.gfxID + ".swf",oData.cell,oData.dir,oData.gfxID);
      this.api.datacenter.Sprites.addItemAt(sID,_loc3_);
   }
   _loc3_.GameActionsManager.init();
   _loc3_.cellNum = oData.cell;
   _loc3_.name = sName;
   _loc3_.scaleX = oData.scaleX;
   _loc3_.scaleY = oData.scaleY;
   _loc3_.noFlip = oData.noFlip;
   _loc3_.powerLevel = oData.powerLevel;
   _loc3_.colorVIP = oData.colorVIP;
   _loc3_.color1 = oData.color1 != -1 ? Number("0x" + oData.color1) : oData.color1;
   _loc3_.color2 = oData.color2 != -1 ? Number("0x" + oData.color2) : oData.color2;
   _loc3_.color3 = oData.color3 != -1 ? Number("0x" + oData.color3) : oData.color3;
   this.setSpriteAccessories(_loc3_,oData.accessories);
   if(oData.LP != undefined)
   {
      _loc3_.LP = oData.LP;
   }
   if(oData.LPmax != undefined)
   {
      _loc3_.LPmax = oData.LPmax;
   }
   if(oData.AP != undefined)
   {
      _loc3_.AP = oData.AP;
   }
   if(oData.AP != undefined)
   {
      _loc3_.APinit = oData.AP;
   }
   if(oData.MP != undefined)
   {
      _loc3_.MP = oData.MP;
   }
   if(oData.MP != undefined)
   {
      _loc3_.MPinit = oData.MP;
   }
   if(oData.summoned != undefined)
   {
      _loc3_.isSummoned = oData.summoned;
   }
   _loc3_.Team = oData.team != undefined ? oData.team : null;
   return _loc3_;
};
   // Some servers send summoned creatures with spriteType -1 and expect a
   // dedicated createCreature() path. If it's missing, summons won't render.
   // We map it to createMonster since both share the same datacenter shape,
   // and ensure the summoned flag is carried over for UI/logic.
   _loc1.createCreature = function(sID, sName, oData)
   {
      if(oData != undefined)
      {
         oData.summoned = oData.summoned != undefined ? oData.summoned : true;
      }
      return this.createMonster(sID, sName, oData);
   };
_loc1.createMonsterGroup = function(sID, sName, oData)
{
   var _loc3_ = this.api.datacenter.Sprites.getItemAt(sID);
   if(_loc3_ == undefined)
   {
      _loc3_ = new dofus.datacenter["\t\x1d"](sID,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + oData.gfxID + ".swf",oData.cell,oData.dir,oData.bonusValue);
      this.api.datacenter.Sprites.addItemAt(sID,_loc3_);
   }
   _loc3_.archimob = oData.ArchiMob;
   _loc3_.GameActionsManager.init();
   _loc3_.cellNum = oData.cell;
   _loc3_.name = sName;
   _loc3_.Level = oData.level;
   _loc3_.scaleX = oData.scaleX;
   _loc3_.scaleY = oData.scaleY;
   _loc3_.noFlip = oData.noFlip;
   _loc3_.color1 = oData.color1 != -1 ? Number("0x" + oData.color1) : oData.color1;
   _loc3_.color2 = oData.color2 != -1 ? Number("0x" + oData.color2) : oData.color2;
   _loc3_.color3 = oData.color3 != -1 ? Number("0x" + oData.color3) : oData.color3;
   _loc3_.totalExp = oData.totalExp;
   _loc3_.extraClip = oData.extraClip;
   _loc3_.tipoMob = oData.tipoMob;
   _loc3_.colorVIP = oData.colorVIP;
   this.setSpriteAccessories(_loc3_,oData.accessories);
   return _loc3_;
};
_loc1.setSpriteAccessories = function(oSprite, _loc3_)
{
   var _loc9_;
   var _loc6_;
   var _loc2_;
   var _loc4_;
   var _loc5_;
   var _loc7_;
   var _loc3_;
   var _loc8_;
   if(_loc3_.length != 0)
   {
      _loc9_ = new Array();
      _loc6_ = _loc3_.split(",");
      _loc2_ = 0;
      while(_loc2_ < _loc6_.length)
      {
         if(_loc6_[_loc2_].indexOf("~") != -1)
         {
            _loc4_ = _loc6_[_loc2_].split("~");
            _loc5_ = _global.parseInt(_loc4_[0],16);
            _loc7_ = _global.parseInt(_loc4_[1]);
            _loc3_ = _global.parseInt(_loc4_[2]) - 1;
            if(_loc3_ < 0)
            {
               _loc3_ = 0;
            }
         }
         else
         {
            _loc5_ = _global.parseInt(_loc6_[_loc2_],16);
            _loc7_ = undefined;
            _loc3_ = undefined;
         }
         if(!_global.isNaN(_loc5_))
         {
            // Usar el unicID tal cual; el datacenter Accessory resuelve el gfx internamente.
            // Pasamos type y skinIndex cuando vienen en el string (compat con objevivos).
            _loc8_ = new dofus.datacenter["\x11"](_loc5_,_loc7_,_loc3_);
            _loc9_[_loc2_] = _loc8_;
         }
         _loc2_ += 1;
      }
      oSprite.accessories = _loc9_;
   }
};
#endinitclip