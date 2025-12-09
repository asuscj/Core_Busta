# Modo Héroes ? Guía de integración en cliente (AS2)

Esta guía indica los puntos del cliente AS2 que deben soportar el modo héroes. Los paths aquí corresponden a este repositorio; si tu base difiere, busca símbolos equivalentes.

## 1) Envío con contexto de héroe
- Archivo: `dofus/aks/Aks.as`
- Método: `send2(heroId, comando)` ? Debe anteponer `-<heroId>|` antes de delegar a `send()`.
- Uso desde UI: Cualquier acción sobre un héroe debe invocar `send2(id, ...)`.

## 2) Recepción/dispatch por héroe
- Archivo: `dofus/aks/DataProcessor.as`
- Requisito: Al recibir mensajes con prefijo `-<heroId>|...` o payloads con `heroId`, enrutar la actualización hacia `this.api.datacenter.getHero(heroId)` y NO hacia `this.api.datacenter.Player`.
- Canales afectados: inventario `V*`, hechizos, stats/oficios.

## 3) Inventario multi-héroe
- Archivo: `dofus/aks/Items.as`
- Handlers a revisar (ya corregidos en esta base):
  - `onQuantity2`, `onAdd2`, `onRemove2`, `onChange2`.
- Cambio clave: Resolver destino con `var hero = this.api.datacenter.getHero(heroId) || this.api.datacenter.Player;` y aplicar cambios en el inventario de `hero`.
- Notas: Cuando se acumulen varias operaciones, puedes pausar/resumir eventos del inventario del héroe si tu framework lo permite.

## 4) Listado/alta de héroes (UI)
- Archivo: `dofus/graphics/gapi/ui/HeroesPanel.as`
- Debe exponer `actualizar(sData)` para procesar `HhA`:
  - Limpia héroes actuales del `Player` y delega a `this.api.network.Account.prepareHeroList(sData)`.
  - Reconstruye la lista con `updateCharactersList()`.
- `updateCharactersList()`:
  - Construye desde `this.api.datacenter.Player.getHeroes()` y re-hidrata cada héroe con `this.api.datacenter.getHero(id)`.
  - Asegura accesorios/sprites usando `CharactersManager.setSpriteAccessories` cuando falten.
  - Evita duplicados y ordena de forma estable (p.ej., por id).

## 5) Cambio de líder
- UI suele enviar `-<heroId>|HL` desde los controles del panel (`HeroItem.as`).
- Al recibir `HhL;<heroId>`, actualiza el líder del `datacenter` y refleja el estado en el banner/atajos.

## 6) Archivos y símbolos relacionados
- `dofus/datacenter/Datacenter.as` ? `getHero(id)` debe devolver un contenedor consistente por héroe.
- `dofus/datacenter/LocalPlayer.as` ? `HeroesList`, `addHeroe`, `setHeroes`, `clearHeroes`, `arrangeHeroes`.
- `dofus/aks/Account.as` ? `prepareHeroList(sData)` y `onAddHero(...)` (índices de campos correctos: sabiduría/iniciativa).
- `dofus/graphics/gapi/ui/HeroItem.as` ? Botones para abrir paneles por héroe y cambiar líder.
- `dofus/managers/CharactersManager.as` ? `setSpriteAccessories` y helpers de hidratación visual.

## 7) Errores corregidos comunes (incluidos aquí como referencia)
- Inventario aplicado al `Player` global en lugar del héroe ? solucionado usando `getHero(heroId)`.
- Índices incorrectos en `onAddHero` (`_loc2[11]`/`[12]` vs `_loc2_[11]`/`[12]`).
- Falta de `HeroesPanel.actualizar(sData)` para `HhA`.

## 8) Checklist de integración en cliente
- [ ] `send2(heroId, cmd)` antepone el prefijo.
- [ ] `DataProcessor` enruta por `heroId` en respuestas.
- [ ] `Items.as` aplica cambios al héroe correcto en `V*`.
- [ ] `HeroesPanel.as` repuebla con `HhA` sin duplicados.
- [ ] Cambio de líder `HhL` actualiza banner/atajos.

Consulta 05-heroes-qa-checklist.md para escenarios de prueba guiados.
