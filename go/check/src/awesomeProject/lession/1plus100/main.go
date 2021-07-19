package main

import (
	"fmt"
	"time"
)

func main() {
	w:=1000000000
	Stime:=time.Now()
    d:=plss(w)
	es:=time.Now().Sub(Stime)
	fmt.Printf("took time: %s\n",es )
    fmt.Printf("%d plus from 1 is: %d\n",w,d)



	Stime1:=time.Now()
	dd:=pls(w)
	ess:=time.Now().Sub(Stime1)
	fmt.Printf("took time: %s\n",ess )
	fmt.Printf("%d plus from 1 is: %d\n",w,dd)

}

func pls(i int) int{
    jj:=0
	for a:=0;a <=i;a++ {
		jj+=a
		//fmt.Printf("j is %d\n",a)
	}
	return jj
}

func plss(i int) int {
	j:=0
	j=(1+i)*i/2
	return j
}