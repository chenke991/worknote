package main

import (
	"./ArrayList"
	"fmt"
)
func main()  {
	//var list ArrayList.List
	//list=ArrayList.NewArrayList()
	list:=ArrayList.NewArrayList()
	for i:=1;i<100;i++ {
		list.Append(i)
	}
	d,err:=list.Get(4)
	a:=list.Set(10,90)
	if a != nil {
		fmt.Println(a)
	}

	fmt.Println(d,err)
	fmt.Println(list)

}
