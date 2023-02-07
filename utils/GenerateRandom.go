package utils

import (
	"math/rand"
	"time"
)

const randomalphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

func GenerateRandomString(length int) string {
	rand.Seed(time.Now().UnixNano())
	b := make([]byte, length)
	for i := range b {
		b[i] = randomalphabet[rand.Intn(len(randomalphabet))]
	}
	return string(b)
}

func RandomString(length int) string {
	rand.Seed(time.Now().UnixNano())
	b := make([]byte, length)
	for i := range b {
		b[i] = randomalphabet[rand.Intn(len(randomalphabet))]
	}
	return string(b)
}

func RandomInt(length int) int {
	rand.Seed(time.Now().UnixNano())
	return rand.Intn(length)
}

func RandomInt64(length int64) int64 {
	rand.Seed(time.Now().UnixNano())
	return rand.Int63n(length)
}

func RandomUsers(length int) []string {
	var users []string
	for i := 0; i < length; i++ {
		users = append(users, RandomString(10))
	}
	return users
}
