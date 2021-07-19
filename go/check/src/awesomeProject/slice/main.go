package main

import "fmt"

func main() {
	b:=[]byte{'g','o','l','a','n','g'}
	a:=b[1:4]
	for i:=0;i<len(a);i++{
		fmt.Printf(" index %d is %s \n",i,string(a[i]))
	}
}
