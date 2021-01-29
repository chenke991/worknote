package main

import (
	"fmt"
	_ "log"
	"net/http"
	"os/exec"
)

//db, err := sql.Open("mysql", "root:123456@(127.0.0.1:8080)/ke?parseTime=true")
//err := db.Ping()

// var ab string

// const ab = `#/bin/bash
// mysql -p123456 -e "show databases;"
// `

const ab = `mysql  -e "show databases;"`

func Cmd() []byte {
	out, err := exec.Command(ab).Output()
	if err != nil {
		fmt.Println(err)
		// return err
	}
	fmt.Println(out)
	return out
}

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		re := Cmd()
		fmt.Fprintf(w, string(re))
		w.Write(re)
	})

	http.ListenAndServe(":80", nil)
}
