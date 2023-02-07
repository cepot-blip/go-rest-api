-- name: CreateFollows : one
INSERT INTO follows (user_id, follower_id, created_at, updated_at) VALUES ($1, $2, $3, $4) RETURNING *

-- name: GetFollows : one
SELECT * FROM follows WHERE id = $1

-- name: GetFollowsForUpdate : one
SELECT * FROM follows WHERE id = $1 FOR UPDATE

-- name: ListFollows : many
SELECT * FROM follows

-- name: UpdateFollows : one
UPDATE follows SET user_id = $1, follower_id = $2, updated_at = $3 WHERE id = $4 RETURNING *

-- name: DeleteFollows : one
DELETE FROM follows WHERE id = $1 RETURNING *

-- name: GetFollowsForUserCount : one
SELECT COUNT(*) FROM follows WHERE user_id = $1

-- name: GetFollowsForFollowerCount : one
SELECT COUNT(*) FROM follows WHERE follower_id = $1

-- name: GetFollowsCount : one
SELECT COUNT(*) FROM follows

-- name: GetFollowsForUser : many
SELECT * FROM follows WHERE user_id = $1

-- name: GetFollowsForFollower : many
SELECT * FROM follows WHERE follower_id = $1

-- name: ListFollows : many
SELECT * FROM follows

-- name: ListFollowsForUser : many
SELECT * FROM follows WHERE user_id = $1

-- name: ListFollowsForFollower : many
SELECT * FROM follows WHERE follower_id = $1
