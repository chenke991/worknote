package main

import (
	"fmt"
)

// func intSumMany(a int, b ...int) (ret int) {
// 	ret = a
// 	for _, v := range b {
// 		ret = ret + v
// 	}
// 	return

// }

func abb(x, y int) int {
	return x + y
}

func sub(x, y int) int {
	return x - y
}

func calc(x, y int, opt func(int, int) int) int {
	return opt(x, y)
}

func main() {
	// s1 := intSumMany(9, 100, 300, 400)
	// s2 := intSumMany(9, 10, 40)
	// s3 := intSumMany(9)
	// fmt.Println(s1, s2, s3)
	r1 := calc(9, 8, abb)
	fmt.Println(r1)

}
