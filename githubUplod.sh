#!/bin/sh
#上传github
set -o
Dir=$HOME/worknote
Time=$(date)
cd $Dir
/usr/bin/git pull
/usr/bin/git add * 
/usr/bin/git commit -m "commit at $Time"
/usr/bin/git push
echo "git push to github at $Time " > /tmp/gitpush.log
