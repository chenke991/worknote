package module

import (
	"fmt"
	yaml "gopkg.in/yaml.v2"
	"io/ioutil"
)

/*
spring:
  mail:
    host: smtp.126.com
    port: 465
    username: 123456@126.com
    password: 1234567
  mysql:
    host: 192.168.56.101
    port: 3306
    db: yunwei
    user: root
    password: www.52xiyou
  tomail:
    - chenke991@126.com
    - chenke991@gmail.com
  files:
    - "/Users/chenke/Documents/tmp/wqyry/tmp"
*/

type BaseInfo struct {
	Spring MailEntity `yaml: "spring"`
}

type MailEntity struct {
	Mail  MailData `yaml: "mail"`
	Mysql DbData   `yaml:"mysql"`
	Files []string `yaml:files`
}

type MailData struct {
	Host   string   `yaml:"host"`
	Port   string   `yaml:"port"`
	User   string   `yaml:"username"`
	Pwd    string   `yaml:"password"`
	Tomail []string `yaml:"tomail"`
}

type DbData struct {
	Host string `yaml:"host"`
	Port string `yaml:"port"`
	Db   string `yaml:"db"`
	User string `yaml:"username"`
	Pwd  string `yaml:"password"`
}

func (c *BaseInfo) GetConf() *BaseInfo {
	yamlFile, err := ioutil.ReadFile("/data/mail.yaml")
	if err != nil {
		fmt.Println(err.Error())
	}
	err = yaml.Unmarshal(yamlFile, c)
	if err != nil {
		fmt.Println(err.Error())
	}
	return c
}

// func main() {
// 	info := BaseInfo{}
// 	conf := info.GetConf()
// 	a := conf.Spring
// 	b, c, d, e := a.Mail.Host, a.Mail.Port, a.Mail.User, a.Mail.Pwd
// 	fmt.Println(b, c, d, e)
// }
