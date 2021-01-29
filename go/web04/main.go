package main

import (
	"fmt"
	"html/template"
	"net/http"
)

func sayHello(w http.ResponseWriter, r *http.Request) {
	t, err := template.ParseFiles("./hello.tmpl")
	if err != nil {
		fmt.Println("Parse file err:%v", err)
		return
	}
	//渲染模板
	err = t.Execute(w, "帅B")
	if err != nil {
		fmt.Println("reader template failed,err:%v", err)
		return
	}
}

func main() {
	http.HandleFunc("/", sayHello)
	err := http.ListenAndServe(":9000", nil)
	if err != nil {
		fmt.Println("http server start faild,err:%v", err)
	}
}
