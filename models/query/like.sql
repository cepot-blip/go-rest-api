-- name CreateLike one
INSERT INTO likes (user_id, post_id, created_at, updated_at) VALUES ($1, $2, $3, $4) RETURNING *

-- name GetLike one
SELECT * FROM likes WHERE id = $1

-- name GetLikeForUpdate one
SELECT * FROM likes WHERE id = $1 FOR UPDATE

-- name ListLikes many
SELECT * FROM likes

-- name UpdateLike one
UPDATE likes SET user_id = $1, post_id = $2, updated_at = $3 WHERE id = $4 RETURNING *

-- name DeleteLike one  
DELETE FROM likes WHERE id = $1 RETURNING *

-- name GetLikesForUserCount one
SELECT COUNT(*) FROM likes WHERE user_id = $1

-- name GetLikesForPostCount one
SELECT COUNT(*) FROM likes WHERE post_id = $1

-- name GetLikesCount one
SELECT COUNT(*) FROM likes

-- name GetLikesForUser many
SELECT * FROM likes WHERE user_id = $1

-- name GetLikesForPost many
SELECT * FROM likes WHERE post_id = $1

-- name ListLikes many
SELECT * FROM likes

-- name ListLikesForUser many
SELECT * FROM likes WHERE user_id = $1

-- name ListLikesForPost many
SELECT * FROM likes WHERE post_id = $1

-- name ListLikes many
SELECT * FROM likes

-- name ListLikesForUser many
SELECT * FROM likes WHERE user_id = $1

