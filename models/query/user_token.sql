-- name: CreateUsersToken : one
INSERT INTO users_tokens (user_id, token, created_at, updated_at) VALUES ($1, $2, $3, $4) RETURNING *

-- name: GetUsersToken : one
SELECT * FROM users_tokens WHERE id = $1

-- name: GetUsersTokenForUpdate : one
SELECT * FROM users_tokens WHERE id = $1 FOR UPDATE

-- name: ListUsersToken : many
SELECT * FROM users_tokens

-- name: UpdateUsersToken : one
UPDATE users_tokens SET user_id = $1, token = $2, updated_at = $3 WHERE id = $4 RETURNING *

-- name: DeleteUsersToken : one
DELETE FROM users_tokens WHERE id = $1 RETURNING *

-- name: GetUsersTokenForUserCount : one
SELECT COUNT(*) FROM users_tokens WHERE user_id = $1

-- name: GetUsersTokenCount : one
SELECT COUNT(*) FROM users_tokens

-- name: GetUsersTokenForUser : many
SELECT * FROM users_tokens WHERE user_id = $1

-- name: GetUsersTokenForUserAndToken : one
SELECT * FROM users_tokens WHERE user_id = $1 AND token = $2

-- name: GetUsersTokenForToken : one
SELECT * FROM users_tokens WHERE token = $1

-- name: GetUsersTokenForUserAndTokenForUpdate : one
SELECT * FROM users_tokens WHERE user_id = $1 AND token = $2 FOR UPDATE
