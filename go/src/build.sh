#!/bin/bash
sh /Users/chenke/Documents/worknote/githubUplod.sh
Main="/data4t/wqyry/check/main"
checkFile="/data/tmp/main"

CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build main.go -o /tmp/main
scp /tmp/main 10.1.2.188:/tmp/
\ssh 10.1.2.188 "mv /tmp/main $Main  && chmod +x $Main && $Main"
\ssh 10.1.2.188 "sh /data4t/wqyry/check/sync.sh"
