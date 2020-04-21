package main

import (
	"fmt"
	"io/ioutil"
	//"regexp"
	"time"
)

func main() {
	folder := "/Users/chenke/Documents/tmp/wqyry/tmp"
	//定义一个切片存放找到的文件列表
	dayNow := getToday()
	fmt.Println(dayNow)
	fmt.Println(listFile(folder, dayNow))
}

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
			fileName := folder + "/" + file.Name()
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
