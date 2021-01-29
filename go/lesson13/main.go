package main

import (
	"fmt"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
)

func indexHa(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"msg": "index",
	})

}

func m1(c *gin.Context) {
	fmt.Println("m1 in ..")
	start := time.Now()
	c.Next() //处理后续函数
	cost := time.Since(start)
	fmt.Printf("cost:%v\n", cost)
	fmt.Println("m1 out....")
}

func main() {
	r := gin.Default()
	r.Use(m1) //全局注册中间件
	r.GET("/index", indexHa)
	r.GET("/shop", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"msg": "shop",
		})
	})
	r.Run(":80")

}
