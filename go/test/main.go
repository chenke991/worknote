package main

import (
	"fmt"
)

func main() {
	map1 := map[int]string{1: "m", 2: "t", 3: "w", 4: "t", 5: "s", 6: "s", 7: "sunday"}
	for k, v := range map1 {
		fmt.Printf("key is :%d - values is :%f \n", k, v)
	}

}
