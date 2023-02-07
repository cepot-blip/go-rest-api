-- name: CreateUsers_session : one
INSERT INTO users_sessions (user_id, token, created_at, updated_at) VALUES ($1, $2, $3, $4) RETURNING *

-- name: GetUsers_session : one
SELECT * FROM users_sessions WHERE id = $1

-- name: GetUsers_sessionForUpdate : one
SELECT * FROM users_sessions WHERE id = $1 FOR UPDATE

-- name: ListUsers_session : many
SELECT * FROM users_sessions

-- name: UpdateUsers_session : one
UPDATE users_sessions SET user_id = $1, token = $2, updated_at = $3 WHERE id = $4 RETURNING *

-- name: DeleteUsers_session : one
DELETE FROM users_sessions WHERE id = $1 RETURNING *

-- name: GetUsers_sessionForUserCount : one
SELECT COUNT(*) FROM users_sessions WHERE user_id = $1

-- name: GetUsers_sessionCount : one
SELECT COUNT(*) FROM users_sessions

-- name: GetUsers_sessionForUser : many
SELECT * FROM users_sessions WHERE user_id = $1
