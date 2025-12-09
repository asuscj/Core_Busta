# Modo Héroes: cambios SQL

Este documento propone un esquema mínimo para soportar el Modo Héroes en el servidor, acorde al contrato que consume el cliente.

## Objetivos de datos

- Relacionar múltiples personajes (héroes) a una misma cuenta conectada.
- Persistir opcionalmente el héroe líder y algunas preferencias por héroe.
- Exponer consultas eficientes para construir:
  - El ?listado de héroes? que espera el cliente (`id;name;guild;sex;color1;color2;color3;accessories;level;selected`).
  - Los accesorios/equipo actual (para `setSpriteAccessories`).

## Tablas y columnas sugeridas

Asumiendo tablas típicas `accounts`, `characters`, `items`, `characters_items`:

- `accounts`
  - `id` (PK)
  - `hero_leader_id` (FK ? `characters.id`, NULLABLE)
  - Índice recomendado: `(hero_leader_id)`

- `characters`
  - `id` (PK)
  - `account_id` (FK ? `accounts.id`)
  - `name`
  - `breed` (clase)
  - `sex` (0/1)
  - `level`
  - `gfx` (entero o texto del recurso gráfico)
  - `color1`, `color2`, `color3` (int, -1 o valor RGB)
  - Preferencias Modo Héroes (opcionales, por héroe):
    - `heroes_in_party` TINYINT(1) DEFAULT 0
    - `heroes_drop_mode` TINYINT (0=por héroe, 1=por IP, etc.)
    - `heroes_kamas_mode` TINYINT (0=individual, 1=compartido, etc.)
    - `heroes_auto_turn` TINYINT(1) DEFAULT 0
  - Índices recomendados: `(account_id)`, `((account_id), level)`, `(name)`

- `characters_items` (inventario/equipamiento actual)
  - `character_id` (FK)
  - `item_id` (FK)
  - `slot` (posición de equipo; usar convención de Retro)
  - `quantity`
  - Índices: `((character_id), slot)`, `((character_id), item_id)`

> Si ya existe una estructura similar, añade únicamente las columnas de preferencias y `hero_leader_id`.

## Consultas útiles

### 1) Listado de héroes por cuenta (para `HhA` o flujo inicial)

Devuelve la cadena `|`-separada que el cliente parsea con `prepareHeroList`.

Pseudo-SQL (ajusta a tu motor):

```sql
SELECT STRING_AGG(
  CONCAT_WS(';',
    c.id,
    c.name,
    COALESCE(g.name, ''),
    c.sex,
    NULLIF(c.color1, ''),
    NULLIF(c.color2, ''),
    NULLIF(c.color3, ''),
    build_accessories_string(c.id), -- ver 2)
    c.level,
    CASE WHEN c.id = a.hero_leader_id THEN '1' ELSE '0' END
  ),
  '|'
) AS heroes_list
FROM characters c
JOIN accounts a ON a.id = c.account_id
LEFT JOIN guilds g ON g.id = c.guild_id
WHERE c.account_id = :account_id;
```

- `build_accessories_string(character_id)`: función/consulta que compone la cadena accesorios en el formato que ya usa tu servidor para Dofus Retro.

### 2) Accesorios/equipo actual

Usa tu lógica existente para serializar los slots equipados. El cliente invoca `CharactersManager.setSpriteAccessories` con esa cadena, por lo que debe ser 100% compatible con Retro.

Ejemplo de helper (pseudo):

```sql
SELECT serialize_accessories(ci.slot, i.gfx, i.effects, ...) AS accessories
FROM characters_items ci
JOIN items i ON i.id = ci.item_id
WHERE ci.character_id = :hero_id AND ci.slot IN (:SLOTS_EQUIPO)
ORDER BY ci.slot;
```

### 3) Preferencias del héroe

Lectura/escritura simples por `characters.id` para:
- `heroes_in_party`
- `heroes_drop_mode`
- `heroes_kamas_mode`
- `heroes_auto_turn`

## Migraciones

- Añadir columnas a `accounts` y `characters` según arriba.
- Crear índices (especialmente por `account_id`).
- Si quieres persistir el orden/selección en panel, puedes añadir `heroes_selected` (TINYINT) o calcular `selected` como `c.id = a.hero_leader_id`.

## Seguridad e integridad

- Valida siempre que `hero_id` pertenece a `account_id` en cada operación (JOIN/EXISTS rápido por índice de `account_id`).
- Si actualizas `hero_leader_id`, asegura que el valor existe y pertenece a la cuenta.

## Rendimiento

- Precalcula/almacena en caché la cadena de accesorios si es costosa de construir y cambia poco.
- Usa `SELECT ... WHERE account_id = ?` para traer todos los héroes de una vez al conectar.

## Formatos consumidos por el cliente

- Colores: `-1` o RGB decimal/hex sin `0x` (el cliente añade `0x`).
- `selected`: `"1"` ó `"0"` como texto.
- Accesorios: la cadena clásica de Retro (sin cambios).
