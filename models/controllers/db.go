package controllers

import (
	"database/sql"
	"log"
	"os"
	"time"
)

// DB is the database connection
var DB *sql.DB

// InitDB initializes the database connection
func InitDB() {
	var err error
	DB, err = sql.Open("postgres", os.Getenv("DATABASE_URL"))
	if err != nil {
		log.Fatal(err)
	}
	DB.SetMaxOpenConns(20)
	DB.SetMaxIdleConns(20)
	DB.SetConnMaxLifetime(5 * time.Minute)
}

// CloseDB closes the database connection
func CloseDB() {
	DB.Close()
}

// GetDB returns the database connection
func GetDB() *sql.DB {
	return DB
}
