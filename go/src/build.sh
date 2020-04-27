#!/bin/bash
Main="/data4t/wqyry/check/main"
checkFile="/data/tmp/main"

CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build main.go
scp main 10.1.2.188:/tmp/
\ssh 10.1.2.188 "mv /tmp/main $Main  && chmod +x $Main && $Main"
\ssh 10.1.2.188 "sh /data4t/wqyry/check/sync.sh"
ConfDir="/data4t/wqyry/check"

#IPS="47.108.54.128 119.3.60.235 121.36.55.125 223.111.161.109"
#for ip in $IPS
#do
#{
#   echo $ip
#   scp -P59878 $Main root@$ip:$checkFile
#   if [ ! -f $ConfDir/$ip.yaml ];then
#      $cFile=$ConfDir/mail.yaml
#   fi
#   scp -P59878 $cFile root@$ip:/data/mail.yaml
#   #ssh -p59878 root@$ip 'chmod +x /data/tmp/main && /data/tmp/main' 
#   ssh -p59878 root@$ip 'chmod +x /data/tmp/main'
#}&
#done
#wait
# 
