# Modo Héroes: posibles errores y cómo mitigarlos

Esta lista recoge fallos típicos al integrar el Modo Héroes entre servidor y cliente, basados en el análisis del código del cliente.

## Enrutamiento y contexto

- No parsear el prefijo `-<heroId>|` en mensajes entrantes.
  - Síntoma: acciones aplican al líder aunque fueron enviadas para otro héroe; UIs muestran datos del héroe equivocado.
  - Mitigación: centraliza el parseo antes del router de comandos y valida pertenencia de `heroId` a la cuenta.

- No anteponer el prefijo en respuestas que aplican a un héroe.
  - Síntoma: el cliente actualiza `Player` en vez del héroe correcto; datacenter inconsistente.
  - Mitigación: añade `-<heroId>|` o usa tipos `V*` que incluyen el `heroId` en el payload.

## Inventario/ítems

- Enviar `O/A/C/R/Q` (inventario) sin `V*` o sin incluir `heroId` en el payload.
  - Síntoma: `Items.onAdd2/onRemove2/onChange2/onQuantity2` no pueden resolver a qué héroe aplicar.
  - Mitigación: usa `VA/VC/VR/VQ` y payload `"<heroId>|..."` como espera el cliente.

- **BUG CORREGIDO (cliente)**: `onAdd2/onRemove2/onChange2/onQuantity2` usaban `Player.findHeroe()` o `Player` directo en lugar de `datacenter.getHero(heroId)`.
  - Impacto: inventario solo funcionaba para el líder actual, no para otros héroes.
  - Fix aplicado: usar `api.datacenter.getHero(heroId)` con fallback a `Player` si falla.

- Cadena de accesorios con formato inesperado.
  - Síntoma: sprites sin equipo o equipo incorrecto; trazas como `set heroe <id> accessories [object Object]`.
  - Mitigación: reutiliza exactamente la serialización de accesorios de Retro.

## Creación/listado de héroes

- Orden o cantidad de campos diferente en `Ah` (onAddHero).
  - Síntoma: colores mal parseados, niveles/gfx cruzados, cierres de UI sin actualizar lista.
  - Mitigación: respeta `id|name|level|guild|sex|gfx|color1|color2|color3|accessories|inParty|sabiduria|iniciativa`.

- **BUG CORREGIDO (cliente)**: `Account.onAddHero` usaba sintaxis errónea `_loc2[11]` y `_loc2[12]` sin guion bajo.
  - Impacto: error de compilación/runtime al recibir respuesta `Ah` con campos sabiduria/iniciativa.
  - Fix aplicado: cambiar a `_loc2_[11]` y `_loc2_[12]`.

- Formato del listado de héroes incorrecto en `HhA`.
  - Síntoma: `HeroesPanel` vacío o parcialmente poblado.
  - Mitigación: usa `id;name;guild;sex;color1;color2;color3;accessories;level;selected` separados por `|`.

- **BUG CORREGIDO (cliente)**: `HeroesPanel.actualizar()` no existía, causando error cuando el servidor envía `HhA`.
  - Impacto: no se puede actualizar el listado de héroes dinámicamente.
  - Fix aplicado: añadido método `actualizar(sData)` que limpia y repuebla la lista.

## Cambio de líder y paneles

- No responder a `HL` con `HhL<id>`.
  - Síntoma: el banner no cambia al nuevo líder; acciones posteriores siguen aplicando al anterior.
  - Mitigación: al validar el cambio, emite `HhL` y sincroniza estado interno del servidor.

- No enviar `HhP<UI>` después de `HhInventory/StatsJob/Spells`.
  - Síntoma: el panel no se abre o abre sin datos.
  - Mitigación: primero `HhP<UI>`, luego las tramas de datos del panel en contexto del héroe.

## Concurrencia/combate

- Permitir cambio de líder en mitad de acciones críticas (combate) sin reglas claras.
  - Síntoma: estados de turno/acciones desincronizados.
  - Mitigación: bloquear `HL` en combate o serializar cambios al final de turno.

- Acciones simultáneas de varios héroes sin control de tasa.
  - Síntoma: flood de mensajes, lag o kicks.
  - Mitigación: rate limiting por conexión y cola por héroe.

## Preferencias y flags

- No persistir o validar `inParty`, modos de drop/kamas, `autoTurn`.
  - Síntoma: opciones se pierden tras reconexión; UI muestra estado incorrecto.
  - Mitigación: guarda por héroe (o por cuenta) y devuelve el estado al abrir `HeroesPanel`.

## Localización/formatos

- Colores no numéricos (p. ej., `0x` duplicado) o `-1` mal tratado.
  - Mitigación: si no hay color, envía `-1`; si hay, envía entero/hex sin prefijo `0x`.

- Campos con `|` o `;` sin escapar en nombres.
  - Mitigación: limpia/escapa o prohíbe dichos caracteres en nombres de personaje/gremio.

## Señales auxiliares

- Ignorar `BM*|.swapchef|<name>` o `AEA<id>`.
  - Síntoma: overview/líder no sincroniza correctamente con la UI.
  - Mitigación: opcionalmente soporta estas rutas si tu servidor ya implementa ese bus; si no, asegura equivalentes (`HL`/`HhL`).

## Observabilidad

- Sin logs por `heroId`.
  - Mitigación: agrega `heroId`, `accountId` y `cmd` en trazas para depurar routing.

## Recomendaciones de prueba

- Casos felices: crear héroe, listar, cambiar líder, abrir y operar inventario/otro panel por héroe, combatir con multi-héroe.
- Bordes: 0 héroes; 1 héroe; >10 héroes (paginación del panel 0?9, 10?19); con/ sin gremio; colores `-1`.
- Errores: `HL` a un `heroId` que no pertenece a la cuenta; inventario `V*` sin `heroId`; `Ah` con campos faltantes.
