package main

import (
	"fmt"
	"io/ioutil"
	//"regexp"
	"database/sql"
	_ "github.com/go-sql-driver/mysql"
	"regexp"
	"time"
)

func main() {
	folder := "/Users/chenke/Documents/tmp/wqyry/tmp"
	//定义一个切片存放找到的文件列表
	dayNow := getToday()
	fmt.Println(dayNow)
	allFiles := listFile(folder, dayNow)
	fmt.Println(allFiles)
	allGames := selectFromMysql()
	fmt.Println("in main")
	// fmt.Println(allGames)
	notMatch, isMatch := matchGameList(dayNow, allGames, allFiles)
	fmt.Println("not Match is :", notMatch, "is match is :", isMatch)

	todayBakFiles := todayBackupFiles(dayNow, allFiles)
	fmt.Println(todayBakFiles)

}

//返回当天备份文件列表
func todayBackupFiles(dayNow string, fileLists []string) []string {
	var todayBakFiles []string
	r := regexp.MustCompile(dayNow)
	for _, v := range fileLists {
		fmt.Println(v)
		if r.MatchString(v) {
			fmt.Println("当天备份文件列表是：", v)
			todayBakFiles = append(todayBakFiles, v)
		}

	}
	return todayBakFiles

}

//从gameIdList 中取出值后循环匹配fileLists,未匹配到说明没有找到备份文件并加入切片中返回
func matchGameList(dayNow string, gameIdList, fileLists []string) ([]string, []string) {
	var notMatch, isMatch []string
	fmt.Println(gameIdList, fileLists)
	// r := regexp.MustCompile(dayNow)
	for _, v := range gameIdList {
		// fmt.Println(v)
		bfile := v + "_" + dayNow
		r := regexp.MustCompile(bfile)
		for _, j := range fileLists {
			if r.MatchString(j) {
				isMatch = append(isMatch, v)
			} else {
				notMatch = append(notMatch, v)
				fmt.Println("未匹配到备份文件", v)
			}

		}

	}

	return notMatch, isMatch
}

// 遍历指定目录下所有文件
func listFile(folder string, dayNow string) []string {
	fileLists := make([]string, 0, 100)
	//开始遍历指定目录
	files, _ := ioutil.ReadDir(folder)
	for _, file := range files {
		if file.IsDir() {
			// fmt.Println("dir:", file, fileLists)
			v := listFile(folder+"/"+file.Name(), dayNow)
			fileLists = append(fileLists, v...)
		} else {
			// fileName := folder + "/" + file.Name()
			fileName := file.Name()
			// fmt.Println("文件路径是", fileName)
			fileLists = append(fileLists, fileName)

		}
	}
	// fmt.Println(fileLists)
	return fileLists

}

func getToday() string {
	//返回20200415,给程序查找当天备份文件
	return time.Now().Format("20060102")
}

//mysql中查出所有game id 按平台分类并输出 wqyry_xiyou_1
func selectFromMysql() []string {
	// gameIdList := make([]string, 0)
	var gameIdList []string
	fmt.Println("从mysql中取数据")
	db, err := sql.Open("mysql", "root:www.52xiyou@tcp(192.168.56.101:3306)/yunwei")
	defer db.Close()
	if err != nil {
		fmt.Println("连接mysql失败")
	}
	rows, err := db.Query("select CONCAT(lower(game.en_name),'_',platform.en_name,'_',number)  from service_base sb left join game on sb.game_id =game.id  left JOIN platform on sb.platform_id =platform.id  where service_id=1")
	if err != nil {
		fmt.Println("查询错误")
	}
	// fmt.Println(rows)
	for rows.Next() {
		var s string
		err = rows.Scan(&s)
		if err != nil {
			fmt.Println("error")
		}
		// fmt.Println(rows)
		gameIdList = append(gameIdList, s)
	}
	fmt.Println(gameIdList)
	return gameIdList

}
