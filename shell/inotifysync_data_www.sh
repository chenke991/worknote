#!/bin/bash
#Fri Apr 12 17:44:31 CST 2019
#chenke

ConfigFile=/data/alioss/ossutilconfig
DESTHOSTDIR=/www/htdocs/
SRCDIR=/data/tmp/

bwdl=(xiyoucdn fwcq)
gzdh=(xiyoucdn gzdh)
sgqjz=(xiyoucdn sgqjz)
tx=(xiyoucdn wawa)
wqyry=(xiyoucdn wqyry)
allgames="|bwdl|gzdh|sgqjz|tx|wqyry|"

function ossutil(){

FILECHANGE=$1
Bucket_dir=$2

echo "/data/alioss/ossutil cp -rf $FILECHANGE oss://$Bucket_dir --jobs=1 --parallel=5 --config-file /data/alioss/ossutilconfig --retry-times=3"

}

inotifywait -mr --timefmt '%d/%m/%y %H:%M' --format '%T %w %f' -e close_write $SRCDIR |  while read DATE TIME DIR FILE; do

       FILECHANGE=${DIR}${FILE}
       GameName=$(echo ${DIR}|awk -F"/" '{print $4}')
       BucketName=${!GameName[0]}
       if [ ${#BucketName} != 0 ];then
         eval BucketDir=\${$GameName[1]}
         eval BucketFile=${FILECHANGE#${SRCDIR}${GameName}*}
         Bucket_dir=$BucketName/$BucketDir$BucketFile
         echo $GameName
         echo "BucketName is $BucketName BucketDir is $BucketDir BucketFile=$BucketFile Bucket_dir=$Bucket_dir"

         ossutil $FILECHANGE $Bucket_dir

         echo "At ${TIME} on ${DATE}, file $FILECHANGE was rsync  BucketName is $BucketName BucketDir is $BucketDir" >> /var/log/sync.log
      else
         echo "$GameName not exist "
     fi
done
