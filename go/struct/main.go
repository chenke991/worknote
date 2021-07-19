package main

import (
	"fmt"
)

// type Address struct {
// 	Province string
// 	City     string
// }

// type Person struct {
// 	Name   string
// 	Age    int
// 	Gender string
// 	Address
// }

// func main() {
// 	p1 := Person{
// 		Name:   "ke",
// 		Age:    33,
// 		Gender: "男",
// 		Address: Address{
// 			Province: "河南",
// 			City:     "ji南",
// 		},
// 	}
// 	fmt.Printf("%#v\n", p1)
// 	fmt.Println(p1.Address, p1.Province, p1.Name, p1.Age, p1.Address.City)
// }

type student struct {
	ID   int
	Name string
}

func newStudent(id int, name string) student {
	return student{
		ID:   id,
		Name: name,
	}
}

type class struct {
	Title   string
	Strdent []student
}

func main() {
	c1 := class{
		Title:   "101班",
		Strdent: make([]student, 0, 20),
	}

	for i := 0; i < 10; i++ {
		tmpStu := newStudent(i, fmt.Sprintf("stu%02d", i))
		c1.Strdent = append(c1.Strdent, tmpStu)
	}
	fmt.Printf("%#v\n", c1)
}
