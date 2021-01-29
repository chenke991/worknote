package main

import (
	"database/sql"
	"fmt"
	_ "log"
	"net/http"
	_ "net/http"

	_ "github.com/go-sql-driver/mysql"

	"github.com/gin-gonic/gin"
)

// func init() {
// 	db, err := sql.Open("mysql", "root:123456@tcp(127.0.0.1:8080)/ke")
// 	if err != nil {
// 		log.Fatal(err)

// 	}
// }
func SqlSel(zoneId string) []interface{} {
	db, err := sql.Open("mysql", "root:123456@tcp(127.0.0.1:8080)/ke")
	if err != nil {
		fmt.Println("连接数据库失败", err)
		// return
	}
	serow := "SELECT zoneId,count(*) FROM pl group by zoneId;"
	fmt.Printf(serow + "\n")
	// stm, _ := db.Prepare(serow)
	// defer stm.Close()
	rows, err := db.Query(serow)
	if err != nil {
		fmt.Println(err)
	}
	defer rows.Close()
	cols, _ := rows.Columns()
	alloRows := make([]interface{}, 0)
	oneRow := make([]interface{}, len(cols))
	scanRow := make([]interface{}, len(cols))

	for rows.Next() {
		// var id, co int
		// rows.Scan(&id, &co)
		// fmt.Println(id, co)
		for i, _ := range oneRow {
			scanRow[i] = &oneRow[i]
			fmt.Println("nxt ", scanRow[i])
		}

		rows.Scan(scanRow...)
		// fmt.Println("scanRow %s", &scanRow[0])
		fieldMap := make(map[string]string)
		for index, val := range oneRow {

			val, ok := val.([]byte)
			fmt.Println("range scanRow:", val, ok)
			if ok {
				fieldMap[cols[index]] = string(val)
				fmt.Println("OKOKOKOK")
			}
			fmt.Println("scanRow:", index, val)
		}
		alloRows = append(alloRows, fieldMap)
	}
	fmt.Println("alloRows:", alloRows)

	return alloRows
}

func main() {
	r := gin.Default()
	r.LoadHTMLFiles("./login.html")
	r.GET("/", func(c *gin.Context) {
		c.String(200, "Fuck")
	})
	///q?zoneId=3001
	r.GET("/q", func(c *gin.Context) {
		zoneId := c.Query("zoneId")
		re := SqlSel(zoneId)
		c.JSON(200, re)

	})
	r.GET("/web", func(c *gin.Context) {
		name := c.DefaultQuery("query", "美人鱼")
		c.JSON(http.StatusOK, gin.H{
			"name": name,
		})

	})
	r.GET("/js", func(c *gin.Context) {
		c.JSON(http.StatusOK, c.QueryMap("ids"))
	})

	r.GET("/login", func(c *gin.Context) {
		c.HTML(http.StatusOK, "login.html", nil)
	})

	r.POST("/login", func(c *gin.Context) {
		username := c.PostForm("username")
		pwd := c.PostForm("pwd")
		c.JSON(http.StatusOK, gin.H{
			"Username": username,
			"Pwd":      pwd,
		})
	})
	r.GET("/usr/:name/:age", func(c *gin.Context) {
		//获取路径参数
		name := c.Param("name")
		age := c.Param("age")
		c.JSON(http.StatusOK, gin.H{
			"name": name,
			"age":  age,
		})
	})
	r.GET("/book/:year/:moth", func(c *gin.Context) {
		year := c.Param("year")
		moth := c.Param("moth")
		c.JSON(http.StatusOK, gin.H{
			"year": year,
			"moth": moth,
		})
	})
	r.Run(":9090")
}
