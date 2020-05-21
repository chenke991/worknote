#!/bin/sh
kubeadm reset
rm -rf /var/lib/etcd
ipvsadm --clear
ps -ef|grep kubelet
docker ps
