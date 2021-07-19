package main

import (
	"fmt"
)

func main() {
	a := [...]int{1, 3, 5, 7, 8, 5}
	// b := 0
	// for _, i := range a {
	// 	b = b + i
	// }
	// fmt.Println(b)
	for k, v := range a {
		for j := k + 1; j < len(a); j++ {
			if v == 8-a[j] {
				fmt.Println(k, j)
			}
		}
	}
}
