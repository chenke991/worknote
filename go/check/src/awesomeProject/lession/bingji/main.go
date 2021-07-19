package main

import "fmt"

func main() {
	var aa =[]string{"1","2","3","9"}
	var bb =[]string{"2","4","5","6"}
	dd:=bingji(aa,bb)
	fmt.Println("dd is %d",dd)

}


func bingji(a,b []string ) []string  {
	c:=make(map[string]int)
	for _,v := range a {
		c[v]++
	}

	for k,v :=range c{
		fmt.Println(k,v)
	}

	for _,vv := range b {
		times,v:=c[vv]
		fmt.Println(times,v)
		if times == 0 {
			a=append(a,vv)
		}
	}

    return a
}