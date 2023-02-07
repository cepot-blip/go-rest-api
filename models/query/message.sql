-- name: CreateMessage : one
INSERT INTO messages (body, user_id, created_at, updated_at) VALUES ($1, $2, $3, $4) RETURNING *

-- name: CreateManyMessage : many
INSERT INTO messages (body, user_id, created_at, updated_at) VALUES ($1, $2, $3, $4) RETURNING *

-- name: GetMessageForUserCount : one
SELECT COUNT(*) FROM messages WHERE user_id = $1

-- name: GetMessageCount : one
SELECT COUNT(*) FROM messages

-- name: GetMessageForUser : many
SELECT * FROM messages WHERE user_id = $1

-- name: GetMessage : one
SELECT * FROM messages WHERE id = $1

-- name: GetMessageForUpdate : one
SELECT * FROM messages WHERE id = $1 FOR UPDATE

-- name: ListMessage : many
SELECT * FROM messages

-- name: UpdateMessage : one
UPDATE messages SET body = $1, updated_at = $2 WHERE id = $3 RETURNING *

-- name: DeleteMessage : one
DELETE FROM messages WHERE id = $1 RETURNING *