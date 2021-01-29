package main

import (
	"fmt"
	"html/template"
	"net/http"
)

type User struct {
	Name   string
	Gender string
	Age    int
}

func f1(w http.ResponseWriter, r *http.Request) {

}

func main() {
	http.HandleFunc("/", f1)
	err := http.ListenAndServe(":9000", nil)
	if err != nil {
		fmt.Println("http server start faild,err:%v", err)
	}
}
