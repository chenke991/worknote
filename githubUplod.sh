#!/bin/sh
#上传github
set -o
Dir=/media/chenke/home/chenke/worknote
Time=$(date)
cd $Dir
git add * 
git commit -m "commit at $Time"
git push
