#!/bin/sh
#20170116 陈珂
#run it as $0 游戏名 平台名 包名
#example sh $0 xyzl XIYOU,xiyoupre,tencent
#example sh $0 xyzl XIYOU,xiyoupre,tencent share version

#1,获取游戏名
#2,获取平台名
#3,获取包名
#4,获取包名和角色名对应关系,从配置文件中获取. wmhy.txt
#5,ssh 至各机房rsync服务器执行脚本，下载文件并放入发布目录

#for online
export LC_ALL="zh_CN.UTF-8"
RsyncDir=/data/btupload
HostName=$(cat /etc/salt/minion_id)

#for test
#RsyncDir=/data/rsyncupload

###############################################

RsyncServerDir=/data/file
TorrentDir=/data/saltstack/salt/torrent/torrents
SaltDir="salt://torrent/torrents"
#check args
echo "@In $0 ALL ARGS ARE $*"
if [ $# -lt 1 ];then
   echo "FUCK_ERROR , run it as sh $0 XYZL"
   exit 500
fi

#1游戏名，需要与salt-key一致
GameName=$(echo $1|tr '[A-Z]' '[a-z]')
GAMENAME=$(echo $1|tr '[a-z]' '[A-Z]')
if [ ! -f ${RsyncDir}/${GameName}.txt ];then
  echo "FUCK_ERROR ${RsyncDir}/${GameName}.txt not exist in $RsyncDir on $HostName FUCK_ERROR exit 400"
  exit 404
else
. ${RsyncDir}/${GameName}.txt
fi

#下载目录
DownLoadDir=/data/file/$GameName

All_Salt_Keys="$GAMENAME-"
#2
allplatform=$2
AllPlatform=$(echo $2|tr '[A-Z]' '[a-z]'|tr ',' ' ')
echo "AllPlatform $AllPlatform"
AllPlatform_Tuple=($AllPlatform)
PlatForm=${AllPlatform_Tuple[0]}

AllArgs=$*

#if [ "$3"x == "$4"x ];then
#   echo "only update nginx conf,do nothing!"
#   exit
#fi


#
#if [ $# -eq 3 ];then
#  shift 2
#  AllPackages=$*
#else
#  AllPackages=$3
#fi 
NEED_ROLE=""
echo "GameName is $GameName"
echo "allplatform is $allplatform"
echo "AllPackages are $AllPackages"
#sh $DownShell $GameName $allplatform $AllPackages


#推送torrent至客户端
function saltcp_torrent(){
echo $All_Salt_Keys
echo "%%%%%%%%%%%%%%"
salt -E "$GAMENAME-.*" cp.get_file $SaltDir/$GameName/game.torrent /data/torrent/game.torrent
#salt -E "$GAMENAME-.*-GZ-*" cmd.run "rm -rf /data/game_cache/*"
}

#p2p下载
function salt_p2p(){
 	salt -E "$All_Salt_Keys" ${GameName}.download_gamefile
}

#校验种子生成时间10分钟内的,由198salt推送过来
function check_torrent(){
  echo "check_torrent in 10min"
  TF=$TorrentDir/$GameName/game.torrent
  TT=$(stat -c %Y $TF)
  TN=$(date +%s)
  echo "$TT $TN"
  CT=0
  until [[ $TT -gt $TN ]]
    do 
        echo "$TT large than $TN"
        sleep 10 
        let "CT++"
        TT=$(stat -c %Y $TF)
        echo $CT
        if [[ $CT -gt 30 ]];then
           echo "FUCK_ERROR,$TF not changed in time ,please check"
           exit 44
        fi
    
    done
}

check_torrent
sleep 5
saltcp_torrent
#salt_p2p
