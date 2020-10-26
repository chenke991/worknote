#!/bin/sh
#scp from 99 
IP=172.0.0.99
for i in Dockerfile start.sh rmcobbler.sh cdcobbler.sh Dockerfile
do
   scp -P59878 ${IP}:/data/cobbler/$i /Users/chenke/Documents/worknote/cobbler
done
#update to github
sh /Users/chenke/Documents/worknote/githubUplod.sh
