# Modo Héroes ? Especificación de Protocolo

Esta especificación define los mensajes entre cliente y servidor para el ?modo héroes?. Los ejemplos usan `...` para partes no relevantes. Adecua literales exactos si tu servidor ya publica un formato concreto.

## 1) Prefijo de contexto de héroe (saliente y opcionalmente entrante)
- Formato: `-<HERO_ID>|<COMANDO>`
- Uso: El cliente envía cualquier comando dentro del contexto de un héroe específico con este prefijo. El servidor puede replicar el prefijo en la respuesta o, alternativamente, incluir `heroId` en la carga útil.
- Ejemplo (abrir inventario del héroe 123): `-123|Ii` (donde `Ii` es el comando de inventario estándar).

## 2) Canal de control de héroes (Hh*)
Acciones gestionadas por el servidor para controlar la UI del cliente:

### Comandos del cliente al servidor:
- `HP` ? Solicita abrir el panel de héroes.
- `HhList` o `HhRefresh` ? Solicita actualizar la lista de héroes (enviado automáticamente cuando el panel se inicializa).
- `HhInventory` ? Solicita abrir inventario del héroe en contexto (prefijado con `-<heroId>|`).
- `HhStatsJob` ? Solicita abrir stats/oficios del héroe en contexto.
- `HhSpells` ? Solicita abrir hechizos del héroe en contexto.

### Respuestas del servidor al cliente:
- **`HhPHeroesPanel`** ? Carga el panel de héroes (respuesta a `HP`).
  - DataProcessor toma `substr(3)` del paquete como nombre del componente
  - `HhPHeroesPanel` ? carga componente `"HeroesPanel"`
- **`HhA<datos>`** ? Actualiza/reemplaza la lista de héroes en el panel (respuesta a `HhList`/`HhRefresh`).
  - `datos`: lista de héroes separados por `|`, cada héroe con campos separados por `~`:
    `id~name~guild~sex~gfxId~color1~color2~color3~accessories~level~selected`
  - Ejemplo: `123~Arthas~MyGuild~0~16711680~65280~255~acc:...~165~0|124~Jaina~MyGuild~1~...~160~1`
- **`HhL<heroId>`** ? Establece nuevo líder activo (respuesta a `-<heroId>|HL`).
- **`HhPInventory`** ? Carga inventario del héroe (respuesta a `-<heroId>|HhInventory`).
- **`HhPStatsJob`** ? Carga stats/oficios del héroe (respuesta a `-<heroId>|HhStatsJob`).
- **`HhPSpells`** ? Carga hechizos del héroe (respuesta a `-<heroId>|HhSpells`).

**IMPORTANTE:** El protocolo usa **`HhP`** (H mayúscula + h minúscula + P) para cargar componentes UI de héroes, NO confundir con `hP` (minúscula) que es para casas (houses/properties).

## 3) Canal de inventario multi-héroe (V*)
- Requisito: Toda actualización de inventario, cuando aplique a un héroe distinto al jugador principal, DEBE indicar `heroId`.
- Dos variantes compatibles:
  1. Prefijo de contexto: `-<heroId>|Vq;...`
  2. `Vq;<heroId>|<resto_campos>` ? incluir `heroId` como primer campo del payload.
- Handlers habituales en cliente: `onQuantity2`, `onAdd2`, `onRemove2`, `onChange2`.

## 4) Listado/alta de héroes (HhA)
- Mensaje: `HhA<datos>` ? listado completo de héroes del jugador.
- **Separador entre héroes:** `|` (pipe)
- **Separador entre campos de un héroe:** `~` (tilde)
- Orden EXACTO de campos para cada héroe:
  1. `id` (numérico, ID del personaje héroe)
  2. `name` (nombre del héroe)
  3. `guild` (nombre de gremio o vacío)
  4. `sex` (0=masculino, 1=femenino)
  5. `gfxId` (ID del GFX/sprite para cargar clip SWF)
  6. `color1` (HEX sin 0x o `-1` cuando no aplique)
  7. `color2` (HEX sin 0x o `-1` cuando no aplique)
  8. `color3` (HEX sin 0x o `-1` cuando no aplique)
  9. `accessories` (string codificado: `acc1,acc2,acc3...`)
  10. `level` (nivel del héroe)
  11. `selected` (0=no seleccionado, 1=líder actual)

- Ejemplo completo de 2 héroes:
  Ejemplo (2 héroes; observa `gfxId` como 5º campo y colores en HEX sin 0x):
  ```
  HhA123~Arthas~~0~100~FF0000~00FF00~0000FF~1f4,1f5,1f6~165~0|124~Jaina~Knights~1~101~-1~-1~-1~1f7,1f8~160~1
  ```

**Cambios vs versión anterior:**
- Separador cambiado de `;` a `~` para evitar conflictos con otros comandos del protocolo.
- Se añade `gfxId` para permitir al cliente cargar el SWF del sprite sin consultas extra.
- Cliente parsea en `Account.as ? prepareHeroList()` usando split por `|` y `~`.

## 5) Cambio de líder
- Entrada del cliente: `-<heroId>|HL` para pedir cambio de líder al héroe `heroId`.
- Respuesta del servidor: `HhL;<heroId>` y, si aplica, sincronizaciones de estado (atajos, bonus de líder, etc.).

## 6) Apertura de paneles por héroe
- Inventario: `-<heroId>|Hi` ? servidor responde con datos de inventario usando 3) para enrutar.
- Hechizos: `-<heroId>|Hs` ? servidor responde con lista/cambios para ese héroe.
- Oficios/Stats: `-<heroId>|Hj`/`-<heroId>|Ht` según convención actual.

## 7) Consideraciones de sincronización
- Todas las respuestas que afecten a datos en el datacenter deben contener `heroId` explícito (prefijo o payload) para evitar aplicar cambios al `Player` global.
- El servidor puede enviar `HhA` para forzar repoblado del panel tras:
  - alta/baja de héroes
  - cambio masivo de datos (accesorios/huesos)
  - re-conexión/handshake

## 8) Errores y códigos (sugeridos)
- `He1;<heroId>` ? Héroe no encontrado/permiso.
- `He2` ? Formato de mensaje inválido.
- `He3;<op>` ? Operación no soportada en modo héroes.

Adecua estos códigos a tu catálogo si ya tienes nomenclatura de errores propia.
