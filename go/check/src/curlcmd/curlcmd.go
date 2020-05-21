// package curlcmd
package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
)

// func Curlget(url string) []byte {
func main() {
	// re, err := http.Get(url)
	re, err := http.Get("http://pv.sohu.com/cityjson")
	if err != nil {
		panic(err)
	}
	defer re.Body.Close()
	body, err := ioutil.ReadAll(re.Body)
	fmt.Println(string(body))

}
