package main

import (
	"fmt"
	"os"
)

//学生管理系统

//需求
//1，添加学员信息
//2，编辑学员信息
//3，展示所有学员信息

func showMenu() {
	fmt.Println("欢迎来到学员信息管理系统")
	fmt.Println("1.添加学员")
	fmt.Println("2.编辑学员信息")
	fmt.Println("3.展示所有学员信息")
	fmt.Println("4.退出系统")
}

func getInput() *student {
	var (
		id    int
		name  string
		class string
	)
	fmt.Println("请按要求输入学员信息")
	fmt.Print("请输入学员学号：")
	fmt.Scanf("%d\n", &id)
	fmt.Print("请输入学员姓名：")
	fmt.Scanf("%s\n", &name)
	fmt.Print("请输入学员的班级：")
	fmt.Scanf("%s\n", &id)
	stu := newStudent(id, name, class)
	return stu
}

func main() {

	sm := newStudentMgr()
	for {
		//打印系统菜单
		showMenu()
		//等待用户输入
		var input int
		fmt.Print("输入操作序号：")
		fmt.Scanf("%d\n", &input)
		fmt.Println("用户输入的是：", input)
		//执行用户选择的动作
		switch input {
		case 1:
			//添加
			stu := getInput()
			sm.addStudent(stu)
		case 2:
			//编辑
			stu := getInput()
			sm.editStudent(stu)

		case 3:
			//显示所有
			sm.showStudent()
		case 4:
			//退出
			os.Exit(0)
		}
	}
}
