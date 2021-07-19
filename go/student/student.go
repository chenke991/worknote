package main

import (
	"fmt"
)

type student struct {
	id    int //学号惟一
	name  string
	class string
}

//构造函数
func newStudent(id int, name, class string) *student {
	return &student{
		id:    id,
		name:  name,
		class: class,
	}
}

//学员管理类型
type studentMgr struct {
	allStudents []*student
}

func newStudentMgr() *studentMgr {
	return &studentMgr{
		allStudents: make([]*student, 0, 100),
	}
}

//add student
func (s *studentMgr) addStudent(newStu *student) {
	s.allStudents = append(s.allStudents, newStu)
}

//edit stud
func (s *studentMgr) editStudent(newStu *student) {
	for i, v := range s.allStudents {
		if newStu.id == v.id { //学号相同时找到要修改的学生
			s.allStudents[i] = newStu
			return
		}
	}
	//走到这里说明输入的学生没找到
	fmt.Println("输入的学生没找到")

}

//show stud
func (s *studentMgr) showStudent() {
	for _, v := range s.allStudents {
		fmt.Printf("班级：%s 学号：%d  姓名：%s \n", v.class, v.id, v.name)
	}
}
