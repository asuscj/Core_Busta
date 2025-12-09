# Modo Héroes (lado servidor)

Este documento resume cómo funciona el ?modo héroes? en el cliente y qué debe implementar el servidor para soportarlo correctamente.

## Resumen funcional

- Un jugador puede controlar varios personajes (?héroes?) de la misma cuenta, alternando el líder y abriendo paneles/acciones por héroe.
- Todo comando cliente?servidor puede ir ?en contexto de héroe?: el cliente antepone un prefijo con el ID del héroe para direccionar la acción.
- El servidor debe devolver también respuestas dirigidas a un héroe, usando el mismo mecanismo de prefijo para que el cliente enrute los datos al datacenter del héroe correcto.

## Contrato de protocolo

### Prefijo de contexto por héroe

- Cliente ? Servidor: cuando se envía una acción para un héroe concreto, el cliente antepone a la orden el prefijo:
  - `-<HERO_ID>|<COMANDO>`
  - Implementación cliente: `Aks.send2(heroID, cmd)` ? `send()` añade `-heroId|` y limpia `_global.HERO_ID`.
- Servidor ? Cliente: cuando la respuesta aplica a un héroe, el servidor debe anteponer el mismo prefijo:
  - `-<HERO_ID>|<MENSAJE>`
  - El cliente (DataProcessor.process) detecta `-`, hace `datacenter.change(heroId)` y procesa el resto del mensaje para ese héroe.

Requisitos:
- Si no hay prefijo, el mensaje aplica al jugador líder actual.
- No mezclar estados entre héroes: inventario, hechizos, stats, etc. deben llegar con el prefijo adecuado.

### Mensajería específica de héroes (canal Hh)

Servidor ? Cliente (DataProcessor, tipo `H`, acción `h`):
- `HhP<UI_NAME>`: pide abrir un panel para el héroe cuyo contexto esté activo. Ejemplos de `<UI_NAME>`: `Inventory`, `StatsJob`, `Spells`.
- `HhL<heroId>`: fija el ?líder? (PlayerReal) en el cliente a `<heroId>` y refresca banner.
- `HhM<flag><texto>`: controla un modal ?Waiting?? del cliente.
  - `<flag>` = `1` abre AskOKWait con `<texto>`; `0` lo cierra.
- `HhA<cadena>`: indica al UI `HeroesPanel` que actualice su listado (payload libre del servidor).

Cliente ? Servidor (clics en `HeroesPanel`/`HeroItem`):
- `HL`: cambiar líder al héroe clicado. Espera respuesta `HhL<id>` y refresco de datos en contexto de ese héroe.
- `HhInventory` | `HhStatsJob` | `HhSpells`: solicita abrir el panel correspondiente para el héroe.
  - Responder con `HhP<UI>` y, a continuación, enviar las tramas de datos de ese panel en contexto del héroe (con prefijo `-<id>|` o con tipos dedicados, ver abajo).
- `Hr`: abrir establo/montura para ese héroe.
- `Hc`: abrir banco para ese héroe.
- `Hp`: alternar estado de grupo (`inParty`) del héroe.
- Opciones de héroe:
  - `HOd`: seleccionar reparto por drop.
  - `HOk`: seleccionar reparto por kamas.
  - `HOa`: activar turno automático del héroe.

Notas:
- Todas las órdenes anteriores se envían con `send2(heroId, "<ORDEN>")`, por lo que el servidor las recibe con prefijo `-<heroId>|`.

### Inventario por héroe (tipo V)

Servidor ? Cliente (DataProcessor, tipo `V`):
- `VA[ E ]|<heroId>|<bloques>`: añadir/recibir ítems para el héroe.
  - `E` opcional indica error (DataProcessor marca `bError`).
  - `<bloques>`: `O<ITEM_DATA>*O<ITEM_DATA>*...`
  - El cliente procesa en `Items.onAdd2(payload)` donde `payload = "<heroId>|..."`.
- `VC|<heroId>|<itemData1;itemData2;...>`: cambios masivos de ítems del héroe.
- `VR|<heroId>|<idItem>*<idItem>*...`: eliminar ítems del héroe.
- `VQ|<heroId>|<idItem,cantidad>*...`: cambios de cantidad.

Accesorios/equipo en sprites:
- El servidor puede enviar accesorios por héroe y el cliente actualizará tanto el `Sprite` como `datacenter.getHero(heroId).accessories`.

### Creación y listado de héroes (tipo A)

Cliente ? Servidor:
- `AA<name>|<breed>|<sex>|<color1>|<color2>|<color3>|1`
  - El sufijo `|1` identifica que es creación en Modo Héroes.

Servidor ? Cliente:
- Confirmación `Ah<id>|<name>|<level>|<guild>|<sex>|<gfx>|<color1>|<color2>|<color3>|<accessories>|<inParty>|<sabiduria>|<iniciativa>`
  - El cliente cierra `CreateCharacter` y actualiza el listado (`onAddHero`).
- Listado para panel de héroes:
  - Enviar mediante `HhA<lista>` o al entrar a la pantalla según tu flujo. El cliente tiene un parser `Account.prepareHeroList(cadena)` con formato por héroe:
    - `<id>;<name>;<guild>;<sex>;<color1>;<color2>;<color3>;<accessories>;<level>;<selected>`
    - Héroes separados por `|`.

### Selección de vista/overviews

Cliente puede enviar además:
- `AEA<heroId>`: seleccionar/traer overview del héroe (usado cuando se elige en UI interna).
- `BM*|.swapchef|<name>`: señal auxiliar (canal BM) para switchear líder por nombre; úsalo si tu servidor ya implementa ese bus.

## Estados que el servidor debe mantener

- Relación cuenta ? héroes (IDs de personajes de la misma cuenta).
- ID del héroe líder vigente por conexión.
- Flags por héroe (opcional persistente): `inParty`, modo reparto (`drop/kamas`), `autoTurn`.
- Durante combate, respetar restricciones del cliente si se decide bloquear cambios de líder.

## Flujo de ejemplo

1) Abrir `HeroesPanel` y listar héroes:
- Servidor envía `HhA<id;name;guild;sex;color1;color2;color3;accessories;level;selected|...>`.

2) Cambiar líder:
- Cliente ? `-12345|HL`
- Servidor valida y responde:
  - `HhL12345` (actualiza PlayerReal)
  - En adelante, todas las tramas normales de juego para ese héroe pueden ir sin prefijo (pues ahora es líder) o con `-12345|` si se prefiere ser explícito.

3) Abrir inventario del héroe 67890:
- Cliente ? `-67890|HhInventory`
- Servidor ? `HhPInventory`
- Servidor ? `VQ|67890|<cantidades>` + `VA|67890|<items>` ? según corresponda.

4) Crear héroe:
- Cliente ? `AAName|<breed>|<sex>|<c1>|<c2>|<c3>|1`
- Servidor crea y responde `Ah<id>|<name>|<level>|<guild>|<sex>|<gfx>|<c1>|<c2>|<c3>|<acc>|<inParty>|<sab>|<ini>`.

## Capa de juego y routing

- A la entrada de cualquier mensaje, si detectas `-<heroId>|`, debes conmutar el ?contexto de ejecución? a ese personaje:
  - Validar que `heroId` pertenece a la cuenta conectada.
  - Ejecutar la orden como si viniera de ese personaje (moverse, usar objeto, lanzar hechizo, etc.).
- Al emitir eventos derivados (drop, inventario, spells, stats), anteponer el mismo prefijo o utilizar los tipos `V*` que incluyen el `heroId` en payload.

## Detalles de formato ya consumidos por el cliente

- Colores: `-1` o hexadecimal sin `0x` (el cliente hace `Number("0x"+color)` si no es `-1`).
- `accessories`: cadena estándar de Retro (ítems en slots) reutilizada por el `CharactersManager.setSpriteAccessories`.
- `selected`: `"1"` para marcado por defecto en el panel.

## Recomendaciones

- Alinea los pipelines existentes de `Account`, `Items`, `Exchange`, `Spells`, `Game` para aceptar contexto de héroe.
- Centraliza el parseo del prefijo `-<id>|` antes del router de comandos.
- Añade guardas de seguridad: límites por cuenta, validación de pertenencia de héroe a la cuenta, coherencia en combate.

## Referencias (cliente)

- Prefijo de envío: `dofus/aks/Aks.as :: send2/send`
- Dispatch por héroe: `dofus/aks/DataProcessor.as :: process()`
- Panel y acciones UI: `graphics/gapi/ui/HeroesPanel.as`, `graphics/gapi/ui/HeroItem.as`
- Lógica de héroes en datacenter: `dofus/datacenter/Datacenter.as`, `dofus/datacenter/LocalPlayer.as`
- Inventario por héroe: `dofus/aks/DataProcessor.as` (tipo `V*`) y `dofus/aks/Items.as` (`onAdd2/onRemove2/onChange2/onQuantity2`)
- Creación/listado: `dofus/aks/Account.as :: addCharacterHero, onAddHero, prepareHeroList`
