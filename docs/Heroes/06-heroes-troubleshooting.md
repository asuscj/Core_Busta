# Modo Héroes ? Troubleshooting

Síntomas comunes, causas probables y cómo diagnosticarlas.

## 1) Inventario se aplica al jugador equivocado
- Causa: Respuesta `V*` sin `heroId` o cliente no enruta por `heroId`.
- Diagnóstico: Habilita logs del canal `V*`. Verifica primer campo `heroId` o prefijo `-<id>|` en respuesta.
- Solución: Servidor debe incluir `heroId` y cliente (Items.as) aplicar en `api.datacenter.getHero(heroId)`.

## 2) Panel de héroes no se actualiza o no se abre
- Causa común: 
  - Panel no abre: Servidor envía `hP...` (minúscula) o nombre de componente incorrecto
  - Panel no actualiza: Falta `HhA` del servidor o el cliente no implementa `HeroesPanel.actualizar`
- Diagnóstico: 
  - Captura tráfico: ¿se ve `HhPHeroesPanel` para abrir panel?
  - ¿Se ve `HhA<datos>` para actualizar lista?
  - ¿`HeroesPanel.as` llama a `prepareHeroList` y repinta?
- Solución: 
  - Usar **`HhPHeroesPanel`** (NO `HhPUI_HeroesPanel`) porque DataProcessor usa `substr(3)` para extraer nombre
  - **`HhP`** es para héroes, **`hP`** es para casas (houses)
  - Formato correcto: `HhP<ComponentName>` donde ComponentName es el nombre exacto del .as
  - Ejemplos: `HhPHeroesPanel`, `HhPInventory`, `HhPStatsJob`, `HhPSpells`
  - Emitir `HhA<datos>` con separador `~` entre campos y `|` entre héroes
  - En cliente implementar `actualizar(sData)` en `HeroesPanel.as`

## 3) Cambio de líder no toma efecto
- Causa: Servidor no emite `HhL` o UI no actualiza líder en datacenter.
- Diagnóstico: Buscar `HhL;<id>` en tráfico y logs del cliente.
- Solución: Enviar `HhL` y refrescar banner/atajos en cliente.

## 4) Accesorios/colores incorrectos en panel
- Causa: Campos incompletos en `HhA` o falta de hidratación en `prepareHeroList`.
- Diagnóstico: Ver payload `HhA` y verifica orden de campos: `id~name~guild~sex~c1~c2~c3~acc~lvl~sel`.
- Solución: Incluir todos los campos en orden correcto y usar `CharactersManager.setSpriteAccessories` al renderizar.

## 5) Errores de índice en parseo de héroe
- Causa: Orden de campos en `HhA` no coincide con parsing en cliente.
- Diagnóstico: Revisa `Account.prepareHeroList` y orden de `split("~")`.
- Solución: Mantén el orden especificado (ver 01-heroes-protocolo.md sección 4) y usa separador `~` consistentemente.

## 6) Duplicados en la lista del panel
- Causa: Mezcla de fuentes (datacenter y Player.HeroesList) sin deduplicación.
- Diagnóstico: Revisa `updateCharactersList`.
- Solución: Construye lista desde `Player.getHeroes()` e hidrata con `datacenter.getHero(id)`; dedup por id.
