-- name: CreateComments one
INSERT INTO comments (body, user_id, post_id, created_at, updated_at) VALUES ($1, $2, $3, $4, $5) RETURNING *

-- name: CreateManyComments many
INSERT INTO comments (body, user_id, post_id, created_at, updated_at) VALUES ($1, $2, $3, $4, $5) RETURNING *

-- name: GetCommentsForUserCount one
SELECT COUNT(*) FROM comments WHERE user_id = $1

-- name: GetCommentsForPostCount one
SELECT COUNT(*) FROM comments WHERE post_id = $1

-- name: GetCommentsCount one
SELECT COUNT(*) FROM comments

-- name: GetCommentsForUser many
SELECT * FROM comments WHERE user_id = $1

-- name: GetCommentsForPost many
SELECT * FROM comments WHERE post_id = $1

-- name: GetComments one
SELECT * FROM comments WHERE id = $1

-- name: GetCommentsForUpdate one
SELECT * FROM comments WHERE id = $1 FOR UPDATE

-- name: ListComments many
SELECT * FROM comments

-- name: UpdateComments one
UPDATE comments SET body = $1, updated_at = $2 WHERE id = $3 RETURNING *

-- name: DeleteComments one
DELETE FROM comments WHERE id = $1 RETURNING *

