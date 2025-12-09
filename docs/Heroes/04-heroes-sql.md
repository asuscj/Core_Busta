# Modo Héroes ? Esquema y migraciones SQL

Modelo de datos sugerido para soportar múltiples héroes por cuenta y designación de líder. Adáptalo a tu motor y convenciones (MySQL/MariaDB/PostgreSQL).

## 1) Tablas/columnas sugeridas

- Tabla `accounts`
  - `id` PK
  - `leader_hero_id` NULLABLE FK a `characters(id)` ? héroe líder por defecto de la cuenta.

- Tabla `characters` (o equivalente)
  - `id` PK
  - `account_id` FK ? `accounts(id)`
  - ... (resto de columnas existentes)
  - Índices nuevos:
    - `idx_characters_account_id` (para listar héroes por cuenta)

- Tabla opcional `account_heroes_settings`
  - `account_id` PK/FK ? `accounts(id)`
  - `chat_color` (opcional) ? color para canal de héroes (si se usa)
  - `preferences_json` (opcional)

## 2) Migraciones ejemplo (SQL genérico)

-- Líder por cuenta
ALTER TABLE accounts
  ADD COLUMN leader_hero_id BIGINT NULL;

-- Índice para listados por cuenta
CREATE INDEX idx_characters_account_id ON characters(account_id);

-- Opcional: tabla de preferencias
CREATE TABLE account_heroes_settings (
  account_id BIGINT PRIMARY KEY,
  chat_color VARCHAR(16) NULL,
  preferences_json TEXT NULL,
  CONSTRAINT fk_ahs_account FOREIGN KEY (account_id) REFERENCES accounts(id)
);

## 3) Consultas útiles
- Listar héroes de una cuenta:
  SELECT * FROM characters WHERE account_id = ? ORDER BY id;

- Obtener líder de una cuenta:
  SELECT leader_hero_id FROM accounts WHERE id = ?;

- Establecer líder:
  UPDATE accounts SET leader_hero_id = ? WHERE id = ?;

## 4) Consideraciones de integridad
- Asegura que `leader_hero_id` siempre pertenece a la misma `account_id`.
- ON DELETE para personajes: Si borras un héroe que es líder, limpia `leader_hero_id` o reasigna automáticamente.

## 5) Datos para render
- Accesorios/huesos: prepara los campos necesarios en la salida `Ah` para que el cliente renderice sin pedir recursos extra.
- Colores: color1, color2, color3 deben estar presentes.

## 6) Performance
- Evita N+1: carga accesorios y stats en el mismo query del listado o mediante joins.
- Indexa `characters(account_id)` y cualquier campo de búsqueda frecuente.
