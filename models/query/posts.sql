-- name: CreatePosts one
INSERT INTO posts (title, body, user_id, created_at, updated_at) VALUES ($1, $2, $3, $4, $5) RETURNING *

-- name: CreateManyPosts many
INSERT INTO posts (title, body, user_id, created_at, updated_at) VALUES ($1, $2, $3, $4, $5) RETURNING *

-- name: GetPostsForUserCount one
SELECT COUNT(*) FROM posts WHERE user_id = $1

-- name: GetPostsCount one
SELECT COUNT(*) FROM posts

-- name: GetPostsForUser many
SELECT * FROM posts WHERE user_id = $1
ORDER BY id ASC
LIMIT $2 OFFSET $3

-- name: GetPosts one
SELECT * FROM posts WHERE id = $1
ORDER BY id ASC

-- name: GetPostsForUpdate one
SELECT * FROM posts WHERE id = $1 FOR UPDATE
ORDER BY id ASC

-- name: ListPosts many
SELECT * FROM posts
ORDER BY id ASC
LIMIT $1 OFFSET $2

-- name: UpdatePosts one
UPDATE posts SET title = $1, body = $2, updated_at = $3 WHERE id = $4 RETURNING *

-- name: DeletePosts one
DELETE FROM posts WHERE id = $1 RETURNING *