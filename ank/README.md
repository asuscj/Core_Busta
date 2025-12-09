# Análisis de la Carpeta ANK

## Estructura General
```
ank/
├── battlefield/           - Sistema de batalla y mapas
├── battlefield[...].as   - Controlador principal de batalla
├── gapi/                 - Interfaz gráfica genérica
└── utils/               - Utilidades y herramientas comunes
```

## Componentes Principales

### 1. Sistema de Batalla (battlefield)
El sistema de batalla parece ser uno de los componentes fundamentales, responsable de:
- Manejo de combates
- Gestión de mapas
- Posicionamiento de entidades

### 2. GAPI (Generic API)
Sistema de interfaz gráfica que probablemente maneja:
- Controles UI genéricos
- Sistemas de ventanas
- Gestión de eventos UI

### 3. Utilidades (utils)
Herramientas y funciones comunes utilizadas en todo el cliente.

## Próximos Pasos de Análisis

1. Examinar utils/ primero ya que probablemente contiene funciones base necesarias para entender el resto
2. Analizar gapi/ para entender el sistema de UI
3. Profundizar en battlefield/ para entender la mecánica de combate

## Notas sobre la Decompilación
- El nombre del archivo battlefield tiene caracteres especiales codificados (%22%5Cx1e%5Ct%5Cx1d%22) que necesitan ser revisados
- Posible problema de codificación en nombres de archivos

## Correcciones aplicadas (decompilación)

- utils/loadJson.as: toString devolvía una variable libre `json` (indefinida). Corregido a `this.json`.
- utils/Sequencer.as: sombreado del parámetro `_loc2_` y referencia a `_loc7` indefinida. Reescrito para usar un objeto local `o` y mantener campos (`id`, `waitEnd`, `object`, `fn`, `parameters`, `duration`).
- battlefield/utils/Pathfinding.as: uso de variable `p` inexistente en `getCeldasPorDistanciaAnillo`. Corregido a `par` (parámetro de la función).
- battlefield/utils/Pathfinding.as: en `getCeldasPorDireccion`, la comprobación de índice inválido estaba vacía y luego escribía `celdas[_loc2_]`. Ahora retorna inmediatamente `celdas` cuando `_loc2_` es inválido para terminar correctamente la función.
- battlefield["%22%5Cx1e%5Ct%5Cx1d%22].as: el contenido estaba fuera de una función y se invocaba `loc1.onLoadInit(_loc2_)` (sin guion bajo). Se restauró la definición correcta ` _loc1.onLoadInit = function(_loc2_) { ... }` y se cerró la función.

### gapi/controls
- gapi/controls/ContainerGrid.as: en `dblClick`, el parámetro de evento `_loc2_` era sombreado por una variable local del mismo nombre, rompiendo el uso posterior. Se renombró la variable local a `_loc3_` y se mantuvo `target` del evento original.
- gapi/controls/ToolTip.as: getters generados por decompilación vacíos en `addProperty` devolvían `undefined` (params, text, x, y). Se implementaron getters que retornan los campos internos (`_oParams`, `_sText`, `_nX`, `_nY`).
- gapi/controls/ProgressBar.as: correcciones de decompilación:
	- Setter mal nombrado `__set__showAnimOnLoads` corregido a `__set__showAnimOnLoad` para emparejar con `addProperty`.
	- `addProperty("showGradient", ...)` usaba el getter equivocado; ahora usa `__get__showGradient`.
	- Método faltante `hideUp` (referenciado por `applyValue` y `createChildren`); se añadió espejo de `uberHideUp` para `_mcRenderer`.
- gapi/controls/ScrollBar.as: uso de `height` en lugar de `_height` para redimensionar el thumb en `resizeThumb`; corregido a `_height` para evitar que no se aplique el tamaño.

### battlefield
- battlefield/MapHandler.as: `showFightCells` tenía reutilización de variables (`_loc2_`, `_loc3_`) que hacía que los bucles no se ejecutaran correctamente (se sobrescribían las cadenas con índices). Se separaron variables de origen (`_loc2s_`, `_loc3s_`) de los índices (`_loc2i_`, `_loc3i_`) sin cambiar la lógica.