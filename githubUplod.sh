#!/bin/sh
#上传github
set -o
Dir=/media/chenke/home/chenke/worknote
Time=$(date)
cd $Dir
/usr/bin/git add * 
/usr/bin/git commit -m "commit at $Time"
/usr/bin/git push
