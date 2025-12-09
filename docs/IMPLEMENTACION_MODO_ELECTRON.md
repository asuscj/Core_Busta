# Implementación del Modo Electron - Guía Completa

## Resumen Ejecutivo

Esta guía proporciona un paso a paso detallado para implementar el **"modo electron"** en otro core de Dofus. El modo electron permite:

- **Detección automática** de entorno Electron vs navegador/standalone
- **Reemplazo dinámico** del panel de chat por un minimapa interactivo
- **Navegación Tab mejorada** en formularios de login
- **Comunicación bidireccional** entre Flash y contenedor Electron
- **Paneles widescreen** que eliminan bordes del chat tradicional

**Tiempo estimado:** 8-12 horas de implementación

---

## Requisitos Técnicos

### ActionScript / Flash
- **ActionScript 2.0** compatible
- **Flash Player 8.0+** (recomendado 10.0+)
- **ExternalInterface** habilitado en compilación
- **MTASC 1.13+** o compilador equivalente

### Estructura del Core Target
```
TargetCore/
??? __Packages/
?   ??? dofus/
?       ??? utils/           # Aks.as, Constants.as
?       ??? managers/        # OptionsManager.as
?       ??? graphics/
?           ??? gapi/
?               ??? ui/      # Banner.as, Chat.as, Login.as, Options.as
?               ??? controls/ # MiniMap symbols
??? frame_1/
?   ??? DoAction.as
??? login.as (o similar)
```

### Assets Flash Necesarios
- Símbolo **MiniMap** (MovieClip exportado para ActionScript)
- Símbolo **ShortcutsChatReplacementPanel** (opcional)
- Símbolo **ButtonCheck** (para UI de opciones)

---

## Fase 1: Configuración Base (2-3 horas)

### Paso 1.1: Agregar Opciones en OptionsManager

**Archivo:** `__Packages/dofus/managers/OptionsManager.as`

**Localizar:** `DEFAULT_VALUES = {...}`

**Agregar las siguientes opciones:**

```actionscript
DEFAULT_VALUES = {
   // ... opciones existentes ...
   EnableWidescreenPanels: false,
   chatReplacementPanel: 0,  // 0=MINIMAP, 1=SHORTCUTS, -1=NO_REPLACEMENT
   MovableBar: true,
   // ... resto de opciones ...
};
```

**Localizar:** función `applyOption(sOption, oValue)`

**Agregar casos:**

```actionscript
function applyOption(sOption, oValue) {
   var _loc3_;
   switch(sOption) {
      // ... casos existentes ...
      
      case "EnableWidescreenPanels":
         // Configurar uso de flash chat vs widescreen panels
         var banner = this.api.ui.getUIComponent("Banner");
         if(banner) {
            banner.configureUseFlashChat(!oValue);
         }
         break;
         
      case "chatReplacementPanel":
         // Cambiar panel de reemplazo
         var bannerComponent = this.api.ui.getUIComponent("Banner");
         if(bannerComponent && bannerComponent.chat && bannerComponent.chat.replacementPanelsManager) {
            bannerComponent.chat.replacementPanelsManager.changeReplacementPanel(oValue);
         }
         break;
         
      // ... resto de casos ...
   }
}
```

### Paso 1.2: Crear Clase dofus.Electron

**Archivo:** `__Packages/dofus/utils/Aks.as`

**Localizar el final del archivo (después de las últimas definiciones de clases)**

**Agregar:**

```actionscript
// ============================================================
// ELECTRON DETECTION & API BRIDGE
// ============================================================

/**
 * Detecta si Flash está ejecutándose dentro de Electron
 */
dofus.Electron = {};
dofus.Electron.isEnabled = function() {
   return _root.electron != undefined;
};

// Constantes Electron
dofus.Electron.WIDESCREEN_PANEL_CHAT = 0;
dofus.Electron.WIDESCREEN_PANEL_CONSOLE = 1;
dofus.Electron.POPUP_MENU_BOTTOMLEFT_POSITION = {x: 0.65, y: 278};
dofus.Electron.POPUP_MENU_BOTTOMRIGHT_POSITION = {x: 737.6, y: 278};

/**
 * Clase Principal: Electron
 * Maneja la comunicación entre Flash y Electron vía ExternalInterface
 */
_global.dofus.Electron = function(oAPI) {
   this._bEnabled = dofus.Electron.isEnabled();
   this._bFocused = true;
   this._bShowingWidescreenPanel = true;
   
   if(!this._bEnabled) {
      return undefined;
   }
   
   this.api = oAPI;
   this._registerExternalInterfaceCallbacks();
};

/**
 * Registra todos los callbacks que Electron puede llamar
 */
_global.dofus.Electron.prototype._registerExternalInterfaceCallbacks = function() {
   // Key & Focus
   flash.external.ExternalInterface.addCallback("onTabKey", this, this.onTabKey);
   flash.external.ExternalInterface.addCallback("onKeyManagerKeyUp", this, this.onKeyManagerKeyUp);
   flash.external.ExternalInterface.addCallback("onWindowFocus", this, this.onWindowFocus);
   flash.external.ExternalInterface.addCallback("onWindowBlur", this, this.onWindowBlur);
   
   // UI State
   flash.external.ExternalInterface.addCallback("onShowingWidescreenPanel", this, this.onShowingWidescreenPanel);
   
   // Misc
   flash.external.ExternalInterface.addCallback("clearCache", this, this.clearCache);
   flash.external.ExternalInterface.addCallback("getLangText", this, this.getLangText);
};

// Propiedades públicas
_global.dofus.Electron.prototype.__get__enabled = function() {
   return this._bEnabled;
};

_global.dofus.Electron.prototype.__get__isWindowFocused = function() {
   return !this._bEnabled || this._bFocused;
};

_global.dofus.Electron.prototype.__get__isShowingWidescreenPanel = function() {
   return this._bShowingWidescreenPanel;
};

// Event handlers
_global.dofus.Electron.prototype.onWindowFocus = function() {
   this._bFocused = true;
};

_global.dofus.Electron.prototype.onWindowBlur = function() {
   this._bFocused = false;
};

_global.dofus.Electron.prototype.onShowingWidescreenPanel = function(bShowing) {
   this._bShowingWidescreenPanel = bShowing;
};

/**
 * onTabKey() - Maneja navegación Tab en login Electron
 */
_global.dofus.Electron.prototype.onTabKey = function() {
   if(!this._bEnabled) {
      return undefined;
   }
   
   var loginUI = this.api.ui.getUIComponent("Login");
   var currentFocus;
   
   if(loginUI != undefined) {
      currentFocus = Selection.getFocus();
      
      if(currentFocus != undefined) {
         // Account ? Password
         if(currentFocus == loginUI.tiAccount.textFieldObject) {
            Selection.setFocus(loginUI.tiPassword.textFieldObject);
            return undefined;
         }
         
         // Password ? OK Button
         if(currentFocus == loginUI.tiPassword.textFieldObject) {
            if(loginUI._btnOK && loginUI._btnOK.tabEnabled) {
               Selection.setFocus(loginUI._btnOK);
            } else {
               Selection.setFocus(loginUI.tiAccount.textFieldObject);
            }
            return undefined;
         }
         
         // OK Button ? Account
         if(currentFocus == loginUI._btnOK) {
            Selection.setFocus(loginUI.tiAccount.textFieldObject);
            return undefined;
         }
      } else {
         // Sin foco inicial: comienza en Account
         Selection.setFocus(loginUI.tiAccount.textFieldObject);
      }
   }
   
   // Fallback: dispatch keyboard shortcut
   if(this.api.kernel && this.api.kernel.KeyManager) {
      this.api.kernel.KeyManager.dispatchShortcut("AUTOCOMPLETE");
   }
};

// Placeholder methods (implementar según necesidades)
_global.dofus.Electron.prototype.onKeyManagerKeyUp = function(nKeyCode) {
   // Procesar key up desde Electron
};

_global.dofus.Electron.prototype.clearCache = function() {
   if(this.api && this.api.kernel) {
      this.api.kernel.clearCache();
   }
};

_global.dofus.Electron.prototype.getLangText = function(sKey, aArgs) {
   if(this.api && this.api.lang) {
      return this.api.lang.getText(sKey, aArgs);
   }
   return sKey;
};

// Propiedades
_global.dofus.Electron.prototype.addProperty("enabled", _global.dofus.Electron.prototype.__get__enabled, function() {});
_global.dofus.Electron.prototype.addProperty("isWindowFocused", _global.dofus.Electron.prototype.__get__isWindowFocused, function() {});
_global.dofus.Electron.prototype.addProperty("isShowingWidescreenPanel", _global.dofus.Electron.prototype.__get__isShowingWidescreenPanel, function() {});
```

### Paso 1.3: Integrar Electron en API Principal

**Archivo:** `__Packages/dofus/utils/Aks.as`

**Localizar:** función constructora de API (generalmente línea ~80-100)

**Buscar la línea que contiene:** `this._oKernel = new dofus...`

**Agregar ANTES de esa línea:**

```actionscript
   // Crear instancia de Electron
   this._oElectron = new dofus.Electron(this);
```

**Buscar el final del constructor de API**

**Agregar:**

```actionscript
   // Exponer Electron públicamente
   this.electron = this._oElectron;
```

---

## Fase 2: Sistema de Reemplazo Chat ? MiniMap (3-4 horas)

### Paso 2.1: Crear ChatReplacementPanelsManager

**Archivo:** `__Packages/dofus/utils/Aks.as`

**Agregar al final del archivo:**

```actionscript
// ============================================================
// CHAT REPLACEMENT PANELS MANAGER
// ============================================================

/**
 * ChatReplacementPanelsManager
 * Responsable de crear, mostrar y ocultar panels de reemplazo (MiniMap, Shortcuts)
 */
_global.dofus.graphics.gapi.ui.ChatReplacementPanelsManager = function(api, chat) {
   this._bCurrentPanelInstanciated = false;
   this._api = api;
   this._chat = chat;
   this._nCurrentPanel = dofus.graphics.gapi.ui.ChatReplacementPanelsManager.NO_REPLACEMENT_PANEL;
};

var _loc1 = _global.dofus.graphics.gapi.ui.ChatReplacementPanelsManager.prototype;

// Constantes
dofus.graphics.gapi.ui.ChatReplacementPanelsManager.NO_REPLACEMENT_PANEL = -1;
dofus.graphics.gapi.ui.ChatReplacementPanelsManager.MINIMAP = 0;
dofus.graphics.gapi.ui.ChatReplacementPanelsManager.SHORTCUTS = 1;
dofus.graphics.gapi.ui.ChatReplacementPanelsManager.FULL_WIDTH_FIGHTER_EFFECTS = 1001;

// Propiedades
_loc1.__get__api = function() {
   return this._api;
};

_loc1.__get__chat = function() {
   return this._chat;
};

_loc1.__get__currentReplacementPanel = function() {
   return this._nCurrentPanel;
};

_loc1.__get__currentTemporaryReplacementPanel = function() {
   return this._nCurrentTemporaryPanel;
};

_loc1.__set__currentTemporaryReplacementPanel = function(nCurrentTemporaryReplacementPanel) {
   this._nCurrentTemporaryPanel = nCurrentTemporaryReplacementPanel;
};

_loc1.__get__isCurrentReplacementPanelTemporary = function() {
   return this._nCurrentTemporaryPanel != undefined && this._nCurrentTemporaryPanel == this._nCurrentPanel;
};

/**
 * instanciateMiniMap() - Crea la instancia de MiniMap en el chat
 */
_loc1.instanciateMiniMap = function() {
   if(this._chat._mcMiniMapReplacementPanel != undefined) {
      return this._chat._mcMiniMapReplacementPanel;
   }
   
   // Parámetros para el MiniMap
   var offsetX = 150;
   var params = {
      _x: offsetX,
      _y: this._chat._mcReplacementPanelMask._y,
      contentPath: "Map",
      enabled: true,
      showHintsMaxDistance: 15,
      customBgScaleWidth: this._chat._mcReplacementPanelMask._width,
      customBgScaleHeight: this._chat._mcReplacementPanelMask._height,
      customBgScaleX: -offsetX,
      customBgScaleY: 0,
      customBgColor: 14012330  // Color beige
   };
   
   // Crear attachMovie
   var miniMapPanel = this._chat.attachMovie("MiniMap", "_mcMiniMapReplacementPanel", 
      dofus.graphics.gapi.controls.Chat.MINIMAP_REPLACEMENT_PANEL_DEPTH, params);
   
   // Aplicar máscara
   miniMapPanel.setMask(this._chat._mcReplacementPanelMask);
   miniMapPanel.addEventListener("click", this);
   
   return miniMapPanel;
};

/**
 * instanciateShortcuts() - Crea panel de shortcuts
 */
_loc1.instanciateShortcuts = function() {
   var params = {_x: 0, _y: 0};
   this._chat.attachMovie("ShortcutsChatReplacementPanel", "_mcReplacementPanel", 
      dofus.graphics.gapi.controls.Chat.REPLACEMENT_PANEL_DEPTH, params);
   
   // Desactivar barra movible cuando se usan shortcuts
   this.api.kernel.OptionsManager.setOption("MovableBar", false);
   
   // Limpiar minimap anterior
   if(this._chat._mcMiniMapReplacementPanel) {
      this._chat._mcMiniMapReplacementPanel.removeEventListener("click", this);
      this._chat._mcMiniMapReplacementPanel.removeMovieClip();
   }
};

/**
 * instanciateCurrentReplacementPanel() - Instancia el panel actual
 */
_loc1.instanciateCurrentReplacementPanel = function(aPanelArgs) {
   if(this._bCurrentPanelInstanciated) {
      return undefined;
   }
   
   this._bCurrentPanelInstanciated = true;
   
   switch(this._nCurrentPanel) {
      case dofus.graphics.gapi.ui.ChatReplacementPanelsManager.MINIMAP:
         this.instanciateMiniMap();
         break;
      case dofus.graphics.gapi.ui.ChatReplacementPanelsManager.SHORTCUTS:
         this.instanciateShortcuts();
         break;
      case dofus.graphics.gapi.ui.ChatReplacementPanelsManager.FULL_WIDTH_FIGHTER_EFFECTS:
         this.instanciateFighterEffectsPanel(aPanelArgs);
         break;
   }
   
   if(this._nCurrentPanel == dofus.graphics.gapi.ui.ChatReplacementPanelsManager.MINIMAP) {
      this._chat._mcMiniMapReplacementPanel._visible = true;
   } else {
      this._chat._mcReplacementPanel.setMask(this._chat._mcReplacementPanelMask);
      this._chat._mcReplacementPanel.addEventListener("click", this);
   }
};

/**
 * removeCurrentReplacementPanel() - Remueve el panel actual
 */
_loc1.removeCurrentReplacementPanel = function() {
   if(!this._bCurrentPanelInstanciated) {
      return undefined;
   }
   
   this._bCurrentPanelInstanciated = false;
   this._chat._mcMiniMapReplacementPanel._visible = false;
   this._chat._mcReplacementPanel.removeEventListener("click", this);
   this._chat._mcReplacementPanel.removeMovieClip();
};

/**
 * changeReplacementPanel() - Cambia el panel visible
 */
_loc1.changeReplacementPanel = function(nPanelWished, bUpdateOption, aPanelArgs) {
   var banner = this.api.ui.getUIComponent("Banner");
   if(banner == undefined || banner.useFlashChat) {
      return undefined;
   }
   
   var actualPanel;
   if(this._nCurrentTemporaryPanel != undefined) {
      // Si hay panel temporal, usarlo a menos que se pida específicamente shortcuts
      if(nPanelWished == dofus.graphics.gapi.ui.ChatReplacementPanelsManager.SHORTCUTS && 
         this._nCurrentTemporaryPanel == dofus.graphics.gapi.ui.ChatReplacementPanelsManager.FULL_WIDTH_FIGHTER_EFFECTS) {
         this._nCurrentTemporaryPanel = undefined;
         actualPanel = nPanelWished;
      } else {
         actualPanel = this._nCurrentTemporaryPanel;
      }
   } else {
      actualPanel = nPanelWished;
   }
   
   var panelChanged = actualPanel != this._nCurrentPanel;
   var optionChanged = nPanelWished != this.api.kernel.OptionsManager.getOption("chatReplacementPanel");
   
   this._nCurrentPanel = actualPanel;
   
   // Actualizar opción si es necesario
   if(optionChanged && bUpdateOption) {
      this.api.kernel.OptionsManager.setOption("chatReplacementPanel", nPanelWished);
   }
   
   // Cambiar panel si es necesario
   if(panelChanged) {
      this.removeCurrentReplacementPanel();
   }
   
   if(actualPanel != dofus.graphics.gapi.ui.ChatReplacementPanelsManager.NO_REPLACEMENT_PANEL) {
      this.instanciateCurrentReplacementPanel(aPanelArgs);
   }
};

/**
 * click() - Maneja clicks en panels de reemplazo
 */
_loc1.click = function(oEvent) {
   var popupMenu;
   var currentPanel;
   
   switch(oEvent.target._name) {
      case "_mcReplacementPanel":
      case "_mcReplacementPanelMask":
      case "_mcMiniMapReplacementPanel":
      case "_mcMiniMap":
      case "_mcMiniMapMask":
         popupMenu = this.api.ui.createPopupMenu();
         currentPanel = this.api.kernel.OptionsManager.getOption("chatReplacementPanel");
         
         popupMenu.addStaticItem(this.api.lang.getText("SHOW"));
         popupMenu.addItem(this.api.lang.getText("BANNER_MAP"), this, this.changeReplacementPanel, 
            [dofus.graphics.gapi.ui.ChatReplacementPanelsManager.MINIMAP, true], 
            currentPanel != dofus.graphics.gapi.ui.ChatReplacementPanelsManager.MINIMAP);
         popupMenu.addItem(this.api.lang.getText("BANNER_SHORTCUTS_BAR"), this, this.changeReplacementPanel, 
            [dofus.graphics.gapi.ui.ChatReplacementPanelsManager.SHORTCUTS, true], 
            currentPanel != dofus.graphics.gapi.ui.ChatReplacementPanelsManager.SHORTCUTS);
         
         popupMenu.show(_root._xmouse, _root._ymouse, true);
         break;
   }
};

// Temporal methods (placeholder)
_loc1.instanciateFighterEffectsPanel = function(aPanelArgs) {
   // Implementar si se necesita panel de efectos de luchador
};

// Propiedades
_loc1.addProperty("api", _loc1.__get__api, function() {});
_loc1.addProperty("chat", _loc1.__get__chat, function() {});
_loc1.addProperty("currentReplacementPanel", _loc1.__get__currentReplacementPanel, function() {});
_loc1.addProperty("currentTemporaryReplacementPanel", _loc1.__get__currentTemporaryReplacementPanel, _loc1.__set__currentTemporaryReplacementPanel);
_loc1.addProperty("isCurrentReplacementPanelTemporary", _loc1.__get__isCurrentReplacementPanelTemporary, function() {});
```

### Paso 2.2: Modificar Chat.as para usar ChatReplacementPanelsManager

**Archivo:** `__Packages/dofus/graphics/gapi/ui/Chat.as`

**Localizar:** función `init()`

**Buscar donde se inicializa el chat (generalmente después de `super.init()`):**

**Agregar:**

```actionscript
   // Crear ChatReplacementPanelsManager
   this._replacementPanelsManager = new dofus.graphics.gapi.ui.ChatReplacementPanelsManager(this.api, this);
   
   // Crear máscara para replacement panels
   this._mcReplacementPanelMask = this.createEmptyMovieClip("_mcReplacementPanelMask", 100);
   with(this._mcReplacementPanelMask) {
      beginFill(0x000000, 100);
      moveTo(0, 0);
      lineTo(276, 0);      // Ancho del panel
      lineTo(276, 150);    // Alto del panel
      lineTo(0, 150);
      lineTo(0, 0);
      endFill();
   }
```

**Buscar función `click()` o el manejador de eventos de click**

**Localizar donde se procesan clicks de filtros (botones `_btnFilter0`, `_btnFilter1`, etc.)**

**Agregar después del procesamiento de filtros:**

```actionscript
   // Disparar evento filterChanged para sincronización
   if(oEvent.target._name.indexOf("_btnFilter") != -1) {
      var filterIndex = parseInt(oEvent.target._name.split("_btnFilter")[1]);
      this.dispatchEvent({
         type: "filterChanged",
         filter: filterIndex,
         selected: oEvent.target.selected
      });
   }
```

**Agregar nuevas funciones al final de Chat.as:**

```actionscript
/**
 * useReplacementPanel() - Cambia a un panel de reemplazo
 */
function useReplacementPanel(nReplacementPanel, aArgs) {
   var useNormalChat = nReplacementPanel == dofus.graphics.gapi.ui.ChatReplacementPanelsManager.NO_REPLACEMENT_PANEL;
   
   // Mostrar/ocultar elementos del chat normal
   this._chatFilters._visible = useNormalChat;
   this._txtChat._visible = useNormalChat;
   
   var i = 0;
   while(i < 12) {
      this["_btnFilter" + i]._visible = useNormalChat;
      i++;
   }
   
   // Mostrar/ocultar panels de reemplazo
   this._mcReplacementPanel._visible = !useNormalChat;
   this._mcMiniMapReplacementPanel._visible = nReplacementPanel == dofus.graphics.gapi.ui.ChatReplacementPanelsManager.MINIMAP && 
      (!useNormalChat && !this._replacementPanelsManager.isCurrentReplacementPanelTemporary);
   this._mcReplacementPanelMask._visible = !useNormalChat;
   
   this.addToQueue({
      object: this._replacementPanelsManager,
      method: this._replacementPanelsManager.changeReplacementPanel,
      params: [nReplacementPanel, undefined, aArgs]
   });
}

/**
 * useTemporaryReplacementPanel() - Mostrar panel temporalmente
 */
function useTemporaryReplacementPanel(nReplacementPanel, aArgs) {
   this._replacementPanelsManager.currentTemporaryReplacementPanel = nReplacementPanel;
   this.addToQueue({
      object: this._replacementPanelsManager,
      method: this._replacementPanelsManager.changeReplacementPanel,
      params: [nReplacementPanel, undefined, aArgs]
   });
}

/**
 * removeTemporaryReplacementPanel() - Volver al panel anterior
 */
function removeTemporaryReplacementPanel() {
   this.replacementPanelsManager.currentTemporaryReplacementPanel = undefined;
   var previousPanel = this.api.kernel.OptionsManager.getOption("chatReplacementPanel");
   this.addToQueue({
      object: this._replacementPanelsManager,
      method: this._replacementPanelsManager.changeReplacementPanel,
      params: [previousPanel]
   });
}
```

### Paso 2.3: Agregar constantes requeridas

**Archivo:** `__Packages/dofus/utils/Constants.as` (o donde estén las constantes)

**Agregar:**

```actionscript
// Constantes Electron y Replacement Panels
dofus.Constants.WIDESCREEN_PANEL_CHAT = 0;
dofus.Constants.WIDESCREEN_PANEL_CONSOLE = 1;
dofus.Constants.MINIMAP_REPLACEMENT_PANEL_DEPTH = 150;
dofus.Constants.REPLACEMENT_PANEL_DEPTH = 160;

// Display Styles
dofus.Constants.DISPLAY_STYLE_WIDESCREEN_PANELS = "widescreenpanels";
```

**En Chat.as, agregar constantes de depths si no existen:**

```actionscript
// En el prototipo de Chat o como constantes estáticas
dofus.graphics.gapi.controls.Chat.MINIMAP_REPLACEMENT_PANEL_DEPTH = 150;
dofus.graphics.gapi.controls.Chat.REPLACEMENT_PANEL_DEPTH = 160;
```

---

## Fase 3: Integración con Banner y Sincronización (2-3 horas)

### Paso 3.1: Modificar Banner.as

**Archivo:** `__Packages/dofus/graphics/gapi/ui/Banner.as`

**Localizar:** función `createChildren()` o donde se inicializa el chat

**Buscar donde se crea el componente chat:**

**Agregar después de la creación del chat:**

```actionscript
   // Registrar listener para eventos de filtros
   if(this._cChat) {
      this._cChat.addEventListener("filterChanged", this);
   }
```

**Agregar nuevas funciones al Banner.as:**

```actionscript
/**
 * configureUseFlashChat() - Configura si usar chat Flash o widescreen panels
 */
function configureUseFlashChat(bUseFlashChat) {
   this.useFlashChat = bUseFlashChat;
   
   if(this._cChat) {
      var replacementPanel = bUseFlashChat ? 
         dofus.graphics.gapi.ui.ChatReplacementPanelsManager.NO_REPLACEMENT_PANEL :
         this.api.kernel.OptionsManager.getOption("chatReplacementPanel");
      
      this._cChat.useReplacementPanel(replacementPanel);
   }
}

/**
 * onFilterChanged() - Maneja cambios de filtros del chat
 */
function onFilterChanged(oEvent) {
   // Actualizar banner illustration
   if(this.illustration && this.illustration.updateFlags) {
      this.illustration.updateFlags();
   }
   
   // Actualizar MiniMap de reemplazo
   if(this._cChat && this._cChat._replacementPanelsManager) {
      var miniMapPanel = this._cChat._replacementPanelsManager.getMiniMapReplacementPanel();
      if(miniMapPanel && miniMapPanel.updateFlags) {
         miniMapPanel.updateFlags();
      }
   }
}

/**
 * forceUpdateAllMiniMaps() - Fuerza actualización de todos los minimaps
 */
function forceUpdateAllMiniMaps() {
   // Actualizar banner illustration
   if(this.illustration && this.illustration.updateFlags) {
      this.illustration.updateFlags();
   }
   
   // Actualizar replacement panels
   if(this._cChat && this._cChat._replacementPanelsManager) {
      var miniMapPanel = this._cChat._mcMiniMapReplacementPanel;
      if(miniMapPanel) {
         if(miniMapPanel.updateFlags) {
            miniMapPanel.updateFlags();
         }
         if(miniMapPanel.updateHints) {
            miniMapPanel.updateHints();
         }
      }
   }
}
```

### Paso 3.2: Agregar Propagación de Updates

**Archivo:** Ubicar los setters del datacenter que manejan coordenadas/highlights

**Generalmente en:** `__Packages/dofus/datacenter/Basics.as` o similar

**Buscar funciones como:** `__set__banner_targetCoords`, `__set__aks_infos_highlightCoords`

**Agregar o modificar para incluir propagación:**

```actionscript
function __set__banner_targetCoords(oCoords) {
   this._oTargetCoords = oCoords;
   
   // Forzar actualización en banner y replacement panels
   var banner = this.api.ui.getUIComponent("Banner");
   if(banner) {
      banner.forceUpdateAllMiniMaps();
   }
}

function __set__aks_infos_highlightCoords(aCoords) {
   this._aHighlightCoords = aCoords;
   
   // Forzar actualización en banner y replacement panels
   var banner = this.api.ui.getUIComponent("Banner");
   if(banner) {
      banner.forceUpdateAllMiniMaps();
   }
}
```

### Paso 3.3: Mejorar Sincronización de MapFilters

**Archivo:** Localizar el componente `MapExplorer` (mapa grande)

**Buscar función de toggle de filtros (generalmente en un click handler)**

**Modificar para que persista en OptionsManager:**

```actionscript
function toggleFilterCategory(nIndex) {
   // Obtener filtros actuales
   var currentFilters = this.api.kernel.OptionsManager.getOption("MapFilters");
   
   // Cambiar el filtro
   currentFilters[nIndex] = !currentFilters[nIndex];
   
   // Guardar cambio
   this.api.kernel.OptionsManager.setOption("MapFilters", currentFilters);
   
   // Actualizar vista local
   this.showHintsCategory(nIndex, currentFilters[nIndex]);
   
   // Forzar actualización en banner (esto ahora debería funcionar automáticamente via applyOption)
   var banner = this.api.ui.getUIComponent("Banner");
   if(banner) {
      banner.forceUpdateAllMiniMaps();
   }
}
```

---

## Fase 4: Mejoras de Login y Navegación Tab (1-2 horas)

### Paso 4.1: Modificar Login.as para Tab Navigation

**Archivo:** `__Packages/dofus/graphics/gapi/ui/Login.as`

**Localizar:** función `init()` o `createChildren()`

**Agregar al final:**

```actionscript
/**
 * addTabReferences() - Prepara campos para navegación Tab en Electron
 */
function addTabReferences() {
   // Exponer campos para onTabKey() de Electron
   this.tiAccount = this._tiAccount;
   this.tiPassword = this._tiPassword;
   this._btnOK = this._btnOK || this.mcLogin._btnOK;  // Ajustar según estructura
   
   // Habilitar tab en campos
   if(this._tiAccount && this._tiAccount.textFieldObject) {
      this._tiAccount.textFieldObject.tabEnabled = true;
   }
   if(this._tiPassword && this._tiPassword.textFieldObject) {
      this._tiPassword.textFieldObject.tabEnabled = true;
   }
   if(this._btnOK) {
      this._btnOK.tabEnabled = true;
   }
}
```

**Llamar `addTabReferences()` al final de `init()` o `createChildren()`:**

```actionscript
   // Al final de init()
   this.addTabReferences();
```

### Paso 4.2: Agregar DisplayStyle Widescreen en Options

**Archivo:** `__Packages/dofus/graphics/gapi/ui/Options.as`

**Localizar:** donde se agregan los DisplayStyles (generalmente en arrays `_eaDisplayStyles`)

**Buscar código similar a:**

```actionscript
this._eaDisplayStyles.push({label: this.api.lang.getText("DISPLAYSTYLE_NORMAL"), style: "normal"});
```

**Agregar después:**

```actionscript
// Solo agregar si Electron está habilitado
if(this.api.electron && this.api.electron.enabled) {
   this._eaDisplayStyles.push({
      label: this.api.lang.getText("DISPLAYSTYLE_WIDESCREENPANELS"), 
      style: dofus.Constants.DISPLAY_STYLE_WIDESCREEN_PANELS
   });
}
```

### Paso 4.3: Agregar Textos de Idioma

**Archivo:** Archivo de idioma (generalmente `Lang/lang_es.txt` o similar)

**Agregar:**

```
DISPLAYSTYLE_WIDESCREENPANELS = "Paneles Widescreen"
BANNER_MAP = "Mapa"
BANNER_SHORTCUTS_BAR = "Barra de Accesos"
SHOW = "Mostrar"
```

---

## Fase 5: Crear Assets Flash Necesarios (2-3 horas)

### Paso 5.1: Símbolo MiniMap

**En Flash IDE:**

1. **Crear nuevo MovieClip** llamado `MiniMap`
2. **Propiedades del símbolo:**
   - Linkage: Export for ActionScript ?
   - Identifier: `MiniMap`
   - AS 2.0 Class: `dofus.graphics.gapi.controls.MiniMap` (debe existir)

3. **Contenido del símbolo:**
   - Capa "background": Rectángulo con fill color beige (#D8B48C)
   - Capa "mask": Shape para clipping (opcional)
   - Capa "content": Contenedor para elementos del mapa

### Paso 5.2: Registrar Clase MiniMap

**Archivo:** `__Packages/dofus/DofusCore.as` o donde se registren las clases

**Buscar líneas similares a:** `Object.registerClass("...", ...);`

**Agregar:**

```actionscript
Object.registerClass("MiniMap", dofus.graphics.gapi.controls.MiniMap);
```

### Paso 5.3: Extender MiniMap.prototype (Opcional)

**Archivo:** `__Packages/dofus/utils/Aks.as` (al final)

**Agregar funcionalidad específica si es necesaria:**

```actionscript
// Extensiones para MiniMap
var _loc1 = dofus.graphics.gapi.controls.MiniMap.prototype;

_loc1.doubleClick = function(oEvent) {
   this._nLastDoubleClick = getTimer();
   var targetX, targetY, subAreaId;
   
   if(!this.api.datacenter.Game.isFight && _global.isNaN(this.dungeonID)) {
      targetX = oEvent.coordinates.x;
      targetY = oEvent.coordinates.y;
      subAreaId = this.api.kernel.AreasManager.getSubAreaIDFromCoordinates(targetX, targetY, this._oMap.superarea);
      
      if(targetX != undefined && targetY != undefined) {
         this.api.network.Basics.autorisedMoveCommand(targetX, targetY, subAreaId);
      }
   }
};
```

---

## Fase 6: Testing y Validación (1-2 horas)

### Paso 6.1: Checklist de Validación

**Detección de Electron:**
- [ ] `dofus.Electron.isEnabled()` retorna `true` en Electron, `false` en navegador
- [ ] `api.electron.enabled` accesible desde cualquier componente

**Reemplazo de Panels:**
- [ ] Click derecho en chat ? Menú "Mostrar" ? "Mapa"
- [ ] Chat desaparece, aparece MiniMap
- [ ] MiniMap responde a doble click (si implementado)
- [ ] Cambio back a chat funciona

**Sincronización de Filtros:**
- [ ] Cambiar filtro en MapExplorer ? MiniMap de reemplazo se actualiza
- [ ] Cambiar filtro en chat ? Banner illustration se actualiza
- [ ] Persistencia: filtros se guardan en OptionsManager

**Navegación Tab:**
- [ ] Tab en login Account ? Password
- [ ] Tab en Password ? OK Button  
- [ ] Tab en OK Button ? Account
- [ ] Funciona solo en Electron

### Paso 6.2: Debug y Troubleshooting

**Problema Común 1:** MiniMap no se instancia
```actionscript
// Verificar en chat click:
trace("_replacementPanelsManager existe: " + (this._replacementPanelsManager != undefined));
trace("Símbolo MiniMap existe: " + (_global.MiniMap != undefined));
```

**Problema Común 2:** Filtros no sincronizan
```actionscript
// Verificar en MapExplorer toggle:
var filters = this.api.kernel.OptionsManager.getOption("MapFilters");
trace("Filtros después de toggle: " + filters.join(","));
```

**Problema Común 3:** Tab navigation no funciona
```actionscript
// Verificar en Login:
trace("Electron enabled: " + this.api.electron.enabled);
trace("Focus actual: " + Selection.getFocus());
```

---

## Fase 7: Configuración Electron (Opcional - 2-3 horas)

### Paso 7.1: Estructura Básica Electron

```
electron/
??? main.js           # Proceso principal
??? preload.js        # Script de preload
??? package.json      # Dependencias
```

### Paso 7.2: main.js

```javascript
const { app, BrowserWindow } = require('electron');
const path = require('path');

let mainWindow;

function createWindow() {
   mainWindow = new BrowserWindow({
      width: 1024,
      height: 768,
      webPreferences: {
         preload: path.join(__dirname, 'preload.js'),
         nodeIntegration: false,
         contextIsolation: true,
         enableRemoteModule: false
      }
   });

   // Cargar página del juego
   mainWindow.loadURL('http://localhost:5000'); // Ajustar según servidor

   mainWindow.on('closed', () => {
      mainWindow = null;
   });

   // Focus / Blur events para Flash
   mainWindow.webContents.on('focus', () => {
      mainWindow.webContents.executeJavaScript(`
         if(window.callFlash) window.callFlash('onWindowFocus', []);
      `);
   });

   mainWindow.webContents.on('blur', () => {
      mainWindow.webContents.executeJavaScript(`
         if(window.callFlash) window.callFlash('onWindowBlur', []);
      `);
   });
}

app.on('ready', createWindow);

app.on('window-all-closed', () => {
   if(process.platform !== 'darwin') {
      app.quit();
   }
});
```

### Paso 7.3: preload.js

```javascript
const { contextBridge } = require('electron');

// Exponer objeto 'electron' al contexto de Flash
contextBridge.exposeInMainWorld('electron', {
   // Tab Key Navigation - llamada desde Electron a Flash
   sendTabKey: () => {
      if(window.callFlash) {
         window.callFlash('onTabKey', []);
      }
   },

   // Placeholder para funciones futuras
   isEnabled: () => true,
   
   // Métodos que Flash puede llamar
   getLangText: (key, args) => {
      return key; // Placeholder
   }
});

// Manejar teclas globales
window.addEventListener('DOMContentLoaded', () => {
   document.addEventListener('keydown', (event) => {
      if(event.key === 'Tab') {
         event.preventDefault();
         window.electron.sendTabKey();
      }
   });
});
```

### Paso 7.4: package.json

```json
{
  "name": "dofus-electron-client",
  "version": "1.0.0",
  "main": "electron/main.js",
  "dependencies": {
    "electron": "^15.0.0"
  },
  "scripts": {
    "start": "electron electron/main.js",
    "dev": "electron electron/main.js --dev"
  }
}
```

---

## Resumen de Archivos Modificados

### ActionScript Files
| Archivo | Tipo | Cambios |
|---------|------|---------|
| `Aks.as` | MODIFICAR | + clase `dofus.Electron` + `ChatReplacementPanelsManager` |
| `OptionsManager.as` | MODIFICAR | + opciones `EnableWidescreenPanels`, `chatReplacementPanel` |
| `Banner.as` | MODIFICAR | + `configureUseFlashChat()`, `onFilterChanged()`, listeners |
| `Chat.as` | MODIFICAR | + `useReplacementPanel()`, dispatch `filterChanged`, manager |
| `Login.as` | MODIFICAR | + `addTabReferences()` para navegación Tab |
| `Options.as` | MODIFICAR | + DisplayStyle widescreen panels |
| `Constants.as` | MODIFICAR | + constantes Electron y depths |
| `DofusCore.as` | MODIFICAR | + `Object.registerClass("MiniMap", ...)` |

### Flash Assets
| Asset | Tipo | Propiedades |
|-------|------|-------------|
| `MiniMap` | MovieClip | Export for ActionScript, clase `dofus.graphics.gapi.controls.MiniMap` |
| `ShortcutsChatReplacementPanel` | MovieClip | Panel de shortcuts (opcional) |
| `ButtonCheck` | Button | Checkbox para opciones |

### Electron Files (Opcional)
| Archivo | Tipo | Función |
|---------|------|---------|
| `main.js` | JavaScript | Proceso principal Electron |
| `preload.js` | JavaScript | Bridge Flash ? Electron |
| `package.json` | JSON | Dependencias Electron |

---

## Tiempo Estimado Total: 10-14 horas

- **Fase 1:** Configuración Base (2-3h)
- **Fase 2:** Chat Replacement (3-4h)  
- **Fase 3:** Sincronización (2-3h)
- **Fase 4:** Login/Tab Navigation (1-2h)
- **Fase 5:** Assets Flash (2-3h)
- **Fase 6:** Testing (1-2h)
- **Fase 7:** Electron Setup (2-3h, opcional)

El **modo electron** estará completamente funcional después de las fases 1-6. La fase 7 es opcional para crear el contenedor Electron completo.

---

**Documentación generada:** Noviembre 2025  
**Versión:** 2.0  
**Core de referencia:** Dofus_Busta