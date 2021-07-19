package ArrayList

import (
	"errors"
	"fmt"
)

//接口
type List interface {
	Size() int //数组大小
	Get(index int ) (interface{},error) //抓取第几个元素
	Insert(index int,newval interface{})error //插入数据
	Set(index int,newval interface{}) error //修改数据
	Append(newval interface{})  //追加
	Clear(newval interface{}) //清空数组
	Delete(index int ) error //删除指定元素
	String() string //返回字符串
}

//数据结构，字符串，整数，实数等
type ArrayList struct {
	dataStore[] interface{} //数组存储
	theSize int //数组大小

}

//初始化列表
func NewArrayList() *ArrayList {
	list:=new(ArrayList)
	list.dataStore=make([]interface{},0,10)
	list.theSize=0
	return list

}

//列表大小
func (list *ArrayList ) Size() int{
	return list.theSize // 返回数组大小
}

//列表追加
func (list *ArrayList) Append(newval interface{}) {
	list.dataStore=append(list.dataStore,newval)
	list.theSize++
}

//抓取指定元素
func (list *ArrayList ) Get(index int) (interface{},error)  {
	if index <=0 || index >= list.theSize{
		return "FUCK",errors.New("下标越界")
	}
	return list.dataStore[index],nil
}

//打印列表内容
func (list *ArrayList ) String() string{
	return fmt.Sprint(list.dataStore)
}

func (list *ArrayList ) Set(index int,newval interface{}) error{
	if index <0 || index >= list.theSize {
		return errors.New("下标越界")
	}
	list.dataStore[index]=newval
	return nil
}
