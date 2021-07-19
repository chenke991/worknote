package main

import (
	"fmt"
	"regexp"
	// "strings"
)

func main() {
	// var s = "how do you do"
	// var wordCount = make(map[string]int)
	// words := strings.Split(s, " ")
	// for _, word := range words {
	// 	v, ok := wordCount[word]
	// 	if ok {
	// 		wordCount[word] = v + 1
	// 	} else {
	// 		wordCount[word] = 1
	// 	}
	// }
	// for k, v := range wordCount {
	// 	fmt.Println(k, v)
	// }
	a := "version: 890789\r"
	r, _ := regexp.Compile("\\d+")
	ra := r.FindAllString(a, -1)
	fmt.Println(ra[0])
}
