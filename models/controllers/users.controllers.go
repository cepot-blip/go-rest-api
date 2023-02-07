package controllers

import (
	"context"
	"time"
)

const addUsers = `INSERT INTO users (username, password, email, created_at, updated_at) VALUES ($1, $2, $3, $4, $5)`

type User struct {
	ID        int       `json:"id"`
	Username  string    `json:"username"`
	Password  string    `json:"password"`
	Email     string    `json:"email"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

// AddUser adds a user to the database
func AddUser(ctx context.Context, username, password, email string) error {
	_, err := GetDB().ExecContext(ctx, addUsers, username, password, email, time.Now(), time.Now())
	return err
}

const createUsersTable = `CREATE TABLE IF NOT EXISTS users (
	id SERIAL PRIMARY KEY,
	username VARCHAR(255) NOT NULL,
	password VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP NOT NULL
)`

// AddUsers adds multiple users to the database
func AddUsers(ctx context.Context, users []string) error {
	for _, user := range users {
		err := AddUser(ctx, user, user, user+"@gmail.com")
		if err != nil {
			return err
		}
	}
	return nil
}

// AddUsersWithTransaction adds multiple users to the database using a transaction
func AddUsersWithTransaction(ctx context.Context, users []string) error {
	tx, err := GetDB().BeginTx(ctx, nil)
	if err != nil {
		return err
	}
	defer tx.Rollback()

	for _, user := range users {
		_, err := tx.ExecContext(ctx, addUsers, user, user, user+"@gmail.com", time.Now(), time.Now())
		if err != nil {
			return err
		}
	}

	return tx.Commit()
}

const deleteUsers = `DELETE FROM users WHERE username = $1`

func DeleteUser(ctx context.Context, username string) error {
	_, err := GetDB().ExecContext(ctx, deleteUsers, username)
	return err
}

const dropUsersTable = `DROP TABLE IF EXISTS users`

// DropUsersTable drops the users table
func DropUsersTable(ctx context.Context) error {
	_, err := GetDB().ExecContext(ctx, dropUsersTable)
	return err
}

const getUsers = `SELECT id, username, password, email, created_at, updated_at FROM users`

// GetUsers returns all users
func GetUsers(ctx context.Context) ([]User, error) {
	rows, err := GetDB().QueryContext(ctx, getUsers)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var users []User
	for rows.Next() {
		var user User
		err := rows.Scan(&user.ID, &user.Username, &user.Password, &user.Email, &user.CreatedAt, &user.UpdatedAt)
		if err != nil {
			return nil, err
		}
		users = append(users, user)
	}
	return users, nil
}

const getUsersByIDs = `SELECT id, username, password, email, created_at, updated_at FROM users WHERE id IN ($1)`
const getUsersByIDs2 = `SELECT id, username, password, email, created_at, updated_at FROM users WHERE id IN ($1, $2)`
const getUsersByIDs3 = `SELECT id, username, password, email, created_at, updated_at FROM users WHERE id IN ($1, $2, $3)`
const getUsersByIDs4 = `SELECT id, username, password, email, created_at, updated_at FROM users WHERE id IN ($1, $2, $3, $4)`

// GetUsersByIDs returns users by their IDs
func GetUsersByIDs(ctx context.Context, ids []int) ([]User, error) {
	var query string
	switch len(ids) {
	case 1:
		query = getUsersByIDs
	case 2:
		query = getUsersByIDs2
	case 3:
		query = getUsersByIDs3
	case 4:
		query = getUsersByIDs4
	default:
		return nil, nil
	}

	rows, err := GetDB().QueryContext(ctx, query, ids)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var users []User
	for rows.Next() {
		var user User
		err := rows.Scan(&user.ID, &user.Username, &user.Password, &user.Email, &user.CreatedAt, &user.UpdatedAt)
		if err != nil {
			return nil, err
		}
		users = append(users, user)
	}
	return users, nil
}

const getUsersByIDsAndEmails = `SELECT id, username, password, email, created_at, updated_at FROM users WHERE id IN ($1) AND email IN ($2)`

// GetUsersByIDsAndEmails returns users by their IDs and emails
func GetUsersByIDsAndEmails(ctx context.Context, ids []int, emails []string) ([]User, error) {
	rows, err := GetDB().QueryContext(ctx, getUsersByIDsAndEmails, ids, emails)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var users []User
	for rows.Next() {
		var user User
		err := rows.Scan(&user.ID, &user.Username, &user.Password, &user.Email, &user.CreatedAt, &user.UpdatedAt)
		if err != nil {
			return nil, err
		}
		users = append(users, user)
	}
	return users, nil
}

const getUsersByIDsAndEmails2 = `SELECT id, username, password, email, created_at, updated_at FROM users WHERE id IN ($1, $2) AND email IN ($3, $4)`

// GetUsersByIDsAndEmails2 returns users by their IDs and emails
func GetUsersByIDsAndEmails2(ctx context.Context, ids []int, emails []string) ([]User, error) {
	rows, err := GetDB().QueryContext(ctx, getUsersByIDsAndEmails2, ids, emails)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var users []User
	for rows.Next() {
		var user User
		err := rows.Scan(&user.ID, &user.Username, &user.Password, &user.Email, &user.CreatedAt, &user.UpdatedAt)
		if err != nil {
			return nil, err
		}
		users = append(users, user)
	}
	return users, nil
}

const getUsersByIDsAndEmails3 = `SELECT id, username, password, email, created_at, updated_at FROM users WHERE id IN ($1, $2, $3) AND email IN ($4, $5, $6)`

// GetUsersByIDsAndEmails3 returns users by their IDs and emails
func GetUsersByIDsAndEmails3(ctx context.Context, ids []int, emails []string) ([]User, error) {
	rows, err := GetDB().QueryContext(ctx, getUsersByIDsAndEmails3, ids, emails)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var users []User
	for rows.Next() {
		var user User
		err := rows.Scan(&user.ID, &user.Username, &user.Password, &user.Email, &user.CreatedAt, &user.UpdatedAt)
		if err != nil {
			return nil, err
		}
		users = append(users, user)
	}
	return users, nil
}

const getUsersByIDsAndEmails4 = `SELECT id, username, password, email, created_at, updated_at FROM users WHERE id IN ($1, $2, $3, $4) AND email IN ($5, $6, $7, $8)`

// GetUsersByIDsAndEmails4 returns users by their IDs and emails
func GetUsersByIDsAndEmails4(ctx context.Context, ids []int, emails []string) ([]User, error) {
	rows, err := GetDB().QueryContext(ctx, getUsersByIDsAndEmails4, ids, emails)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var users []User
	for rows.Next() {
		var user User
		err := rows.Scan(&user.ID, &user.Username, &user.Password, &user.Email, &user.CreatedAt, &user.UpdatedAt)
		if err != nil {
			return nil, err
		}
		users = append(users, user)
	}
	return users, nil
}

const listUsers = `SELECT id, username, password, email, created_at, updated_at FROM users`

// ListUsers returns all users
func ListUsers(ctx context.Context) ([]User, error) {
	rows, err := GetDB().QueryContext(ctx, listUsers)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var users []User
	for rows.Next() {
		var user User
		err := rows.Scan(&user.ID, &user.Username, &user.Password, &user.Email, &user.CreatedAt, &user.UpdatedAt)
		if err != nil {
			return nil, err
		}
		users = append(users, user)
	}
	return users, nil
}

const listUsers2 = `SELECT id, username, password, email, created_at, updated_at FROM users LIMIT $1`

// ListUsers2 returns all users
func ListUsers2(ctx context.Context, limit int) ([]User, error) {
	rows, err := GetDB().QueryContext(ctx, listUsers2, limit)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var users []User
	for rows.Next() {
		var user User
		err := rows.Scan(&user.ID, &user.Username, &user.Password, &user.Email, &user.CreatedAt, &user.UpdatedAt)
		if err != nil {
			return nil, err
		}
		users = append(users, user)
	}
	return users, nil
}

const listUsers3 = `SELECT id, username, password, email, created_at, updated_at FROM users LIMIT $1 OFFSET $2`

// ListUsers3 returns all users
func ListUsers3(ctx context.Context, limit, offset int) ([]User, error) {
	rows, err := GetDB().QueryContext(ctx, listUsers3, limit, offset)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var users []User
	for rows.Next() {
		var user User
		err := rows.Scan(&user.ID, &user.Username, &user.Password, &user.Email, &user.CreatedAt, &user.UpdatedAt)
		if err != nil {
			return nil, err
		}
		users = append(users, user)
	}
	return users, nil
}

const listUsers4 = `SELECT id, username, password, email, created_at, updated_at FROM users LIMIT $1 OFFSET $2`

// ListUsers4 returns all users
func ListUsers4(ctx context.Context, limit, offset int) ([]User, error) {
	rows, err := GetDB().QueryContext(ctx, listUsers4, limit, offset)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var users []User
	for rows.Next() {
		var user User
		err := rows.Scan(&user.ID, &user.Username, &user.Password, &user.Email, &user.CreatedAt, &user.UpdatedAt)
		if err != nil {
			return nil, err
		}
		users = append(users, user)
	}
	return users, nil
}

const listUsersParams = `SELECT id, username, password, email, created_at, updated_at FROM users WHERE id = $1 AND email = $2`

// ListUsersParams returns all users
func ListUsersParams(ctx context.Context, id int, email string) ([]User, error) {
	rows, err := GetDB().QueryContext(ctx, listUsersParams, id, email)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var users []User
	for rows.Next() {
		var user User
		err := rows.Scan(&user.ID, &user.Username, &user.Password, &user.Email, &user.CreatedAt, &user.UpdatedAt)
		if err != nil {
			return nil, err
		}
		users = append(users, user)
	}
	return users, nil
}
