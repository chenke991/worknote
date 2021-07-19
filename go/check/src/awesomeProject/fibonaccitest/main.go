package main

import (
	"fmt"
	"time"
)

const LIM = 40
var r [LIM]int64

func main() {
	var rr int64 = 0
	Startim:=time.Now()
	for i:=0;i<LIM;i++ {
		rr=fb(i)
		fmt.Printf("fi(%d) is: %d \n",i, rr)
	}
	es:=time.Now().Sub(Startim)
	fmt.Printf("took time: %s\n",es )
}

func fb(i int) (re int64)  {
	//if r[i] !=0 {
	//	re=r[i]
	//	return r[i]
	//}
	if i <=1{
		re=1
	}else{
		re=fb(i-1)+fb(i-2)
	}
	r[i]=re
	return
}