package main

import (
	"fmt"
)

var name = 6

func a() func() {
	return func() {
		name += 1
		fmt.Println(name)
	}
}

func main() {
	b := a()
	b()
	b()
	var name = 90
	b()
	b()
	fmt.Println(name)
}
