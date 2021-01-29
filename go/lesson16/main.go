package main

import (
	// "fmt"
	"net/http"
	// "time"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	r.GET("index", func(c *gin.Context) {
		c.Redirect(http.StatusMovedPermanently, "https://baidu.com")
	})
	r.Run(":9090")
}
