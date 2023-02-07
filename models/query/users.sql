-- name : CreateUsers : one 
INSERT INTO users (name, email, password, created_at, updated_at) VALUES ($1, $2, $3, $4, $5) RETURNING *

-- name : GetUsers : one
SELECT * FROM users WHERE id = $1

-- name : GetUsersForUpdate : one
SELECT * FROM users WHERE id = $1 FOR UPDATE

-- name : ListUsers : many
SELECT * FROM users
ORDER BY id ASC
LIMIT $1 OFFSET $2

-- name : UpdateUsers : one
UPDATE users SET name = $1, email = $2, password = $3, updated_at = $4 WHERE id = $5 RETURNING *

-- name : DeleteUsers : one
DELETE FROM users WHERE id = $1 RETURNING *


