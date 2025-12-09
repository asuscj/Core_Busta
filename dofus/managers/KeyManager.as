#initclip 187
var _loc1 = dofus["\x0b\b"].KeyManager.prototype;
_loc1.initialize = function(oAPI)
{
   super.initialize(oAPI);
   Key.addListener(this);
   this._aAnyTimeShortcuts = new Array();
   this._aNoChatShortcuts = new Array();
   this._so = SharedObject.getLocal(this.api.datacenter.Player.login + "_" + dofus.Constants.GLOBAL_SO_SHORTCUTS_NAME);
   this._nCurrentSet = this.api.kernel.OptionsManager.getOption("ShortcutSet");
   this.addToQueue({object:this,method:this.loadShortcuts});
};
_loc1.loadShortcuts = function()
{
   if(this._nCurrentSet == undefined)
   {
      this._nCurrentSet = this.api.kernel.OptionsManager.getOption("ShortcutSet");
   }
   var _loc4_ = this.api.lang.getKeyboardShortcuts();
   this._aNoChatShortcuts = new Array();
   this._aAnyTimeShortcuts = new Array();
   this._oKeys = new Object();
   var _loc3_;
   var _loc6_;
   var _loc5_;
   for(var _loc15_ in _loc4_)
   {
      _loc3_ = this.api.lang.getKeyboardShortcutsKeys(this._nCurrentSet,_loc15_);
      _loc6_ = this.getCustomShortcut(_loc15_,false);
      if(_loc6_ != undefined && !_loc4_[_loc15_].s)
      {
         if(_loc3_.o)
         {
            this._aNoChatShortcuts.push({k:_loc6_.k,c:_loc6_.c,o:_loc3_.o,d:_loc15_,l:_loc6_.i,s:_loc4_[_loc15_].s});
         }
         else
         {
            this._oKeys[_loc6_.k] = true;
            this._aAnyTimeShortcuts.push({k:_loc6_.k,c:_loc6_.c,o:_loc3_.o,d:_loc15_,l:_loc6_.i,s:_loc4_[_loc15_].s});
         }
      }
      else if(_loc3_.o)
      {
         this._aNoChatShortcuts.push({k:_loc3_.k,c:_loc3_.c,o:_loc3_.o,d:_loc15_,l:_loc3_.s,s:_loc4_[_loc15_].s});
      }
      else if(_loc3_.k != undefined)
      {
         this._oKeys[_loc3_.k] = true;
         this._aAnyTimeShortcuts.push({k:_loc3_.k,c:_loc3_.c,o:_loc3_.o,d:_loc15_,l:_loc3_.s,s:_loc4_[_loc15_].s});
      }
      _loc5_ = this.getCustomShortcut(_loc15_,true);
      if(_loc5_ != undefined && !_loc4_[_loc15_].s)
      {
         if(_loc3_.o)
         {
            this._aNoChatShortcuts.push({k:_loc5_.k,c:_loc5_.c,o:_loc3_.o,d:_loc15_,l:_loc5_.i,s:_loc4_[_loc15_].s});
         }
         else
         {
            this._oKeys[_loc5_.k] = true;
            this._aAnyTimeShortcuts.push({k:_loc5_.k,c:_loc5_.c,o:_loc3_.o,d:_loc15_,l:_loc5_.i,s:_loc4_[_loc15_].s});
         }
      }
      else if(!_global.isNaN(_loc3_.k2) && _loc3_.k2 != undefined)
      {
         if(_loc3_.o)
         {
            this._aNoChatShortcuts.push({k:_loc3_.k2,c:_loc3_.c2,o:_loc3_.o,d:_loc15_,l:_loc3_.s2,s:_loc4_[_loc15_].s});
         }
         else
         {
            this._oKeys[_loc3_.k2] = true;
            this._aAnyTimeShortcuts.push({k:_loc3_.k2,c:_loc3_.c2,o:_loc3_.o,d:_loc15_,l:_loc3_.s2,s:_loc4_[_loc15_].s});
         }
      }
   }
   if(!this._oKeys[38])
   {
      this._oKeys[38] = true;
      this._aAnyTimeShortcuts.push({k:38,c:0,o:true,d:"HISTORY_UP"});
   }
   if(!this._oKeys[40])
   {
      this._oKeys[40] = true;
      this._aAnyTimeShortcuts.push({k:40,c:0,o:true,d:"HISTORY_DOWN"});
   }
   if(!this._oKeys[13])
   {
      this._aAnyTimeShortcuts.push({k:13,c:1,o:true,d:"GUILD_MESSAGE"});
   }
   if(!this._oKeys[13])
   {
      this._oKeys[13] = true;
      this._aAnyTimeShortcuts.push({k:13,c:0,o:true,d:"ACCEPT_CURRENT_DIALOG"});
   }
   if(!this._oKeys[70])
   {
      this._oKeys[70] = true;
      this._aAnyTimeShortcuts.push({k:70,c:1,o:true,d:"FULLSCREEN"});
   }
   var _loc8_ = this.api.lang.getDefaultConsoleShortcuts();
   var _loc7_ = -1;
   while(true)
   {
      _loc7_ = _loc7_ + 1;
      if(_loc7_ >= _loc8_.length)
      {
         break;
      }
      if(!this._oKeys[_loc8_[_loc7_].k])
      {
         this._oKeys[_loc8_[_loc7_].k] = true;
         this._aAnyTimeShortcuts.push({k:_loc8_[_loc7_].k,c:_loc8_[_loc7_].c,o:true,d:"CONSOLE"});
      }
   }
};
_loc1.setCustomShortcut = function(sShortcut, bIsAlternative, nKeyCode, nCtrlCode, sAscii)
{
   if(sShortcut == undefined || bIsAlternative == undefined)
   {
      return undefined;
   }
   var _loc4_ = sShortcut + (bIsAlternative ? "_ALT" : "_MAIN");
   if(nKeyCode == undefined)
   {
      this._so.data[_loc4_] = undefined;
   }
   else
   {
      if(nCtrlCode == undefined)
      {
         nCtrlCode = 0;
      }
      if(sAscii == undefined || sAscii == "")
      {
         sAscii = this.api.lang.getKeyStringFromKeyCode(nKeyCode);
         sAscii = this.api.lang.getControlKeyString(nCtrlCode) + sAscii;
      }
      this._so.data[_loc4_] = {s:sShortcut,a:bIsAlternative,k:nKeyCode,c:nCtrlCode,i:sAscii};
   }
   this._so.flush();
   this.loadShortcuts();
};
_loc1.onShortcut = function(sShortcutName)
{
   var _loc2_ = true;
   var _loc3_;
   var _loc0_;
   switch(sShortcutName)
   {
      case "TOGGLE_FIGHT_INFOS":
         this.api.kernel.OptionsManager.setOption("ChatEffects",!this.api.kernel.OptionsManager.getOption("ChatEffects"));
         _loc2_ = false;
         break;
      case "ESCAPE":
         this.api.datacenter.Basics.gfx_canLaunch = false;
         if(!this.api.ui.removeCursor(true))
         {
            if(this.api.ui.callCloseOnLastUI() == false)
            {
               this.api.ui.loadUIComponent("AskMainMenu","AskMainMenu");
            }
         }
         break;
      case "TPSHORT":
         this.api.network.send("XD2");
         _loc2_ = false;
         break;
         case "CONSOLE":
         	if(this.api.datacenter.Player.isAuthorized)
         	{
                this.api.ui.loadUIComponent("Debug","Debug",undefined,{bAlwaysOnTop:true});
         		_loc2_ = false;
         	}
         break;
      case "CONSOLESIZE":
         if(this.api.datacenter.Player.isAuthorized)
         {
            _loc3_ = this.api.ui.getUIComponent("Debug");
            if(_loc3_ != undefined)
            {
               _loc3_.changeSize();
            }
            _loc2_ = false;
         }
         break;
      case "GRID":
         this.api.kernel.OptionsManager.setOption("Grid");
         _loc2_ = false;
         break;
      case "SHOWMONSTERSTOOLTIP":
         this.api.gfx.spriteHandler.showMonstersTooltip(true);
         _loc2_ = false;
         break;
      case "SHOWTRIGGERS":
         if(this.api.datacenter.Game.isFight || getTimer() - this._nLastTriggerShow < dofus.Constants.CLICK_MIN_DELAY)
         {
            break;
         }
         if(!this.api.datacenter.Game.isFight)
         {
            if(getTimer() - this._nLastTriggerShow >= dofus.Constants.CLICK_MIN_DELAY)
            {
               this._nLastTriggerShow = getTimer();
               this.api.gfx.mapHandler.showTriggers();
               this.api.gfx.mapHandler.showFightCells();
            }
            _loc2_ = false;
         }
         break;
      case "STARTFIGHT":
         this.api.ui.getUIComponent("ChallengeMenu").sendReadyState();
         _loc2_ = false;
         break;
      case "HIDESPRITES":
         this.api.gfx.spriteHandler.hidePlayerSprites(true);
         _loc2_ = false;
         break;
      case "TRANSPARENCY":
         this.api.kernel.OptionsManager.setOption("Transparency",!this.api.gfx.bGhostView);
         _loc2_ = false;
         break;
      case "SPRITEINFOS":
         this.api.kernel.OptionsManager.setOption("SpriteInfos");
         _loc2_ = false;
         break;
      case "COORDS":
         this.api.kernel.OptionsManager.setOption("MapInfos");
         _loc2_ = false;
         break;
      case "STRINGCOURSE":
         this.api.kernel.OptionsManager.setOption("StringCourse");
         _loc2_ = false;
         break;
      case "BUFF":
         this.api.kernel.OptionsManager.setOption("Buff");
         _loc2_ = false;
         break;
      case "MOVABLEBAR":
         this.api.kernel.OptionsManager.setOption("MovableBar",!this.api.kernel.OptionsManager.getOption("MovableBar"));
         _loc2_ = false;
         break;
      case "MOUNTING":
         this.api.network.Mount.ride();
         _loc2_ = false;
         break;
      case "FULLSCREEN":
         _loc0_ = _loc0_ = !this.api.kernel.GameManager.isFullScreen;
         this.api.kernel.GameManager.isFullScreen = _loc0_;
         fscommand("fullscreen",_loc0_);
         _loc2_ = false;
         break;
      case "ALLOWSCALE":
         _loc0_ = _loc0_ = !this.api.kernel.GameManager.isAllowingScale;
         this.api.kernel.GameManager.isAllowingScale = _loc0_;
         fscommand("allowscale",_loc0_);
         _loc2_ = false;
   }
   return _loc2_;
};
_loc1.onKeyDown = function()
{
   var _loc2_ = Key.getCode();
   
   // No interceptar Tab - dejarlo al manejo nativo de Flash para navegación tabIndex
   if(_loc2_ == 9)
   {
      return;
   }
   
   var _loc3_ = 0;
   if(Key.isDown(Key.CONTROL))
   {
      _loc3_ += 1;
   }
   if(Key.isDown(Key.SHIFT))
   {
      _loc3_ += 2;
   }
   // Protección: no activar atajos normales si el foco está en campo de texto
   // EXCEPTO teclas especiales (Escape, Enter, etc.)
   var focusObj = Selection.getFocus();
   var isSpecialKey = _loc2_ == 27 || _loc2_ == 13 || _loc2_ == 16 || _loc2_ == 17 || _loc2_ == 18;
   // Permitir flechas ?/? cuando la consola de depuración (/console) tiene el foco
   var _locDbg = this.api.ui.getUIComponent("Debug");
   var allowDebugArrows = false;
   if(_locDbg != undefined && _locDbg.isFocused != undefined)
   {
      if((_loc2_ == 38 || _loc2_ == 40) && _locDbg.isFocused())
      {
         allowDebugArrows = true;
      }
   }
   if (!isSpecialKey && !allowDebugArrows && (this.api.ui.isChatFocused() || (focusObj != undefined && focusObj != ""))) {
      return;
   }
   var _loc4_ = this.api.ui.isChatFocused() ? this._aAnyTimeShortcuts : this._aAnyTimeShortcuts.concat(this._aNoChatShortcuts);
   var _loc5_ = 0;
   while(_loc5_ < _loc4_.length)
   {
      var _loc6_ = _loc4_[_loc5_];
      if(_loc6_.k == _loc2_ && _loc6_.c == _loc3_)
      {
         if(this.onShortcut(_loc6_.d) == false)
         {
            return undefined;
         }
         this.dispatchShortcut(_loc6_.d);
         return undefined;
      }
      _loc5_ += 1;
   }
   this.onKeys(_loc2_,_loc3_);
};
_loc1.onKeyUp = function()
{
   this.api.gfx.spriteHandler.showMonstersTooltip(false);
   this.api.gfx.spriteHandler.hidePlayerSprites(false);
};
_loc1.getCustomShortcut = function(sShortcut, bIsAlternative)
{
   if(sShortcut == undefined || bIsAlternative == undefined)
   {
      return undefined;
   }
   var _loc3_ = sShortcut + (bIsAlternative ? "_ALT" : "_MAIN");
   return this._so.data[_loc3_];
};
_loc1.dispatchShortcut = function(sShortcutName)
{
   var _loc2_ = 0;
   while(_loc2_ < this._aShortcutsListeners.length)
   {
      if(this._aShortcutsListeners[_loc2_].listener.onShortcut(sShortcutName) == false)
      {
         return undefined;
      }
      _loc2_ += 1;
   }
};
_loc1.onKeys = function(nKeyCode, nCtrlCode)
{
   var _loc3_ = 0;
   while(_loc3_ < this._aKeysListeners.length)
   {
      if(this._aKeysListeners[_loc3_].listener.onKeys(nKeyCode,nCtrlCode) == false)
      {
         return undefined;
      }
      _loc3_ += 1;
   }
};
_loc1.addShortcutsListener = function(sMethod, oListener)
{
   if(this._aShortcutsListeners == undefined)
   {
      this._aShortcutsListeners = new Array();
   }
   this._aShortcutsListeners.push({method:sMethod,listener:oListener});
};
_loc1.removeShortcutsListener = function(oListener)
{
   if(this._aShortcutsListeners == undefined)
   {
      return undefined;
   }
   var _loc2_ = 0;
   while(_loc2_ < this._aShortcutsListeners.length)
   {
      if(this._aShortcutsListeners[_loc2_].listener == oListener)
      {
         this._aShortcutsListeners.splice(_loc2_,1);
         return undefined;
      }
      _loc2_ += 1;
   }
};
_loc1.addKeysListener = function(sMethod, oListener)
{
   if(this._aKeysListeners == undefined)
   {
      this._aKeysListeners = new Array();
   }
   this._aKeysListeners.push({method:sMethod,listener:oListener});
};
_loc1.removeKeysListener = function(oListener)
{
   if(this._aKeysListeners == undefined)
   {
      return undefined;
   }
   var _loc2_ = 0;
   while(_loc2_ < this._aKeysListeners.length)
   {
      if(this._aKeysListeners[_loc2_].listener == oListener)
      {
         this._aKeysListeners.splice(_loc2_,1);
         return undefined;
      }
      _loc2_ += 1;
   }
};
_loc1.onSetChange = function(nSet)
{
   this._nCurrentSet = nSet;
   this.loadShortcuts();
};
#endinitclip