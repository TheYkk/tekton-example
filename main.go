package main

import (
	"fmt"
	"log"
	"net/http"
)

var (
	Version = "dev"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "{\"alive\": true}")
}

func main() {
	log.Printf("version %s", Version)
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8080", nil)
}
