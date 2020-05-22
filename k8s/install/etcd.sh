#!/bin/sh
#curl -sSL https://dl.k8s.io/release/stable.txt 获取最新版本，这里用1.18.2
#1.可执行文件kubelet kubeadm kubectl 放在本机/tmp/k8s/目录下
#2.以下主机间用root ssh 22 端口key登陆,且没密码,部署完成后即可更改ssh登陆端口
export HOST0=192.168.238.229
export HOST1=192.168.1.100
export HOST2=192.168.1.101
export VIP=192.168.0.254
export DownKubeUri="http://121.46.17.198/k8s"
export Version=1.18.2

rm -rf /tmp/${HOST0}/ /tmp/${HOST1}/ /tmp/${HOST2}/
mkdir -p /tmp/${HOST0}/ /tmp/${HOST1}/ /tmp/${HOST2}/
ETCDHOSTS=(${HOST0} ${HOST1} ${HOST2})
ETCDHOSTA=(${HOST1} ${HOST2})
NAMES=("infra0" "infra1" "infra2")
ETCD_TAG=$(kubeadm config images list --kubernetes-version  1.18.2 2>/dev/null|grep etcd|awk -F":" '{print $NF}')

function createCfg(){
for i in "${!ETCDHOSTS[@]}"; do
HOST=${ETCDHOSTS[$i]}
NAME=${NAMES[$i]}
echo "i@@@@ $NAME"
cat << EOF > /tmp/${HOST}/kubeadmcfg.yaml
apiVersion: "kubeadm.k8s.io/v1beta2"
kind: ClusterConfiguration
etcd:
    local:
        serverCertSANs:
        - "${HOST}"
        peerCertSANs:
        - "${HOST}"
        extraArgs:
            initial-cluster: ${NAMES[0]}=https://${ETCDHOSTS[0]}:2380,${NAMES[1]}=https://${ETCDHOSTS[1]}:2380,${NAMES[2]}=https://${ETCDHOSTS[2]}:2380
            initial-cluster-state: new
            name: ${NAME}
            listen-peer-urls: https://${HOST}:2380
            listen-client-urls: https://${HOST}:2379
            advertise-client-urls: https://${HOST}:2379
            initial-advertise-peer-urls: https://${HOST}:2380
EOF
done

}

function createKey(){
kubeadm init phase certs etcd-ca

kubeadm init phase certs etcd-server --config=/tmp/${HOST2}/kubeadmcfg.yaml
kubeadm init phase certs etcd-peer --config=/tmp/${HOST2}/kubeadmcfg.yaml
kubeadm init phase certs etcd-healthcheck-client --config=/tmp/${HOST2}/kubeadmcfg.yaml
kubeadm init phase certs apiserver-etcd-client --config=/tmp/${HOST2}/kubeadmcfg.yaml
cp -R /etc/kubernetes/pki /tmp/${HOST2}/



# cleanup non-reusable certificates
find /etc/kubernetes/pki -not -name ca.crt -not -name ca.key -type f -delete

kubeadm init phase certs etcd-server --config=/tmp/${HOST1}/kubeadmcfg.yaml
kubeadm init phase certs etcd-peer --config=/tmp/${HOST1}/kubeadmcfg.yaml
kubeadm init phase certs etcd-healthcheck-client --config=/tmp/${HOST1}/kubeadmcfg.yaml
kubeadm init phase certs apiserver-etcd-client --config=/tmp/${HOST1}/kubeadmcfg.yaml
cp -R /etc/kubernetes/pki /tmp/${HOST1}/
find /etc/kubernetes/pki -not -name ca.crt -not -name ca.key -type f -delete

kubeadm init phase certs etcd-server --config=/tmp/${HOST0}/kubeadmcfg.yaml
kubeadm init phase certs etcd-peer --config=/tmp/${HOST0}/kubeadmcfg.yaml
kubeadm init phase certs etcd-healthcheck-client --config=/tmp/${HOST0}/kubeadmcfg.yaml
kubeadm init phase certs apiserver-etcd-client --config=/tmp/${HOST0}/kubeadmcfg.yaml
# No need to move the certs because they are for HOST0

# clean up certs that should not be copied off this host
find /tmp/${HOST2} -name ca.key -type f -delete
find /tmp/${HOST1} -name ca.key -type f -delete

}

function scpFilesToAllEtcdHost(){
kubeadm init phase etcd local --config=/tmp/${HOST0}/kubeadmcfg.yaml
sed -i  "s@61.160@192.168@g;/path/ s@/var/lib/etcd@/data/etcd@g" /etc/kubernetes/manifests/etcd.yaml
mv /etc/kubernetes/manifests/etcd.yaml /etc/kubernetes/manifests/etc.yaml
systemctl start kubelet

for i in "${!ETCDHOSTA[@]}"; do
HOST=${ETCDHOSTA[$i]}
echo "scp -r /tmp/${HOST}/* ${HOST}:/root/"

scp -r /tmp/${HOST}/* ${HOST}:/root/
ssh root@${HOST} " \cp -rf /root/pki /etc/kubernetes "
ssh root@${HOST} 'systemctl start kubelet && kubeadm init phase etcd local --config=/root/kubeadmcfg.yaml && sed -i  "s@61.160@192.168@g;/path/ s@/var/lib/etcd@/data/etcd@g" /etc/kubernetes/manifests/etcd.yaml && mv /etc/kubernetes/manifests/etcd.yaml /etc/kubernetes/manifests/etc.yaml'
done
}


function CheckEtcd(){

echo "docker run --rm -it \
--net host \
-v /etc/kubernetes:/etc/kubernetes k8s.gcr.io/etcd:${ETCD_TAG} etcdctl \
--cert /etc/kubernetes/pki/etcd/peer.crt \
--key /etc/kubernetes/pki/etcd/peer.key \
--cacert /etc/kubernetes/pki/etcd/ca.crt \
--endpoints https://${HOST0}:2379 endpoint health --cluster"

docker run --rm -it \
--net host \
-v /etc/kubernetes:/etc/kubernetes k8s.gcr.io/etcd:${ETCD_TAG} etcdctl \
--cert /etc/kubernetes/pki/etcd/peer.crt \
--key /etc/kubernetes/pki/etcd/peer.key \
--cacert /etc/kubernetes/pki/etcd/ca.crt \
--endpoints https://${HOST0}:2379 endpoint health --cluster


}

function installKubelet(){
mkdir -p /tmp/k8s

cat << EOF > /tmp/k8s/install.sh
#!/bin/bash
apt install -y conntrack socat ipvsadm
for s in kubelet kubeadm kubectl kubelet-pre-start.sh
do
	file=/usr/bin/$s
	if [ ! -f $file ];then
		echo "wget -O $file $DownKubeUri/$Version/$s "
		wget -O $file $DownKubeUri/$Version/$s 
		[ $? -ne 0 ] && echo "FUCKERROR wget $DownKubeUri/$Version/$s to $file error"
                exit 44
        fi
done

mkdir -p /etc/systemd/system/kubelet.service.d/
mkdir -p /etc/kubernetes/manifests/
chmod +x /root/k8s/kubelet-pre-start.sh
\mv /root/k8s/20-etcd-service-manager.conf /etc/systemd/system/kubelet.service.d/ && mv /root/k8s/kubelet-pre-start.sh /usr/bin/ && mv /root/k8s/kubelet.service /etc/systemd/system/ && systemctl daemon-reload && systemctl restart kubelet
EOF

cat << EOF > /tmp/k8s/20-etcd-service-manager.conf
[Service]
ExecStart=
#  Replace "systemd" with the cgroup driver of your container runtime. The default value in the kubelet is "cgroupfs".
ExecStart=/usr/bin/kubelet --address=127.0.0.1 --pod-manifest-path=/etc/kubernetes/manifests --cgroup-driver=systemd
Restart=always
EOF

cat <<EOF > /tmp/k8s/kubelet.service
[Unit]
Description=kubelet: The Kubernetes Node Agent
Documentation=http://kubernetes.io/docs/

[Service]
ExecStart=/usr/bin/kubelet
ExecStartPre=/usr/bin/kubelet-pre-start.sh
Restart=always
StartLimitInterval=0
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

cat << EOF >/tmp/k8s/kubelet-pre-start.sh
#!/bin/bash
# Open ipvs
modprobe -- ip_vs
modprobe -- ip_vs_rr
modprobe -- ip_vs_wrr
modprobe -- ip_vs_sh
if [[ $(uname -r |cut -d . -f1) -ge 4 && $(uname -r |cut -d . -f2) -ge 19 ]]; then
  modprobe -- nf_conntrack
else
  modprobe -- nf_conntrack
fi

cat <<EF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EF
sysctl --system
sysctl -w net.ipv4.ip_forward=1
# systemctl stop firewalld && systemctl disable firewalld
swapoff -a
#setenforce 0
exit 0
EOF

for i in "${!ETCDHOSTS[@]}"; do
HOST=${ETCDHOSTS[$i]}
echo "scp -r /tmp/k8s ${HOST}:/root"

scp -r /tmp/k8s ${HOST}:/root/
ssh root@${HOST} " bash /root/k8s/install.sh"
done

}


function clearEtcd(){
for i in "${!ETCDHOSTS[@]}"; do

HOST=${ETCDHOSTS[$i]}
echo $HOST
ssh root@${HOST} 'rm -rf /etc/kubernetes /data/etcd /var/lib/etcd /root/pki /root/kubeadmcfg.yaml /root/kube /root/.kube rm -rf /tmp/192.168* && sleep 5 &&  docker ps '
done 
}

function clearKubeletSvc(){
for i in "${!ETCDHOSTS[@]}"; do
HOST=${ETCDHOSTS[$i]}
echo $HOST
ssh root@${HOST} 'rm -f /etc/systemd/system/kubelet.service.d/20-etcd-service-manager.conf && systemctl daemon-reload && systemctl stop kubelet'
done


}

function installHaproxy(){
echo "install Haproxy"
cat <<EOF>/tmp/installhaproxy.sh
#!/bin/sh
apt install -y haproxy
cat <<EF>>/etc/haproxy/haproxy.cfg
listen status
        bind *:51080
        stats refresh 3s
        stats uri /stats
        stats realm Haproxy Manager
        stats auth chenke:www.52xiyou.com



listen apiserver-k8s
        bind *:56443
        default_backend k8sapis

backend k8sapis
        server k8sapis1 127.0.0.1:6443
        server k8sapis2 ${HOST0}:6443
        server k8sapis3 ${HOST1}:6443
        server k8sapis4 ${HOST2}:6443
EF
/usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg

EOF
for i in "${!ETCDHOSTS[@]}"; do
HOST=${ETCDHOSTS[$i]}
echo $HOST
scp  /tmp/installhaproxy.sh root@${HOST}:/root/
ssh root@${HOST} 'bash /root/installhaproxy.sh'
done


}



function installKeepalive(){
echo "install keepalive"
cat >/tmp/installkeepalive.sh <<EOF
#!/bin/sh
apt install -y keepalived
cat>/etc/keepalived/keepalived.conf<<EF
global_defs {
   router_id LVS_Master
}

vrrp_instance VI_1 {
    state MASTER               #指定instance初始状态，实际根据优先级决定.backup节点不一样
    interface ens3             #虚拟IP所在网
    virtual_router_id 88       #VRID，相同VRID为一个组，决定多播MAC地址
    priority 100               #优先级，另一台改为90.backup节点不一样
    advert_int 1               #检查间隔
    authentication {
        auth_type PASS         #认证方式，可以是pass或ha
        auth_pass 1113         #认证密码
    }
    virtual_ipaddress {
        192.168.0.254        #VIP地址
    }
}
EF
systemctl restart keepalived
EOF

for i in "${!ETCDHOSTSA[@]}"; do
HOST=${ETCDHOSTSA[$i]}
echo $HOST
scp /tmp/installkeepalive.sh root@${HOST}:/root
ssh root@${HOST} 'bash /root/installkeepalive.sh'
done
}


function installK8s(){
#echo "enbale ipvs"
#cat >>/root/kubeadm.yaml <<EOF
#apiVersion: kubeproxy.config.k8s.io/v1alpha1
#kind: KubeProxyConfiguration
#mode: ipvs
#EOF
wget -O /root/kubeadm.yaml $DownKubeUri/${Version}/kubeadm.yaml
sed -i "s/HOST0/${HOST0}/g" /root/kubeadm.yaml
sed -i "s/HOST1/${HOST1}/g" /root/kubeadm.yaml
echo "sed -i s/HOST2/${HOST2}/g /root/kubeadm.yaml"
sed -i "s/HOST2/${HOST2}/g" /root/kubeadm.yaml
sed -i "s/VIP/$VIP/g" /root/kubeadm.yaml
kubeadm init    --config=/root/kubeadm.yaml --upload-certs  --v=6
echo " run as to add master  kubeadm join $VIP:56443 --token 9o17md.zncnim7w0kspe4l0     --discovery-token-ca-cert-hash sha256:e64fff43f427fd167df43e7e4f2ab9f9790d7ba635589b95271a02b6e2afd307     --control-plane --certificate-key d4273f19837d7b219ffccdcf5105c776a11cfd81edfe7a0fe49dff556e6e9521 --ignore-preflight-errors=all --v=6"

}

function installDeployment(){
mkdir /root/k8s/
cd /root/k8s/
for i in ingressds.yaml ingressrbac.yaml ingressroutes.yaml ingresssvcs.yaml recommended.yaml
do 
   echo $i
   
   kubectl apply -f http://121.46.17.198/k8s/1.18.2/system/$i
done
}

case $1 in
etcd)
#  installHaproxy
#  installKeepalive
  installKubelet
  createCfg
  createKey
  scpFilesToAllEtcdHost
  sleep 5
  CheckEtcd
  sleep 5
#  clearKubeletSvc
;;
clearKubeletSvc)
  clearKubeletSvc
;;
installK8s)
   installK8s
	;;
installDeployment)
   installDeployment
   ;;
clear)
  clearEtcd
  ;;
*)
	echo "ERROR!!! sh $0 clear|etcd|clearKubeletSvc|installK8s|installDeployment"
esac
