#initclip 204
if(_global.MODO_ELBUSTA)
{
   _global.LOG_TXT = "";
   _global.LC = new LocalConnection();
   _global.trace2 = function(txt)
   {
      _global.LC.send("lc_name","log",txt);
      _global.LOG_TXT += "\n" + txt;
   };
   _global.toJSON = function(obj)
   {
      var _loc1_ = obj;
      var _loc3_;
      if(obj instanceof Array)
      {
         _loc1_ = "(Array)[";
         _loc3_ = true;
         for(var _loc4_ in obj)
         {
            if(!_loc3_)
            {
               _loc1_ += ", ";
            }
            _loc1_ += obj[_loc4_];
            _loc3_ = false;
         }
         _loc1_ += "]";
      }
      else if(obj instanceof Object)
      {
         _loc1_ = "(Object){";
         _loc3_ = true;
         for(_loc4_ in obj)
         {
            if(!_loc3_)
            {
               _loc1_ += ", ";
            }
            _loc1_ += "\"" + _loc4_ + "\":\"" + obj[_loc4_] + "\"";
            _loc3_ = false;
         }
         _loc1_ += "}";
      }
      return _loc1_;
   };
}
var _loc1 = ank["\x1e\n\x07"]["\x0e\x1c"].prototype;
_loc1.externalInterfaceEscape = function()
{
   return this.replace(["&amp;","&lt;","&gt;","\\"],["&ASamp;","&ASlt;","&ASgt;","\\\\"]);
};
_loc1.removeAccents = function()
{
   var _loc7_ = "àáâãäÀÁÂÃÄèéêëËÉÊÈìíîïÌÍÎÏòóôõöÒÓÔÕÖùúûüÙÚÛÜýýÿÝÝŸçÇñÑ ";
   var _loc6_ = "aaaaaAAAAAeeeeEEEEiiiiIIIIoooooOOOOOuuuuUUUUyyyYYYcCnN";
   var _loc5_ = "";
   var _loc2_ = 0;
   var _loc4_;
   var _loc3_;
   while(_loc2_ < this._s.length)
   {
      _loc4_ = this._s.charAt(_loc2_);
      _loc3_ = _loc7_.indexOf(_loc4_);
      _loc5_ += _loc3_ == -1 ? _loc4_ : _loc6_.charAt(_loc3_);
      _loc2_ += 1;
   }
   return _loc5_;
};
_loc1 = dofus["\x1e\n\x07"]["\x1d\x1b"].prototype;
_loc1.addProperty("mouseClicksMemorizer",function()
{
   return this._oMouseClicksMemorizer;
}
,function()
{
}
);
_loc1.initialize = function()
{
   this._oConfig = _global.CONFIG;
   this._oLang = new dofus["\x1e\n\x07"]["\x10\x13"]();
   this._oUI = dofus["\x10\x16"].getClip().GAPI;
   this._oUI.api = this;
   this._oElectron = new dofus["\x0f\t"](this);
   this._oKernel = new dofus["\f\x04"](this);
   this._oSounds = dofus.sounds.AudioManager.getInstance();
   _global.SOMA = this._oSounds;
   this._oDatacenter = new dofus.datacenter["\x11\r"](this);
   this._oNetwork = new dofus.aks["\x1e\x0f"](this);
   this._oGfx = dofus["\x10\x16"].getClip().BATTLEFIELD;
   if(this._oConfig.isStreaming && this._oConfig.streamingMethod == "explod")
   {
      this._oGfx.initialize(this._oDatacenter,dofus.Constants.OBJECTS_LIGHT_FILE,dofus.Constants.OBJECTS_LIGHT_FILE,dofus.Constants.ACCESSORIES_PATH,this);
   }
   else
   {
      this._oGfx.initialize(this._oDatacenter,dofus.Constants.GROUND_FILE,dofus.Constants.OBJECTS_FILE,dofus.Constants.ACCESSORIES_PATH,this);
   }
   this._oColors = _global.GAC;
   this._oConfig.languages = this._oLang.getConfigText("LANGUAGES_LIST");
   this._oMouseClicksMemorizer = new ank.utils.MouseClicksMemorizer();
   _root.menu = new ank.gapi.controls.RightClickContextMenu(this);
};
_global.ank.gapi.controls.RightClickContextMenu = function(oAPI, callbackFunction)
{
   super(callbackFunction);
   this.hideBuiltInItems();
   var proto = ank.gapi.controls.RightClickContextMenu.prototype;
   this.onSelect = function()
   {
      proto.onRightClick(oAPI);
   };
};
ank.gapi.controls.RightClickContextMenu.prototype = new ContextMenu();
_loc1 = ank.gapi.controls.RightClickContextMenu.prototype;
_loc1.onRightClick = function(api)
{
   api.ui.hideTooltip();
   var _loc12_ = ank.gapi.controls.PopupMenu.currentPopupMenu;
   if(_loc12_ != undefined)
   {
      _loc12_.onMouseUp();
   }
   api.mouseClicksMemorizer.storeCurrentMouseClick(true);
   
   // Verificar que el mouse REALMENTE esté sobre el sprite antes de interactuar
   if(api.gfx.rollOverMcSprite != undefined && !(api.gfx.rollOverMcSprite.data instanceof dofus.datacenter["\f\f"]))
   {
      if(api.gfx.rollOverMcSprite.hitTest(_root._xmouse, _root._ymouse, true))
      {
         api.gfx.onSpriteRelease(api.gfx.rollOverMcSprite,true);
         api.gfx.rollOverMcSprite = undefined;
         api.gfx.rollOverMcObject = undefined;
         return undefined;
      }
      else
      {
         // Mouse no está sobre el sprite, limpiar la referencia
         api.gfx.rollOverMcSprite = undefined;
      }
   }
   
   // Verificar que el mouse REALMENTE esté sobre el objeto antes de interactuar
   if(api.gfx.rollOverMcObject != undefined)
   {
      if(api.gfx.rollOverMcObject.hitTest(_root._xmouse, _root._ymouse, true))
      {
         api.gfx.onObjectRelease(api.gfx.rollOverMcObject,true);
         api.gfx.rollOverMcSprite = undefined;
         api.gfx.rollOverMcObject = undefined;
         return undefined;
      }
      else
      {
         // Mouse no está sobre el objeto, limpiar la referencia
         api.gfx.rollOverMcObject = undefined;
      }
   }
   
   var _loc8_ = api.ui.uiComponents;
   var _loc6_ = 0;
   var _loc7_;
   var _loc3_;
   var _loc4_;
   while(_loc6_ < _loc8_.length)
   {
      _loc7_ = _loc8_[_loc6_].name;
      if(_loc7_ != undefined)
      {
         _loc3_ = api.ui.getUIComponent(_loc7_);
         if(_loc7_ == "MapExplorer")
         {
            _loc3_._mnMap.showPopupGoToPosition();
            return undefined;
         }
         if(_loc3_.currentOverItem instanceof dofus.datacenter["\f\f"])
         {
            if(api.ui.getUIComponent("ItemViewer") != undefined)
            {
               api.ui.unloadUIComponent("ItemViewer");
            }
            _loc3_ = api.ui.loadUIComponent("ItemViewer","ItemViewer",{item:_loc3_.currentOverItem},{bAlwaysOnTop:true});
            _loc3_.hideWarning();
            return undefined;
         }
         _loc4_ = _loc3_.currentOverItem;
         if(_loc4_ instanceof dofus.datacenter["\f\f"])
         {
            _loc3_.itemViewer.createActionPopupMenu(_loc4_);
            return undefined;
         }
         if(_loc4_ instanceof dofus.datacenter["\x1e\x0e\x1c"])
         {
            if(api.datacenter.Game.isFight && (api.kernel.OptionsManager.getOption("RightClickToCast") && !Key.isDown(16)))
            {
               _loc3_.shortcuts.castSpellOnSelf(_loc4_);
            }
            else
            {
               _loc3_.createSpellActionPopupMenu(_loc4_);
            }
            return undefined;
         }
         if(_loc4_ instanceof dofus.datacenter.InventoryShortcutItem)
         {
            _loc3_.createInventoryShortcutItemActionPopupMenu(_loc4_);
            return undefined;
         }
         if(_loc4_ instanceof dofus.datacenter.RapidStuff)
         {
            _loc3_.createRapidStuffShortcutItemActionPopupMenu(_loc4_);
            return undefined;
         }
      }
      _loc6_ += 1;
   }
   var _loc11_;
   if(api.datacenter.Basics.inGame && api.datacenter.Player.isAuthorized)
   {
      _loc11_ = api.kernel.AdminManager.getAdminPopupMenu(api.datacenter.Player.Name,true);
      _loc11_.addItem("Client v" + dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION + " >>",this,this.printRightClickPopupMenu,[api]);
      _loc11_.items.unshift(_loc11_.items.pop());
      _loc11_.show(_root._xmouse,_root._ymouse,true);
   }
   else
   {
      this.printRightClickPopupMenu(api);
   }
};
_loc1.printRightClickPopupMenu = function(api)
{
   var _loc4_ = api.ui.createPopupMenu();
   if(_global.MODO_ELBUSTA)
   {
      _loc4_.addItem("COPY LOGS",this,function()
      {
         System.setClipboard(_global.LOG_TXT);
      }
      );
   }
   _loc4_.addStaticItem("DOFUS RETRO Client v" + dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION);
   _loc4_.addStaticItem("Flash player " + System.capabilities.version);
   var o = {};
   var gapi = api.ui;
   o.selectQualities = function()
   {
      var _loc1_ = gapi.createPopupMenu();
      _loc1_.addStaticItem(api.lang.getText("OPTION_DEFAULTQUALITY"));
      _loc1_.addItem(api.lang.getText("QUALITY_LOW"),o,o.setQualityOption,["low"],o.getOption("DefaultQuality") != "low");
      _loc1_.addItem(api.lang.getText("QUALITY_MEDIUM"),o,o.setQualityOption,["medium"],o.getOption("DefaultQuality") != "medium");
      _loc1_.addItem(api.lang.getText("QUALITY_HIGH"),o,o.setQualityOption,["high"],o.getOption("DefaultQuality") != "high");
      _loc1_.show();
   };
   o.setQualityOption = function(sQuality)
   {
      o.setOption("DefaultQuality",sQuality);
   };
   o.setOption = function(sKey, mValue)
   {
      api.kernel.OptionsManager.setOption(sKey,mValue);
   };
   o.getOption = function(sKey)
   {
      return api.kernel.OptionsManager.getOption(sKey);
   };
   _loc4_.addItem(api.lang.getText("OPTION_DEFAULTQUALITY") + " >>",o,o.selectQualities);
   _loc4_.addItem(api.lang.getText("OPTIONS"),gapi,gapi.loadUIComponent,["Options","Options",{_y:(gapi.screenHeight != 432 ? 0 : -50)},{bAlwaysOnTop:true}]);
   _loc4_.addItem(api.lang.getText("OPTION_MOVABLEBAR"),o,function(sKey, mValue)
   {
      o.setOption(sKey,mValue);
      api.kernel.OptionsManager.onMovableBarOptionChanged();
   }
   ,["MovableBar",!o.getOption("MovableBar")]);
   _loc4_.show(_root._xmouse,_root._ymouse,true);
};
_global.dofus["\x0f\t"] = function(oAPI)
{
   this._bEnabled = dofus["\x0f\t"].isEnabled();
   this._bUseRsaCrypto = _root.RSACrypto != undefined;
   this._bFocused = true;
   this._bShowingWidescreenPanel = true;
   super();
   flash.external.ExternalInterface.addCallback("openClientChatPrefixMenu",this,this.openClientChatPrefixMenu);
   flash.external.ExternalInterface.addCallback("onRetroConsoleHref",this,this.onRetroConsoleHref);
   flash.external.ExternalInterface.addCallback("onRetroChatHref",this,this.onRetroChatHref);
   flash.external.ExternalInterface.addCallback("onRetroChatOpened",this,this.onRetroChatOpened);
   flash.external.ExternalInterface.addCallback("onRetroConsoleOpened",this,this.onRetroConsoleOpened);
   flash.external.ExternalInterface.addCallback("onRetroChatInput",this,this.onRetroChatInput);
   flash.external.ExternalInterface.addCallback("onRetroConsoleInput",this,this.onRetroConsoleInput);
   flash.external.ExternalInterface.addCallback("onRetroChatFunctionKey",this,this.onRetroChatFunctionKey);
   flash.external.ExternalInterface.addCallback("onRetroConsoleFunctionKey",this,this.onRetroConsoleFunctionKey);
   flash.external.ExternalInterface.addCallback("onRetroChatSetFilter",this,this.onRetroChatSetFilter);
   flash.external.ExternalInterface.addCallback("onTelemetryCallback",this,this.onTelemetryCallback);
   flash.external.ExternalInterface.addCallback("onHashCallback",this,this.onHashCallback);
   flash.external.ExternalInterface.addCallback("onKeyManagerKeyUp",this,this.onKeyManagerKeyUp);
   flash.external.ExternalInterface.addCallback("clearCache",this,this.clearCache);
   flash.external.ExternalInterface.addCallback("onTabKey",this,this.onTabKey);
   flash.external.ExternalInterface.addCallback("onRightClick",this,this.onRightClick);
   flash.external.ExternalInterface.addCallback("onWindowFocus",this,this.onWindowFocus);
   flash.external.ExternalInterface.addCallback("onWindowBlur",this,this.onWindowBlur);
   flash.external.ExternalInterface.addCallback("onShowingWidescreenPanel",this,this.onShowingWidescreenPanel);
   flash.external.ExternalInterface.addCallback("onAuthorizedCommandAnswer",this,this.onAuthorizedCommandAnswer);
   flash.external.ExternalInterface.addCallback("getLangText",this,this.getLangText);
   this.initialize(oAPI);
};
dofus["\x0f\t"].prototype = new dofus["\x1e\n\x07"]["\x1d\x19"]();
_loc1 = dofus["\x0f\t"].prototype;
dofus["\x0f\t"].WIDESCREEN_PANEL_CHAT = 0;
dofus["\x0f\t"].WIDESCREEN_PANEL_CONSOLE = 1;
dofus["\x0f\t"].POPUP_MENU_BOTTOMLEFT_POSITION = {x:0.65,y:278};
dofus["\x0f\t"].POPUP_MENU_BOTTOMRIGHT_POSITION = {x:737.6,y:278};
dofus["\x0f\t"].EXTERNAL_INTERFACE_UNDEFINED_TEXT = "|null|";
_loc1.__get__enabled = function()
{
   return this._bEnabled;
};
_loc1.__get__useRsaCrypto = function()
{
   return this._bUseRsaCrypto;
};
_loc1.__get__isWindowFocused = function()
{
   return !this._bEnabled || this._bFocused;
};
_loc1.getLangText = function(sKey, aArgs)
{
   this.api.kernel.debug("getLangText : " + this.api.lang.getText(sKey,aArgs));
   if(!this._bEnabled)
   {
      return "";
   }
   return this.api.lang.getText(sKey,aArgs);
};
_loc1.clearCache = function()
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   this.api.kernel.clearCache();
};
_loc1.onRetroConsoleHref = function(oEvent)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   if(!this.api.network.isConnected)
   {
      return undefined;
   }
   var _loc2_ = !oEvent.rightSide ? dofus["\x0f\t"].POPUP_MENU_BOTTOMLEFT_POSITION : dofus["\x0f\t"].POPUP_MENU_BOTTOMRIGHT_POSITION;
   dofus["\r\x14"].gapi.ui.Debug.onHref({params:oEvent.params},this.api,_loc2_);
};
_loc1.onRetroChatHref = function(oEvent)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   var _loc2_ = this.api.ui.getUIComponent("Banner");
   if(_loc2_ == undefined)
   {
      return undefined;
   }
   var _loc3_ = !oEvent.rightSide ? dofus["\x0f\t"].POPUP_MENU_BOTTOMLEFT_POSITION : dofus["\x0f\t"].POPUP_MENU_BOTTOMRIGHT_POSITION;
   _loc2_.href({params:oEvent.params},_loc3_);
};
_loc1.openClientChatPrefixMenu = function(bRightSide)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   var _loc2_ = this.api.ui.getUIComponent("Banner");
   if(_loc2_ == undefined)
   {
      return undefined;
   }
   var _loc3_ = !bRightSide ? dofus["\x0f\t"].POPUP_MENU_BOTTOMLEFT_POSITION : dofus["\x0f\t"].POPUP_MENU_BOTTOMRIGHT_POSITION;
   _loc2_.openChatPrefixMenu(_loc3_);
};
_loc1.onRetroChatOpened = function()
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   var _loc2_ = this.api.ui.getUIComponent("Banner");
   if(_loc2_ == undefined)
   {
      return undefined;
   }
   this.retroChatRefresh(this.api.kernel.ChatManager.visibleTypes,this.api.kernel.OptionsManager.getOption("TimestampInChat"));
   this.retroChatSetPrefix(_loc2_.chatPrefix);
   // Sincronizar el modo oscuro del chat al abrir el chat de Electron
   this.setChatDarkMode(this.api.kernel.OptionsManager.getOption("ElectronEnableChatDarkMode"));
};
_loc1.onRetroConsoleOpened = function()
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   this.retroConsoleSetHeaderLabel(this.api.datacenter.Basics.aks_a_prompt);
};
_loc1.onRetroChatInput = function(sInput)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   var _loc2_ = this.api.ui.getUIComponent("Banner");
   if(_loc2_ == undefined)
   {
      return undefined;
   }
   this.api.kernel.Console.process(sInput,this.api.datacenter.Basics.chatParams);
   this.api.datacenter.Basics.chatParams = {};
   if(_loc2_.txtConsole != undefined)
   {
      _loc2_.txtConsole = "";
      this.api.electron.retroChatSetPromptText("");
   }
};
_loc1.onRetroConsoleInput = function(sInput)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   if(!this.api.datacenter.Player.isAuthorized)
   {
      return undefined;
   }
   this.api.kernel.DebugConsole.process(sInput);
};
_loc1.onRetroChatSetFilter = function(nChannel, bSubscribe)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   this.api.network.Chat.subscribeChannels(nChannel,bSubscribe);
};
_loc1.onRetroChatFunctionKey = function(oEvent)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   var _loc2_ = this.api.ui.getUIComponent("Banner");
   if(!_loc2_)
   {
      return undefined;
   }
   var _loc6_ = oEvent.keyCode;
   var _loc7_ = oEvent.controlKey;
   var _loc5_ = oEvent.shiftKey;
   var _loc3_;
   switch(_loc6_)
   {
      case 33:
         _loc2_.doChatWhisperHistoryUp();
         break;
      case 34:
         _loc2_.doChatWhisperHistoryDown();
         break;
      case 38:
         if(_loc5_)
         {
            _loc2_.doChatWhisperHistoryUp();
         }
         else
         {
            _loc2_.doChatHistoryUp();
         }
         break;
      case 40:
         if(_loc5_)
         {
            _loc2_.doChatWhisperHistoryDown();
         }
         else
         {
            _loc2_.doChatHistoryDown();
         }
         break;
      case 9:
         _loc3_ = oEvent.currentPrompt;
         if(_loc3_ == dofus["\x0f\t"].EXTERNAL_INTERFACE_UNDEFINED_TEXT)
         {
            _loc3_ = "";
         }
         _loc2_.txtConsole = _loc3_;
         _loc2_.askShowAutoCompleteResult();
      default:
         return;
   }
};
_loc1.onRetroConsoleFunctionKey = function(oEvent)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   var _loc2_ = oEvent.keyCode;
   switch(_loc2_)
   {
      case 38:
         dofus["\r\x14"].gapi.ui.Debug.doConsoleHistoryUp(this.api);
         break;
      case 40:
         dofus["\r\x14"].gapi.ui.Debug.doConsoleHistoryDown(this.api);
         break;
      case 9:
         dofus["\r\x14"].gapi.ui.Debug.askShowAutoCompleteResult(this.api,oEvent.currentPrompt);
      default:
         return;
   }
};
_loc1.onTabKey = function()
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   var _loc2_ = this.api.ui.getUIComponent("Login");
   var _loc3_;
   if(_loc2_ != undefined)
   {
      if(!_loc2_._tiAccount.tabEnabled || !_loc2_._tiPassword.tabEnabled)
      {
         return undefined;
      }
      _loc3_ = eval(Selection.getFocus());
      if(_loc3_ != undefined)
      {
         if(_loc3_ == _loc2_._tiAccount._tText)
         {
            Selection.setFocus(_loc2_._tiPassword._tText);
            return undefined;
         }
         if(_loc3_ == _loc2_._tiPassword._tText)
         {
            if(_loc2_._btnOK.tabEnabled)
            {
               Selection.setFocus(_loc2_._btnOK);
            }
            else
            {
               Selection.setFocus(_loc2_._tiAccount._tText);
            }
            return undefined;
         }
         if(_loc3_ == _loc2_._btnOK)
         {
            Selection.setFocus(_loc2_._tiAccount._tText);
            return undefined;
         }
      }
      else
      {
         Selection.setFocus(_loc2_._tiAccount._tText);
      }
   }
   this.api.kernel.KeyManager.dispatchShortcut("AUTOCOMPLETE");
};
dofus["\x0f\t"].getUserDataTextFileXMLContent = function(xml, sRelativePath)
{
   if(!dofus["\x0f\t"].isEnabled())
   {
      return false;
   }
   var _loc1_ = dofus["\x0f\t"].getUserDataTextFileContent(sRelativePath);
   if(_loc1_ == undefined)
   {
      return false;
   }
   xml.parseXML(_loc1_);
   xml.onLoad(true);
   return true;
};
dofus["\x0f\t"].getUserDataTextFileContent = function(sRelativePath)
{
   if(!dofus["\x0f\t"].isEnabled())
   {
      return undefined;
   }
   var _loc1_ = String(flash.external.ExternalInterface.call("getUserDataTextFileContent",sRelativePath));
   if(_loc1_ == dofus["\x0f\t"].EXTERNAL_INTERFACE_UNDEFINED_TEXT)
   {
      return undefined;
   }
   return _loc1_;
};
_loc1.onAuthorizedCommandAnswer = function(nType, sContent)
{
   if(!this.api.datacenter.Player.isAuthorized)
   {
      return undefined;
   }
   this.api.network.Basics.onAuthorizedCommand(true,nType + "|0|electron|" + sContent);
};
_loc1.retroChatSetPrefix = function(sPrefix)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   if(sPrefix == undefined || sPrefix.length == 0)
   {
      sPrefix = "/s";
   }
   flash.external.ExternalInterface.call("retroChatSetPrefix",sPrefix);
};
_loc1.retroChatInsertPromptText = function(sText)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   if(sText == undefined || sText.length == 0)
   {
      sText = dofus["\x0f\t"].EXTERNAL_INTERFACE_UNDEFINED_TEXT;
   }
   flash.external.ExternalInterface.call("retroChatInsertPromptText",sText);
};
_loc1.retroChatSetPromptText = function(sText, bFocus)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   if(bFocus == undefined)
   {
      bFocus = false;
   }
   if(sText == undefined || sText.length == 0)
   {
      sText = dofus["\x0f\t"].EXTERNAL_INTERFACE_UNDEFINED_TEXT;
   }
   flash.external.ExternalInterface.call("retroChatSetPromptText",{text:sText,focus:bFocus});
};
_loc1.retroConsoleSetPromptText = function(sText, bFocus)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   if(bFocus == undefined)
   {
      bFocus = false;
   }
   if(sText == undefined || sText.length == 0)
   {
      sText = dofus["\x0f\t"].EXTERNAL_INTERFACE_UNDEFINED_TEXT;
   }
   flash.external.ExternalInterface.call("retroConsoleSetPromptText",{text:sText,focus:bFocus});
};
_loc1.retroConsoleSetHeaderLabel = function(sText)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   flash.external.ExternalInterface.call("retroConsoleSetHeaderLabel",{text:sText});
};
_loc1.setWidescreenEnabled = function(bWidescreenEnabled)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   flash.external.ExternalInterface.call("setWidescreenEnabled",bWidescreenEnabled);
};
_loc1.setWidescreenPanelId = function(nWidescreenPanelId)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   flash.external.ExternalInterface.call("setWidescreenPanelId",nWidescreenPanelId);
};
_loc1.getWidescreenPanelId = function()
{
   if(!this._bEnabled)
   {
      return -1;
   }
   var _loc2_ = Number(flash.external.ExternalInterface.call("getWidescreenPanelId"));
   return _loc2_;
};
dofus["\x0f\t"].retroConsoleOpen = function()
{
   if(!dofus["\x0f\t"].isEnabled())
   {
      return undefined;
   }
   flash.external.ExternalInterface.call("retroConsoleOpen");
};
dofus["\x0f\t"].retroChatOpen = function()
{
   if(!dofus["\x0f\t"].isEnabled())
   {
      return undefined;
   }
   flash.external.ExternalInterface.call("retroChatOpen");
};
_loc1.retroConsoleClear = function()
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   flash.external.ExternalInterface.call("retroConsoleClear");
};
_loc1.retroChatClear = function()
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   flash.external.ExternalInterface.call("retroChatClear");
};
_loc1.setChatDarkMode = function(bDarkMode)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   flash.external.ExternalInterface.call("setChatDarkMode",bDarkMode);
};
dofus["\x0f\t"].isEnabled = function()
{
   return _root.electron != undefined;
};
dofus["\x0f\t"].getLanguage = function()
{
   if(!dofus["\x0f\t"].isEnabled())
   {
      return undefined;
   }
   return String(flash.external.ExternalInterface.call("getLanguage"));
};
_loc1.getCurrentDate = function()
{
   if(!this._bEnabled)
   {
      return "";
   }
   return String(flash.external.ExternalInterface.call("getCurrentDate"));
};
_loc1.getYesterdayDate = function()
{
   if(!this._bEnabled)
   {
      return "";
   }
   return String(flash.external.ExternalInterface.call("getYesterdayDate"));
};
_loc1.getContextData = function()
{
   var _loc4_ = {};
   var _loc3_ = this.api.datacenter.Player;
   var _loc2_ = this.api.datacenter.Basics;
   var _loc6_ = [_loc3_.Agility,_loc3_.AgilityTotal,_loc3_.AgilityXtra,_loc3_.AP,_loc3_.BonusPoints,_loc3_.BonusPointsSpell,_loc3_.canAssault,_loc3_.canAttack,_loc3_.canAttackDungeonMonstersWhenMutant,_loc3_.canAttackMonstersAnywhereWhenMutant,_loc3_.canBeMerchant,_loc3_.canChallenge,_loc3_.canChatToAll,_loc3_.canExchange,_loc3_.canMoveInAllDirections,_loc3_.cantInteractWithPrism,_loc3_.cantInteractWithTaxCollector,_loc3_.cantSpeakNPC,_loc3_.canUseInteractiveObjects,_loc3_.canUseObject,_loc3_.Chance,_loc3_.ChanceXtra,_loc3_.color1,_loc3_.color2,_loc3_.color3,_loc3_.craftPublicMode,_loc3_.CriticalHitBonus,_loc3_.currentJobID,_loc3_.currentWeight,_loc3_.Discernment,_loc3_.Energy,_loc3_.EnergyMax,_loc3_.Force,_loc3_.ForceXtra,_loc3_.Guild,_loc3_.huntMatchmakingStatus,_loc3_.ID,_loc3_.Initiative,_loc3_.inParty,_loc3_.Intelligence,_loc3_.IntelligenceXtra,_loc3_.isAuthorized,_loc3_.isCurrentPlayer,_loc3_.isCurrentSpellForced,_loc3_.isHuntMatchmakingActive(),_loc3_.isMutant,_loc3_.isRiding,_loc3_
   .isSkippingFightAnimations,_loc3_.isSkippingLootPanel,_loc3_.Kama,_loc3_.Level,_loc3_.LP,_loc3_.LPmax,_loc3_.MaxSummonedCreatures,_loc3_.maxWeight,_loc3_.mountXPPercent,_loc3_.MP,_loc3_.Name,_loc3_.RangeModerator,_loc3_.restrictions,_loc3_.Sex,_loc3_.subscriber,_loc3_.SummonedCreatures,_loc3_.Vitality,_loc3_.VitalityXtra,_loc3_.Wisdom,_loc3_.WisdomXtra,_loc3_.XP,_loc3_.XPhigh,_loc3_.XPlow,_loc3_.zaapToken];
   var _loc5_ = [_loc2_.aks_a_logs,_loc2_.aks_a_prompt,_loc2_.aks_can_generate_names,_loc2_.aks_chat_lastActionTime,_loc2_.aks_community_id,_loc2_.aks_connection_server,_loc2_.aks_connection_server_port,_loc2_.aks_current_map_id,_loc2_.aks_current_regional_version,_loc2_.aks_current_team,_loc2_.aks_debug_command_line,_loc2_.aks_detected_country,_loc2_.aks_emote_lastActionTime,_loc2_.aks_exchange_echangeType,_loc2_.aks_exchange_isForgemagus,_loc2_.aks_game_end_bonus,_loc2_.aks_gameserver_ip,_loc2_.aks_gameserver_port,_loc2_.aks_identity,_loc2_.aks_incoming_server_id,_loc2_.aks_infos_lifeRestoreInterval,_loc2_.aks_is_free_community,_loc2_.aks_notify_on_friend_connexion,_loc2_.aks_rescue_count,_loc2_.aks_secret_question,_loc2_.aks_server_will_disconnect,_loc2_.aks_ticket,_loc2_.allowedAdminCommands,_loc2_.canUseSeeAllSpell,_loc2_.characterSwitchTicket,_loc2_.communityId,_loc2_.connexionKey,_loc2_.createCharacter,_loc2_.dofusPseudo,_loc2_.first_connection_from_miniclip,_loc2_.first_movement,_loc2_
   .forceAutomaticServerSelection,_loc2_.forceFlashChat,_loc2_.forceManualServerSelection,_loc2_.gfx_canLaunch,_loc2_.gfx_isSpritesHidden,_loc2_.gfx_lastActionTime,_loc2_.gfx_lastArea,_loc2_.gfx_lastSubarea,_loc2_.hasCreatedCharacter,_loc2_.hasForcedManualSelection,_loc2_.ignoreCreateCharacter,_loc2_.ignoreMigration,_loc2_.inactivity_signaled,_loc2_.inGame,_loc2_.inventory_filter,_loc2_.isCraftLooping,_loc2_.isCreatingNewCharacter,_loc2_.isLogged,_loc2_.kbArticle,_loc2_.kbCategory,_loc2_.kbDisplayType,_loc2_.kbSearch,_loc2_.lastDateUpdate,_loc2_.lastPingTimer,_loc2_.login,_loc2_.mapExplorer_grid,_loc2_.mapExplorer_zoom,_loc2_.payzone_isFirst,_loc2_.pvpHuntedSpriteID,_loc2_.quests_lastID,_loc2_.serverHost,_loc2_.serverMessageID,_loc2_.serverPort,_loc2_.spellManager_errorMsg,_loc2_.kamas_lastGained,_loc2_.exp_lastGained,_loc2_.guildExp_lastGained,_loc2_.mountExp_lastGained,_loc2_.isSubscribedConquestFeed];
   _loc4_.player = _loc6_;
   _loc4_.basics = _loc5_;
   return _loc4_;
};
_loc1.getTelemetry = function(sExtraData)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   var _loc2_ = new ank["\x1e\n\x07"]["\x0e\x1c"](sExtraData).externalInterfaceEscape();
   flash.external.ExternalInterface.call("getTelemetry",_loc2_,this.getContextData());
};
_loc1.getHash = function()
{
   flash.external.ExternalInterface.call("getHash");
};
_loc1.onTelemetryCallback = function(oTelemetryCallback)
{
   var _loc2_ = oTelemetryCallback.answer;
   this.api.network.send("HT" + _loc2_,undefined,undefined,true);
};
_loc1.onHashCallback = function(oHashCallback)
{
   var _loc2_ = oHashCallback.answer;
   this.api.network.Basics.autorisedCommand("hash add auto " + _loc2_);
};
_loc1.setLanguage = function(sLanguage)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   flash.external.ExternalInterface.call("setLanguage",sLanguage);
};
_loc1.__get__isShowingWidescreenPanel = function()
{
   return this._bEnabled && this._bShowingWidescreenPanel;
};
_loc1_.getRandomNetworkKey = function()
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   return String(flash.external.ExternalInterface.call("getRandomNetworkKey"));
};
_loc1.hasSystemInformations = function()
{
   if(!this._bEnabled)
   {
      return false;
   }
   return flash.external.ExternalInterface.call("hasSystemInformations");
};
_loc1.getSystemInformation = function(sType)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   return flash.external.ExternalInterface.call("getSystemInformation",sType);
};
_loc1.onWindowFocus = function()
{
   this.api.kernel.debug("onWindowFocus");
   if(this._bFocused)
   {
      return undefined;
   }
   var _loc4_ = this.api.gfx.spriteHandler.getSprites().getItems();
   var _loc2_;
   var _loc3_;
   for(var _loc5_ in _loc4_)
   {
      _loc2_ = _loc4_[_loc5_];
      if(!(!_loc2_.isInMove || _loc2_.moveSpeedType == undefined))
      {
         _loc3_ = ank.battlefield.mc.Sprite(_loc2_.mc);
         _loc3_.setAnim(_loc2_.moveAnimation != undefined ? _loc2_.moveAnimation : _loc2_.moveSpeedType);
      }
   }
   this._bFocused = true;
};
_loc1.onWindowBlur = function()
{
   this.api.kernel.debug("onWindowBlur","INFO_CHAT");
   if(!this._bFocused)
   {
      return undefined;
   }
   var _loc4_ = this.api.gfx.spriteHandler.getSprites().getItems();
   var _loc2_;
   var _loc3_;
   for(var _loc5_ in _loc4_)
   {
      _loc2_ = _loc4_[_loc5_];
      if(_loc2_.isInMove)
      {
         _loc3_ = ank.battlefield.mc.Sprite(_loc2_.mc);
         _loc3_.setAnim("static");
      }
   }
   this._bFocused = false;
};
_loc1.onShowingWidescreenPanel = function(bShow)
{
   this.api.kernel.debug("onShowingWidescreenPanel");
   this._bShowingWidescreenPanel = bShow;
   var _loc2_ = this.api.ui.getUIComponent("Banner");
   if(_loc2_ != undefined)
   {
      _loc2_.configureUseFlashChat(this.api.datacenter.Basics.forceFlashChat || (!this.api.kernel.OptionsManager.getOption("EnableWidescreenPanels") || !bShow));
   }
};
_loc1.getCautionIcon = function()
{
   if(!this._bEnabled)
   {
      return "<img src=\"CautionIcon\" hspace=\'0\' vspace=\'0\' width=\'13\' height=\'13\' />";
   }
   return "<element class=\"emojiFont\">?</element> ";
};
_loc1.initialize = function(oAPI)
{
   super.initialize(oAPI);
   if(this._bEnabled)
   {
      this._bShowingWidescreenPanel = flash.external.ExternalInterface.call("isShowingWidescreenPanel");
   }
};
_loc1.getHtmlStrippedString = function(sHtml)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   return String(flash.external.ExternalInterface.call("stripHtml",sHtml));
};
_loc1.getXmlEscapedString = function(sInput)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   return String(flash.external.ExternalInterface.call("escapeXml",sInput));
};
_loc1.getRandomNetworkKey = function()
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   return String(flash.external.ExternalInterface.call("getRandomNetworkKey"));
};
_loc1.setIngameDiscordActivity = function()
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   var _loc8_ = "Elbusta Retro v" + dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION;
   var _loc5_ = this.api.lang.getText("CURRENT_SERVER",[this.api.datacenter.Basics.aks_current_server.label]);
   var _loc6_ = this.api.datacenter.Player.Name;
   var _loc3_ = this.api.datacenter.Basics.dofusPseudo;
   var _loc4_ = this.api.lang.getClassText(this.api.datacenter.Player.Guild).ln;
   var _loc7_ = this.api.datacenter.Player.Guild;
   var _loc2_ = this.api.datacenter.Player.Sex;
   flash.external.ExternalInterface.call("setIngameDiscordActivity",_loc8_,_loc5_,_loc6_,_loc3_,_loc4_,_loc7_,_loc2_);
};
_loc1.log = function(sMessage, bError)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   dofus["\x0f\t"].doLog(sMessage,bError);
};
dofus["\x0f\t"].doLog = function(sMessage, bError)
{
   if(bError == undefined)
   {
      bError = false;
   }
   var _loc2_ = new ank["\x1e\n\x07"]["\x0e\x1c"](sMessage).externalInterfaceEscape();
   flash.external.ExternalInterface.call("userLog",_loc2_,bError);
};
_loc1.retroChatRefresh = function(aVisibleTypes, bShowTimestampNewState)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   flash.external.ExternalInterface.call("retroChatRefresh",aVisibleTypes,bShowTimestampNewState);
};
_loc1.onKeyManagerKeyUp = function()
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   this.api.kernel.KeyManager.onKeyUp();
};
_loc1.focusWidescreenPanelIfPossible = function()
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   flash.external.ExternalInterface.call("focusWidescreenPanelIfPossible");
};
_loc1.consoleLog = function(sType, sServerText, bAlreadyEscapedForExternalInterface)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   var _loc2_;
   if(!bAlreadyEscapedForExternalInterface)
   {
      _loc2_ = new ank["\x1e\n\x07"]["\x0e\x1c"](sServerText).externalInterfaceEscape();
      flash.external.ExternalInterface.call("consoleLog",sType,_loc2_);
   }
   else
   {
      flash.external.ExternalInterface.call("consoleLog",sType,sServerText);
   }
};
_loc1.showMenuBar = function(bShow)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   flash.external.ExternalInterface.call("showMenuBar",bShow);
};
_loc1.consolePrint = function(sServerText, sType, oGrid, bAlreadyEscapedForExternalInterface)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   var _loc2_;
   if(!bAlreadyEscapedForExternalInterface)
   {
      _loc2_ = new ank["\x1e\n\x07"]["\x0e\x1c"](sServerText).externalInterfaceEscape();
      flash.external.ExternalInterface.call("consolePrint",_loc2_,sType,oGrid);
   }
   else
   {
      flash.external.ExternalInterface.call("consolePrint",sServerText,sType,oGrid);
   }
};
_loc1.chatLog = function(sRawText)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   var _loc2_ = new ank["\x1e\n\x07"]["\x0e\x1c"](sRawText).externalInterfaceEscape();
   flash.external.ExternalInterface.call("chatLog",_loc2_);
};
_loc1.chatPrint = function(sText, sColor, sUniqId, nType, sTime)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   var _loc2_ = new ank["\x1e\n\x07"]["\x0e\x1c"](sText).externalInterfaceEscape();
   flash.external.ExternalInterface.call("chatPrint",_loc2_,sColor,sUniqId,nType,sTime);
};
_loc1.debugRequest = function(bSend, sData)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   var _loc3_ = this.api.datacenter.Player.Name;
   var _loc2_ = this.api.datacenter.Basics.aks_current_server.label;
   var _loc4_ = new ank["\x1e\n\x07"]["\x0e\x1c"](sData).externalInterfaceEscape();
   flash.external.ExternalInterface.call("debugRequest",bSend,dofus.Constants.LOG_DATAS,_loc4_,_loc3_,_loc2_);
};
_loc1.applyPacketToSendPostProcessing = function(sData)
{
   if(!this._bEnabled)
   {
      return sData;
   }
   var _loc3_ = new ank["\x1e\n\x07"]["\x0e\x1c"](sData).externalInterfaceEscape();
   var _loc2_ = String(flash.external.ExternalInterface.call("applyPacketToSendPostProcessing",_loc3_));
   if(_loc2_ == dofus.Constants.EXTERNAL_INTERFACE_UNDEFINED_TEXT)
   {
      return sData;
   }
   return _loc2_;
};
_loc1.onPacketSent = function(sData)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   var _loc2_ = new ank["\x1e\n\x07"]["\x0e\x1c"](sData).externalInterfaceEscape();
   flash.external.ExternalInterface.call("onPacketSent",_loc2_);
};
_loc1.onPacketReceived = function(sData)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   var _loc2_ = new ank["\x1e\n\x07"]["\x0e\x1c"](sData).externalInterfaceEscape();
   flash.external.ExternalInterface.call("onPacketReceived",_loc2_);
};
_loc1.setLoginDiscordActivity = function()
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   var _loc3_ = "Client v" + dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION;
   var _loc2_ = "Build " + dofus.Constants.VERSIONDATE;
   flash.external.ExternalInterface.call("setLoginDiscordActivity",_loc3_,_loc2_);
};
_loc1.makeNotification = function(sContent)
{
   if(!this._bEnabled || sContent == undefined)
   {
      return undefined;
   }
   sContent = sContent.split("<b>").join("");
   sContent = sContent.split("</b>").join("");
   sContent = sContent.split("<u>").join("");
   sContent = sContent.split("</u>").join("");
   var _loc3_ = new ank["\x1e\n\x07"]["\x0e\x1c"](sContent).externalInterfaceEscape();
   flash.external.ExternalInterface.call("makeNotification",_loc3_);
};
_loc1.updateWindowTitle = function(sPlayerName)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   var _loc2_ = "";
   if(sPlayerName != undefined)
   {
      _loc2_ = sPlayerName + " - ";
   }
   _loc2_ = _loc2_ + "Elbusta Retro v" + dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION;
   flash.external.ExternalInterface.call("changeTitle",_loc2_);
};
_loc1.setInitialized = function()
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   flash.external.ExternalInterface.call("setInitialized");
};
_loc1.onRightClick = function()
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   _root.menu.onRightClick(this.api);
};
_loc1.printRightClickPopupMenu = function()
{
   var _loc3_ = this.api.ui.createPopupMenu();
   _loc3_.addStaticItem("DOFUS RETRO Client v" + dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION);
   _loc3_.addStaticItem("Flash player " + System.capabilities.version);
   var o = new Object();
   var api = this.api;
   var gapi = this.api.ui;
   o.selectQualities = function()
   {
      var _loc1_ = gapi.createPopupMenu();
      _loc1_.addStaticItem(api.lang.getText("OPTION_DEFAULTQUALITY"));
      _loc1_.addItem(api.lang.getText("QUALITY_LOW"),o,o.setQualityOption,["low"],o.getOption("DefaultQuality") != "low");
      _loc1_.addItem(api.lang.getText("QUALITY_MEDIUM"),o,o.setQualityOption,["medium"],o.getOption("DefaultQuality") != "medium");
      _loc1_.addItem(api.lang.getText("QUALITY_HIGH"),o,o.setQualityOption,["high"],o.getOption("DefaultQuality") != "high");
      _loc1_.addItem(api.lang.getText("QUALITY_BEST"),o,o.setQualityOption,["best"],o.getOption("DefaultQuality") != "best");
      _loc1_.show();
   };
   o.setQualityOption = function(_loc2_)
   {
      o.setOption("DefaultQuality",_loc2_);
   };
   o.setOption = function(_loc2_, _loc3_)
   {
      api.kernel.OptionsManager.setOption(_loc2_,_loc3_);
   };
   o.getOption = function(_loc2_)
   {
      return api.kernel.OptionsManager.getOption(_loc2_);
   };
   _loc3_.addItem(api.lang.getText("OPTION_DEFAULTQUALITY") + " >>",o,o.selectQualities);
   _loc3_.addItem(api.lang.getText("OPTIONS"),gapi,gapi.loadUIComponent,["Options","Options",{_y:(gapi.screenHeight != 432 ? 0 : -50)},{bAlwaysOnTop:true}]);
   _loc3_.addItem(api.lang.getText("ZOOM"),api.ui,api.ui.loadUIAutoHideComponent,["Zoom","Zoom",{sprite:api.datacenter.Player.data}],api.gfx.isMapBuild && api.gfx.isContainerVisible);
   _loc3_.addItem(api.lang.getText("OPTION_MOVABLEBAR"),o,o.setOption,["MovableBar",!o.getOption("MovableBar")]);
   _loc3_.show(_root._xmouse,_root._ymouse,true);
};
_loc1.addProperty("isShowingWidescreenPanel",_loc1.__get__isShowingWidescreenPanel,function()
{
}
);
_loc1.addProperty("enabled",_loc1.__get__enabled,function()
{
}
);
_loc1.addProperty("useRsaCrypto",_loc1.__get__useRsaCrypto,function()
{
}
);
_loc1.addProperty("isWindowFocused",_loc1.__get__isWindowFocused,function()
{
}
);
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
_loc1 = dofus["\x1e\n\x07"]["\x12\x05"]["\x11\x07"].prototype;
_loc1.process = function(_loc3_)
{
   super.process(_loc3_);
   if(_loc3_.charAt(0) == "/")
   {
      var _loc4_ = _loc3_.split(" ");
      var _loc5_ = _loc4_[0].substr(1).toUpperCase();
      _loc4_.splice(0,1);
      switch(_loc5_)
      {
         case "FORCECHAT":
            if(_loc4_[0] == "1")
            {
               this.api.datacenter.Basics.forceFlashChat = true;
            }
            else if(_loc4_[0] == "0")
            {
               this.api.datacenter.Basics.forceFlashChat = false;
            }
            else
            {
               this.api.datacenter.Basics.forceFlashChat = !this.api.datacenter.Basics.forceFlashChat;
            }
            this.api.kernel.showMessage(undefined,"FORCE FLASH CHAT : " + this.api.datacenter.Basics.forceFlashChat,"DEBUG_LOG");
            var uiBanner = this.api.ui.getUIComponent("Banner");
            if(uiBanner != undefined)
            {
               var _loc82_ = this.api.datacenter.Basics.forceFlashChat || !this.api.kernel.OptionsManager.getOption("EnableWidescreenPanels") || !this.api.electron.isShowingWidescreenPanel;
               _loc82_ = this.api.datacenter.Basics.forceFlashChat;
               uiBanner.configureUseFlashChat(_loc82_);
            }
            break;
         case "TOGGLESPRITES":
            this.api.datacenter.Basics.gfx_isSpritesHidden = !this.api.datacenter.Basics.gfx_isSpritesHidden;
            if(this.api.datacenter.Basics.gfx_isSpritesHidden)
            {
               this.api.gfx.spriteHandler.maskAllSprites();
               break;
            }
            this.api.gfx.spriteHandler.unmaskAllSprites();
            break;
         case "CLEANCELLS":
            this.api.gfx.mapHandler.resetEmptyCells();
            break;
         case "SEQACTIONS":
            var _loc6_ = this.api.datacenter.Sprites.getItems();
            for(var k in _loc6_)
            {
               var _loc7_ = k;
               var _loc8_ = _loc6_[_loc7_];
               var _loc9_ = _loc8_.sequencer;
               this.api.kernel.showMessage(undefined,"    Print Sequencer Actions List for " + _loc7_ + ", " + _loc8_.name,"DEBUG_LOG");
               _loc9_.printActions();
            }
            break;
         case "INFOS":
            var _loc10_ = "Svr:\nNb:";
            _loc10_ += "\n Map  : " + String(this.api.datacenter.Game.playerCount);
            _loc10_ += "\n Cell : " + this.api.datacenter.Map.data[this.api.datacenter.Player.data.cellNum].spriteOnCount;
            _loc10_ += "\nDataServers:";
            var _loc11_ = 0;
            while(_loc11_ < this.api.config.dataServers.length)
            {
               _loc10_ += "\n host : " + this.api.config.dataServers[_loc11_].url;
               _loc11_ += 1;
            }
            _loc10_ += "\n l   : " + this.api.config.language + " (" + this.api.lang.getLangVersion() + " & " + this.api.lang.getXtraVersion() + ")";
            this.api.kernel.showMessage(undefined,_loc10_,"DEBUG_LOG");
            break;
         case "ZOOM":
            this.api.kernel.GameManager.zoomGfx(_loc4_[0],_loc4_[1],_loc4_[2]);
            break;
         case "TIMERSCOUNT":
            this.api.kernel.showMessage(undefined,String(ank["\x1e\n\x07"]["\x1e\x0b\x02"].getTimersCount()),"DEBUG_LOG");
            break;
         case "VARS":
            this.api.kernel.showMessage(undefined,this.api.kernel.TutorialManager.vars,"DEBUG_LOG");
            break;
         case "MOUNT":
            var _loc12_ = this.api.gfx.getSprite(this.api.datacenter.Player.ID);
            if(!_loc12_.isMounting)
            {
               var _loc13_ = _loc4_[0] != undefined ? _loc4_[0] + ".swf" : "7002.swf";
               var _loc14_ = _loc4_[1] != undefined ? _loc4_[1] + ".swf" : "10.swf";
               var _loc15_ = new ank.battlefield.datacenter.Mount(dofus.Constants.CLIPS_PERSOS_PATH + _loc13_,dofus.Constants.CHEVAUCHOR_PATH + _loc14_);
               this.api.gfx.mountSprite(this.api.datacenter.Player.ID,_loc15_);
               break;
            }
            this.api.gfx.unmountSprite(this.api.datacenter.Player.ID);
            break;
         case "SCALE":
            this.api.gfx.setSpriteScale(this.api.datacenter.Player.ID,_loc4_[0],_loc4_.length == 2 ? _loc4_[1] : _loc4_[0]);
            break;
         case "ANIM":
            if(dofus.Constants.DEBUG)
            {
               if(_loc4_.length > 1)
               {
                  this.api.gfx.setSpriteLoopAnim(this.api.datacenter.Player.ID,_loc4_[0],_loc4_[1]);
                  break;
               }
               this.api.gfx.setSpriteAnim(this.api.datacenter.Player.ID,_loc4_.join(""));
            }
            break;
         case "EVAL":
            var eee = _loc4_.join(" ");
            eval(eee);
            break;
         case "C":
            var _loc16_ = _loc4_[0];
            _loc4_.splice(0,1);
            switch(_loc16_)
            {
               case ">":
                  this.api.network.send(_loc4_.join(" "));
                  break;
               case "<":
                  this.api.network.processCommand(_loc4_.join(" "));
            }
            break;
         case "D":
            var _loc17_ = _loc4_[0];
            _loc4_.splice(0,1);
            switch(_loc17_)
            {
               case ">":
                  this.api.network.send(_loc4_.join(" "),false,undefined,false,true);
                  break;
               case "<":
                  this.api.network.processCommand(_loc4_.join(" "));
            }
            break;
         case "DEBUGZAAP":
            dofus["\x1e\t\x06"].newInstance();
            break;
         case "PRINTJAILDIALOG":
            var _loc18_ = this.api.kernel.ChatManager.getJailDialog();
            if(_loc18_.length == 0)
            {
               this.api.kernel.showMessage(undefined,"No jail dialog found","DEBUG_LOG");
               break;
            }
            this.api.kernel.showMessage(undefined,_loc18_,"DEBUG_LOG");
            break;
         case "MAKEREPORT":
            if(!this.api.electron.enabled)
            {
               this.api.kernel.showMessage(undefined,"This feature is not compatible on a Flash Projector","ERROR_CHAT");
               return undefined;
            }
            if(!dofus["\x0b\b"].AdminManager.getInstance().isExecutingBatch)
            {
               this.api.kernel.showMessage(undefined,"You can\'t do this out of a batch execution.","ERROR_CHAT");
               return undefined;
            }
            var _loc19_ = _loc3_.split("|");
            var _loc20_ = _loc19_[0].substring(_loc5_.length + 2);
            var _loc21_ = _loc19_[1] == "allaccounts";
            var _loc22_ = _loc19_[2];
            var _loc23_ = _loc19_[3].split(",");
            if(_loc20_ == undefined || (_loc20_.length < 1 || (_loc22_ == undefined || _loc22_.length < 1)))
            {
               this.api.kernel.showMessage(undefined,"/makereport &lt;target pseudos|\'allaccounts\'|reason|[autocomplete action]&gt;","DEBUG_LOG");
               return undefined;
            }
            var _loc24_;
            var _loc25_;
            if(_loc23_ != undefined)
            {
               var _loc26_ = 0;
               while(_loc26_ < _loc23_.length)
               {
                  var _loc27_ = _loc23_[_loc26_];
                  switch(_loc27_)
                  {
                     case "chatmessage":
                        _loc24_ = this.api.kernel.GameManager.lastClickedMessage;
                        break;
                     case "jaildialog":
                        _loc25_ = this.api.kernel.ChatManager.getJailDialog();
                  }
                  _loc26_ += 1;
               }
            }
            var _loc28_ = dofus["\r\x14"].gapi.ui.MakeReport(this.api.ui.getUIComponent("MakeReport"));
            if(_loc28_ == undefined)
            {
               this.api.datacenter.Temporary.Report = new Object();
               var _loc29_ = this.api.datacenter.Temporary.Report;
               _loc29_.currentTargetPseudos = _loc20_;
               _loc29_.currentTargetIsAllAccounts = _loc21_;
               _loc29_.targetPseudos = _loc20_;
               _loc29_.description = _loc24_;
               _loc29_.jailDialog = _loc25_;
               _loc29_.isAllAccounts = _loc21_;
               _loc29_.reason = _loc22_;
            }
            else
            {
               var _loc30_ = this.api.datacenter.Temporary.Report;
               _loc30_.currentTargetPseudos = _loc20_;
               _loc30_.currentTargetIsAllAccounts = _loc21_;
               _loc30_.targetPseudos += "," + _loc20_;
               _loc30_.description = _loc24_;
            }
            this.api.network.Basics.askReportInfos(1,_loc20_,_loc21_);
            break;
         case "FASTSERVERSWITCH":
            var _loc31_ = Number(_loc4_[0]);
            if(_global.isNaN(_loc31_) || _loc31_ == undefined)
            {
               this.api.kernel.showMessage(undefined,"I need a valid server ID !","DEBUG_LOG");
               return undefined;
            }
            var _loc32_ = this.api.datacenter.Player.Name;
            if(_loc32_ == undefined)
            {
               this.api.kernel.showMessage(undefined,"You have to be in game to do this","DEBUG_LOG");
               return undefined;
            }
            var _loc33_ = new Object();
            _loc33_.serverId = _loc31_;
            _loc33_.playerName = _loc32_;
            dofus["\f\x04"].FAST_SWITCHING_SERVER_REQUEST = _loc33_;
            this.api.network.disconnect(true,false,false);
            break;
         case "CLEAR":
            this.api.ui.getUIComponent("Debug").clear();
            break;
         case "FILEOUTPUT":
            if(this.api.electron.enabled)
            {
               var _loc34_ = this.api.ui.getUIComponent("Debug");
               if(_loc34_ == undefined)
               {
                  _loc34_ = this.api.ui.loadUIComponent("Debug","Debug",undefined,{bAlwaysOnTop:true});
               }
               var _loc35_ = Number(_loc4_[0]);
               if(_loc4_[0] == undefined || (_global.isNaN(_loc35_) || (_loc35_ < 0 || _loc35_ > 2)))
               {
                  this.api.kernel.showMessage(undefined,"/fileoutput &lt;0 (disabled) | 1 (enabled) | 2 (full)&gt;","DEBUG_LOG");
                  return undefined;
               }
               var _loc36_ = "";
               switch(_loc35_)
               {
                  case 0:
                     _loc36_ = "Disabled";
                     break;
                  case 1:
                     _loc36_ = "Enabled";
                     break;
                  case 2:
                     _loc36_ = "Enabled (full)";
               }
               _loc34_.fileOutput = _loc35_;
               this.api.kernel.showMessage(undefined,"File Output (Console) : " + _loc36_,"DEBUG_LOG");
               break;
            }
            this.api.kernel.showMessage(undefined,"Does not work on a Flash Projector","DEBUG_ERROR");
            break;
         case "LOGDISCO":
            if(_loc4_[0] == "1")
            {
               this.api.datacenter.Game.isLoggingMapDisconnections = true;
            }
            else if(_loc4_[0] == "0")
            {
               this.api.datacenter.Game.isLoggingMapDisconnections = false;
            }
            else
            {
               this.api.datacenter.Game.isLoggingMapDisconnections = !this.api.datacenter.Game.isLoggingMapDisconnections;
            }
            this.api.kernel.showMessage(undefined,"LOG DISCONNECTIONS ON MAP : " + this.api.datacenter.Game.isLoggingMapDisconnections,"DEBUG_LOG");
            break;
         case "PING":
            this.api.network.ping();
            break;
         case "MAPID":
            this.api.kernel.showMessage(undefined,"carte : " + this.api.datacenter.Map.id,"DEBUG_LOG");
            this.api.kernel.showMessage(undefined,"Area : " + this.api.datacenter.Map.area,"DEBUG_LOG");
            this.api.kernel.showMessage(undefined,"Sub area : " + this.api.datacenter.Map.subarea,"DEBUG_LOG");
            this.api.kernel.showMessage(undefined,"Super Area : " + this.api.datacenter.Map.superarea,"DEBUG_LOG");
            break;
         case "CELLID":
            this.api.kernel.showMessage(undefined,"cellule : " + this.api.datacenter.Player.data.cellNum,"DEBUG_LOG");
            break;
         case "TIME":
            this.api.kernel.showMessage(undefined,"Heure : " + this.api.kernel.NightManager.time,"DEBUG_LOG");
            break;
         case "CACHE":
            this.api.kernel.askClearCache();
            break;
         case "REBOOT":
            this.api.kernel.reboot();
            break;
         case "FPS":
            this.api.ui.getUIComponent("Debug").showFps();
            break;
         case "UI":
            this.api.ui.loadUIComponent(_loc4_[0],_loc4_[0]);
            break;
         case "DEBUG":
            dofus.Constants.DEBUG = !dofus.Constants.DEBUG;
            this.api.kernel.showMessage(undefined,"DEBUG : " + dofus.Constants.DEBUG,"DEBUG_LOG");
            break;
         case "ASKOK":
            this.api.ui.loadUIComponent("AskOk","AskOkContent",{title:"AskOKDebug",text:this.api.lang.getText(_loc4_[0],_loc4_.splice(1))});
            break;
         case "ASKOK2":
            var _loc37_ = "";
            var _loc38_ = 0;
            while(_loc38_ < _loc4_.length)
            {
               if(_loc38_ > 0)
               {
                  _loc37_ += " ";
               }
               _loc37_ += _loc4_[_loc38_];
               _loc38_ += 1;
            }
            this.api.ui.loadUIComponent("AskOk","AskOkContent",{title:"AskOKDebug",text:_loc37_});
            break;
         case "MOVIECLIP":
            this.api.kernel.findMovieClipPath();
            break;
         case "LOS":
            var _loc39_ = Number(_loc4_[0]);
            var _loc40_ = Number(_loc4_[1]);
            if(_global.isNaN(_loc39_) || (_loc39_ == undefined || (_global.isNaN(_loc40_) || _loc40_ == undefined)))
            {
               this.api.kernel.showMessage(undefined,"Unable to resolve case ID","DEBUG_LOG");
               return undefined;
            }
            this.api.kernel.showMessage(undefined,"Line of sight between " + _loc39_ + " and " + _loc40_ + " -> " + ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].checkView(this.api.gfx.mapHandler,_loc39_,_loc40_),"DEBUG_LOG");
            break;
         case "CLEARCELL":
            var _loc41_ = Number(_loc4_[0]);
            if(_global.isNaN(_loc41_) || _loc41_ == undefined)
            {
               this.api.kernel.showMessage(undefined,"I\'ll need an ID!","DEBUG_LOG");
               return undefined;
            }
            this.api.gfx.mapHandler.getCellData(_loc41_).removeAllSpritesOnID();
            this.api.kernel.showMessage(undefined,"Cell " + _loc41_ + " cleaned.","DEBUG_LOG");
            break;
         case "CELLINFO":
            var _loc42_ = Number(_loc4_[0]);
            if(_global.isNaN(_loc42_) || _loc42_ == undefined)
            {
               this.api.kernel.showMessage(undefined,"I\'ll need an ID!","DEBUG_LOG");
               return undefined;
            }
            var _loc43_ = this.api.gfx.mapHandler.getCellData(_loc42_);
            this.api.kernel.showMessage(undefined,"Datas about cell " + _loc42_ + ":","DEBUG_LOG");
            for(var k in _loc43_)
            {
               this.api.kernel.showMessage(undefined,"    " + k + " -> " + _loc43_[k],"DEBUG_LOG");
               if(_loc43_[k] instanceof Object)
               {
                  for(var l in _loc43_[k])
                  {
                     this.api.kernel.showMessage(undefined,"        " + l + " -> " + _loc43_[k][l],"DEBUG_LOG");
                  }
               }
            }
            break;
         case "LANGFILE":
            this.api.kernel.showMessage(undefined,_loc4_[0] + " lang file size : " + this.api.lang.getLangFileSize(_loc4_[0]) + " octets","DEBUG_LOG");
            break;
         case "POINTSPRITE":
            this.api.kernel.TipsManager.pointSprite(-1,Number(_loc4_[0]));
            break;
         case "LISTSPRITES":
            var _loc44_ = this.api.gfx.spriteHandler.getSprites().getItems();
            for(var k in _loc44_)
            {
               this.api.kernel.showMessage(undefined,"Sprite " + _loc44_[k].gfxFile,"DEBUG_LOG");
            }
            break;
         case "LISTPICTOS":
            var _loc45_ = this.api.gfx.mapHandler.getCellsData();
            for(var k in _loc45_)
            {
               if(_loc45_[k].layerObject1Num != undefined && (!_global.isNaN(_loc45_[k].layerObject1Num) && _loc45_[k].layerObject1Num > 0))
               {
                  this.api.kernel.showMessage(undefined,"Picto " + _loc45_[k].layerObject1Num,"DEBUG_LOG");
               }
               if(_loc45_[k].layerObject2Num != undefined && (!_global.isNaN(_loc45_[k].layerObject2Num) && _loc45_[k].layerObject2Num > 0))
               {
                  this.api.kernel.showMessage(undefined,"Picto " + _loc45_[k].layerObject2Num,"DEBUG_LOG");
               }
            }
            break;
         case "POINTPICTO":
            this.api.kernel.TipsManager.pointPicto(-1,Number(_loc4_[0]));
            break;
         case "SAVETHEWORLD":
            if(dofus.Constants.SAVING_THE_WORLD)
            {
               dofus["\x1e\x14\x0f"].execute();
               break;
            }
            this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc5_]),"DEBUG_ERROR");
            break;
         case "STOPSAVETHEWORLD":
            if(dofus.Constants.SAVING_THE_WORLD)
            {
               dofus["\x1e\x14\x0f"].stop();
               break;
            }
            this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc5_]),"DEBUG_ERROR");
            break;
         case "NEXTSAVE":
            if(dofus.Constants.SAVING_THE_WORLD)
            {
               dofus["\x1e\x14\x0f"].getInstance().nextAction();
               break;
            }
            this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc5_]),"DEBUG_ERROR");
            break;
         case "SOMAPLAY":
            var _loc46_ = _loc4_.join(" ");
            this.api.kernel.AudioManager.playSound(_loc46_);
            break;
         case "SKIPFIGHTANIMATIONS":
            if(!dofus.Constants.ALPHA)
            {
               if(!this.api.datacenter.Player.isAuthorized)
               {
                  this.api.kernel.showMessage(undefined,"(Â°~Â°)","ERROR_BOX");
               }
               return undefined;
            }
            if(_loc4_[0] == "1")
            {
               this.api.datacenter.Player.isSkippingFightAnimations = true;
            }
            else if(_loc4_[0] == "0")
            {
               this.api.datacenter.Player.isSkippingFightAnimations = false;
            }
            else
            {
               this.api.datacenter.Player.isSkippingFightAnimations = !this.api.datacenter.Player.isSkippingFightAnimations;
            }
            this.api.kernel.showMessage(undefined,"SKIP FIGHT ANIMATIONS : " + this.api.datacenter.Player.isSkippingFightAnimations,"DEBUG_LOG");
            break;
         case "SKIPLOOTPANEL":
            if(!dofus.Constants.ALPHA)
            {
               if(!this.api.datacenter.Player.isAuthorized)
               {
                  this.api.kernel.showMessage(undefined,"(Â°~Â°)","ERROR_BOX");
               }
               return undefined;
            }
            if(_loc4_[0] == "1")
            {
               this.api.datacenter.Player.isSkippingLootPanel = true;
            }
            else if(_loc4_[0] == "0")
            {
               this.api.datacenter.Player.isSkippingLootPanel = false;
            }
            else
            {
               this.api.datacenter.Player.isSkippingLootPanel = !this.api.datacenter.Player.isSkippingLootPanel;
            }
            this.api.kernel.showMessage(undefined,"SKIP LOOT PANEL : " + this.api.datacenter.Player.isSkippingLootPanel,"DEBUG_LOG");
            break;
         case "VERIFYIDENTITY":
            var _loc47_ = _loc4_[0];
            if(this.api.network.isValidNetworkKey(_loc47_))
            {
               this.api.kernel.showMessage(undefined,_loc47_ + ": Ok!","DEBUG_LOG");
               break;
            }
            this.api.kernel.showMessage(undefined,_loc47_ + ": Failed.","DEBUG_LOG");
            if(_loc47_ == undefined)
            {
               this.api.kernel.showMessage(undefined," - Undefined identity.","DEBUG_LOG");
            }
            if(_loc47_.length == 0)
            {
               this.api.kernel.showMessage(undefined," - Zero-length identity.","DEBUG_LOG");
            }
            if(_loc47_ == "")
            {
               this.api.kernel.showMessage(undefined,"\t- Empty string identity.","DEBUG_LOG");
            }
            if(dofus.aks["\x1e\x0f"].checksum(_loc47_.substr(0,_loc47_.length - 1)) != _loc47_.substr(_loc47_.length - 1))
            {
               this.api.kernel.showMessage(undefined,"\t- First checksum is wrong. Got " + _loc47_.substr(_loc47_.length - 1) + ", " + dofus.aks["\x1e\x0f"].checksum(_loc47_.substr(0,_loc47_.length - 1)) + " expected.","DEBUG_LOG");
            }
            if(dofus.aks["\x1e\x0f"].checksum(_loc47_.substr(1,_loc47_.length - 2)) != _loc47_.substr(0,1))
            {
               this.api.kernel.showMessage(undefined,"\t- Second checksum is wrong. Got " + _loc47_.substr(0,1) + ", " + dofus.aks["\x1e\x0f"].checksum(_loc47_.substr(1,_loc47_.length - 2)) + " expected.","DEBUG_LOG");
            }
            break;
         case "SEARCHNPC":
            var _loc48_ = _loc3_.substr(_loc5_.length + 2);
            if(_loc48_ == undefined || _loc48_.length < 2)
            {
               this.api.kernel.showMessage(undefined,"Syntax : /searchnpc [name]","DEBUG_LOG");
               return undefined;
            }
            var _loc49_ = "";
            _loc49_ += "Looking for npc : " + _loc48_;
            var _loc50_ = this.api.lang.getNonPlayableCharactersTexts();
            for(var i in _loc50_)
            {
               if(_loc50_[i].n.toUpperCase().indexOf(_loc48_.toUpperCase()) != -1)
               {
                  _loc49_ += "\n " + _loc50_[i].n + " : " + i;
               }
            }
            this.api.kernel.showMessage(undefined,_loc49_,"DEBUG_LOG");
            break;
         case "SEARCHBREED":
            var _loc51_ = _loc3_.substr(_loc5_.length + 2);
            if(_loc51_ == undefined || _loc51_.length < 2)
            {
               this.api.kernel.showMessage(undefined,"Syntax : /searchbreed [name]","DEBUG_LOG");
               return undefined;
            }
            var _loc52_ = "";
            _loc52_ += "Looking for breed : " + _loc51_;
            var _loc53_ = this.api.lang.getAllClassText();
            for(var i in _loc53_)
            {
               if(_loc53_[i].sn.toUpperCase().indexOf(_loc51_.toUpperCase()) != -1)
               {
                  _loc52_ += "\n " + _loc53_[i].sn + " : " + i;
               }
            }
            this.api.kernel.showMessage(undefined,_loc52_,"DEBUG_LOG");
            break;
         case "SEARCHALIGNMENT":
            var _loc54_ = _loc3_.substr(_loc5_.length + 2);
            if(_loc54_ == undefined || _loc54_.length < 2)
            {
               this.api.kernel.showMessage(undefined,"Syntax : /searchalignment [name]","DEBUG_LOG");
               return undefined;
            }
            var _loc55_ = "";
            _loc55_ += "Looking for alignment : " + _loc54_;
            var _loc56_ = this.api.lang.getAlignments();
            for(var i in _loc56_)
            {
               if(_loc56_[i].n.toUpperCase().indexOf(_loc54_.toUpperCase()) != -1)
               {
                  _loc55_ += "\n " + _loc56_[i].n + " : " + i;
               }
            }
            this.api.kernel.showMessage(undefined,_loc55_,"DEBUG_LOG");
            break;
         case "SEARCHITEM":
            var _loc57_ = _loc3_.substr(_loc5_.length + 2);
            if(_loc57_ == undefined || _loc57_.length < 2)
            {
               this.api.kernel.showMessage(undefined,"Syntax : /searchitem [name]","DEBUG_LOG");
               return undefined;
            }
            var _loc58_ = "";
            _loc58_ += "Looking for item : " + _loc57_;
            var _loc59_ = this.api.lang.getItemUnics();
            for(var i in _loc59_)
            {
               if(_loc59_[i].n.toUpperCase().indexOf(_loc57_.toUpperCase()) != -1)
               {
                  _loc58_ += "\n " + _loc59_[i].n + " : " + i;
               }
            }
            this.api.kernel.showMessage(undefined,_loc58_,"DEBUG_LOG");
            break;
         case "SEARCHJOB":
            var _loc60_ = _loc3_.substr(_loc5_.length + 2);
            if(_loc60_ == undefined || _loc60_.length < 2)
            {
               this.api.kernel.showMessage(undefined,"Syntax : /searchjob [name]","DEBUG_LOG");
               return undefined;
            }
            var _loc61_ = "";
            _loc61_ += "Looking for job : " + _loc60_;
            var _loc62_ = this.api.lang.getAllJobsText();
            for(var i in _loc62_)
            {
               var _loc63_ = _loc62_[i];
               if(!(_global.isNaN(_loc63_.g) || _loc63_.g < 1))
               {
                  if(_loc63_.n.toUpperCase().indexOf(_loc60_.toUpperCase()) != -1)
                  {
                     _loc61_ += "\n " + _loc63_.n + " : " + i;
                  }
               }
            }
            this.api.kernel.showMessage(undefined,_loc61_,"DEBUG_LOG");
            break;
         case "SEARCHMONSTER":
            var _loc64_ = _loc3_.substr(_loc5_.length + 2);
            if(_loc64_ == undefined || _loc64_.length < 2)
            {
               this.api.kernel.showMessage(undefined,"Syntax : /searchmonster [name]","DEBUG_LOG");
               return undefined;
            }
            var _loc65_ = "";
            _loc65_ += "Looking for monster : " + _loc64_;
            var _loc66_ = this.api.lang.getMonsters();
            for(var i in _loc66_)
            {
               if(_loc66_[i].n.toUpperCase().indexOf(_loc64_.toUpperCase()) != -1)
               {
                  _loc65_ += "\n " + _loc66_[i].n + " : " + i + " (gfx : " + _loc66_[i].g + ")";
               }
            }
            this.api.kernel.showMessage(undefined,_loc65_,"DEBUG_LOG");
            break;
         case "SEARCHSUBAREA":
            var _loc67_ = _loc3_.substr(_loc5_.length + 2);
            if(_loc67_ == undefined || _loc67_.length < 2)
            {
               this.api.kernel.showMessage(undefined,"Syntax : /searchsubarea [name]","DEBUG_LOG");
               return undefined;
            }
            var _loc68_ = "";
            _loc68_ += "Looking for subarea : " + _loc67_;
            var _loc69_ = this.api.lang.getMapSubAreas();
            for(var i in _loc69_)
            {
               if(_loc69_[i].n.toUpperCase().indexOf(_loc67_.toUpperCase()) != -1)
               {
                  _loc68_ += "\n " + _loc69_[i].n + " : " + i;
               }
            }
            this.api.kernel.showMessage(undefined,_loc68_,"DEBUG_LOG");
            break;
         case "SEARCHSPELL":
            var _loc70_ = _loc3_.substr(_loc5_.length + 2);
            if(_loc70_ == undefined || _loc70_.length < 2)
            {
               this.api.kernel.showMessage(undefined,"Syntax : /searchspell [name]","DEBUG_LOG");
               return undefined;
            }
            var _loc71_ = "";
            _loc71_ += "Looking for spell : " + _loc70_;
            var _loc72_ = this.api.lang.getSpells();
            for(var i in _loc72_)
            {
               if(_loc72_[i].n.toUpperCase().indexOf(_loc70_.toUpperCase()) != -1)
               {
                  _loc71_ += "\n " + _loc72_[i].n + " : " + i;
               }
            }
            this.api.kernel.showMessage(undefined,_loc71_,"DEBUG_LOG");
            break;
         case "SEARCHQUEST":
            var _loc73_ = _loc3_.substr(_loc5_.length + 2);
            if(_loc73_ == undefined || _loc73_.length < 2)
            {
               this.api.kernel.showMessage(undefined,"Syntax : /searchquest [name]","DEBUG_LOG");
               return undefined;
            }
            var _loc74_ = "";
            _loc74_ += "Looking for quest : " + _loc73_;
            var _loc75_ = this.api.lang.getQuests();
            for(var i in _loc75_)
            {
               if(_loc75_[i].toUpperCase().indexOf(_loc73_.toUpperCase()) != -1)
               {
                  _loc74_ += "\n " + _loc75_[i] + " : " + i;
               }
            }
            this.api.kernel.showMessage(undefined,_loc74_,"DEBUG_LOG");
            break;
         default:
            this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc5_]),"DEBUG_ERROR");
      }
   }
   else if(this.api.datacenter.Basics.isLogged)
   {
      this.api.network.Basics.autorisedCommand(_loc3_);
   }
   else
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc3_]),"DEBUG_ERROR");
   }
};
_loc1 = dofus["\f\x04"].prototype;
_loc1.start = function()
{
   this.api.ui.setScreenSize(742,556);
   if(this.getFlashVersion() > 8 && !this.api.electron.enabled)
   {
      Stage.showMenu = false;
   }
   if(!this.api.electron.enabled && (this.OptionsManager.getOption("DisplayStyle") == "medium" && (System.capabilities.screenResolutionY < 950 && System.capabilities.playerType != "StandAlone")))
   {
      this.OptionsManager.setOption("DisplayStyle","normal");
   }
   else if(this.OptionsManager.getOption("EnableWidescreenPanels") && this.api.electron.enabled)
   {
      this.OptionsManager.setOption("DisplayStyle",dofus["\x0b\b"].OptionsManager.DISPLAY_STYLE_WIDESCREEN_PANELS);
      this.setDisplayStyle(dofus["\x0b\b"].OptionsManager.DISPLAY_STYLE_WIDESCREEN_PANELS,true);
   }
   else
   {
      this.setDisplayStyle(this.OptionsManager.getOption("DisplayStyle"),true);
   }
   if(this.api.config.isStreaming)
   {
      if(this.api.config.streamingMethod == "explod")
      {
         this.api.gfx.setStreaming(true,dofus.Constants.GFX_OBJECTS_PATH,dofus.Constants.GFX_GROUNDS_PATH);
      }
      this.api.gfx.setStreamingMethod(this.api.config.streamingMethod);
   }
   this.setQuality(this.OptionsManager.getOption("DefaultQuality"));
   this.autoLogon();
};
_loc1.getFlashVersion = function()
{
   return Number(getVersion().split(" ")[1].split(",")[0]);
};
_loc1.setDisplayStyle = function(_loc2_, _loc3_)
{
   if(this.api.electron.enabled)
   {
      _loc3_ = _loc2_ == dofus["\x0b\b"].OptionsManager.DISPLAY_STYLE_WIDESCREEN_PANELS;
      this.OptionsManager.setOption("EnableWidescreenPanels",_loc3_);
      this.api.kernel.debug(_loc3_);
      return undefined;
   }
   if(System.capabilities.playerType == "StandAlone" && System.capabilities.os.indexOf("Windows") != -1)
   {
      _loc3_ = new ank.external.display["\x1e\x13\x0f"]();
      switch(_loc2_)
      {
         case "normal":
            _loc3_.disable();
            break;
         case "medium":
            _loc3_.addEventListener("onScreenResolutionError",this);
            _loc3_.addEventListener("onScreenResolutionSuccess",this);
            if(_loc3_ != true)
            {
               _loc3_.addEventListener("onExternalError",this);
            }
            _loc3_.enable(800,600,32);
            break;
         case "maximized":
            _loc3_.addEventListener("onScreenResolutionError",this);
            _loc3_.addEventListener("onScreenResolutionSuccess",this);
            if(_loc3_ != true)
            {
               _loc3_.addEventListener("onExternalError",this);
            }
            _loc3_.enable(1024,768,32);
         default:
            return;
      }
   }
   else
   {
      _root._loader.setDisplayStyle(_loc2_);
   }
};
_loc1.showMessage = function(sTitle, sMsg, sType, oParams, sUniqId)
{
   var _loc7_;
   var _loc6_;
   var _loc8_;
   switch(sType)
   {
      case "PALMAD_BOX":
         if(sTitle == undefined)
         {
            sTitle = this.api.lang.getText("ERROR_WORD");
         }
         this.api.ui.loadUIComponent("AskOK","AskOK" + (oParams.name != undefined ? oParams.name : ""),{title:sTitle,text:sMsg,params:oParams.params,multipage:true},{bForceLoad:true});
         break;
      case "WAIT_BOX":
         if(sTitle == undefined)
         {
            sTitle = this.api.lang.getText("CHAT_LINK_WARNING");
         }
         this.api.ui.loadUIComponent("AskOKWait","AskOKWait",{title:sTitle,text:sMsg,params:oParams.params},{bForceLoad:true});
         break;
      case "CAUTION_YESNO":
         if(sTitle == undefined)
         {
            sTitle = this.api.lang.getText("CAUTION");
         }
         _loc7_ = this.api.ui.loadUIComponent("AskYesNo","AskYesNo" + (oParams.name == undefined ? "" : oParams.name),{title:sTitle,text:sMsg,params:oParams.params},{bForceLoad:true});
         _loc7_.addEventListener("yes",oParams.listener != undefined ? oParams.listener : this);
         _loc7_.addEventListener("no",oParams.listener != undefined ? oParams.listener : this);
         break;
      case "CAUTION_YESNOIGNORE":
         if(sTitle == undefined)
         {
            sTitle = this.api.lang.getText("CAUTION");
         }
         _loc6_ = this.api.ui.loadUIComponent("AskYesNoIgnore","AskYesNoIgnore" + (oParams.name == undefined ? "" : oParams.name),{title:sTitle,text:sMsg,player:oParams.player,params:oParams.params},{bForceLoad:true});
         _loc6_.addEventListener("yes",oParams.listener != undefined ? oParams.listener : this);
         _loc6_.addEventListener("no",oParams.listener != undefined ? oParams.listener : this);
         _loc6_.addEventListener("ignore",oParams.listener != undefined ? oParams.listener : this);
         break;
      case "ERROR_BOX":
         if(sTitle == undefined)
         {
            sTitle = this.api.lang.getText("ERROR_WORD");
         }
         this.api.ui.loadUIComponent("AskOK","AskOK" + (oParams.name == undefined ? "" : oParams.name),{title:sTitle,text:sMsg,params:oParams.params},{bForceLoad:true});
         break;
      case "INFO_CANCEL":
         if(sTitle == undefined)
         {
            sTitle = this.api.lang.getText("INFORMATION");
         }
         _loc8_ = this.api.ui.loadUIComponent("AskCancel","AskCancel" + (oParams.name == undefined ? "" : oParams.name),{title:sTitle,text:sMsg,params:oParams.params},{bForceLoad:true});
         _loc8_.addEventListener("cancel",oParams.listener != undefined ? oParams.listener : this);
         break;
      case "ERROR_CHAT":
         this.ChatManager.addText(sTitle != undefined ? "<b>" + sTitle + "</b> : " + sMsg : sMsg,dofus.Constants.ERROR_CHAT_COLOR,true,sUniqId);
         break;
      case "MESSAGE_CHAT":
         this.ChatManager.addText(sMsg,dofus.Constants.MSG_CHAT_COLOR,true,sUniqId);
         break;
      case "EMOTE_CHAT":
         this.ChatManager.addText(sMsg,dofus.Constants.EMOTE_CHAT_COLOR,true,sUniqId);
         break;
      case "THINK_CHAT":
         this.ChatManager.addText(sMsg,dofus.Constants.THINK_CHAT_COLOR,true,sUniqId);
         break;
      case "EVENT_CHAT":
         this.ChatManager.addText(sMsg,dofus.Constants.EVENT_CHAT_COLOR,true,sUniqId);
         break;
      case "HEROES_CHAT":
         this.ChatManager.addText(sMsg,dofus.Constants.HEROES_CHAT_COLOR,true,sUniqId);
         break;
      case "INFO_FIGHT_CHAT":
         this.api.kernel.ChatManager.feMessagesBuffer.printAll();
         if(!this.api.kernel.OptionsManager.getOption("ChatEffects"))
         {
            return undefined;
         }
         break;
      case "COMMANDS_CHAT":
      case "INFO_CHAT":
         break;
      case "PVP_CHAT":
         sMsg = this.api.kernel.ChatManager.parseInlinePos(sMsg);
         this.ChatManager.addText(sMsg,dofus.Constants.PVP_CHAT_COLOR,true,sUniqId);
         break;
      case "WHISP_CHAT":
         this.ChatManager.addText(sMsg,dofus.Constants.MSGCHUCHOTE_CHAT_COLOR,true,sUniqId);
         break;
      case "PARTY_CHAT":
         this.ChatManager.addText(sMsg,dofus.Constants.GROUP_CHAT_COLOR,true,sUniqId);
         break;
      case "GUILD_CHAT":
         this.ChatManager.addText(sMsg,dofus.Constants.GUILD_CHAT_COLOR,false,sUniqId);
         break;
      case "GUILD_CHAT_SOUND":
         this.ChatManager.addText(sMsg,dofus.Constants.GUILD_CHAT_COLOR,true,sUniqId);
         break;
      case "RECRUITMENT_CHAT":
         this.ChatManager.addText(sMsg,dofus.Constants.RECRUITMENT_CHAT_COLOR,false,sUniqId);
         break;
      case "TRADE_CHAT":
         this.ChatManager.addText(sMsg,dofus.Constants.TRADE_CHAT_COLOR,false,sUniqId);
         break;
      case "MEETIC_CHAT":
         this.ChatManager.addText(sMsg,dofus.Constants.MEETIC_CHAT_COLOR,false,sUniqId);
         break;
      case "ADMIN_CHAT":
         this.ChatManager.addText(sMsg,dofus.Constants.ADMIN_CHAT_COLOR,false,sUniqId);
         break;
      case "DEBUG_LOG":
         this.api.datacenter.Basics.aks_a_logs += "<br/><font color=\"#FFFFFF\">" + sMsg + "</font>";
         this.api.ui.getUIComponent("Debug").setLogsText(this.api.datacenter.Basics.aks_a_logs);
         break;
      case "DEBUG_ERROR":
         this.api.datacenter.Basics.aks_a_logs += "<br/><font color=\"#FF0000\">" + sMsg + "</font>";
         this.api.ui.getUIComponent("Debug").refresh();
         break;
      case "DEBUG_INFO":
         this.api.datacenter.Basics.aks_a_logs += "<br/><font color=\"#00FF00\">" + sMsg + "</font>";
         this.api.ui.getUIComponent("Debug").refresh();
         break;
      case "INFO_BOX":
         if(sTitle == undefined)
         {
            sTitle = this.api.lang.getText("INFORMATIONS");
         }
         this.api.ui.loadUIComponent("AskOK","AskOK" + (oParams.name == undefined ? "" : oParams.name),{title:sTitle,text:sMsg,params:oParams.params},{bForceLoad:true});
         break;
      case "HUNT_CHAT":
         this.ChatManager.addText(sMsg,dofus.Constants.GAME_HUNT_CHAT,true,sUniqId);
      default:
         return;
   }
   this.ChatManager.addText(sMsg,dofus.Constants.INFO_CHAT_COLOR,true,sUniqId);
};
_loc1.initLogon = function()
{
   // Instrumentation: record electron init/login steps which may clear the console
   
   // Protect against external (Electron/ExternalInterface) callbacks that
   // may toggle debug mode during initialization. Remember current DEBUG
   // state, call electron init/update hooks, then restore DEBUG if it was
   // changed unexpectedly. This ensures DEBUG only changes when the core
   // explicitly toggles it.
   var _prevDebug = dofus.Constants.DEBUG;
   try
   {
      if(this.api.electron && this.api.electron.setInitialized)
      {
         this.api.electron.setInitialized();
      }
      if(this.api.electron && this.api.electron.updateWindowTitle)
      {
         this.api.electron.updateWindowTitle();
      }
      if(this.api.electron && this.api.electron.setLoginDiscordActivity)
      {
         this.api.electron.setLoginDiscordActivity();
      }
   }
   catch(e)
   {
   }
   try
   {
      if(dofus.Constants.DEBUG != _prevDebug)
      {
         // Prevent automatic external toggles of DEBUG, restore silently.
         dofus.Constants.DEBUG = _prevDebug;
      }
   }
   catch(e){}
   this.api.ui.loadUIComponent("MainMenu","MainMenu",{quitMode:(!(System.capabilities.playerType == "PlugIn" && !this.api.electron.enabled) ? "quit" : "no")},{bStayIfPresent:true,bAlwaysOnTop:true});
};
_loc1.onInitAndLoginFinished = function()
{
   this.MapsServersManager.initialize(this.api);
   this.DocumentsServersManager.initialize(this.api);
   this.TutorialServersManager.initialize(this.api);
   this.AreasManager.initialize(this.api);
   this.AdminManager.initialize(this.api);
   var _loc2_ = this.api.lang.getTimeZoneText();
   this.NightManager.initialize(_loc2_.tz.slice(),_loc2_.m.slice(),_loc2_.z,this.api.gfx);
   this.api.kernel.KeyManager.onSetChange(this.api.kernel.OptionsManager.getOption("ShortcutSet"));
   this.XTRA_LANG_FILES_LOADED = true;
   this.api.network.Account.sendConfiguredPort();
   this.api.network.Account.sendIdentity();
   this.api.network.Account.getServersList();
};
_loc1.yes = function(_loc2_)
{
   // Instrumentation: only clear Electron retro chat/console for full disconnect/quit
   
   switch(_loc2_.target._name)
   {
      case "AskYesNoQuit":
         // Full quit: clear external retro chat/console then quit
         try { if(this.api.electron && this.api.electron.retroChatClear) this.api.electron.retroChatClear(); } catch(e) {}
         this.quit(false);
         break;
      case "AskYesNoDisconnect":
         // Full disconnect: clear external retro chat/console then disconnect
         try { if(this.api.electron && this.api.electron.retroChatClear) this.api.electron.retroChatClear(); } catch(e) {}
         this.api.network.disconnect(false,false);
         break;
      case "AskYesNoChangeCharacter":
         // Character change: do not clear external retro chat/console to preserve debug logs
         this.api.network.disconnect(true,false,true);
         break;
      case "AskYesNoClearCache":
         this.clearCache();
      default:
         return;
   }
};
_loc1.debug = function(sMessage)
{
   if(dofus.Constants.DEBUG_MSG)
   {
      this.api.electron.consoleLog("DEBUG_LOG",sMessage);
   }
};
_loc1 = dofus["\r\x14"].gapi.ui.Debug.prototype;
_loc1.__set__tiCommandLine = function(sText)
{
   this._tiCommandLine.text = sText;
};
_loc1.addProperty("tiCommandLine",function()
{
}
,_loc1.__set__tiCommandLine);
dofus["\r\x14"].gapi.ui.Debug.doConsoleHistoryUp = function(api)
{
   var _loc1_ = api.ui.getUIComponent("Debug");
   var _loc2_ = api.kernel.DebugConsole.getHistoryUp().value;
   if(_loc1_ != undefined)
   {
      _loc1_._tiCommandLine.text = _loc2_;
      _loc1_.addToQueue({object:_loc1_,method:_loc1_.placeCursorAtTheEnd});
   }
   api.electron.retroConsoleSetPromptText(_loc2_);
};
dofus["\r\x14"].gapi.ui.Debug.doConsoleHistoryDown = function(api)
{
   var _loc1_ = api.ui.getUIComponent("Debug");
   var _loc2_ = api.kernel.DebugConsole.getHistoryDown().value;
   if(_loc1_ != undefined)
   {
      _loc1_._tiCommandLine.text = _loc2_;
      _loc1_.addToQueue({object:_loc1_,method:_loc1_.placeCursorAtTheEnd});
   }
   api.electron.retroConsoleSetPromptText(_loc2_);
};
dofus["\r\x14"].gapi.ui.Debug.askShowAutoCompleteResult = function(api, sText)
{
   Selection.setFocus(null);
   if(dofus["\r\x14"].gapi.ui.Debug.Debug._nAutoCompleteTimeout != undefined)
   {
      _global.clearTimeout(dofus["\r\x14"].gapi.ui.Debug._nAutoCompleteTimeout);
   }
   var _loc2_ = _global.setTimeout(api.kernel.DebugConsole,"doConsoleAutoComplete",100,api,sText);
   dofus["\r\x14"].gapi.ui.Debug._nAutoCompleteTimeout = _loc2_;
};
_loc1.initFocus = function()
{
   if(this.api.electron.isShowingWidescreenPanel)
   {
      this.api.electron.focusWidescreenPanelIfPossible();
   }
   this._tiCommandLine.setFocus();
};
dofus["\r\x14"].gapi.ui.Debug.onHref = function(oEvent, api, oCustomPopupPosition)
{
   var _loc2_ = oEvent.params.split(",");
   var _loc6_ = String(_loc2_.shift());
   var _loc5_;
   var _loc3_;
   switch(_loc6_)
   {
      case "ShowPlayerPopupMenu":
         if(api.datacenter.Basics.inGame)
         {
            api.kernel.GameManager.showPlayerPopupMenu(undefined,{sPlayerID:_global.unescape(_loc2_[0]),sPlayerName:_global.unescape(_loc2_[1]),oCustomPopupPosition:oCustomPopupPosition});
         }
         break;
      case "ExecCmd":
         _loc5_ = _loc2_.shift() == "true";
         _loc3_ = _global.unescape(_loc2_.join(","));
         if(_loc5_)
         {
            api.kernel.AdminManager.sendCommand(_loc3_);
         }
         else
         {
            api.kernel.AdminManager.prepareCommand(_loc3_);
         }
      default:
         return;
   }
};
_loc1.onShortcut = function(_loc2_)
{
   var _loc3_;
   var _loc5_;
   var _loc4_;
   switch(_loc2_)
   {
      case "HISTORY_UP":
         if(this.isFocused())
         {
            this._tiCommandLine.text = this.api.kernel.DebugConsole.getHistoryUp().value;
            this.addToQueue({object:this,method:this.placeCursorAtTheEnd});
            _loc2_ = false;
         }
         break;
      case "HISTORY_DOWN":
         if(this.isFocused())
         {
            this._tiCommandLine.text = this.api.kernel.DebugConsole.getHistoryDown().value;
            this.addToQueue({object:this,method:this.placeCursorAtTheEnd});
            _loc2_ = false;
         }
         break;
      case "TEAM_MESSAGE":
         if(this.isFocused())
         {
            _loc3_ = this.api.kernel.OptionsManager.getOption("DebugSizeIndex") + 1;
            _loc3_ %= 3;
            this.api.kernel.OptionsManager.setOption("DebugSizeIndex",_loc3_);
            this.applySizeIndex();
         }
         break;
      case "ACCEPT_CURRENT_DIALOG":
         if(this.isFocused())
         {
            _loc5_ = this._tiCommandLine.text;
            if(_loc5_.length == 0)
            {
               break;
            }
            _loc2_ = false;
            if(this._tiCommandLine.text != undefined)
            {
               this._tiCommandLine.text = "";
            }
            this.api.kernel.DebugConsole.process(_loc5_);
            break;
         }
         _loc4_ = this.gapi.getUIComponent("Banner");
         if(Selection.getFocus() != undefined && !(_loc4_ != undefined && (_loc4_.isChatFocus() && !_loc4_.chatInputHasText())))
         {
            break;
         }
         _loc2_ = false;
         this._tiCommandLine.setFocus();
   }
   return _loc2_;
};
_loc1 = dofus["\x1e\n\x07"]["\x12\x05"]["\x15"].prototype;
_loc1.doConsoleAutoComplete = function(api, sText)
{
   var _loc1_ = api.kernel.Console.autoCompletion(api.datacenter.Basics.allowedAdminCommands,sText);
   if(!_loc1_.isFull)
   {
      if(_loc1_.list == undefined || _loc1_.list.length == 0)
      {
         api.sounds.events.onError();
      }
      else
      {
         api.ui.showTooltip(_loc1_.list.sort().join(", "),0,520);
      }
   }
   var _loc4_ = _loc1_.result + (!_loc1_.isFull ? "" : " ");
   var _loc3_ = api.ui.getUIComponent("Debug");
   if(_loc3_ != undefined)
   {
      _loc3_.tiCommandLine = _loc4_;
      _loc3_.placeCursorAtTheEnd();
   }
   api.electron.retroConsoleSetPromptText(_loc4_);
};
_loc1 = dofus.aks["\x1e\x0f"].prototype;
_loc1.onConnect = function(_loc2_)
{
   this._bConnecting = false;
   var _loc3_;
   if(!_loc2_)
   {
      if(this.api.datacenter.Basics.aks_rescue_count > 0)
      {
         this.api.datacenter.Basics.aks_rescue_count--;
         ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,"connect",this,this.connect,_global.CONFIG.rdelay,[this.api.datacenter.Basics.aks_gameserver_ip,this.api.datacenter.Basics.aks_gameserver_port,false]);
         this.api.ui.loadUIComponent("WaitingMessage","WaitingMessage",{text:this.api.lang.getText("TRYING_TO_RECONNECT",[this.api.datacenter.Basics.aks_rescue_count])},{bAlwaysOnTop:true,bForceLoad:true});
         return undefined;
      }
      if(this.api.datacenter.Basics.aks_rescue_count == 0)
      {
         this.onClose(false,true);
         return undefined;
      }
      if(this.api.ui.getUIComponent("Login") && (this.api.datacenter.Basics.aks_connection_server && this.api.datacenter.Basics.aks_connection_server.length))
      {
         _loc3_ = String(this.api.datacenter.Basics.aks_connection_server.shift());
         ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,"connect",this,this.connect,_global.CONFIG.rdelay,[_loc3_,this.api.datacenter.Basics.aks_connection_server_port,false]);
         return undefined;
      }
      this.api.ui.unloadUIComponent("Waiting");
      this.api.ui.unloadUIComponent("WaitingMessage");
      this.api.ui.unloadUIComponent("ChooseCharacter");
      this.api.kernel.manualLogon();
      _global[dofus.Constants.GLOBAL_SO_OPTIONS_NAME].data.securitedConnexion = undefined;
      this.api.kernel.showMessage(this.api.lang.getText("CONNECTION"),this.api.lang.getText("CANT_CONNECT"),"ERROR_BOX",{name:"OnConnect"});
      this.softDisconnect();
   }
   else
   {
      this.api.ui.unloadUIComponent("Waiting");
      this.api.ui.unloadUIComponent("WaitingMessage");
      if(!this.api.datacenter.Basics.isLogged)
      {
         this.api.ui.loadUIComponent("MainMenu","MainMenu",{quitMode:(!(System.capabilities.playerType == "PlugIn" && !this.api.electron.enabled) ? "quit" : "no")},{bStayIfPresent:true,bAlwaysOnTop:true});
      }
      this._bConnected = true;
   }
};
_loc1 = dofus["\r\x14"].gapi.ui.Banner.prototype;
_loc1.__get__useFlashChat = function()
{
   return this._bUseFlashChat;
};
_loc1.addProperty("useFlashChat",_loc1.__get__useFlashChat,function()
{
}
);
_loc1.addProperty("currentOverItem",function()
{
   return this._msShortcuts.currentOverItem;
}
,function()
{
}
);
_loc1.createChildren = function()
{
   this._ldrVisual._visible = false;
   this._txtVisual._visible = false;
   this._btnVisual._visible = false;
   this._btnRecompensas._visible = false;
   this._bUseFlashChat = true;
   this._btnFights._visible = false;
   this.addToQueue({object:this,method:this.hideEpisodicContent});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
   this.showPoints(false);
   this.showNextTurnButton(false);
   this.showGiveUpButton(false);
   this._mcRightPanelPlacer._visible = false;
   this._mcCircleXtraPlacer._visible = false;
   this._btnSpellsGridOpenClose._visible = false;
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
   var _loc2_ = this.api.datacenter.Basics.forceFlashChat || (!this.api.kernel.OptionsManager.getOption("EnableWidescreenPanels") || !this.api.electron.isShowingWidescreenPanel);
   this.addToQueue({object:this,method:this.configureUseFlashChat,params:[_loc2_]});
   k = 0;
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
_loc1.doChatWhisperHistoryUp = function()
{
   this._txtConsole.text = this.api.kernel.Console.getWhisperHistoryUp();
   this.addToQueue({object:this,method:this.placeCursorAtTheEnd});
   this.api.electron.retroChatSetPromptText(this._txtConsole.text);
};
_loc1.doChatWhisperHistoryDown = function()
{
   this._txtConsole.text = this.api.kernel.Console.getWhisperHistoryDown();
   this.addToQueue({object:this,method:this.placeCursorAtTheEnd});
   this.api.electron.retroChatSetPromptText(this._txtConsole.text);
};
_loc1.doChatHistoryUp = function()
{
   var _loc2_ = this.api.kernel.Console.getHistoryUp();
   if(_loc2_ != undefined)
   {
      this.api.datacenter.Basics.chatParams = _loc2_.params;
      this._txtConsole.text = _loc2_.value;
   }
   this.addToQueue({object:this,method:this.placeCursorAtTheEnd});
   this.api.electron.retroChatSetPromptText(this._txtConsole.text);
};
_loc1.doChatHistoryDown = function()
{
   var _loc2_ = this.api.kernel.Console.getHistoryDown();
   if(_loc2_ != undefined)
   {
      this.api.datacenter.Basics.chatParams = _loc2_.params;
      this._txtConsole.text = _loc2_.value;
   }
   else
   {
      this._txtConsole.text = "";
   }
   this.addToQueue({object:this,method:this.placeCursorAtTheEnd});
   this.api.electron.retroChatSetPromptText(this._txtConsole.text);
};
_loc1.doAutoComplete = function()
{
   var _loc3_ = [];
   var _loc2_ = this.api.datacenter.Sprites.getItems();
   for(var _loc5_ in _loc2_)
   {
      if(_loc2_[_loc5_] instanceof dofus.datacenter["\x13\x01"])
      {
         _loc3_.push(_loc2_[_loc5_].name);
      }
   }
   var _loc4_ = this.api.kernel.Console.autoCompletion(_loc3_,this._txtConsole.text);
   if(!_loc4_.isFull)
   {
      if(_loc4_.list == undefined || _loc4_.list.length == 0)
      {
         this.api.sounds.events.onError();
      }
      else
      {
         this.api.ui.showTooltip(_loc4_.list.sort().join(", "),0,520);
      }
   }
   this._txtConsole.text = _loc4_.result + (!_loc4_.isFull ? "" : " ");
   this.api.electron.retroChatSetPromptText(this._txtConsole.text);
   this.placeCursorAtTheEnd();
};
_loc1.insertChat = function(sText)
{
   if(this._bUseFlashChat)
   {
      this._txtConsole.text += sText;
   }
   else
   {
      this.api.electron.retroChatInsertPromptText(sText);
   }
};
_loc1.setChatPrefix = function(sPrefix, bFocusTxtCommand)
{
   this.api.kernel.debug("setChatPrefix : " + sPrefix + " " + bFocusTxtCommand);
   if(bFocusTxtCommand == undefined)
   {
      bFocusTxtCommand = true;
   }
   if(sPrefix == "")
   {
      sPrefix = "/s";
   }
   this._sChatPrefix = sPrefix;
   if(sPrefix != "/s")
   {
      this._btnHelp.label = sPrefix;
      this._btnHelp.icon = "";
   }
   else
   {
      this._btnHelp.label = "";
      this._btnHelp.icon = "UI_BannerChatCommandAll";
   }
   this.api.electron.retroChatSetPrefix(sPrefix);
   if(bFocusTxtCommand)
   {
      this.addToQueue({object:this,method:this.placeCursorAtTheEnd});
   }
};
_loc1.openChatPrefixMenu = function(oCustomPopupPosition)
{
   var _loc3_ = this.api.lang.getConfigText("CHAT_FILTERS");
   var _loc2_ = this.api.ui.createPopupMenu();
   _loc2_.addStaticItem(this.api.lang.getText("CHAT_PREFIX"));
   _loc2_.addItem(this.api.lang.getText("DEFAUT") + " (/s)",this,this.setChatPrefix,["/s"]);
   _loc2_.addItem(this.api.lang.getText("TEAM") + " (/t)",this,this.setChatPrefix,["/t"],this.api.datacenter.Game.isFight);
   _loc2_.addItem(this.api.lang.getText("PARTY") + " (/p)",this,this.setChatPrefix,["/p"],this.api.ui.getUIComponent("Party") != undefined);
   _loc2_.addItem(this.api.lang.getText("GUILD") + " (/g)",this,this.setChatPrefix,["/g"],this.api.datacenter.Player.guildInfos != undefined);
   if(_loc3_[4])
   {
      _loc2_.addItem(this.api.lang.getText("ALIGNMENT") + " (/a)",this,this.setChatPrefix,["/a"],this.api.datacenter.Player.alignment.index != 0);
   }
   if(_loc3_[5])
   {
      _loc2_.addItem(this.api.lang.getText("RECRUITMENT") + " (/r)",this,this.setChatPrefix,["/r"]);
   }
   if(_loc3_[6])
   {
      _loc2_.addItem(this.api.lang.getText("TRADE") + " (/b)",this,this.setChatPrefix,["/b"]);
   }
   if(_loc3_[7])
   {
      _loc2_.addItem(this.api.lang.getText("MEETIC") + " (/i)",this,this.setChatPrefix,["/i"]);
   }
   if(this.api.datacenter.Player.isAuthorized)
   {
      _loc2_.addItem(this.api.lang.getText("PRIVATE_CHANNEL") + " (/q)",this,this.setChatPrefix,["/q"]);
   }
   _loc2_.addItem(this.api.lang.getText("ALL_CHAT") + " (/all)",this,this.setChatPrefix,[".all"]);
   _loc2_.addItem(this.api.lang.getText("HELP"),this,this.displayChatHelp,[]);
   if(this.api.electron.enabled)
   {
      _loc2_.addItem(this.api.lang.getText("OPEN_EXTERNAL_CHAT"),dofus["\x0f\t"],dofus["\x0f\t"].retroChatOpen,[]);
      if(this.api.datacenter.Player.isAuthorized)
      {
         _loc2_.addItem(this.api.lang.getText("OPEN_EXTERNAL_CONSOLE"),dofus["\x0f\t"],dofus["\x0f\t"].retroConsoleOpen,[]);
      }
   }
   if(oCustomPopupPosition != undefined)
   {
      _loc2_.show(oCustomPopupPosition.x,oCustomPopupPosition.y,true);
   }
   else
   {
      _loc2_.show(this._btnHelp._x,this._btnHelp._y,true);
   }
};
_loc1.onShortcut = function(_loc2_)
{
   var _loc10_;
   var _loc6_;
   var _loc7_;
   var _loc11_;
   var _loc9_;
   var _loc4_;
   var _loc3_;
   var _loc5_;
   switch(_loc2_)
   {
      case "CTRL_STATE_CHANGED_ON":
         if(this._bIsOnFocus && !(this.api.config.isLinux || this.api.config.isMac))
         {
         }
         break;
      case "CTRL_STATE_CHANGED_OFF":
         if(this._bIsOnFocus && !(this.api.config.isLinux || this.api.config.isMac))
         {
         }
         break;
      case "ESCAPE":
         if(this.isChatFocus())
         {
            Selection.setFocus(null);
            _loc2_ = false;
         }
         break;
      case "ACCEPT_CURRENT_DIALOG":
         if(this.isChatFocus())
         {
            if(this._txtConsole.text.length != 0)
            {
               this.api.kernel.Console.process(this.getChatCommand(),this.api.datacenter.Basics.chatParams);
               this.api.datacenter.Basics.chatParams = new Object();
               if(this._txtConsole.text != undefined)
               {
                  this._txtConsole.text = "";
                  this.api.electron.retroChatSetPromptText("");
               }
               _loc2_ = false;
            }
            break;
         }
         if(this._bChatAutoFocus)
         {
            _loc10_ = this.gapi.getUIComponent("Debug");
            if(Selection.getFocus() != undefined && !(_loc10_ != undefined && (_loc10_.isFocused() && !_loc10_.commandInputHasText())))
            {
               break;
            }
            _loc2_ = false;
            this.setChatFocus();
         }
         break;
      case "TEAM_MESSAGE":
         if(this.isChatFocus())
         {
            if(this._txtConsole.text.length != 0)
            {
               _loc6_ = this.getChatCommand();
               if(_loc6_.charAt(0) == "/")
               {
                  _loc6_ = _loc6_.substr(_loc6_.indexOf(" ") + 1);
               }
               this.api.kernel.Console.process("/t " + _loc6_,this.api.datacenter.Basics.chatParams);
               this.api.datacenter.Basics.chatParams = new Object();
               if(this._txtConsole.text != undefined)
               {
                  this._txtConsole.text = "";
                  this.api.electron.retroChatSetPromptText("");
               }
               _loc2_ = false;
            }
            break;
         }
         if(Selection.getFocus() == undefined && this._bChatAutoFocus)
         {
            _loc2_ = false;
            this.setChatFocus();
         }
         break;
      case "GUILD_MESSAGE":
         if(this.isChatFocus())
         {
            if(this._txtConsole.text.length != 0)
            {
               _loc7_ = this.getChatCommand();
               if(_loc7_.charAt(0) == "/")
               {
                  _loc7_ = _loc7_.substr(_loc7_.indexOf(" ") + 1);
               }
               this.api.kernel.Console.process("/g " + _loc7_,this.api.datacenter.Basics.chatParams);
               this.api.datacenter.Basics.chatParams = new Object();
               if(this._txtConsole.text != undefined)
               {
                  this._txtConsole.text = "";
                  this.api.electron.retroChatSetPromptText("");
               }
               _loc2_ = false;
            }
            break;
         }
         if(Selection.getFocus() == undefined && this._bChatAutoFocus)
         {
            _loc2_ = false;
            this.setChatFocus();
         }
         break;
      case "WHISPER_HISTORY_UP":
         if(this.isChatFocus())
         {
            this._txtConsole.text = this.api.kernel.Console.getWhisperHistoryUp();
            this.addToQueue({object:this,method:this.placeCursorAtTheEnd});
            _loc2_ = false;
         }
         break;
      case "WHISPER_HISTORY_DOWN":
         if(this.isChatFocus())
         {
            this._txtConsole.text = this.api.kernel.Console.getWhisperHistoryDown();
            this.addToQueue({object:this,method:this.placeCursorAtTheEnd});
            _loc2_ = false;
         }
         break;
      case "HISTORY_UP":
         if(this.isChatFocus())
         {
            _loc11_ = this.api.kernel.Console.getHistoryUp();
            if(_loc11_ != undefined)
            {
               this.api.datacenter.Basics.chatParams = _loc11_.params;
               this._txtConsole.text = _loc11_.value;
            }
            this.addToQueue({object:this,method:this.placeCursorAtTheEnd});
            _loc2_ = false;
         }
         break;
      case "HISTORY_DOWN":
         if(this.isChatFocus())
         {
            _loc9_ = this.api.kernel.Console.getHistoryDown();
            if(_loc9_ != undefined)
            {
               this.api.datacenter.Basics.chatParams = _loc9_.params;
               this._txtConsole.text = _loc9_.value;
            }
            else
            {
               this._txtConsole.text = "";
            }
            this.addToQueue({object:this,method:this.placeCursorAtTheEnd});
            _loc2_ = false;
         }
         break;
      case "AUTOCOMPLETE":
         _loc4_ = new Array();
         _loc3_ = this.api.datacenter.Sprites.getItems();
         for(var _loc8_ in _loc3_)
         {
            if(_loc3_[_loc8_] instanceof dofus.datacenter["\x13\x01"])
            {
               _loc4_.push(_loc3_[_loc8_].name);
            }
         }
         _loc5_ = this.api.kernel.Console.autoCompletion(_loc4_,this._txtConsole.text);
         if(!_loc5_.isFull)
         {
            if(_loc5_.list == undefined || _loc5_.list.length == 0)
            {
               this.api.sounds.events.onError();
            }
            else
            {
               this.api.ui.showTooltip(_loc5_.list.sort().join(", "),0,520);
            }
         }
         this._txtConsole.text = _loc5_.result + (!_loc5_.isFull ? "" : " ");
         this.placeCursorAtTheEnd();
         break;
      case "NEXTTURN":
         if(this.api.datacenter.Game.isFight)
         {
            if(this.api.datacenter.Game.isRunning)
            {
               this.api.network.Game.prepareTurnEnd();
            }
            else if(this.api.ui.getUIComponent("ChallengeMenu") != undefined)
            {
               this.api.ui.getUIComponent("ChallengeMenu").sendReadyState();
            }
            _loc2_ = false;
         }
         break;
      case "MAXI":
         this._cChat.open(false);
         _loc2_ = false;
         break;
      case "MINI":
         this._cChat.open(true);
         _loc2_ = false;
         break;
      case "CHARAC":
         if(this.api.kernel.OptionsManager.getOption("BannerShortcuts"))
         {
            this.click({target:this._btnStatsJob});
            _loc2_ = false;
         }
         break;
      case "SPELLS":
         if(this.api.kernel.OptionsManager.getOption("BannerShortcuts"))
         {
            this.click({target:this._btnSpells});
            _loc2_ = false;
         }
         break;
      case "INVENTORY":
         if(this.api.kernel.OptionsManager.getOption("BannerShortcuts"))
         {
            this.click({target:this._btnInventory});
            _loc2_ = false;
         }
         break;
      case "QUESTS":
         if(this.api.kernel.OptionsManager.getOption("BannerShortcuts"))
         {
            this.click({target:this._btnQuests});
            _loc2_ = false;
         }
         break;
      case "MAP":
         if(this.api.kernel.OptionsManager.getOption("BannerShortcuts"))
         {
            this.click({target:this._btnMap});
            _loc2_ = false;
         }
         break;
      case "FRIENDS":
         if(this.api.kernel.OptionsManager.getOption("BannerShortcuts"))
         {
            this.click({target:this._btnFriends});
            _loc2_ = false;
         }
         break;
      case "GUILD":
         if(this.api.kernel.OptionsManager.getOption("BannerShortcuts"))
         {
            this.click({target:this._btnGuild});
            _loc2_ = false;
         }
         break;
      case "MOUNT":
         if(this.api.kernel.OptionsManager.getOption("BannerShortcuts"))
         {
            this.click({target:this._btnMount});
            _loc2_ = false;
         }
   }
   this._lastKeyIsShortcut = _loc2_;
   return _loc2_;
};
_loc1.configureUseFlashChat = function(bUse)
{
   this._bUseFlashChat = bUse;
   this._cChat.useReplacementPanel(bUse ? dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.NO_REPLACEMENT_PANEL : this.api.kernel.OptionsManager.getOption("chatReplacementPanel"));
   this._txtConsole._visible = bUse;
   this._mcBgTxtConsole._visible = bUse;
   this._cChat._btnOpenClose._visible = bUse;
   this._cChat._btnHelpForPanel._visible = !bUse;
   this._btnHelp._visible = bUse;
   if(!bUse)
   {
      this._cChat.open(true);
   }
};
_loc1.showRightPanel = function(sPanelName, oParams)
{
   if(this._mcRightPanel.className == sPanelName)
   {
      return undefined;
   }
   if(this._mcRightPanel != undefined)
   {
      this.hideRightPanel();
   }
   var _loc3_ = this.chat.fightSpectatorReplacementPanel;
   if(_loc3_ != undefined)
   {
      _loc3_.update(oParams.data);
   }
   else if(this.api.kernel.OptionsManager.getOption("SpriteInfos"))
   {
      if(this.chat.replacementPanelsManager.currentReplacementPanel == dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.SHORTCUTS)
      {
         this.chat.shortcutsReplacementPanel.showMiniMap(false);
         this.chat.shortcutsReplacementPanel.updateSprite(oParams.data);
      }
      else
      {
         this.chat.useTemporaryReplacementPanel(dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.FULL_WIDTH_FIGHTER_EFFECTS,[oParams.data]);
      }
   }
   this._btnSpellsGridOpenClose._visible = false;
   oParams._x = this._mcRightPanelPlacer._x;
   oParams._y = this._mcRightPanelPlacer._y;
   var _loc4_ = this.attachMovie(sPanelName,"_mcRightPanel",this.getNextHighestDepth(),oParams);
   _loc4_.swapDepths(this._mcRightPanelPlacer);
};
_loc1.hideRightPanel = function()
{
   if(this._mcRightPanel != undefined)
   {
      this._mcRightPanel.swapDepths(this._mcRightPanelPlacer);
      this._mcRightPanel.removeMovieClip();
      this._btnSpellsGridOpenClose._visible = true;
   }
};
_loc1 = dofus["\x0b\b"].GameManager.prototype;
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
   var _loc18_ = _loc3_ == undefined ? _loc13_.name : _loc3_;;
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
_loc1 = dofus["\x0b\b"].OptionsManager.prototype;
dofus["\x0b\b"].OptionsManager.DISPLAY_STYLE_WIDESCREEN_PANELS = "widescreenpanels";
dofus["\x0b\b"].OptionsManager.DEFAULT_VALUES = {Myflag:true,loaded:true,Grid:false,Transparency:false,SpriteInfos:true,SpriteMove:true,MapInfos:true,AutoHideSmileys:false,StringCourse:true,PointsOverHead:true,ChatEffects:true,CreaturesMode:50,Buff:true,GuildMessageSound:false,BannerShortcuts:true,StartTurnSound:true,TipsOnStart:true,DisplayStyle:"normal",DebugSizeIndex:0,ServerPortIndex:0,MovableBar:false,ViewAllMonsterInGroup:true,MovableBarSize:5,ShortcutSet:1,ShortcutSetDefault:1,CharacterPreview:true,MapFilters:[0,1,1,1,1,1,1],Aura:true,AudioMusicVol:60,AudioEffectVol:100,AudioEnvVol:60,AudioMusicMute:false,AudioEffectMute:false,AudioEnvMute:false,FloatingTipsCoord:new com.ankamagames.types["\x1e\x16\x0e"](415,30),DisplayingFreshTips:true,CensorshipFilter:true,BigStoreSellFilter:false,RememberAccountName:false,LastAccountNameUsed:"",DefaultQuality:"high",ConquestFilter:-2,FightGroupAutoLock:false,BannerIllustrationMode:"artwork",BannerGaugeMode:"xp",AskForWrongCraft:true,AdvancedLineOfSight:true,RemindTurnTime:true,HideSpellBar:false,SeeAllSpell:true,UseSpeakingItems:true,ConfirmDropItem:true,TimestampInChat:true,ViewDicesDammages:false,SeeDamagesColor:true,RemasteredSpellIconsPack:1,PrettyTacticMode:true,TacticMode:false,ShowPopup:true,IndicateEntityTurnStart:true,AskQuantityObjectHeal:true,HeroesSortField:undefined,ToogleSprites:false,ExoticColor:2373056,StylePoint:1,RegroupDamage:true,ViewHPAsBar:false,AnimateHPBar:false,ShowFriendsAllHealthBar:true,EnableWidescreenPanels:true,chatReplacementPanel:dofus["\r\x13"]
.gapi.ui.ChatReplacementPanelsManager.MINIMAP,ShowMount:true,RightClickToCast:true,FightCreaturesMode:false,DisableDeathAnimation:false,UseLightEndFightUI:false,SkipFightPlayerAnimations:false,SkipFightCriticalBubble:false,colorfulTactic:true,NightMode:true,ElectronEnableChatDarkMode:false,ornamento:false,tactico:false,UseLightEndFightUI:false,Follower:false,ViewHPAsBar:true,AnimateHPBar:true,hideSuccessComplete:false};
_loc1.onMovableBarOptionChanged = function()
{
   var _loc2_ = this.api.ui.getUIComponent("Banner");
   var _loc3_;
   if(_loc2_ != undefined)
   {
      _loc3_ = _loc2_.chat.replacementPanelsManager;
      if(_loc3_.currentReplacementPanel == dofus["\r\x14"].gapi.ui.chat.ChatReplacementPanelsManager.SHORTCUTS)
      {
         _loc3_.changeReplacementPanel(dofus["\r\x14"].gapi.ui.chat.ChatReplacementPanelsManager.MINIMAP,true);
      }
   }
   if(this.getOption("chatReplacementPanel") == dofus["\r\x14"].gapi.ui.chat.ChatReplacementPanelsManager.SHORTCUTS)
   {
      this.setOption("chatReplacementPanel",dofus["\r\x14"].gapi.ui.chat.ChatReplacementPanelsManager.MINIMAP);
   }
};
_loc1.applyOption = function(_loc2_, _loc3_)
{
   var _loc2_;
   switch(_loc2_)
   {
      case "ElectronEnableChatDarkMode":
         // Apply Electron chat dark mode immediately when the option changes
         if(this.api && this.api.electron && this.api.electron.enabled)
         {
            this.api.electron.setChatDarkMode(_loc3_);
         }
         break;
      case "colorfulTactic":
         if(this.api.datacenter.Game.isTacticMode && this.api.datacenter.Game.isFight)
         {
            this.api.gfx.activateTacticMode(false);
            this.api.gfx.activateTacticMode(true);
         }
         break;
      case "hideReset":
         this.api.network.Game.ReturnResetOptions();
         break;
      case "hidePrestige":
         this.api.network.Game.ReturnPrestigeOptions();
         break;
      case "AudioEffectMute":
         this.api.kernel.AudioManager.effectMute = _loc3_;
         break;
      case "tactico":
         this.api.datacenter.Game.isTacticMode = _loc3_;
         break;
      case "ShowMount":
         if(this.api.datacenter.Game.isFight)
         {
            _loc3_ = this.api.datacenter.Sprites.getItems();
            for(var _loc4_ in _loc3_)
            {
               _loc2_ = _loc3_[_loc4_];
               if(_loc2_ instanceof dofus.datacenter["\x13\x01"])
               {
                  if(_loc2_.mount != undefined || _loc2_.tmpMount != undefined)
                  {
                     if(_loc3_ == true)
                     {
                        if(_loc2_.tmpMount == undefined)
                        {
                           _loc2_.tmpMount = _loc2_.mount;
                           _loc2_.mount = undefined;
                        }
                        this.api.gfx.mountSprite(_loc2_.id,_loc2_.tmpMount);
                        delete _loc2_.tmpMount;
                     }
                     else
                     {
                        _loc2_.tmpMount = _loc2_.mount;
                        this.api.gfx.unmountSprite(_loc2_.id);
                     }
                  }
               }
            }
         }
         break;
      case "Grid":
         if(_loc3_ == true)
         {
            this.api.gfx.drawGrid();
            break;
         }
         this.api.gfx.removeGrid();
         break;
      case "Transparency":
         this.api.gfx.setSpriteGhostView(_loc3_);
         break;
      case "SpriteInfos":
         if(_loc3_ == false)
         {
            this.api.ui.unloadUIComponent("SpriteInfos");
            this.setOption("SpriteMove",false);
         }
         break;
      case "SpriteMove":
         if(_loc3_ == false)
         {
            this.api.gfx.clearZoneLayer("move");
            break;
         }
         if(this.loadValue("SpriteInfos") == false)
         {
            this.setOption("SpriteInfos",true);
         }
         break;
      case "MapInfos":
         if(_loc3_ == true)
         {
            this.api.ui.loadUIComponent("MapInfos","MapInfos",undefined,{bForceLoad:true});
            break;
         }
         this.api.ui.unloadUIComponent("MapInfos");
         break;
      case "StringCourse":
         if(_loc3_ == false)
         {
            this.api.ui.unloadUIComponent("StringCourse");
         }
         break;
      case "CreaturesMode":
         this.api.kernel.GameManager.applyCreatureMode();
         break;
      case "Buff":
         if(_loc3_)
         {
            this.api.ui.loadUIComponent("Buff","Buff");
            break;
         }
         this.api.ui.unloadUIComponent("Buff");
         break;
      case "DisplayStyle":
         this.api.kernel.debug("SetDisplayStyle : " + _loc3_);
         this.api.kernel.setDisplayStyle(_loc3_);
         break;
      case "DefaultQuality":
         this.api.kernel.setQuality(_loc3_);
         break;
      case "MovableBar":
         this.api.ui.getUIComponent("Banner").displayMovableBar(_loc3_ && (this.api.datacenter.Game.isFight || !this.getOption("HideSpellBar")));
         break;
      case "HideSpellBar":
         this.api.ui.getUIComponent("Banner").displayMovableBar(this.getOption("MovableBar") && (this.api.datacenter.Game.isFight || !_loc3_));
         break;
      case "MovableBarSize":
         this.api.ui.getUIComponent("Banner").setMovableBarSize(_loc3_);
         break;
      case "ShortcutSet":
         this.api.kernel.KeyManager.onSetChange(_loc3_);
         break;
      case "CharacterPreview":
         this.api.ui.getUIComponent("Inventory").showCharacterPreview(_loc3_);
         break;
      case "AudioMusicVol":
         this.api.kernel.AudioManager.musicVolume = _loc3_;
         break;
      case "AudioEffectVol":
         this.api.kernel.AudioManager.effectVolume = _loc3_;
         break;
      case "AudioEnvVol":
         this.api.kernel.AudioManager.environmentVolume = _loc3_;
         break;
      case "AudioMusicMute":
         this.api.kernel.AudioManager.musicMute = _loc3_;
         break;
      case "AudioEffectMute":
         this.api.kernel.AudioManager.effectMute = _loc3_;
         break;
      case "AudioEnvMute":
         this.api.kernel.AudioManager.environmentMute = _loc3_;
         break;
      case "TimestampInChat":
         this.api.electron.retroChatRefresh(undefined,_loc3_);
         this.api.kernel.ChatManager.refresh();
         break;
      case "SkipFightAnimations":
         this.api.datacenter.Player.isSkippingFightAnimations = _loc3_;
         break;
      case "SkipLootPanel":
         this.api.datacenter.Player.isSkippingLootPanel = _loc3_;
         break;
      case "EnableWidescreenPanels":
         this.api.electron.setWidescreenEnabled(_loc3_);
         _loc2_ = this.api.ui.getUIComponent("Banner");
         if(_loc2_ != undefined)
         {
            _loc2_.configureUseFlashChat(this.api.datacenter.Basics.forceFlashChat || (!_loc3_ || !this.api.electron.isShowingWidescreenPanel));
         }
         break;
      case "PrettyTacticMode":
         if(this.api.datacenter.Game.isFight && this.api.datacenter.Game.isTacticMode)
         {
            this.api.gfx.activateTacticMode(true);
         }
         break;
      case "AutoHideSmiley":
      case "DebugSizeIndex":
      case "ServerPortIndex":
      case "ViewAllMonsterInGroup":
      case "ChatEffects":
      case "GuildMessageSound":
      case "StartTurnSound":
      case "BannerShortcuts":
      case "RegroupDamage":
      case "AnimateHPBar":
      case "ViewHPAsBar":
      case "ShowFriendsAllHealthBar":
      case "TipsOnStart":
      case "PointsOverHead":
   }
   return true;
};
_loc1 = dofus.aks.Chat.prototype;
_loc1.subscribeChannels = function(_loc2, _loc3_)
{
   switch(_loc2)
   {
      case 0:
         _loc2 = "i";
         break;
      case 2:
         _loc2 = "*";
         break;
      case 3:
         _loc2 = "#$p";
         break;
      case 4:
         _loc2 = "%";
         break;
      case 5:
         _loc2 = "!";
         break;
      case 6:
         _loc2 = "?";
         break;
      case 7:
         _loc2 = ":";
         break;
      case 8:
         _loc2 = "^";
         break;
      case 11:
         _loc2 = "~";
   }
   this.aks.send("cC" + (!_loc3_ ? "-" : "+") + _loc2,true);
};
_loc1.onSubscribeChannel = function(sExtraData)
{
   var _loc4_ = sExtraData.charAt(0) == "+";
   var _loc5_ = sExtraData.substr(1).split("");
   var _loc3_ = 0;
   var _loc2_;
   while(_loc3_ < _loc5_.length)
   {
      _loc2_ = 0;
      switch(_loc5_[_loc3_])
      {
         case "i":
            _loc2_ = 0;
            break;
         case "*":
            _loc2_ = 2;
            break;
         case "#":
            _loc2_ = 3;
            break;
         case "$":
            _loc2_ = 3;
            break;
         case "p":
            _loc2_ = 3;
            break;
         case "%":
            _loc2_ = 4;
            break;
         case "!":
            _loc2_ = 5;
            break;
         case "?":
            _loc2_ = 6;
            break;
         case ":":
            _loc2_ = 7;
            break;
         case "^":
            _loc2_ = 8;
            break;
         case "@":
            _loc2_ = 9;
            break;
         case "¡ ":
            _loc2_ = 10;
            break;
         case "~":
            _loc2_ = 11;
            break;
         case "¬":
            _loc2_ = 12;
      }
      _loc3_ += 1;
      this.api.ui.getUIComponent("Banner").chat.selectFilter(_loc2_,_loc4_);
      this.api.kernel.ChatManager.setTypeVisible(_loc2_,_loc4_);
      this.api.datacenter.Basics.chat_type_visible[_loc2_] = _loc4_;
   }
};
_loc1.onMessage = function(_loc2_, _loc3_)
{
   if(!_loc2_)
   {
      switch(_loc3_.charAt(0))
      {
         case "S":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /w <" + this.api.lang.getText("NAME") + "> <" + this.api.lang.getText("MSG") + ">"]),"ERROR_CHAT");
            break;
         case "f":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("USER_NOT_CONNECTED",[_loc3_.substr(1)]),"ERROR_CHAT");
            break;
         case "e":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("USER_NOT_CONNECTED_BUT_TRY_SEND_EXTERNAL",[_loc3_.substr(1)]),"ERROR_CHAT");
            break;
         case "n":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("USER_NOT_CONNECTED_EXTERNAL_NACK",[_loc3_.substr(1)]),"ERROR_CHAT");
      }
      return undefined;
   }
   var _loc17_ = _loc3_.charAt(0);
   _loc3_ = _loc17_ != "|" ? _loc3_.substr(2) : _loc3_.substr(1);
   var _loc8_ = _loc3_.split("|");
   _loc3_ = _loc8_[2];
   var _loc4_ = _loc8_[1];
   var _loc9_ = _loc8_[0];
   var _loc13_ = _loc8_[3];
   var _loc5_ = !(_loc8_[4] != undefined && (_loc8_[4].length > 0 && _loc8_[4] != "")) ? null : _loc8_[4];
   if(this.api.kernel.ChatManager.isBlacklisted(_loc4_))
   {
      return undefined;
   }
   var _loc7_ = _loc3_;
   var _loc25_;
   if(_loc13_.length > 0)
   {
      _loc25_ = _loc13_.split("!");
      _loc3_ = this.api.kernel.ChatManager.parseInlineItems(_loc3_,_loc25_);
   }
   _loc3_ = this.api.kernel.ChatManager.parseInlinePos(_loc3_);
   var _loc6_;
   var _loc15_;
   var _loc19_;
   var _loc11_;
   var _loc23_;
   var _loc24_;
   var _loc20_;
   var _loc21_;
   var _loc27_;
   var _loc22_;
   var _loc31_;
   var _loc29_;
   var _loc16_;
   var _loc10_;
   var _loc30_;
   var _loc26_;
   var _loc12_;
   var _loc18_;
   var _loc14_;
   var _loc28_;
   switch(_loc17_)
   {
      case "~":
         this.api.kernel.ChatManager.addText("(" + this.api.lang.getText("ALL_CHANNEL") + ") " + this.getLinkName(_loc4_,_loc5_) + " : " + _loc3_,dofus.Constants.ALL_CHAT_COLOR,true,_loc5_);
         return undefined;
      case "¬":
         this.api.kernel.ChatManager.addText("(" + this.api.lang.getText("UNKNOWN_CHANNEL") + ") " + this.getLinkName(_loc4_,_loc5_) + " : " + _loc3_,dofus.Constants.UNKNOWN_CHAT_COLOR,true,_loc5_);
         return undefined;
      case "¿":
         this.api.kernel.ChatManager.addText("(" + this.api.lang.getText("KOLISEO_CHANNEL") + ") " + this.getLinkName(_loc4_,_loc5_) + " : " + _loc3_,dofus.Constants.KOLISEO_CHAT_COLOR,true,_loc5_);
         return undefined;
      case "¡":
         this.api.kernel.ChatManager.addText("(" + this.api.lang.getText("ABO_CHANNEL") + ") " + this.getLinkName(_loc4_,_loc5_) + " : " + _loc3_,dofus.Constants.ABO_CHAT_COLOR,true,_loc5_);
         return undefined;
      case "F":
         _loc6_ = "WHISP_CHAT";
         _loc3_ = this.api.kernel.ChatManager.parseSecretsEmotes(_loc3_);
         if(!_loc3_.length)
         {
            return undefined;
         }
         _loc15_ = this.api.lang.getText("FROM") + " " + _loc4_ + " : ";
         this.api.electron.makeNotification(_loc15_ + this.api.kernel.ChatManager.applyInputCensorship(_loc3_));
         _loc3_ = this.api.lang.getText("FROM") + " <i>" + this.getLinkName(_loc4_,_loc5_) + "</i> : " + this.getLinkMessage(_loc4_,_loc15_,_loc7_,_loc3_,_loc5_);
         this.api.kernel.Console.pushWhisper("/w " + _loc4_ + " ");
         break;
      case "T":
         _loc6_ = "WHISP_CHAT";
         _loc19_ = this.api.lang.getText("TO_DESTINATION") + " " + _loc4_ + " : ";
         _loc3_ = this.api.lang.getText("TO_DESTINATION") + " " + this.getLinkName(_loc4_,_loc5_) + " : " + this.getLinkMessage(_loc4_,_loc19_,_loc7_,_loc3_,_loc5_);
         break;
      case "#":
         if(this.api.datacenter.Game.isFight)
         {
            _loc6_ = "WHISP_CHAT";
            if(this.api.datacenter.Game.isSpectator)
            {
               _loc11_ = "(" + this.api.lang.getText("SPECTATOR") + ")";
            }
            else
            {
               _loc11_ = "(" + this.api.lang.getText("TEAM") + ")";
            }
            _loc23_ = _loc11_ + " " + _loc4_ + " : ";
            _loc3_ = _loc11_ + " " + this.getLinkName(_loc4_,_loc5_) + " : " + this.getLinkMessage(_loc4_,_loc23_,_loc7_,_loc3_,_loc5_);
         }
         break;
      case "%":
         _loc6_ = "GUILD_CHAT_SOUND";
         _loc24_ = "(" + this.api.lang.getText("GUILD") + ") " + _loc4_ + " : ";
         _loc3_ = "(" + this.api.lang.getText("GUILD") + ") " + this.getLinkName(_loc4_,_loc5_) + " : " + this.getLinkMessage(_loc4_,_loc24_,_loc7_,_loc3_,_loc5_);
         break;
      case "$":
         _loc6_ = "PARTY_CHAT";
         _loc20_ = "(" + this.api.lang.getText("PARTY") + ") " + _loc4_ + " : ";
         _loc3_ = "(" + this.api.lang.getText("PARTY") + ") " + this.getLinkName(_loc4_,_loc5_) + " : " + this.getLinkMessage(_loc4_,_loc20_,_loc7_,_loc3_,_loc5_);
         break;
      case "!":
         _loc6_ = "PVP_CHAT";
         _loc21_ = "(" + this.api.lang.getText("ALIGNMENT") + ") " + _loc4_ + " : ";
         _loc3_ = "(" + this.api.lang.getText("ALIGNMENT") + ") " + this.getLinkName(_loc4_,_loc5_) + " : " + this.getLinkMessage(_loc4_,_loc21_,_loc7_,_loc3_,_loc5_);
         break;
      case "?":
         _loc6_ = "RECRUITMENT_CHAT";
         _loc27_ = "(" + this.api.lang.getText("RECRUITMENT") + ") " + _loc4_ + " : ";
         _loc3_ = "(" + this.api.lang.getText("RECRUITMENT") + ") " + this.getLinkName(_loc4_,_loc5_) + " : " + this.getLinkMessage(_loc4_,_loc27_,_loc7_,_loc3_,_loc5_);
         break;
      case ":":
         _loc6_ = "TRADE_CHAT";
         _loc22_ = "(" + this.api.lang.getText("TRADE") + ") " + _loc4_ + " : ";
         _loc3_ = "(" + this.api.lang.getText("TRADE") + ") " + this.getLinkName(_loc4_,_loc5_) + " : " + this.getLinkMessage(_loc4_,_loc22_,_loc7_,_loc3_,_loc5_);
         break;
      case "^":
         _loc6_ = "MEETIC_CHAT";
         _loc31_ = "(" + this.api.lang.getText("MEETIC") + ") " + _loc4_ + " : ";
         _loc3_ = "(" + this.api.lang.getText("MEETIC") + ") " + this.getLinkName(_loc4_,_loc5_) + " : " + this.getLinkMessage(_loc4_,_loc31_,_loc7_,_loc3_,_loc5_);
         break;
      case "@":
         _loc6_ = "ADMIN_CHAT";
         _loc29_ = "(" + this.api.lang.getText("PRIVATE_CHANNEL") + ") " + _loc4_ + " : ";
         _loc3_ = "(" + this.api.lang.getText("PRIVATE_CHANNEL") + ") " + this.getLinkName(_loc4_,_loc5_) + " : " + this.getLinkMessage(_loc4_,_loc29_,_loc7_,_loc3_,_loc5_);
         break;
      case "_":
         _loc6_ = "HEROES_CHAT";
         _loc25_ = "(" + this.api.lang.getText("HEROES_CHANNEL") + ") " + _loc4_ + " : ";
         _loc3_ = "(" + this.api.lang.getText("HEROES_CHANNEL") + ") " + this.getLinkName(_loc4_,_loc5_) + " : " + this.getLinkMessage(_loc4_,_loc25_,_loc7_,_loc3_,_loc5_);
         break;
      case "+":
         _loc6_ = "ERROR_CHAT";
         _loc3_ = this.getLinkName(_loc4_,_loc5_) + " : " + _loc3_;
         break;
      default:
         _loc16_ = _loc3_.charAt(0) == dofus.Constants.EMOTE_CHAR && (_loc3_.charAt(1) == dofus.Constants.EMOTE_CHAR && (_loc3_.charAt(_loc3_.length - 1) == dofus.Constants.EMOTE_CHAR && _loc3_.charAt(_loc3_.length - 2) == dofus.Constants.EMOTE_CHAR));
         if(this.api.lang.getConfigText("EMOTES_ENABLED") && (!_loc16_ && (_loc3_.charAt(0) == dofus.Constants.EMOTE_CHAR && _loc3_.charAt(_loc3_.length - 1) == dofus.Constants.EMOTE_CHAR)))
         {
            if(!this.api.datacenter.Game.isRunning && this.api.kernel.ChatManager.isTypeVisible(2))
            {
               _loc10_ = !(_loc3_.charAt(_loc3_.length - 2) == "." && _loc3_.charAt(_loc3_.length - 3) != ".") ? _loc3_ : _loc3_.substr(0,_loc3_.length - 2) + dofus.Constants.EMOTE_CHAR;
               _loc10_ = dofus.Constants.EMOTE_CHAR + _loc10_.charAt(1).toUpperCase() + _loc10_.substr(2);
               this.api.gfx.addSpriteBubble(_loc9_,this.api.kernel.ChatManager.applyInputCensorship(_loc10_));
            }
            _loc6_ = "EMOTE_CHAT";
            _loc3_ = _loc3_.substr(1,_loc3_.length - 2);
            if(!dofus["\x0b\b"].ChatManager.isPonctuation(_loc3_.charAt(_loc3_.length - 1)))
            {
               _loc3_ += ".";
            }
            _loc3_ = "<i>" + this.getLinkName(_loc4_,_loc5_) + " " + _loc3_.charAt(0).toLowerCase() + _loc3_.substr(1) + "</i>";
            break;
         }
         if(_loc3_.substr(0,7) == "!THINK!")
         {
            _loc3_ = _loc3_.substr(7);
            if(!this.api.datacenter.Game.isRunning && this.api.kernel.ChatManager.isTypeVisible(2))
            {
               this.api.gfx.addSpriteBubble(_loc9_,this.api.kernel.ChatManager.applyInputCensorship(_loc3_),ank.battlefield["\x1e\x0b\t"].BUBBLE_TYPE_THINK);
            }
            _loc6_ = "THINK_CHAT";
            _loc30_ = _loc4_ + " " + this.api.lang.getText("THINKS_WORD") + " : ";
            _loc3_ = "<i>" + this.getLinkName(_loc4_,_loc5_) + " " + this.api.lang.getText("THINKS_WORD") + " : " + this.getLinkMessage(_loc4_,_loc30_,_loc7_,_loc3_,_loc5_) + "</i>";
            break;
         }
         if(_loc16_ && !_global.isNaN(_loc3_.substr(2,_loc3_.length - 4)))
         {
            if(!this.api.kernel.OptionsManager.getOption("UseSpeakingItems"))
            {
               return undefined;
            }
            _loc26_ = _global.parseInt(_loc3_.substr(2,_loc3_.length - 4));
            _loc12_ = this.api.lang.getSpeakingItemsText(_loc26_ - Number(_loc9_));
            if(_loc12_.m)
            {
               _loc6_ = "MESSAGE_CHAT";
               _loc3_ = _loc12_.m;
               if(!this.api.datacenter.Game.isRunning && this.api.kernel.ChatManager.isTypeVisible(2))
               {
                  this.api.gfx.addSpriteBubble(_loc9_,this.api.kernel.ChatManager.applyInputCensorship(_loc3_));
               }
               _loc18_ = _loc4_ + " : ";
               _loc3_ = this.getLinkName(_loc4_,_loc5_,true) + " : " + this.getLinkMessage(_loc4_,_loc18_,_loc7_,_loc3_,_loc5_);
               break;
            }
            return undefined;
         }
         if(!this.api.datacenter.Game.isRunning && this.api.kernel.ChatManager.isTypeVisible(2))
         {
            this.api.gfx.addSpriteBubble(_loc9_,this.api.kernel.ChatManager.applyInputCensorship(_loc3_));
         }
         _loc6_ = "MESSAGE_CHAT";
         _loc14_ = _loc4_ + " : ";
         _loc3_ = this.getLinkName(_loc4_,_loc5_) + " : " + this.getLinkMessage(_loc4_,_loc14_,_loc7_,_loc3_,_loc5_);
         if(this.api.datacenter.Player.isAuthorized)
         {
            _loc28_ = this.api.kernel.DebugManager.getTimestamp();
            this.api.kernel.ChatManager.addRawMessage(this.api.datacenter.Map.id,_loc6_,this.getRawFullMessage(_loc14_,_loc7_),_loc28_);
         }
   }
   this.api.kernel.showMessage(undefined,_loc3_,_loc6_,undefined,_loc5_);
};
dofus.aks.Chat.getLinkHighlightSprite = function(_loc2_, _loc3_)
{
   return "<a href=\"asfunction:onHref,highlightSprite," + _loc2_ + "\">" + _loc3_ + "</a>";
};
dofus.aks.Chat.getLinkHighlightSprites = function(aSpritesIDs, _loc3_)
{
   return dofus.aks.Chat.getLinkHighlightSprite(aSpritesIDs.join(","),_loc3_);
};
_loc1 = dofus.aks.Game.prototype;
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
   var _loc9_ = _loc2_.split("|");
   var _loc4_ = _loc9_[0];
   var _loc8_ = Number(_loc9_[1]) / 1000;
   var _loc12_ = Number(_loc9_[2]);
   this.api.datacenter.Game.currentTableTurn = _loc12_;
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
      this.api.ui.getUIComponent("Banner").startTimer(_loc8_);
      this.api.kernel.GameManager.startInactivityDetector();
      dofus["\x10\x16"].getInstance().forceMouseOver();
      this.api.gfx.mapHandler.resetEmptyCells();
   }
   else
   {
      this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_NONE);
      this.api.ui.getUIComponent("Timeline").startChrono(_loc8_);
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
   if(this.api.kernel.OptionsManager.getOption("IndicateEntityTurnStart"))
   {
      if(this.bSubareaHasWhiteFloor)
      {
         this.api.gfx.addSpriteExtraClip(_loc4_,dofus.Constants.HIGHLIGHT_FILE,0,true);
      }
      else
      {
         this.api.gfx.addSpriteExtraClip(_loc4_,dofus.Constants.HIGHLIGHT_FILE,undefined,true);
      }
   }
   this.api.kernel.GameManager.cleanUpGameArea(true);
   ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this.api.network.Ping,"GameDecoDetect",this.api.network,this.api.network.quickPing,_loc8_ * 1000);
   this.api.kernel.TipsManager.showNewTip(dofus["\x0b\b"].TipsManager.TIP_FIGHT_START);
   var _loc10_;
   var _loc11_;
   var _loc7_;
   if(!this.api.kernel.OptionsManager.getOption("Myflag"))
   {
      _loc10_ = _loc2_.id;
      _loc11_ = _loc2_.cellNum;
      _loc7_ = new ank.battlefield.datacenter["\x1e\n\x01"]();
      _loc7_.file = dofus.Constants.CLIPS_PATH + "myflag.swf";
      _loc7_.bInFrontOfSprite = true;
      _loc7_.bTryToBypassContainerColor = true;
      this.api.gfx.spriteLaunchVisualEffect(_loc10_,_loc7_,_loc11_,11,undefined,undefined,undefined,true);
   }
};
_loc1 = dofus["\x1e\n\x07"]["\x12\x05"]["\x12\x1c"].prototype;
_loc1.process = function(sCmd, oParams)
{
   super.process(sCmd,oParams);
   sCmd = this.parseSpecialDatas(sCmd);
   var _loc4_;
   var _loc14_;
   var _loc26_;
   var _loc6_;
   var _loc13_;
   var _loc20_;
   var _loc30_;
   var _loc22_;
   var _loc16_;
   var _loc8_;
   var _loc15_;
   var _loc7_;
   var _loc11_;
   var _loc21_;
   var _loc29_;
   var _loc27_;
   var _loc5_;
   var _loc12_;
   var _loc9_;
   var _loc24_;
   var _loc23_;
   var _loc28_;
   var _loc25_;
   if(sCmd.charAt(0) == "/")
   {
      _loc4_ = sCmd.split(" ");
      _loc14_ = _loc4_[0].substr(1).toUpperCase();
      _loc4_.splice(0,1);
      while(_loc4_[0].length == 0)
      {
         _loc4_.splice(0,1);
      }
      switch(_loc14_)
      {
         case "ALL":
            this.api.network.Chat.send(_loc4_.join(" "),"~",oParams);
            break;
         case "LK":
            _loc26_ = this.api.datacenter.Player.Spells.findFirstItem("ID",179);
            _global.API.kernel.showMessage(undefined,_loc26_,"INFO_CHAT");
            this.api.kernel.GameManager.switchToSpellLaunch(_loc26_.item,true);
            break;
         case "CR":
            this.api.ui.loadUIComponent("ChooseReward","ChooseReward",{items:undefined});
            break;
         case "CREA":
            this.api.kernel.GameManager.isFightCreaturesMode = !this.api.kernel.GameManager.isFightCreaturesMode;
            break;
         case "SWAPHEROEVIEW":
            if(this.api.ui.getUIComponent("Inventory") != null)
            {
               this.api.datacenter.Player.swapNextHeroeView("Inventory");
               break;
            }
            if(this.api.ui.getUIComponent("StatsJob") != null)
            {
               this.api.datacenter.Player.swapNextHeroeView("StatsJob");
            }
            break;
         case "FINDPOS":
            for(var _loc18_ in this.api.datacenter.Player.Inventory)
            {
               _loc6_ = this.api.datacenter.Player.Inventory[_loc18_];
               if(_loc6_.position == 1)
               {
                  this.api.kernel.showMessage(undefined,"item position 1 : " + _loc6_.name + " " + _loc6_.ID,"INFO_CHAT");
               }
            }
            break;
         case "HELP":
         case "H":
         case "?":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("COMMANDS_HELP"),"INFO_CHAT");
            break;
         case "VERSION":
         case "VER":
         case "ABOUT":
            _loc13_ = "--------------------------------------------------------------\n";
            _loc13_ += "<b>DOFUS RETRO Client v" + dofus.Constamts.VERSION + "." + dofus.Constamts.SUBVERSION + "." + dofus.Constamts.SUBSUBVERSION + "</b>";
            if(dofus.Constamts.BETAVERSION > 0)
            {
               _loc13_ += " <b><font color=\"#FF0000\">BETA VERSION " + dofus.Constamts.BETAVERSION + "</font></b>";
            }
            _loc13_ += "\n(c) ANKAMA GAMES (" + dofus.Constamts.VERSIONDATE + ")\n";
            _loc13_ += "Flash player " + System.capabilities.version + "\n";
            _loc13_ += "--------------------------------------------------------------";
            this.api.kernel.showMessage(undefined,_loc13_,"COMMANDS_CHAT");
            break;
         case "CHOOSEENSEMBLE":
            oEnsemble = new dofus.datacenter.EnsemblesIcons(2);
            oEnsemble.spells.push(new dofus.datacenter["\x1e\x0e\x1c"](5230,1));
            this.api.datacenter.Player.Ensembles.push(oEnsemble);
            this.api.datacenter.Player.ensembleSelected = oEnsemble;
            break;
         case "T":
            this.api.network.Chat.send(_loc4_.join(" "),"#",oParams);
            break;
         case "G":
            if(this.api.datacenter.Player.guildInfos != undefined)
            {
               this.api.network.Chat.send(_loc4_.join(" "),"%",oParams);
            }
            break;
         case "P":
            if(this.api.ui.getUIComponent("Party") != undefined)
            {
               this.api.network.Chat.send(_loc4_.join(" "),"$",oParams);
            }
            break;
         case "S":
            this.api.network.Chat.send(_loc4_.join(" "),"*",oParams);
            break;
         case "A":
            this.api.network.Chat.send(_loc4_.join(" "),"!",oParams);
            break;
         case "R":
            this.api.network.Chat.send(_loc4_.join(" "),"?",oParams);
            break;
         case "B":
            this.api.network.Chat.send(_loc4_.join(" "),":",oParams);
            break;
         case "I":
            this.api.network.Chat.send(_loc4_.join(" "),"^",oParams);
            break;
         case "Q":
            this.api.network.Chat.send(_loc4_.join(" "),"@",oParams);
         case "M":
            this.api.network.Chat.send(_loc4_.join(" "),"¤ ",oParams);
            break;
         case "E":
            this.api.network.Chat.send(_loc4_.join(" "),"~",oParams);
            break;
         case "W":
         case "MSG":
         case "WHISPER":
            if(_loc4_.length < 2)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /w &lt;" + this.api.lang.getText("NAME") + "&gt; &lt;" + this.api.lang.getText("MSG") + "&gt;"]),"ERROR_CHAT");
               break;
            }
            _loc20_ = _loc4_[0];
            if(_loc20_.length < 2)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /w &lt;" + this.api.lang.getText("NAME") + "&gt; &lt;" + this.api.lang.getText("MSG") + "&gt;"]),"ERROR_CHAT");
               break;
            }
            _loc4_.shift();
            _loc30_ = _loc4_.join(" ");
            this.pushWhisper("/w " + _loc20_ + " ");
            this.api.network.Chat.send(_loc30_,_loc20_,oParams);
            break;
         case "WHOAMI":
            this.api.network.Basics.whoAmI();
            break;
         case "WHOIS":
            if(_loc4_.length == 0)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /whois &lt;" + this.api.lang.getText("NAME") + "&gt;"]),"ERROR_CHAT");
               break;
            }
            this.api.network.Basics.whoIs(_loc4_[0]);
            break;
         case "F":
         case "FRIEND":
         case "FRIENDS":
            switch(_loc4_[0].toUpperCase())
            {
               case "A":
               case "+":
                  this.api.network.Friends.addFriend(_loc4_[1]);
                  break;
               case "D":
               case "R":
               case "-":
                  this.api.network.Friends.removeFriend(_loc4_[1]);
                  break;
               case "L":
                  this.api.network.Friends.getFriendsList();
                  break;
               default:
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /f &lt;A/D/L&gt; &lt;" + this.api.lang.getText("NAME") + "&gt;"]),"ERROR_CHAT");
            }
            break;
         case "IGNORE":
         case "ENEMY":
            switch(_loc4_[0].toUpperCase())
            {
               case "A":
               case "+":
                  this.api.network.Enemies.addEnemy(_loc4_[1]);
                  break;
               case "D":
               case "R":
               case "-":
                  this.api.network.Enemies.removeEnemy(_loc4_[1]);
                  break;
               case "L":
                  this.api.network.Enemies.getEnemiesList();
                  break;
               default:
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /f &lt;A/D/L&gt; &lt;" + this.api.lang.getText("NAME") + "&gt;"]),"ERROR_CHAT");
            }
            break;
         case "PING":
            this.api.network.ping();
            break;
         case "GOD":
         case "GODMODE":
            _loc22_ = ["Bill","Tyn","Nyx","Lichen","Simsoft"];
            this.api.kernel.showMessage(undefined,_loc22_[Math.floor(Math.random() * _loc22_.length)],"INFO_CHAT");
            break;
         case "APING":
            this.api.kernel.showMessage(undefined,"Average ping : " + this.api.network.getAveragePing() + "ms (on " + this.api.network.getAveragePingPacketsCount() + " packets)","INFO_CHAT");
            break;
         case "MAPID":
            this.api.kernel.showMessage(undefined,"MAP ID : " + this.api.datacenter.Map.id,"INFO_CHAT");
            if(this.api.datacenter.Player.isAuthorized)
            {
               this.api.kernel.showMessage(undefined,"Area : " + this.api.datacenter.Map.area,"INFO_CHAT");
               this.api.kernel.showMessage(undefined,"Sub area : " + this.api.datacenter.Map.subarea,"INFO_CHAT");
               this.api.kernel.showMessage(undefined,"Super Area : " + this.api.datacenter.Map.superarea,"INFO_CHAT");
            }
            break;
         case "CELLID":
            this.api.kernel.showMessage(undefined,"CELL ID : " + this.api.datacenter.Player.data.cellNum,"INFO_CHAT");
            break;
         case "TIME":
            this.api.kernel.showMessage(undefined,this.api.kernel.NightManager.date + " - " + this.api.kernel.NightManager.time,"INFO_CHAT");
            break;
         case "LIST":
         case "PLAYERS":
            if(!this.api.datacenter.Game.isFight)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_DO_COMMAND_HERE",[_loc14_]),"ERROR_CHAT");
               return undefined;
            }
            _loc16_ = new Array();
            _loc8_ = this.api.datacenter.Sprites.getItems();
            for(_loc18_ in _loc8_)
            {
               if(_loc8_[_loc18_] instanceof dofus.datacenter["\x13\x01"])
               {
                  _loc16_.push("- " + _loc8_[_loc18_].name);
               }
            }
            this.api.kernel.showMessage(undefined,this.api.lang.getText("PLAYERS_LIST") + " :\n" + _loc16_.join("\n"),"INFO_CHAT");
            break;
         case "KICK":
            if(!this.api.datacenter.Game.isFight || this.api.datacenter.Game.isRunning)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_DO_COMMAND_HERE",[_loc14_]),"ERROR_CHAT");
               return undefined;
            }
            _loc15_ = String(_loc4_[0]);
            _loc7_ = this.api.datacenter.Sprites.getItems();
            for(_loc18_ in _loc7_)
            {
               if(_loc7_[_loc18_] instanceof dofus.datacenter["\x13\x01"] && _loc7_[_loc18_].name == _loc15_)
               {
                  _loc11_ = _loc7_[_loc18_].id;
                  break;
               }
            }
            if(_loc11_ != undefined)
            {
               this.api.network.Game.leave(_loc11_);
               break;
            }
            this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_KICK_A",[_loc15_]),"ERROR_CHAT");
            break;
         case "SPECTATOR":
         case "SPEC":
            if(!this.api.datacenter.Game.isRunning || this.api.datacenter.Game.isSpectator)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_DO_COMMAND_HERE",[_loc14_]),"ERROR_CHAT");
               return undefined;
            }
            this.api.network.Fights.blockSpectators();
            break;
         case "AWAY":
            this.api.network.Basics.away();
            break;
         case "INVISIBLE":
            this.api.network.Basics.invisible();
            break;
         case "INVITE":
            _loc21_ = String(_loc4_[0]);
            if(_loc21_.length == 0 || _loc21_ == undefined)
            {
               break;
            }
            this.api.network.Party.invite(_loc21_);
            break;
         case "CONSOLE":
               if(this.api.datacenter.Player.isAuthorized)
               {
                  // Instrumentation: log who requested the Debug UI (player/account/timestamp)
                  this.api.ui.loadUIComponent("Debug","Debug",undefined,{bAlwaysOnTop:true});
                  break;
               }
            this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc14_]),"ERROR_CHAT");
            break;
         case "DEBUG":
            if(this.api.datacenter.Player.isAuthorized)
            {
               this.api.kernel.DebugManager.toggleDebug();
            }
            break;
         case "CHANGECHARACTER":
            this.api.kernel.changeServer();
            break;
         case "LOGOUT":
            this.api.kernel.disconnect();
            break;
         case "QUIT":
            this.api.kernel.quit();
            break;
         case "THINK":
         case "METHINK":
         case "PENSE":
         case "TH":
            if(_loc4_.length < 1)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /" + _loc14_.toLowerCase() + " &lt;" + this.api.lang.getText("TEXT_WORD") + "&gt;"]),"ERROR_CHAT");
               break;
            }
            _loc29_ = "!THINK!" + _loc4_.join(" ");
            if(this.api.datacenter.Player.canChatToAll)
            {
               this.api.network.Chat.send(_loc29_,"*",oParams);
            }
            break;
         case "ME":
         case "EM":
         case "MOI":
         case "EMOTE":
            if(!this.api.lang.getConfigText("EMOTES_ENABLED"))
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc14_]),"ERROR_CHAT");
               break;
            }
            if(_loc4_.length < 1)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /" + _loc14_.toLowerCase() + " &lt;" + this.api.lang.getText("TEXT_WORD") + "&gt;"]),"ERROR_CHAT");
               break;
            }
            _loc27_ = _loc4_.join(" ");
            if(this.api.datacenter.Player.canChatToAll)
            {
               this.api.network.Chat.send(dofus.Constamts.EMOTE_CHAR + _loc27_ + dofus.Constamts.EMOTE_CHAR,"*",oParams);
            }
            break;
         case "KB":
            this.api.ui.loadUIComponent("KnownledgeBase","KnownledgeBase");
            break;
         case "RELEASE":
            if(this.api.datacenter.Player.data.isTomb)
            {
               this.api.network.Game.freeMySoul();
               break;
            }
            if(this.api.datacenter.Player.data.isSlow)
            {
               this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_ALREADY_A_GHOST"),"ERROR_CHAT");
               break;
            }
            this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_NOT_DEAD_AT_LEAST_FOR_NOW"),"ERROR_CHAT");
            break;
         case "SELECTION":
            if(_loc4_[0] == "enable" || _loc4_[0] == "on")
            {
               this.api.ui.getUIComponent("Banner").setSelectable(true);
               break;
            }
            if(_loc4_[0] == "disable" || _loc4_[0] == "off")
            {
               this.api.ui.getUIComponent("Banner").setSelectable(false);
               break;
            }
            this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",["/selection [enable|on|disable|off]"]),"ERROR_CHAT");
            break;
         case "RETROCHAT":
         case "CHATOUTPUT":
            if(!this.api.electron.enabled)
            {
               this.api.kernel.showMessage(undefined,"Does not work on a Flash Projector","ERROR_CHAT");
               break;
            }
            dofus.Electron.retroChatOpen();
            break;
         case "WTF":
            for(_loc18_ in this.api.datacenter.Player.getHeroes())
            {
               _loc5_ = this.api.datacenter.Player.getHeroes()[_loc18_];
               this.api.kernel.showMessage(undefined,_loc5_.ID + " " + _loc5_.Guild + " " + _loc5_.Name,"INFO_CHAT");
            }
            break;
         case "SHOWLIFES":
            _loc12_ = this.api.gfx.spriteHandler.getSprites().getItems();
            for(var _loc19_ in _loc12_)
            {
               _loc9_ = _loc12_[_loc19_];
               this.api.gfx.showOrDisableSpriteOverHeadItem(_loc19_,"text",dofus["\r\x13"].battlefield.HealthBarOverHead,[_loc9_,100]);
            }
            break;
         case "CLS":
         case "CLEAR":
            this.api.electron.retroChatClear();
            this.api.kernel.ChatManager.clear();
            this.api.kernel.ChatManager.refresh(true);
            break;
         case "TACTIC":
            if(this.api.datacenter.Player.isAuthorized || this.api.datacenter.Game.isFight)
            {
               this.api.datacenter.Game.isTacticMode = !this.api.datacenter.Game.isTacticMode;
               this.api.gfx.activateTacticMode(this.api.datacenter.Game.isTacticMode);
               this.api.ui.getUIComponent("FightOptionButtons")._btnTactic.selected = this.api.datacenter.Game.isTacticMode;
            }
            break;
         case "CELLINFOS":
            _loc24_ = this.api.datacenter.Player.data.cellNum;
            _loc23_ = this.api.datacenter.Map.data[_loc24_];
            _loc28_ = _loc23_.active;
            this.api.kernel.debug("cellule : " + _loc24_ + " ,tactic : " + _loc23_.isTactic2(this.api.datacenter.Map) + " ,active : " + _loc28_);
            break;
         case "SPEAKINGITEM":
            if(this.api.datacenter.Player.isAuthorized)
            {
               this.api.kernel.showMessage(undefined,"Count : " + this.api.kernel.SpeakingItemsManager.nextMsgDelay,"ERROR_CHAT");
               break;
            }
         case "TUTO":
            this.api.kernel.TutorialServersManager.loadTutorial(_loc4_ + "_" + _loc4_);
            break;
         case "TEST2":
            this.api.network.send("GI");
            this.api.network.send("BD");
            this.api.network.send("GI");
            break;
         default:
            _loc25_ = this.api.lang.getEmoteID(_loc14_.toLowerCase());
            if(_loc25_ != undefined)
            {
               this.api.network.Emotes.useEmote(_loc25_);
               break;
            }
            this.api.kernel.showMessage(undefined,this.api.lang.getText("UNKNOW_COMMAND",[_loc14_]),"ERROR_CHAT");
      }
   }
   else if(this.api.datacenter.Player.canChatToAll)
   {
      this.api.network.Chat.send(sCmd,"*",oParams);
   }
};
_loc1.getCurrentPercent = function()
{
   var _loc2_ = Math.floor((this.api.datacenter.Player.XP - this.api.datacenter.Player.XPlow) / (this.api.datacenter.Player.XPhigh - this.api.datacenter.Player.XPlow) * 100) + "%";
   return _loc2_;
};
_loc1 = dofus["\r\x14"].gapi.ui.Login.prototype;
_loc1.switchLanguage = function(sLanguage)
{
   this.api.config.language = sLanguage;
   this.api.electron.setLanguage(sLanguage);
   this.api.kernel.clearCache();
};
_loc1 = dofus["\x0b\b"].AdminManager.prototype;
_loc1.prepareChat = function(_loc2_)
{
   this.api.ui.getUIComponent("Banner").txtConsole = _loc2_;
   this.api.electron.retroChatSetPromptText(sCommand,true);
};
_loc1.prepareCommand = function(sCommand)
{
   var _loc2_;
   if(this.api.electron.isShowingWidescreenPanel && this.api.electron.getWidescreenPanelId() == dofus.Electron.WIDESCREEN_PANEL_CONSOLE)
   {
      _loc2_ = this.api.ui.getUIComponent("Debug");
      if(_loc2_ != undefined)
      {
         _loc2_.tiCommandLine = sCommand;
      }
      this.api.electron.retroConsoleSetPromptText(sCommand,true);
   }
   else
   {
      this.api.ui.loadUIComponent("Debug","Debug",{command:sCommand},{bStayIfPresent:true,bAlwaysOnTop:true});
   }
};
_loc1 = dofus["\r\x14"].gapi.controls.Chat.prototype;
dofus["\r\x14"].gapi.controls.Chat.XTRA_MASK_OPEN_OFFSET = 300;
dofus["\r\x14"].gapi.controls.Chat.REPLACEMENT_PANEL_DEPTH = 10;
dofus["\r\x14"].gapi.controls.Chat.MINIMAP_REPLACEMENT_PANEL_DEPTH = 9;
dofus["\r\x14"].gapi.controls.Chat.HIDDEN_ITEM = 12009;
_loc1.__get__replacementPanelsManager = function()
{
   return this._replacementPanelsManager;
};
_loc1.addProperty("replacementPanelsManager",_loc1.__get__replacementPanelsManager,function()
{
}
);
_loc1.__get__shortcutsReplacementPanel = function()
{
   if(this.replacementPanelsManager.currentReplacementPanel != dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.SHORTCUTS)
   {
      return undefined;
   }
   return this._mcReplacementPanel;
};
_loc1.addProperty("shortcutsReplacementPanel",_loc1.__get__shortcutsReplacementPanel,function()
{
}
);
_loc1.__get__miniMapReplacementPanel = function()
{
   if(this.replacementPanelsManager.currentReplacementPanel != dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.MINIMAP)
   {
      return undefined;
   }
   return this._mcMiniMapReplacementPanel;
};
_loc1.addProperty("miniMapReplacementPanel",_loc1.__get__miniMapReplacementPanel,function()
{
}
);
_loc1.__get__fightSpectatorReplacementPanel = function()
{
   if(this.replacementPanelsManager.currentReplacementPanel != dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.FULL_WIDTH_FIGHTER_EFFECTS)
   {
      return undefined;
   }
   return this._mcReplacementPanel;
};
_loc1.addProperty("fightSpectatorReplacementPanel",_loc1.__get__fightSpectatorReplacementPanel,function()
{
}
);
_loc1.open = function(bOpen)
{
   var _loc5_ = this.api.ui.getUIComponent("Banner");
   if(_loc5_ != undefined && (!_loc5_.useFlashChat && !bOpen))
   {
      return undefined;
   }
   if(bOpen == !this._bOpened)
   {
      return undefined;
   }
   var _loc6_;
   if(!bOpen && this.api.datacenter.Player.isAuthorized)
   {
      if(this.api.kernel.OptionsManager.getOption("DebugSizeIndex") != dofus["\r\x14"].gapi.ui.Debug.CONSOLE_MINIMIZED)
      {
         _loc6_ = this.api.ui.getUIComponent("Debug");
         if(_loc6_ != undefined)
         {
            this.api.kernel.OptionsManager.setOption("DebugSizeIndex",dofus["\r\x14"].gapi.ui.Debug.CONSOLE_MINIMIZED);
            _loc6_.applySizeIndex(false);
         }
      }
   }
   this._btnOpenClose.selected = !bOpen;
   var _loc3_;
   if(bOpen)
   {
      _loc3_ = -1;
   }
   else
   {
      _loc3_ = 1;
   }
   this._txtChat.setSize(this._txtChat.width,this._txtChat.height + _loc3_ * dofus["\r\x14"].gapi.controls.Chat.OPEN_OFFSET);
   var _loc7_ = this._mcReplacementPanelMask._height + _loc3_ * dofus["\r\x14"].gapi.controls.Chat.XTRA_MASK_OPEN_OFFSET;
   this._mcReplacementPanelMask._height = _loc7_;
   var _loc4_ = this.miniMapReplacementPanel;
   if(_loc4_ != undefined)
   {
      _loc4_.customBgScaleHeight = this._mcReplacementPanelMask._height;
      _loc4_.setScale(dofus["\r\x14"].gapi.controls.MiniMap.SCALE_CUSTOM,true);
   }
   this._y -= _loc3_ * dofus["\r\x14"].gapi.controls.Chat.OPEN_OFFSET;
   this._bOpened = !bOpen;
};
_loc1.__get__filters = function()
{
   return new Array(this._btnFilter0.selected,this._btnFilter1.selected,this._btnFilter2.selected,this._btnFilter3.selected,this._btnFilter4.selected,this._btnFilter5.selected,this._btnFilter6.selected,this._btnFilter7.selected,this._btnFilter8.selected,this._btnFilter10.selected);
};
_loc1.useReplacementPanel = function(nReplacementPanel, aArgs)
{
   var _loc3_ = nReplacementPanel == dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.NO_REPLACEMENT_PANEL;
   this._chatFilters._visible = _loc3_;
   this._txtChat._visible = _loc3_;
   var _loc2_ = 0;
   while(_loc2_ < 12)
   {
      this["_btnFilter" + _loc2_]._visible = _loc3_;
      _loc2_ = _loc2_ + 1;
   }
   this._mcReplacementPanel._visible = !_loc3_;
   this._mcMiniMapReplacementPanel._visible = nReplacementPanel == dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.MINIMAP && (!_loc3_ && !this._replacementPanelsManager.isCurrentReplacementPanelTemporary);
   this._mcReplacementPanelMask._visible = !_loc3_;
   this.addToQueue({object:this._replacementPanelsManager,method:this._replacementPanelsManager.changeReplacementPanel,params:[nReplacementPanel,undefined,aArgs]});
};
_loc1.useTemporaryReplacementPanel = function(nReplacementPanel, aArgs)
{
   this._replacementPanelsManager.currentTemporaryReplacementPanel = nReplacementPanel;
   this.addToQueue({object:this._replacementPanelsManager,method:this._replacementPanelsManager.changeReplacementPanel,params:[nReplacementPanel,undefined,aArgs]});
};
_loc1.removeTemporaryReplacementPanel = function()
{
   this.replacementPanelsManager.currentTemporaryReplacementPanel = undefined;
   var _loc2_ = this.api.kernel.OptionsManager.getOption("chatReplacementPanel");
   this.addToQueue({object:this._replacementPanelsManager,method:this._replacementPanelsManager.changeReplacementPanel,params:[_loc2_]});
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.controls.Chat.CLASS_NAME);
   this._replacementPanelsManager = new dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager(this.api,this);
   this.api.kernel.ChatManager.updateRigth();
   this.isSeePlaces = false;
   var chat = this;
   this._mcReplacementPanelMask.onRelease = function()
   {
      var _loc2_ = {};
      _loc2_.target = this;
      chat.replacementPanelsManager.click(_loc2_);
   };
};
_global.dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager = function(api, chat)
{
   this._bCurrentPanelInstanciated = false;
   this._api = api;
   this._chat = chat;
   this._nCurrentPanel = dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.NO_REPLACEMENT_PANEL;
};
_loc1 = _global.dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.prototype;
dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.NO_REPLACEMENT_PANEL = -1;
dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.MINIMAP = 0;
dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.SHORTCUTS = 1;
dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.FULL_WIDTH_FIGHTER_EFFECTS = 1001;
_loc1.__get__api = function()
{
   return this._api;
};
_loc1.__get__chat = function()
{
   return this._chat;
};
_loc1.__get__currentReplacementPanel = function()
{
   return this._nCurrentPanel;
};
_loc1.__get__currentTemporaryReplacementPanel = function()
{
   return this._nCurrentTemporaryPanel;
};
_loc1.__set__currentTemporaryReplacementPanel = function(nCurrentTemporaryReplacementPanel)
{
   this._nCurrentTemporaryPanel = nCurrentTemporaryReplacementPanel;
};
_loc1.__get__isCurrentReplacementPanelTemporary = function()
{
   return this._nCurrentTemporaryPanel != undefined && this._nCurrentTemporaryPanel == this._nCurrentPanel;
};
_loc1.instanciateCurrentReplacementPanel = function(aPanelArgs)
{
   if(this._bCurrentPanelInstanciated)
   {
      return undefined;
   }
   this._bCurrentPanelInstanciated = true;
   switch(this._nCurrentPanel)
   {
      case dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.MINIMAP:
         this.instanciateMiniMap();
         break;
      case dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.SHORTCUTS:
         this.instanciateShortcuts();
         break;
      case dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.FULL_WIDTH_FIGHTER_EFFECTS:
         this.instanciateFighterEffectsPanel(aPanelArgs);
   }
   if(this._nCurrentPanel == dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.MINIMAP)
   {
      this._chat._mcMiniMapReplacementPanel._visible = true;
   }
   else
   {
      this._chat._mcReplacementPanel.setMask(this._chat._mcReplacementPanelMask);
      this._chat._mcReplacementPanel.addEventListener("click",this);
   }
};
_loc1.removeCurrentReplacementPanel = function()
{
   if(!this._bCurrentPanelInstanciated)
   {
      return undefined;
   }
   this._bCurrentPanelInstanciated = false;
   this._chat._mcMiniMapReplacementPanel._visible = false;
   this._chat._mcReplacementPanel.removeEventListener("click",this);
   this._chat._mcReplacementPanel.removeMovieClip();
};
_loc1.instanciateMiniMap = function()
{
   var _loc2_;
   var _loc4_;
   var _loc3_;
   if(this._chat._mcMiniMapReplacementPanel == undefined)
   {
      _loc2_ = 150;
      _loc4_ = {_x:_loc2_,_y:this._chat._mcReplacementPanelMask._y,contentPath:"Map",enabled:true,showHintsMaxDistance:15,customBgScaleWidth:this._chat._mcReplacementPanelMask._width,customBgScaleHeight:this._chat._mcReplacementPanelMask._height,customBgScaleX:- _loc2_,customBgScaleY:0,customBgColor:14012330};
      _loc3_ = this._chat.attachMovie("MiniMap","_mcMiniMapReplacementPanel",dofus["\r\x14"].gapi.controls.Chat.MINIMAP_REPLACEMENT_PANEL_DEPTH,_loc4_);
      _loc3_.addEventListener("click",this);
   }
   this._chat._mcMiniMapReplacementPanel.setMask(this._chat._mcReplacementPanelMask);
};
_loc1.instanciateShortcuts = function()
{
   var _loc2_ = {_x:0,_y:0};
   this._chat.attachMovie("ShortcutsChatReplacementPanel","_mcReplacementPanel",dofus["\r\x14"].gapi.controls.Chat.REPLACEMENT_PANEL_DEPTH,_loc2_);
   this.api.kernel.OptionsManager.setOption("MovableBar",false);
   this._chat._mcMiniMapReplacementPanel.removeEventListener("click",this);
   this._chat._mcMiniMapReplacementPanel.removeMovieClip();
};
_loc1.instanciateFighterEffectsPanel = function(aPanelArgs)
{
   var _loc3_ = !(aPanelArgs != undefined && aPanelArgs.length > 0) ? undefined : aPanelArgs[0];
   var _loc2_ = {_x:0,_y:0,spriteData:_loc3_};
   this._chat.attachMovie("FighterEffectsReplacementPanel","_mcReplacementPanel",dofus["\r\x14"].gapi.controls.Chat.REPLACEMENT_PANEL_DEPTH,_loc2_);
};
_loc1.changeReplacementPanel = function(nPanelWished, bUpdateOption, aPanelArgs)
{
   var _loc5_ = this.api.ui.getUIComponent("Banner");
   if(_loc5_ == undefined || _loc5_.useFlashChat)
   {
      return undefined;
   }
   var _loc2_;
   if(this._nCurrentTemporaryPanel != undefined)
   {
      if(nPanelWished == dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.SHORTCUTS && this._nCurrentTemporaryPanel == dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.FULL_WIDTH_FIGHTER_EFFECTS)
      {
         this._nCurrentTemporaryPanel = undefined;
         _loc2_ = nPanelWished;
      }
      else
      {
         _loc2_ = this._nCurrentTemporaryPanel;
      }
   }
   else
   {
      _loc2_ = nPanelWished;
   }
   var _loc4_ = _loc2_ != this._nCurrentPanel;
   var _loc6_ = nPanelWished != this.api.kernel.OptionsManager.getOption("chatReplacementPanel");
   this._nCurrentPanel = _loc2_;
   trace2("changeReplacementPanel " + _loc2_ + " - " + _loc6_ + " - " + _loc4_);
   if(_loc6_ && bUpdateOption)
   {
      this.api.kernel.OptionsManager.setOption("chatReplacementPanel",nPanelWished);
   }
   if(_loc4_)
   {
      this.removeCurrentReplacementPanel();
   }
   if(_loc2_ != dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.NO_REPLACEMENT_PANEL)
   {
      this.instanciateCurrentReplacementPanel(aPanelArgs);
   }
};
_loc1.click = function(oEvent)
{
   var _loc3_;
   var _loc4_;
   switch(oEvent.target._name)
   {
      case "_mcReplacementPanel":
      case "_mcReplacementPanelMask":
      case "_mcMiniMapReplacementPanel":
      case "_mcMiniMap":
      case "_mcMiniMapMask":
         _loc3_ = this.api.ui.createPopupMenu();
         _loc4_ = this.api.kernel.OptionsManager.getOption("chatReplacementPanel");
         _loc3_.addStaticItem(this.api.lang.getText("SHOW"));
         _loc3_.addItem(this.api.lang.getText("BANNER_MAP"),this,this.changeReplacementPanel,[dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.MINIMAP,true],_loc4_ != dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.MINIMAP);
         _loc3_.addItem(this.api.lang.getText("BANNER_SHORTCUTS_BAR"),this,this.changeReplacementPanel,[dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.SHORTCUTS,true],_loc4_ != dofus["\r\x14"].gapi.ui.ChatReplacementPanelsManager.SHORTCUTS);
         _loc3_.show(_root._xmouse,_root._ymouse,true);
      default:
         return;
   }
};
_loc1.addProperty("api",_loc1.__get__api,function()
{
}
);
_loc1.addProperty("chat",_loc1.__get__chat,function()
{
}
);
_loc1.addProperty("currentReplacementPanel",_loc1.__get__currentReplacementPanel,function()
{
}
);
_loc1.addProperty("currentTemporaryReplacementPanel",_loc1.__get__currentTemporaryReplacementPanel,function()
{
}
);
_loc1.addProperty("currentTemporaryReplacementPanel",_loc1.__get__currentTemporaryReplacementPanel,_loc1.__set__currentTemporaryReplacementPanel);
_loc1.addProperty("isCurrentReplacementPanelTemporary",_loc1.__get__isCurrentReplacementPanelTemporary,function()
{
}
);
_global.dofus["\r\x14"].gapi.controls.FighterEffectsReplacementPanel = function()
{
   super();
};
dofus["\r\x14"].gapi.controls.FighterEffectsReplacementPanel.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = dofus["\r\x14"].gapi.controls.FighterEffectsReplacementPanel.prototype;
dofus["\r\x14"].gapi.controls.FighterEffectsReplacementPanel.CLASS_NAME = "FighterEffectsReplacementPanel";
_loc1.__set__spriteData = function(oSpriteData)
{
   this._oSpriteData = oSpriteData;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.controls.FighterEffectsReplacementPanel.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.update = function(oSpriteData)
{
   this.api.ui.hideTooltip();
   this._oSpriteData = oSpriteData;
   this.addToQueue({object:this,method:this.initData});
};
_loc1.refresh = function()
{
   if(this._oSpriteData == undefined)
   {
      this._lblName.text = "";
      this._lstEffects.dataProvider = undefined;
   }
   else
   {
      this._lblName.text = this._oSpriteData.name + " (" + this.api.lang.getText("LEVEL_SMALL") + this._oSpriteData.Level + ")";
      this._lstEffects.dataProvider = this._oSpriteData.EffectsManager.getEffects();
   }
};
_loc1.initData = function()
{
   trace2("FighterEffects initData " + toJSON(this._oSpriteData));
   if(this._oSpriteData == undefined)
   {
      this._lblName.text = "";
      this._lstEffects.dataProvider = undefined;
   }
   else
   {
      this._lblName.text = this._oSpriteData.name + " (" + this.api.lang.getText("LEVEL_SMALL") + this._oSpriteData.Level + ")";
      this._lstEffects.dataProvider = this._oSpriteData.EffectsManager.getEffects();
   }
};
_loc1.initTexts = function()
{
};
_loc1.addListeners = function()
{
};
_loc1.addProperty("spriteData",function()
{
}
,_loc1.__set__spriteData);
_global.dofus["\r\x14"].gapi.controls.ShortcutsChatReplacementPanel = function()
{
   super();
};
dofus["\r\x14"].gapi.controls.ShortcutsChatReplacementPanel.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = dofus["\r\x14"].gapi.controls.ShortcutsChatReplacementPanel.prototype;
dofus["\r\x14"].gapi.controls.ShortcutsChatReplacementPanel.CLASS_NAME = "ShortcutsChatReplacementPanel";
dofus["\r\x14"].gapi.controls.ShortcutsChatReplacementPanel.MAX_CONTAINER = 16;
dofus["\r\x14"].gapi.controls.ShortcutsChatReplacementPanel.START_CONTAINER_ID = 15;
_loc1.__get__miniMap = function()
{
   return this._mcMiniMap;
};
_loc1.addProperty("miniMap",_loc1.__get__miniMap,function()
{
}
);
_loc1.__set__spriteData = function(oSpriteData)
{
   this._oSpriteData = oSpriteData;
};
_loc1.addProperty("spriteData",function()
{
}
,_loc1.__set__spriteData);
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.controls.ShortcutsChatReplacementPanel.CLASS_NAME);
   this._banner = this.api.ui.getUIComponent("Banner");
   this._mouseShortcuts = this._banner._msShortcuts;
};
_loc1.createChildren = function()
{
   this.showMiniMap(true);
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.updateSprite = function(oSpriteData)
{
   this.api.ui.hideTooltip();
   this._oSpriteData = oSpriteData;
   this.addToQueue({object:this,method:this.initData});
};
_loc1.getContainer = function(nID)
{
   return this["_ctr" + nID];
};
_loc1.setContainer = function(nID, cContainer)
{
   this["_ctr" + nID] = cContainer;
};
_loc1.refresh = function()
{
   if(this._oSpriteData == undefined)
   {
      this._lblName.text = "";
      this._lstEffects.dataProvider = undefined;
   }
   else
   {
      this._lblName.text = this._oSpriteData.name + " (" + this.api.lang.getText("LEVEL_SMALL") + this._oSpriteData.Level + ")";
      this._lstEffects.dataProvider = this._oSpriteData.EffectsManager.getEffects();
   }
};
_loc1.initData = function()
{
   trace2("ShortcutsChatinitData " + toJSON(this._oSpriteData));
   if(this._oSpriteData == undefined)
   {
      this._lblName.text = "";
      this._lstEffects.dataProvider = undefined;
   }
   else
   {
      this._lblName.text = this._oSpriteData.name + " (" + this.api.lang.getText("LEVEL_SMALL") + this._oSpriteData.Level + ")";
      this._lstEffects.dataProvider = this._oSpriteData.EffectsManager.getEffects();
   }
};
_loc1.showMiniMap = function(bShow)
{
   if(bShow)
   {
      this.instanciateMiniMap();
   }
   this._mcMiniMap._visible = bShow;
   this._mcMiniMapMask._visible = bShow;
};
_loc1.instanciateMiniMap = function()
{
   var _loc2_;
   var _loc4_;
   var _loc3_;
   if(this._mcMiniMap == undefined)
   {
      _loc2_ = 72;
      _loc4_ = {_x:_loc2_,_y:this._mcMiniMapMask._y,contentPath:"Map",enabled:true,showHintsMaxDistance:10,customBgScaleWidth:this._mcMiniMapMask._width,customBgScaleHeight:this._mcMiniMapMask._height,customBgScaleX:- _loc2_,customBgScaleY:0,customBgColor:14012330};
      _loc3_ = this.attachMovie("MiniMap","_mcMiniMap",this.getNextHighestDepth(),_loc4_);
      _loc3_.addEventListener("click",this._banner.chat.replacementPanelsManager);
   }
   this._mcMiniMap.setMask(this._mcMiniMapMask);
};
_loc1.initTexts = function()
{
};
_loc1.addListeners = function()
{
   var _loc2_ = 0;
   var _loc5_;
   var _loc3_;
   while(_loc2_ < dofus["\r\x14"].gapi.controls.ShortcutsChatReplacementPanel.MAX_CONTAINER)
   {
      _loc5_ = this["_ctr" + _loc2_];
      _loc3_ = 15 + _loc2_;
      _loc5_.params = {position:_loc3_};
      this._mouseShortcuts.setContainer(_loc3_,_loc5_);
      _loc5_.addEventListener("click",this._mouseShortcuts);
      _loc5_.addEventListener("dblClick",this._mouseShortcuts);
      _loc5_.addEventListener("over",this._mouseShortcuts);
      _loc5_.addEventListener("out",this._mouseShortcuts);
      _loc5_.addEventListener("drag",this._mouseShortcuts);
      _loc5_.addEventListener("drop",this._mouseShortcuts);
      _loc5_.addEventListener("onContentLoaded",this._mouseShortcuts);
      _loc2_ += 1;
   }
   this._mouseShortcuts.updateCurrentTabInformations();
   this.api.kernel.KeyManager.addShortcutsListener("onShortcut",this);
   var chat = this._banner.chat;
   this._mcMiniMapMask.onRelease = function()
   {
      var _loc2_ = {};
      _loc2_.target = this;
      chat.replacementPanelsManager.click(_loc2_);
   };
};
_loc1.onShortcut = function(shortcut)
{
   var _loc2_ = 0;
   var _loc4_;
   var _loc3_;
   while(_loc2_ < dofus["\r\x14"].gapi.controls.ShortcutsChatReplacementPanel.MAX_CONTAINER)
   {
      if(shortcut == "MOVABLEBAR_SH" + _loc2_)
      {
         _loc4_ = 15 + _loc2_;
         _loc3_ = this._mouseShortcuts.getContainer(_loc4_);
         if(_loc3_ != undefined)
         {
            _loc3_.notInChat = true;
            _loc3_.emulateClick();
            return false;
         }
      }
      _loc2_ += 1;
   }
   return true;
};
_loc1 = dofus["\r\x14"].gapi.controls.MiniMap.prototype;
_loc1.addClickEvent = function(mc)
{
   var _loc4_;
   var _loc3_;
   if(this.api.datacenter.Player.isAuthorized)
   {
      var miniMap = this;
      _loc4_ = function()
      {
         miniMap.onAdminClick();
      };
      mc.onPress = _loc4_;
      delete mc.onRelease;
   }
   else
   {
      var miniMap = this;
      _loc3_ = function()
      {
         miniMap.click();
      };
      mc.onRelease = _loc3_;
      delete mc.onPress;
   }
};
_loc1.initMap = function()
{
   this._mcBitmapContainer.removeMovieClip();
   this._mcBitmapContainer = this._ldrBitmapMap.content.createEmptyMovieClip("_mcBitmapContainer",1);
   this._mcBitmapContainer._visible = false;
   this.addClickEvent(this._mcBitmapContainer);
   this.addClickEvent(this._mcCursor);
   var thisMiniMap = this;
   this._mcBitmapContainer.onRollOut = function()
   {
      this.gapi.hideTooltip();
      if (this.gapi.api && this.gapi.api.gfx) {
         this.gapi.api.gfx.rollOverMcSprite = undefined;
         this.gapi.api.gfx.rollOverMcObject = undefined;
      }
   };
   this._mcBitmapContainer.onRollOver = function()
   {
      thisMiniMap.dispatchEvent({type:"over"});
   };
   this._mcCursor._xscale = this._nMapScale;
   this._mcCursor._yscale = this._nMapScale;
   this._mcCursor.oMap = this._oMap;
   this._mcCursor.gapi = this.gapi;
   this._mcCursor.onRollOver = function()
   {
      thisMiniMap.dispatchEvent({type:"over"});
      this.gapi.showTooltip(this.oMap.x + "," + this.oMap.y,this,-20,{bXLimit:false,bYLimit:false});
   };
   this._mcCursor.onRollOut = function()
   {
      this.gapi.hideTooltip();
      if (this.gapi.api && this.gapi.api.gfx) {
         this.gapi.api.gfx.rollOverMcSprite = undefined;
         this.gapi.api.gfx.rollOverMcObject = undefined;
      }
   };
   this.updateMap();
   this.updateHints();
};
_loc1.click = function()
{
   if(getTimer() - this._nLastDoubleClick < 750)
   {
      return undefined;
   }
   this.dispatchEvent({type:"click"});
};
_loc1.doubleClick = function(_loc2_)
{
   this._nLastDoubleClick = getTimer();
   var _loc4_;
   var _loc3_;
   var _loc6_;
   if(!this.api.datacenter.Game.isFight && _global.isNaN(this.dungeonID))
   {
      _loc4_ = _loc2_.coordinates.x;
      _loc3_ = _loc2_.coordinates.y;
      _loc6_ = this.api.kernel.AreasManager.getSubAreaIDFromCoordinates(_loc2_.coordinates.x,_loc2_.coordinates.y,this._oMap.superarea);
      if(_loc4_ != undefined && _loc3_ != undefined)
      {
         this.api.network.Basics.autorisedMoveCommand(_loc4_,_loc3_,_loc6_);
      }
   }
};
_loc1 = _global.dofus.aks.Game.prototype;
_loc1.onCreate = function(_loc2_, _loc3_)
{
   if(!_loc2_)
   {
      ank["\x1e\n\x07"]["\x0b\f"].err("[onCreate] Impossible de crÃ©er la partie");
      return undefined;
   }
   var _loc7_ = _loc3_.split("|");
   var _loc6_ = Number(_loc7_[0]);
   if(_loc6_ != 1)
   {
      ank["\x1e\n\x07"]["\x0b\f"].err("[onCreate] Type incorrect");
      return undefined;
   }
   this.api.datacenter.Game = new dofus.datacenter.Game();
   this.api.datacenter.Game.state = _loc6_;
   var _loc4_ = this.api.ui.getUIComponent("Banner");
   _loc4_.chat.removeTemporaryReplacementPanel();
   _loc2_ = _loc4_.chat.shortcutsReplacementPanel;
   if(_loc2_ != undefined)
   {
      _loc2_.showMiniMap(true);
      _loc2_.updateSprite(undefined);
   }
   dofus["\r\x14"].gapi.ui["\x1c\x10"]["\x1c\x0f"].showGaugeMode(_loc4_);
   var _loc2_;
   for(var _loc3_ in this.api.datacenter.Heroes)
   {
      _loc2_ = this.api.datacenter.Heroes[_loc3_];
      _loc2_.data.initAP(false);
      _loc2_.data.initMP(false);
      _loc2_.SpellsManager.clear();
      _loc2_.data.CharacteristicsManager.initialize();
      _loc2_.data.EffectsManager.initialize();
      _loc2_.clearSummon();
   }
   this.api.gfx.cleanMap(1);
   this.onCreateSolo();
};
_loc1 = dofus.datacenter.Basics.prototype;
_loc1.__get__pathMove_intoWorld = function()
{
   return this._sPathMove_intoWorld;
};
_loc1.__set__pathMove_intoWorld = function(sPathMove_intoWorld)
{
   this._sPathMove_intoWorld = sPathMove_intoWorld;
};
_loc1.__get__aks_infos_highlightCoords = function()
{
   return this._aks_infos_highlightCoords;
};
_loc1.__set__aks_infos_highlightCoords = function(aCoord)
{
   this._aks_infos_highlightCoords = aCoord;
   var _loc2_ = this.api.ui.getUIComponent("Banner");
   _loc2_.illustration.updateFlags();
   _loc2_.chat.miniMapReplacementPanel.updateFlags();
   _loc2_.chat.shortcutsReplacementPanel.miniMap.updateFlags();
   return this.aks_infos_highlightCoords;
};
_loc1.__set__banner_targetCoords = function(aCoord)
{
   this._banner_targetCoords = aCoord;
   var _loc2_ = this.api.ui.getUIComponent("Banner");
   _loc2_.illustration.updateFlags();
   _loc2_.chat.miniMapReplacementPanel.updateFlags();
   _loc2_.chat.shortcutsReplacementPanel.miniMap.updateFlags();
   return this.banner_targetCoords;
};
_loc1.__get__banner_targetCoords = function()
{
   return this._banner_targetCoords;
};
_loc1.aks_infos_highlightCoords_clear = function(nFlagType)
{
   var _loc4_;
   var _loc3_;
   if(_global.isNaN(nFlagType))
   {
      this._aks_infos_highlightCoords = [];
   }
   else
   {
      _loc4_ = [];
      _loc3_ = 0;
      while(_loc3_ < this._aks_infos_highlightCoords.length)
      {
         if(this._aks_infos_highlightCoords[_loc3_].type != nFlagType)
         {
            _loc4_.push(this._aks_infos_highlightCoords[_loc3_]);
         }
         _loc3_ += 1;
      }
      this._aks_infos_highlightCoords = _loc4_;
   }
   var _loc6_ = this.api.ui.getUIComponent("Banner");
   _loc6_.illustration.updateFlags();
   _loc6_.chat.miniMapReplacementPanel.updateFlags();
   _loc6_.chat.shortcutsReplacementPanel.miniMap.updateFlags();
};
_loc1.addProperty("aks_infos_highlightCoords",_loc1.__get__aks_infos_highlightCoords,_loc1.__set__aks_infos_highlightCoords);
_loc1.addProperty("banner_targetCoords",_loc1.__get__banner_targetCoords,_loc1.__set__banner_targetCoords);
_loc1.addProperty("pathMove_intoWorld",_loc1.__get__pathMove_intoWorld,_loc1.__set__pathMove_intoWorld);
if(!dofus["\r\x14"].gapi.controls.banner)
{
   _global.dofus["\r\x14"].gapi.controls.banner = new Object();
}
_global.dofus["\r\x14"].gapi.controls.banner.MouseShortcutsTabContainers = function()
{
   this._nCurrentPage = 1;
   this._aMovableBarContainers = [];
   this._aShortcutsElectronContainers = [];
   super();
};
_global.dofus["\r\x14"].gapi.controls.banner.MouseShortcutsTabContainers.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = dofus["\r\x14"].gapi.controls.banner.MouseShortcutsTabContainers.prototype;
dofus["\r\x14"].gapi.controls.banner.MouseShortcutsTabContainers.CLASS_NAME = "MouseShortcutsTabContainers";
dofus["\r\x14"].gapi.controls.banner.MouseShortcutsTabContainers.OFFSETS = [{min:1,max:14},{min:15,max:28}];
dofus["\r\x14"].gapi.controls.banner.MouseShortcutsTabContainers.MOVABLE_BAR_OFFSET = {min:29,max:43};
dofus["\r\x14"].gapi.controls.banner.MouseShortcutsTabContainers.ELECTRON_SHORTCUTS_OFFSET = {min:44,max:60};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.controls.banner.MouseShortcutsTabContainers.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initData});
};
_loc1.initData = function()
{
   var _loc2_ = 1;
   var _loc3_;
   while(_loc2_ <= dofus["\r\x14"].gapi.controls.banner.MouseShortcutsTabContainers.OFFSETS[0].max)
   {
      _loc3_ = this["_ctr" + _loc2_];
      _loc3_.params.position = this.getCurrentPageOffset().min - 1 + _loc2_;
      _loc2_ += 1;
   }
};
_loc1.getCurrentPageOffset = function()
{
   return dofus["\r\x14"].gapi.controls.banner.MouseShortcutsTabContainers.OFFSETS[this._nCurrentPage - 1];
};
_loc1.getContainerPositionByIndex = function(nIndex)
{
   var _loc2_ = this.getCurrentPageOffset();
   return nIndex - (_loc2_.min - 1);
};
_loc1.indexIsRangeOfShortcutsByPage = function(nIndex)
{
   var _loc2_ = this.getCurrentPageOffset();
   return nIndex >= _loc2_.min && nIndex <= _loc2_.max;
};
_loc1.indexIsRangeOfShortcuts = function(nIndex)
{
   return nIndex >= dofus["\r\x14"].gapi.controls.banner.MouseShortcutsTabContainers.OFFSETS[0].min && nIndex <= dofus["\r\x14"].gapi.controls.banner.MouseShortcutsTabContainers.OFFSETS[1].max;
};
_loc1.indexIsRangeOfMovableBar = function(nIndex)
{
   return nIndex >= dofus["\r\x14"].gapi.controls.banner.MouseShortcutsTabContainers.MOVABLE_BAR_OFFSET.min && nIndex <= dofus["\r\x14"].gapi.controls.banner.MouseShortcutsTabContainers.MOVABLE_BAR_OFFSET.max;
};
_loc1.indexIsRangeOfElectronShortcuts = function(nIndex)
{
   return nIndex >= dofus["\r\x14"].gapi.controls.banner.MouseShortcutsTabContainers.ELECTRON_SHORTCUTS_OFFSET.min && nIndex <= dofus["\r\x14"].gapi.controls.banner.MouseShortcutsTabContainers.ELECTRON_SHORTCUTS_OFFSET.max;
};
_loc1.getContainer = function(nIndex, bIndexByPage)
{
   if(this.indexIsRangeOfMovableBar(nIndex))
   {
      return this._aMovableBarContainers[nIndex - dofus["\r\x14"].gapi.controls.banner.MouseShortcutsTabContainers.MOVABLE_BAR_OFFSET.min];
   }
   if(this.indexIsRangeOfElectronShortcuts(nIndex))
   {
      return this._aShortcutsElectronContainers[nIndex - dofus["\r\x14"].gapi.controls.banner.MouseShortcutsTabContainers.ELECTRON_SHORTCUTS_OFFSET.min];
   }
   if(this.indexIsRangeOfShortcuts(nIndex))
   {
      if(!this.indexIsRangeOfShortcutsByPage(nIndex) && bIndexByPage != false)
      {
         return undefined;
      }
      if(bIndexByPage == false)
      {
         return this["_ctr" + nIndex];
      }
      return this["_ctr" + this.getContainerPositionByIndex(nIndex)];
   }
};
_loc1.setMovableBarContainer = function(nIndex, ctnData)
{
   this._aMovableBarContainers[nIndex] = ctnData;
   ctnData.params = {position:nIndex + dofus["\r\x14"].gapi.controls.banner.MouseShortcutsTabContainers.MOVABLE_BAR_OFFSET.min};
};
_loc1.setElectronShortcutsContainer = function(nIndex, ctnData)
{
   this._aShortcutsElectronContainers[nIndex] = ctnData;
   ctnData.params = {position:nIndex + dofus["\r\x14"].gapi.controls.banner.MouseShortcutsTabContainers.ELECTRON_SHORTCUTS_OFFSET.min};
};
_loc1.updateContainer = function(nIndex, ctnData)
{
   var _loc2_ = this.getContainer(nIndex);
   if(_loc2_ != undefined)
   {
      _loc2_.contentData = ctnData;
   }
};
_loc1.__get__currentPage = function()
{
   return this._nCurrentPage;
};
_loc1.__set__currentPage = function(nCurrentPage)
{
   this._nCurrentPage = nCurrentPage;
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addProperty("currentPage",_loc1.__get__currentPage,_loc1.__set__currentPage);
var _loc1 = dofus["\r\x14"].gapi.controls.MouseShortcuts.prototype;
_loc1.createChildren = function()
{
   if(this._mcShortcutsContainers == undefined)
   {
      this.attachMovie("MouseShortcutsTabContainers","_mcShortcutsContainers",this.getNextHighestDepth(),{_x:this._mcShortcutsPlacer._x,_y:_mcShortcutsPlacer._y,currentPage:1});
   }
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.getContainer = function(nID)
{
   return this._mcShortcutsContainers["_ctr" + nID];
};
_loc1.setMovableBarContainer = function(nIndex, ctn)
{
   this._mcShortcutsContainers.setMovableBarContainer(nIndex,ctn);
};
_loc1.setElectronShortcutsContainer = function(nIndex, ctr)
{
   this._mcShortcutsContainers.setElectronShortcutsContainer(nIndex,ctr);
};
_loc1 = dofus["\r\x14"].gapi.ui.PlayerInfos.prototype;
_loc1.refresh = function()
{
   if(this._oData == undefined)
   {
      this._lblName.text = "";
      this._lstEffects.dataProvider = undefined;
   }
   else
   {
      this._lblName.text = this._oData.name + " (" + this.api.lang.getText("LEVEL_SMALL") + this._oData.Level + ")";
      this._lstEffects.dataProvider = this._oData.EffectsManager.getEffects();
   }
};
_loc1.initData = function()
{
   trace2("PlayerInfos initData " + toJSON(this._oData));
   if(this._oData != undefined)
   {
      this._winBackground.title = this.api.lang.getText("EFFECTS") + " " + this._oData.name + " (" + this.api.lang.getText("LEVEL_SMALL") + this._oData.Level + ")";
      this._lstEffects.dataProvider = this._oData.EffectsManager.getEffects();
   }
};
_loc1 = dofus["\r\x14"].battlefield["\x10\x18"].prototype;
_loc1.showSpriteInfosIfWeNeed = function(oSprite)
{
   if(!this.api.kernel.OptionsManager.getOption("SpriteInfos"))
   {
      return undefined;
   }
   if(this.api.kernel.OptionsManager.getOption("SpriteMove") && (oSprite.isVisible && this.api.ui.isCursorHidden()))
   {
      this.api.gfx.drawZone(oSprite.cellNum,0,oSprite.MP,"move",dofus.Constants.CELL_MOVE_RANGE_COLOR,"C".charCodeAt(0));
   }
   this.api.ui.getUIComponent("Banner").showRightPanel("BannerSpriteInfos",{data:oSprite},true,true);
};
_loc1 = dofus["\r\x14"].gapi.controls["\x1e\x0b\x03"].TimelineItem.prototype;
_loc1.onRollOver = function()
{
   trace2("TimelineItem onRollOver _oData " + toJSON(this._oData));
   this._mcBackRect._alpha = 50;
   this._oData.mc.onRollOver();
   this._oData.mc.showEffects(true);
};
_loc1 = dofus["\r\x14"].gapi.ui["\x1e\x16\x12"]["\x1e\x16\x11"].prototype;
_loc1.setValue = function(_loc2_, _loc3_, _loc4_)
{
   trace2(this._parent + " setValue " + _loc2_ + " - " + toJSON(_loc4_));
   if(_loc2_)
   {
      this._ldrIcon.forceNextLoad();
      this._ldrIcon.contentPath = dofus.Constants.EFFECTSICON_FILE;
      this._lblDescription.text = _loc4_.description;
      this._lblRemainingTurn.text = _loc4_.remainingTurnStr;
      this._lblSpell.text = _loc4_.spellName;
      var ref = this;
      this._mcInteractivity.onRollOver = function()
      {
         ref.over({target:this});
      };
      this._mcInteractivity.onRollOut = function()
      {
         ref.out({target:this});
         if (ref.api && ref.api.gfx) {
            ref.api.gfx.rollOverMcSprite = undefined;
            ref.api.gfx.rollOverMcObject = undefined;
         }
      };
      this._oItem = _loc4_;
   }
   else if(this._lblSpell.text != undefined)
   {
      this._ldrIcon.contentPath = "";
      this._lblDescription.text = "";
      this._lblRemainingTurn.text = "";
      this._lblSpell.text = "";
      delete this._mcInteractivity.onRollOver;
      delete this._mcInteractivity.onRollOut;
   }
};
_loc1 = dofus["\x0b\b"].EffectsManager.prototype;
_loc1.updateData = function()
{
   if(_global.API.ui.getUIComponent("PlayerInfos") != undefined)
   {
      _global.API.ui.getUIComponent("PlayerInfos").refresh();
   }
   var _loc2_ = _global.API.ui.getUIComponent("Banner");
   if(_loc2_ != undefined)
   {
      _loc2_.chat._mcReplacementPanel.refresh();
   }
};
_loc1.addEffect = function(_loc2_)
{
   var _loc3_ = 0;
   var _loc2_;
   while(_loc3_ < this._aEffects.length)
   {
      _loc2_ = this._aEffects[_loc3_];
      if(_loc2_.spellID == _loc2_.spellID && (_loc2_.type == _loc2_.type && _loc2_.remainingTurn == _loc2_.remainingTurn))
      {
         _loc2_.param1 += _loc2_.param1;
         return undefined;
      }
      _loc3_ += 1;
   }
   this._aEffects.push(_loc2_);
   this.updateData();
};
_loc1.terminateAllEffects = function()
{
   var _loc2_ = this._aEffects.length;
   var _loc3_;
   while(true)
   {
      _loc2_ -= 1;
      if(_loc2_ < 0)
      {
         break;
      }
      _loc3_ = this._aEffects[_loc2_];
      this._aEffects.splice(_loc2_,_loc2_ + 1);
   }
   this.updateData();
};
_loc1.nextTurn = function()
{
   var _loc2_ = this._aEffects.length;
   var _loc3_;
   while(true)
   {
      _loc2_ -= 1;
      if(_loc2_ < 0)
      {
         break;
      }
      _loc3_ = this._aEffects[_loc2_];
      _loc3_.remainingTurn--;
      if(_loc3_.remainingTurn <= 0)
      {
         this._aEffects.splice(_loc2_,1);
      }
   }
   this.updateData();
};
_loc1.removeEffectsByCasterID = function(sCasterID)
{
   if(sCasterID == undefined)
   {
      return undefined;
   }
   var _loc2_ = this._aEffects.length;
   var _loc3_;
   while(true)
   {
      _loc2_ -= 1;
      if(_loc2_ < 0)
      {
         break;
      }
      _loc3_ = this._aEffects[_loc2_];
      if(_loc3_.sCasterID == sCasterID)
      {
         this._aEffects.splice(_loc2_,1);
      }
   }
   this.updateData();
};
#endinitclip
