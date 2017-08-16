#!/bin/sh
#run it as sh $0 xiyou 1 20 3 [xyzl xiyou-g.com]
#生成合服列表
set -o nounset #变量值为空退出
set -o errexit #执行出错退出

Tim=$(date +%m%d)
beginNum=${2:-2}
endNum=${3:-2}
interVal=${4:-2} #二合一或多合一
platForm=${1:-xiyou}
gameName=${5:-xyzl}
domAin=${6:-xiyou-g.com}

if [ $# -lt 3 ];then
   echo "run it as sh $0 xiyou 1 20 3"
   exit 500
fi
ADDR=$(nslookup s$endNum.xyzl${platForm}.${domAin} 119.29.29.29|grep Address|grep -v "#53"|tail -n 1|awk '{print $NF}')
Address=${ADDR:-NULL}
echo "beginNum:$beginNum endNum:$endNum Address:$Address"
if [ $Address == "NULL" ];then
    echo -e "\033[47;31m FUCK_ERROR, s$endNum.xyzl${platForm}.xiyou-g.com is not exist,do nothing \033[0m"
    exit
fi
#seq $beginNum $endNum|awk -v varT="$Tim" -v varP="$platForm" 'ORS=NR%2?"-":"\n" {if(ORS=="-") {print varP"|"$0 >> varT} else {print $0 >> varT}}'
#seq $beginNum $endNum|awk -v varT="$Tim" -v varP="$platForm" 'ORS=NR%2?"-":"\n" {$0=(ORS=="-")?"varP"|"$0"":"0"} END {print >> varT}'
#seq $beginNum $endNum|awk -v varT="$Tim" -v varP="$platForm" 'ORS=NR%2?":":"\n" {$0=(ORS==":")?varP"|"$0:$0} {print >> varT}'
##seq $beginNum $endNum|awk -v varT="$Tim" -v varP="$platForm" 'ORS=NR%2?":":"\n" {$0=(ORS==":")?varP"|"$0:$0} {print >> varT;system(wc -l)} END {/"$beginNum"/,/"$endNum"/ varT;system(wc -l)}'
if [ $interVal -eq 2 ];then
  seq $beginNum $endNum|awk -v varT="$Tim" -v varN="$interVal" -v varP="$platForm" 'ORS=NR%varN?":":"\n" {$0=(ORS==":")?varP"|"$0:$0} {print >> varT}END{system("wc -l "varT"")}'
else
  TimBig=$(date +%m%d%m%s)
#  seq $beginNum $endNum|awk -v varT="$TimBig" -v varN="$interVal" -v varP="$platForm" -F"-" 'ORS=NR%varN?"-":"\n" {$0=(ORS=="-")?varP"|"$0:$0} {print >> varT}END{print $1,$NF;system("wc -l "varT"");}'
  seq $beginNum $endNum|awk -v varT="$TimBig" -v varN="$interVal" -v varP="$platForm"  'ORS=NR%varN?"-":"\n" {$0=(ORS=="-")?varP"|"$0:$0} {print >> varT} END {system("wc -l "varT"")}'
  awk -F"-" -v varT="$Tim" '{print $1 "-" $NF >> varT}' $TimBig
fi
