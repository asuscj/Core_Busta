# Modo Héroes ? Guía de implementación en servidor

Esta guía explica cómo añadir soporte de ?modo héroes? en tu servidor para funcionar con el cliente AS2/Dofus Retro descrito en este repositorio.

## Objetivos
- Mantener múltiples héroes activos bajo una misma cuenta.
- Enrutar comandos al héroe correcto mediante un prefijo de contexto.
- Emitir eventos de control de UI (`Hh*`) para sincronizar el cliente.
- Incluir `heroId` en respuestas de datos (inventario, hechizos, etc.).

## 1) Parsing del prefijo de contexto
- Entrada esperada del cliente: `-<heroId>|<COMANDO>`.
- Pasos:
  1. Si el mensaje empieza por `-`, parsea `<heroId>` hasta `|`.
  2. Valida que `<heroId>` pertenece a la cuenta autenticada.
  3. Enruta el resto del comando (`<COMANDO>`) al contexto/estado del héroe.
  4. Si no hay prefijo, trata el mensaje en el contexto del líder actual.

## 2) Modelo de datos en memoria
- Estructura de sesión por cuenta:
  - `leaderHeroId` ? héroe que recibe por defecto los comandos sin prefijo.
  - `heroes` ? mapa `heroId -> HeroState` (stats, inventario, hechizos, accesorios, posición, etc.).
- Consistencia: Cualquier modificación a `HeroState` debe publicar el `heroId` en la respuesta al cliente.

## 3) Respuestas y eventos
- Prefijo en respuestas: Usa el mismo formato `-<heroId>|<PAQUETE>` para que el cliente enrute correctamente.
- Control de UI:
  - **`HhPHeroesPanel`** ? Carga el panel de héroes (respuesta a `HP`).
  - **`HhA<datos_lista>`** ? Actualiza lista de héroes (formato: `id~name~guild~sex~c1~c2~c3~acc~lvl~sel|...`).
  - **`HhL<heroId>`** ? Notifica cambio de líder.
  - **`HhPInventory`** ? Carga inventario del héroe (respuesta a `-<heroId>|HhInventory`).
  - **`HhPStatsJob`** ? Carga stats/oficios del héroe (respuesta a `-<heroId>|HhStatsJob`).
  - **`HhPSpells`** ? Carga hechizos del héroe (respuesta a `-<heroId>|HhSpells`).

- Inventario multi-héroe (con prefijo `-<heroId>|`):
  - `-<heroId>|OAKO<listaObjetos>` ? Lista completa de items.
  - `-<heroId>|OQ<itemUid>|<cantidad>` ? Cambio de cantidad.
  - `-<heroId>|OA<itemData>` ? Alta de item.
  - `-<heroId>|OR<itemUid>` ? Baja de item.
  - `-<heroId>|OM<itemUid>|<pos>|<cantidad>` ? Movimiento/equipado.
  - `-<heroId>|Ow<usado>|<max>` ? Actualización de pods.

**IMPORTANTE:** Separador de campos de héroe es `~` (tilde), NO `;` para evitar conflictos con otros comandos.

## 4) Listado y alta de héroes (HhA)
- A demanda (cuando cliente envía `HhList` o `HhRefresh`), responde `HhA` con la lista completa.
- Formato: `HhA<hero1>|<hero2>|...` donde cada héroe es `id~name~guild~sex~c1~c2~c3~acc~lvl~sel`.
- Ejemplo servidor Java: `construirListaHeroesHhA()` construye el string y se envía como `HhA` + resultado.
- El cliente parsea en `Account.as ? prepareHeroList()` usando split por `|` (héroes) y `~` (campos).

## 5) Cambio de líder
- Al recibir `HL` (con prefijo o con heroId explícito), valida pertenencia y actualiza `leaderHeroId` en sesión.
- Emite `HhL;<heroId>` para sincronizar el cliente.

## 6) Seguridad y validaciones
- Siempre valida que `heroId` pertenece a la cuenta conectada.
- Limita concurrencia: serializa operaciones por `heroId` o usa locks finos.
- Protege contra spoofing de prefijos (`-999999|...`).

## 7) Ejemplos de flujo
- **Abrir panel de héroes:**
  1. Cliente: `HP`
  2. Servidor: `HhPHeroesPanel` (carga el panel - DataProcessor extrae "HeroesPanel" con substr(3))
  3. Cliente (auto): `HhList` (solicita lista)
  4. Servidor: `HhA123~Arthas~~0~16711680~65280~255~acc~165~0|124~Jaina~~1~...~160~1`

- **Abrir inventario de héroe 123:**
  1. Cliente: `-123|HhInventory`
  2. Servidor: `HhPInventory` (carga UI - DataProcessor extrae "Inventory" con substr(3))
  3. Servidor: `-123|OAKO<listaItems>` (envía items)
  4. Servidor: `-123|Ow<usado>|<max>` (envía pods)

- **Cambiar líder a 456:**
  1. Cliente: `-456|HL`
  2. Servidor: `HhL456` (confirma cambio)
  3. Servidor: `HhA...` (actualiza lista con nuevo selected=1)

## 8) Pruebas unitarias sugeridas
- Parser de prefijo: entradas válidas/ inválidas.
- Enrutado por `heroId`: que impacte el `HeroState` correcto.
- Emisión `HhA` tras alta/baja.
- Respuestas `V*` contienen siempre `heroId` correcto.

## 9) Métricas/observabilidad (opcional)
- Contadores por `heroId` para operaciones de inventario.
- Latencia de `HhA` a render en cliente (aprox., si tienes telemetría).

## 10) Compatibilidad hacia atrás
- Si el cliente no envía prefijos, mantén el comportamiento tradicional (modo sin héroes) usando `leaderHeroId` como jugador activo.
