package main

import (
	"fmt"
	"github.com/robfig/cron"
)



func main()  {
	//cron.New(cron.)
	c:=cron.New(cron.WithSeconds())
	spec:="00 05 13 * * 4"
	c.AddFunc(spec,func(){
		fmt.Println("2222222")
	})

	c.Start()
	select {

	}
}