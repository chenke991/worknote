#!/bin/sh
#scp from 99 
IP=172.0.0.199
for i in  dhcp.template start_in_docker.sh Dockerfile start.sh rmcobbler.sh cdcobbler.sh Dockerfile
do
   scp -P59878 ${IP}:/data/cobbler/$i /Users/chenke/Documents/worknote/cobbler
done

scp -r -P59878 ${IP}:/data/cobbler/etc/cobbler/bash /Users/chenke/Documents/worknote/cobbler/


#update to github
sh /Users/chenke/Documents/worknote/githubUplod.sh
