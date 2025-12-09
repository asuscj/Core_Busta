# Modo Héroes ? Resumen rápido y guía de adopción

Este paquete documenta, de forma clara y accionable, cómo activar el ?modo héroes? en el servidor y en el cliente (AS2/Dofus Retro). Incluye especificación de protocolo, guía de servidor, guía de cliente, cambios SQL, checklist de QA y troubleshooting.

## Qué habilita
- Controlar múltiples personajes (?héroes?) desde una cuenta activa.
- Conmutar líder, abrir paneles (inventario, hechizos, oficios) por héroe.
- Recibir/emitir actualizaciones de inventario, estado y apariencia por héroe.

## Componentes y contratos esenciales
- **Prefijo de contexto en comandos:** `-<HERO_ID>|<COMANDO>` (ejemplo: `-123|HhInventory`).
- **Canal de control de héroes:** `Hh<acción>` con formato:
  - `HP` ? Cliente solicita abrir panel ? Servidor responde `HhPHeroesPanel`
  - `HhList`/`HhRefresh` ? Cliente solicita lista ? Servidor responde `HhA<datos>`
  - `HhL<heroId>` ? Servidor notifica cambio de líder
- **Separadores:** Usa `~` (tilde) entre campos de héroe, `|` (pipe) entre héroes. NO uses `;` para evitar conflictos.
- **Canal de inventario multi-héroe:** Respuestas con prefijo `-<heroId>|OAKO...`, `-<heroId>|OQ...`, etc.
- **Listado de héroes:** `HhA<hero1>|<hero2>` donde cada héroe es `id~name~guild~sex~gfxId~c1~c2~c3~acc~lvl~sel`.

**IMPORTANTE:** El protocolo usa `HhP` (H mayúscula) para héroes, NO confundir con `hP` (h minúscula) que es para casas.

Más detalles en 01-heroes-protocolo.md.

## Pasos rápidos ? Servidor
1) **Protocolo:** Implementa parsing del prefijo `-<heroId>|...` y enruta el comando al contexto de ese héroe.
2) **Respuestas:** Usa el mismo prefijo `-<heroId>|<PAQUETE>` en respuestas para que el cliente enrute correctamente.
3) **Control de UI:**
   - `HP` recibido ? enviar `HhPHeroesPanel` (DataProcessor extrae "HeroesPanel" con substr(3))
   - `HhList`/`HhRefresh` recibido ? enviar `HhA<lista>` con formato `id~name~guild~sex~c1~c2~c3~acc~lvl~sel|...`
   - `-<heroId>|HL` recibido ? enviar `HhL<heroId>` (cambio de líder)
   - `-<heroId>|HhInventory` recibido ? enviar `HhPInventory` + datos prefijados
4) **Listado:** Usa método `construirListaHeroesHhA()` que construye string con separador `~` entre campos y `|` entre héroes.
5) **SQL:** Añade/ajusta tablas para héroes por cuenta y líder; ver 04-heroes-sql.md.

**IMPORTANTE:** Los paquetes `HhP<ComponentName>` son procesados con `substr(3)` por el DataProcessor, así que:
- `HhPHeroesPanel` ? carga el componente "HeroesPanel"
- `HhPInventory` ? carga el componente "Inventory"
- `HhPStatsJob` ? carga el componente "StatsJob"
- `HhPSpells` ? carga el componente "Spells"

**Referencia de implementación:** `ServidorSocket.java ? analizar_Heroes()` y `construirListaHeroesHhA()`.

## Pasos rápidos ? Cliente (AS2)
1) **Envío prefijado:** Usa `send2(heroId, comando)` que produce `-<heroId>|<comando>`.
2) **Recepción:** `DataProcessor.as` detecta prefijo `-<heroId>|` y enruta al datacenter del héroe correspondiente.
3) **Panel y líder:**
   - `DataProcessor.as` case "H" ? subcase "h" ? subcase "P" ? carga UI con `loadUIComponent(componentName, ...)`
   - `DataProcessor.as` case "H" ? subcase "h" ? subcase "A" ? actualiza lista con `HeroesPanel.actualizar(data)`
   - `DataProcessor.as` case "H" ? subcase "h" ? subcase "L" ? cambia líder con `setPlayerReal(heroId)`
4) **Inventario:** Handlers detectan prefijo y aplican cambios al héroe objetivo, no al `Player` global.
5) **UI:** `HeroesPanel.as` envía `HhList` en `initData()` y parsea respuesta con `Account.prepareHeroList()` usando split por `~` y `|`.

**Archivos clave:** `DataProcessor.as`, `Account.as`, `HeroesPanel.as`.

## Criterios de aceptación mínimos
- Puedo abrir/usar inventario de cualquier héroe y ver cambios correctos.
- Cambio de líder refleja a quién siguen los atajos/entrada de teclado.
- `HhA` repuebla el panel sin reiniciar el cliente.
- Sin duplicados ni desincronización entre datacenter y UI.

## Referencias
- 01-heroes-protocolo.md ? Contrato de mensajes completo.
- 02-heroes-servidor.md ? Implementación en servidor.
- 03-heroes-cliente.md ? Integración en cliente AS2.
- 04-heroes-sql.md ? Esquema y migraciones.
- 05-heroes-qa-checklist.md ? Pruebas y validación.
- 06-heroes-troubleshooting.md ? Diagnóstico y solución de problemas.
