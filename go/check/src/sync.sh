#!/bin/bash
Main="/data4t/wqyry/check/main"
checkFile="/data/tmp/main"
LMd5=$(md5sum $Main|awk '{print $1}')

#CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build main.go
#scp main 10.1.2.188:/tmp/
#\ssh 10.1.2.188 'mv /tmp/main $Main  && chmod +x $Main && $Main'
ConfDir="/data4t/wqyry/check"

IPS="192.168.1.1 192.168.1.3"
for ip in $IPS
do
{
   echo $ip
   RMd5=$(ssh -p59878 root@$ip "md5sum /data/tmp/main"|awk '{print $1}')
   if [ "$LMd5"x == "$RMd5"x ];then
           echo "LMd5 : $LMd5;RMd5: ${RMd5} ,do nothing"
   else
     rsync -avzP -e 'ssh -p 59878' $Main root@$ip:$checkFile
    fi
   if [  -f $ConfDir/$ip.yaml ];then
      cFile=$ConfDir/$ip.yaml
   else
      cFile=$ConfDir/.mail.yaml
   fi
   scp -P59878 $cFile root@$ip:/data/.mail.yaml
   ssh -p59878 root@$ip 'chmod +x /data/tmp/main && /data/tmp/main'
}&
done
wait

$Main
