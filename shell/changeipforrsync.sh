#!/bin/sh
#如果IP有变化就更改配置文件并重启rsync-server docker
#Wed May 27 22:07:29 CST 2020
ipFile=/ndata/www/om/tianshi/ip.txt
confDir=/data/rsync
startShell=${confDir}/start.sh
confFile=${confDir}/rsyncd.conf

[ ! -f ${ipFile} ] && echo "${ipFile} not exist" && exit 44

Newipadd=$(cat $ipFile)

function check_ip(){
  awk -v ipa=$Newipadd '/allow/ {if(match($0,ipa)) print ipa " in confile" ;else print "will restart sync-server " system("/data/scripts/changeipforrsync.sh addip") }' $confFile
}

add_ip_restart_docker(){
  oldLine=$(grep allow ${confFile})
  echo "oldLine is $oldLine"
  sed -i "/allow/ {s@=@= ${Newipadd}/32@}" $confFile
  echo "in $0 restart rsync-server"
  sh ${confDir}/restart.sh
}

case $1 in
   addip)
      add_ip_restart_docker
   ;;
    *)
      check_ip
;;
esac
