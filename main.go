package main

import (
	"fmt"
	"html"
	"log"
	"net/http"
)

func main() {
	// index handler
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, %q", html.EscapeString(r.URL.Path))
	})

	// hello handler
	http.HandleFunc("/hello", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello")
	})

	// starting the server
	log.Fatal(http.ListenAndServe(":8081", nil))
}
