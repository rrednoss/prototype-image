package main

import (
	"net/http"
	"time"
)

func main() {
	s := http.Server{
		Addr:         ":8000",
		ReadTimeout:  30 * time.Second,
		WriteTimeout: 60 * time.Second,
		IdleTimeout:  90 * time.Second,
		Handler:      SimpleHandler{},
	}
	err := s.ListenAndServe()
	if err != nil && err != http.ErrServerClosed {
		panic(err)
	}
}

type SimpleHandler struct{}

func (h SimpleHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("prototype-image v2.0.0\n"))
}
