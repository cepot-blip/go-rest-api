-- name : CreateNotification : one
INSERT INTO notifications (user_id, message, created_at, updated_at) VALUES ($1, $2, $3, $4) RETURNING *

-- name : CreateManyNotification : many
INSERT INTO notifications (user_id, message, created_at, updated_at) VALUES ($1, $2, $3, $4) RETURNING *

-- name : GetNotificationForUserCount : one
SELECT COUNT(*) FROM notifications WHERE user_id = $1

-- name : GetNotificationCount : one
SELECT COUNT(*) FROM notifications

-- name : GetNotificationForUser : many
SELECT * FROM notifications WHERE user_id = $1

-- name : GetNotification : one
SELECT * FROM notifications WHERE id = $1

-- name : GetNotificationForUpdate : one
SELECT * FROM notifications WHERE id = $1 FOR UPDATE

-- name : ListNotification : many
SELECT * FROM notifications

-- name : UpdateNotification : one
UPDATE notifications SET user_id = $1, message = $2, updated_at = $3 WHERE id = $4 RETURNING *

-- name : DeleteNotification : one
DELETE FROM notifications WHERE id = $1 RETURNING *

-- name : GetNotificationsForUserCount : one
SELECT COUNT(*) FROM notifications WHERE user_id = $1

-- name : GetNotificationsCount : one
SELECT COUNT(*) FROM notifications

