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

func sayHello(w http.ResponseWriter, r *http.Request) {
	t, err := template.ParseFiles("./hello.tmpl")
	if err != nil {
		fmt.Println("faild ,err %v", err)
		return
	}
	u1 := User{
		Name:   "帅B",
		Gender: "男",
		Age:    11,
	}

	m1 := map[string]interface{}{
		"name":   "lllll",
		"gender": "women",
		"age":    44,
	}

	hobbyList := []string{
		"唱",
		"跳",
		"RAP",
	}
	t.Execute(w, map[string]interface{}{
		"u1": u1,
		"m1": m1,
		"h1": hobbyList,
	})

}

func main() {
	http.HandleFunc("/", sayHello)
	err := http.ListenAndServe(":9000", nil)
	if err != nil {
		fmt.Println("http server start faild,err:%v", err)
	}
}
