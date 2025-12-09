# Flujo: cambio de Chat a MiniMap (Banner / Chat Replacement Panels)

Resumen ejecutivo

- Objetivo: documentar cómo el panel de chat del `Banner` puede reemplazarse por un `MiniMap` (o un panel de shortcuts), cómo se instancian los minimapas de reemplazo y cómo se actualizan los filtros/flags/hints para que el minimapa refleje cambios realizados desde el mapa grande (`MapExplorer`) u otras partes.
- Resultado: se detallan las clases, funciones y los pasos clave (instanciación, visibilidad, llamadas de actualización). También se indican observaciones sobre por qué un `updateFlags()` aislado puede no ser suficiente y recomendaciones prácticas.

Componentes clave

- `dofus/graphics/gapi/controls/Chat.as` (control del chat en el Banner)
  - Implementa la lógica de los botones de filtrado del chat, los eventos de click/hover y el manager de panels de reemplazo (`ChatReplacementPanelsManager`).
  - Propiedades/métodos relevantes: `replacementPanelsManager`, `miniMapReplacementPanel`, `shortcutsReplacementPanel`, `useReplacementPanel()`, `useTemporaryReplacementPanel()`, `removeTemporaryReplacementPanel()`.
  - El `Chat` crea internamente `ChatReplacementPanelsManager` en `init()`.

- `dofus/graphics/gapi/ui/Banner.as` (UI principal del banner)
  - Contiene el sub-control `chat` y métodos que invocan actualizaciones visuales globales: por ejemplo `configureUseFlashChat()` que decide si se debe usar panel de chat interno o panel externo, y que llama `this._cChat.useReplacementPanel(...)`.
  - Registra listeners (`this._cChat.addEventListener("filterChanged",this)`), y en varios puntos llama a: `illustration.updateFlags()`, `chat.miniMapReplacementPanel.updateFlags()`, `chat.shortcutsReplacementPanel.miniMap.updateFlags()` cuando cambian coordenadas objetivo o highlights.

- `dofus/utils/Aks.as` (glue / definiciones de `MiniMap.prototype` y handlers globales)
  - Define/expone `MiniMap.prototype` (métodos como `initMap()`, `updateMap()`, `updateHints()`, `updateFlags()` y `doubleClick()`), y se registran instancias de `MiniMap` cuando son attachMovie en los panels de reemplazo.
  - En `Aks`/kernel/datacenter setters (por ejemplo `Datacenter.__set__aks_infos_highlightCoords` y `banner_targetCoords`) se observa que al actualizar coordenadas/highlights hacen:
    - `this.api.ui.getUIComponent("Banner").illustration.updateFlags();`
    - `this.api.ui.getUIComponent("Banner").chat.miniMapReplacementPanel.updateFlags();`
    - `this.api.ui.getUIComponent("Banner").chat.shortcutsReplacementPanel.miniMap.updateFlags();`
    lo cual ilustra el patrón 'actualiza la fuente y fuerza un refresh en banner + replacement minimaps'.

Instanciación del MiniMap en panels (flujo)

1. `Banner.createChildren()` → crea/acomoda subcontroles (incluye `chat`).
2. `Chat.init()` crea `this._replacementPanelsManager = new ChatReplacementPanelsManager(this.api,this);`.
3. `ChatReplacementPanelsManager.changeReplacementPanel()` decide qué panel mostrar y llama a `instanciateCurrentReplacementPanel()`.
4. `instanciateMiniMap()` (en `ChatReplacementPanelsManager`) hace:
   - Si `this._chat._mcMiniMapReplacementPanel` no existe, crea un attachMovie("MiniMap","_mcMiniMapReplacementPanel",depth,args) donde args incluyen: `contentPath:"Map"`, `enabled:true`, `showHintsMaxDistance`, `customBgScaleWidth/Height/X/Y`, `customBgColor`.
   - `this._chat._mcMiniMapReplacementPanel.setMask(this._chat._mcReplacementPanelMask)`.
5. En `ShortcutsChatReplacementPanel.instanciateMiniMap()` ocurre lo mismo para `this._mcMiniMap` (mini mapa pequeño dentro del panel de shortcuts).

Qué hace el `MiniMap` al inicializarse

- `MiniMap.initMap()`:
  - crea el contenedor bitmap, configura manejadores de eventos (rollOver/rollOut), escala del cursor, setea referencias (`oMap`), y llama a `this.updateMap(); this.updateHints();`.
- `updateHints()` y `updateFlags()` son las rutinas que pintan marcadores/hints/flags en el minimapa. Su implementación (definida junto a `MiniMap.prototype` en `Aks`/`DoAction`/fused file) lee el estado (ver más abajo) para decidir qué mostrar.

Manejo de filtros y sincronización

- Fuente principal de filtros/flags:
  - `OptionsManager.DEFAULT_VALUES.MapFilters` almacena el array por defecto: `MapFilters:[0,1,1,1,1,1,1]`.
  - `MapExplorer` (UI del mapa grande) en su lógica de toggling lee `this.api.kernel.OptionsManager.getOption("MapFilters")[index]` para determinar estado actual.
  - Sin embargo, en el trozo observado el toggle hace `this.showHintsCategory(index, !this.api.kernel.OptionsManager.getOption("MapFilters")[index]);` y luego `this.api.ui.getUIComponent("Banner").illustration.updateHints();` — NO vi una escritura explícita a `OptionsManager.setOption("MapFilters", newArray)` en ese handler. Si no se persiste la opción, otros consumidores que lean desde `OptionsManager` no verán el cambio.

- Patrón de actualización usado en otras partes:
  - Hay setters en `datacenter.Basics` (por ejemplo `__set__aks_infos_highlightCoords` y `__set__banner_targetCoords`) que, una vez que cambian la data, llaman a:
    - `Banner.illustration.updateFlags();`
    - `Banner.chat.miniMapReplacementPanel.updateFlags();`
    - `Banner.chat.shortcutsReplacementPanel.miniMap.updateFlags();`
  - Esto sugiere que la práctica establecida es: actualizar la "fuente de verdad" (datacenter / options) y luego forzar refresh a banner + replacement minimaps.

Por qué un simple `updateFlags()` desde `MapExplorer` a veces no actualiza la vista

- Si `MapExplorer` cambia solo el estado interno (por ejemplo una variable local o la vista) pero no persiste el cambio en `OptionsManager` ni en `datacenter.Basics` (la fuente que `MiniMap.updateHints()` consulta), entonces llamar `updateFlags()` solo forzará un redraw pero el `MiniMap` seguirá leyendo datos desde `OptionsManager.getOption("MapFilters")` o desde `datacenter.Basics`, que no se han actualizado.
- Alternativamente, `MiniMap.updateHints()` / `updateFlags()` pueden consultar cachés locales o variables internas (por ejemplo `this._aHints` o similar) que no sean reemplazadas por la llamada externa si no hay una función de reaplicación de filtros. Por eso es importante que `MapExplorer` escriba el nuevo estado en la fuente canónica (probablemente `OptionsManager.setOption("MapFilters", newArray)` o en `datacenter`) y/o emita el mismo evento/listener que otras partes del código esperan.

Eventos y dispatch

- `Chat` dispatcha `filterChanged` cuando el usuario pulsa los botones de filtro (ver `Chat.click`: `this.dispatchEvent({type:"filterChanged",filter:0,selected:this._btnFilter0.selected});`). El `Banner` se suscribe a `this._cChat.addEventListener("filterChanged",this)`.
- En lugares donde se aplican cambios de highlights/coords, el código actualiza datacenter y luego ejecuta los `updateFlags()` en banner y panels de minimap (ver setters en `datacenter.Basics`).

Recomendaciones prácticas (cómo arreglar la desincronización)

1. Persistir cambios de MapFilters en OptionsManager desde `MapExplorer` cuando se togglea una categoría:
   - Leer la array actual: `var a = this.api.kernel.OptionsManager.getOption("MapFilters");`
   - Modificar `a[index] = !a[index];`
   - Guardar: `this.api.kernel.OptionsManager.setOption("MapFilters", a);`
   - A continuación, llamar a las actualizaciones estándar si fuera necesario:
     - `this.api.ui.getUIComponent("Banner").illustration.updateHints();`
     - `this.api.ui.getUIComponent("Banner").chat.miniMapReplacementPanel.updateFlags();`
     - `this.api.ui.getUIComponent("Banner").chat.shortcutsReplacementPanel.miniMap.updateFlags();`
   - O mejor aún: si `OptionsManager.setOption` llama internamente a `applyOption` y `applyOption` propaga la actualización, confiar en eso en vez de llamar manualmente a `updateFlags()`.

2. Alternativa/event-driven: Si existe un evento central para cambios de filtros (ej.: `OptionsManager` despacha un evento), registrar el `MiniMap` o los replacement panels como listeners para ese evento y, al recibirlo, llamar a `updateHints()`/`updateFlags()` leyendo la nueva opción.

3. Validar `MiniMap.updateHints()`/`updateFlags()`:
   - Revisar esas funciones para confirmar de dónde obtienen los filtros (¿`OptionsManager.getOption("MapFilters")`? ¿`datacenter.Basics`?). Si no leen `OptionsManager` directamente, actualizar su implementación para consultar la fuente canónica en cada refresh.

Fragmentos / lugares concretos en el código revisado

- `ChatReplacementPanelsManager.instanciateMiniMap()` — attachMovie para `MiniMap` (args: `contentPath:"Map"`, `showHintsMaxDistance`, `customBgScaleWidth`, `customBgScaleHeight`, etc.).
- `Chat.init()` — `this._replacementPanelsManager = new ChatReplacementPanelsManager(this.api,this);`
- `Chat.click` en filtros — `this.dispatchEvent({type:"filterChanged",filter:N,selected:...});` y `this.api.kernel.ChatManager.setTypeVisible(...);`
- `Banner.configureUseFlashChat()` — decide `chat.useReplacementPanel(...)` en función de `OptionsManager.getOption("EnableWidescreenPanels")` y `Basics.forceFlashChat`.
- `datacenter.Basics.__set__aks_infos_highlightCoords` y `__set__banner_targetCoords` — cuando se cambian, llaman a `Banner.illustration.updateFlags()` y a `chat.*.updateFlags()`.

Conclusión y próximos pasos sugeridos

- Lo más probable: la desincronización que viste (el replacement minimap no actualiza inmediatamente cuando togglear el filtro en `MapExplorer`) se debe a que el toggle no persiste la nueva configuración en la fuente de verdad (`OptionsManager` o `datacenter`) y solo fuerza un update local.
- Implementación recomendada: modificar `MapExplorer` para que actualice `OptionsManager.MapFilters` (o la estructura de datos canónica), y confiar en la cascada de actualizaciones (o llamar explícitamente a las mismas rutinas que utilizan los setters del datacenter) para que banner y replacement minimaps se actualicen correctamente.

Anexos — referencias rápidas (nombres/métodos para buscar)

- `ChatReplacementPanelsManager.instanciateMiniMap()` — crea `MiniMap` attachMovie
- `Chat.useReplacementPanel()` / `Chat.useTemporaryReplacementPanel()` / `Chat.removeTemporaryReplacementPanel()`
- `Chat.click` -> dispatch `filterChanged` events
- `Banner.configureUseFlashChat()`
- `MiniMap.initMap()` -> `updateMap()` and `updateHints()`
- `datacenter.Basics.__set__aks_infos_highlightCoords` / `__set__banner_targetCoords` -> llaman `updateFlags()` en banner y minimaps
- `OptionsManager.DEFAULT_VALUES.MapFilters`

Siguientes pasos que puedo hacer ahora (elige lo que prefieras)

- Implementar el cambio en `MapExplorer` para que escriba en `OptionsManager.setOption("MapFilters", a)` y luego llame a los `updateFlags()` (o, mejor, rely on applyOption). Puedo hacer el parche y probarlo.
- Revisar e incluso modificar `MiniMap.updateHints()` / `updateFlags()` para que siempre lean la fuente canónica (`OptionsManager.getOption("MapFilters")`) en cada refresh.
- Añadir logging/trazas temporales para comprobar el flujo de datos (qué lee el `MiniMap` al actualizar) y reproducir el fallo.

---

Documento generado por revisión de:
- `dofus/graphics/gapi/controls/Chat.as`
- `dofus/graphics/gapi/ui/Banner.as`
- `dofus/utils/Aks.as`

Fecha: 2025-10-25
