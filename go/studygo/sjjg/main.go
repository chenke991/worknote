package main

import (
	"fmt"
	"math/rand"
	"time"
)

//
//func pln01(num int)  int {
//	for i:=1;i<=num;i++ {
//		fmt.Println("i is ",i)
//	}
//	return 0
//}
//
//func pln02(num int)  int {
//	if num>0 {
//
//		fmt.Println("i is",num)
//		return pln02(num-1)
//	}
//	return 0
//}
//
//func main1()  {
//	//TS:=time.Now()
//	//p1:=pln01(100000)
//	//TV:=time.Since(TS)
//	//fmt.Println("use ",TV,p1)
//
//	TS2:=time.Now()
//	p2:=pln02(100000)
//	TV2:=time.Since(TS2)
//	fmt.Println("use ",TV2,p2)
//
//}

//计算数组连续最大值
//var sl1=[]int{-1,3,-1,4,-6,1,6,-1,9,6,7,8,-1,-9,100,-4}
var sl1 []int
//生成随机数组
func randsl(n int) []int{
	for i:=0 ;i<n;i++{
		sl1 = append(sl1, rand.Intn(50)-40)
	}
	return sl1
}
func maxSumsl(sl []int) int  {
	fmt.Println(sl)
	var sum1,summax int
    for i:=0 ;i<len(sl);i++ {
    	sum1 +=sl[i]
    	if sum1 > summax{
    		summax = sum1
		}else if sum1 < 0 {
			sum1 = 0
		}
	}
	return summax
}

func main(){
	a:=randsl(1000000)
	TS:=time.Now()
	re:=maxSumsl(a)
	TV:=time.Since(TS)
	fmt.Println("use ",TV)
	fmt.Println("max sum is :",re)
}