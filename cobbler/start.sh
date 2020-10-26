#!/bin/sh
#prepaire dir
Dirs=(/data/cobbler/etc/cobbler /data/cobbler/var/www/cobbler/images /data/cobbler/var/www/cobbler/ks_mirror /data/cobbler/var/www/cobbler/rendered /data/cobbler/var/www/cobbler/links /data/cobbler/var/lib/cobbler/loaders /data/cobbler/var/lib/tftpboot /data/cobbler/etc/httpd)

for D in ${Dirs[@]}
do
        echo $D
	if [ ! -d $D ];then
		mkdir -p $D
	fi
done

Files=(/data/cobbler/etc/cobbler/settings /data/cobbler/etc/cobbler/debmirror.conf /data/cobbler/etc/cobbler/ubuntu18.04_xiyou.seed /data/cobbler/etc/cobbler/dhcp.template /data/cobbler/etc/httpd/cobbler_web.conf)
for D in ${Files[@]}
do
	if [ ! -f $D ];then
		echo "$D not exist! FUCK ERROR"
	fi
done

docker run \
-d \
--privileged \
--net host \
-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
-v /data/cobbler/etc/cobbler/settings:/etc/cobbler/settings \
-v /data/cobbler/etc/cobbler/start_in_docker.sh:/start_in_docker.sh \
-v /data/cobbler/etc/cobbler/debmirror.conf:/etc/debmirror.conf \
-v /data/cobbler/etc/cobbler/ubuntu18.04_xiyou.seed:/var/lib/cobbler/kickstarts/ubuntu18.04_xiyou.seed \
-v /data/cobbler/etc/cobbler/dhcp.template:/etc/cobbler/dhcp.template \
-v /data/cobbler/var/www/cobbler/images:/var/www/cobbler/images \
-v /data/cobbler/var/www/cobbler/ks_mirror:/var/www/cobbler/ks_mirror \
-v /data/cobbler/var/www/cobbler/rendered:/var/www/cobbler/rendered \
-v /data/cobbler/var/www/cobbler/links:/var/www/cobbler/links \
-v /data/cobbler/var/lib/cobbler/loaders/:/var/lib/cobbler/loaders/ \
-v /data/cobbler/var/lib/tftpboot:/var/lib/tftpboot \
-v /data/cobbler/etc/httpd/cobbler_web.conf:/etc/httpd/conf.d/cobbler_web.conf \
-v /mnt:/mnt:ro \
-p 69:69 \
-p 80:80 \
-p 443:443 \
-p 25151:25151 \
--name cobblerv2 cobbler:v1.6

echo "docker exec -it cobblerv2 /bin/bash ' sh /start_in_docker.sh (cobbler sync && systemctl start dhcpd && systemctl start tftp)'"
echo "###############################################"
echo " 
- cobbler signature report --name=ubuntu 查看签名校验
- cobbler check
- cobbler sync 配置同步
- cobbler get-loaders 下载网络引导文件
- cobbler distro list 查看已经存在的安装源
- cobbler import --name="ubuntu18.04" --path=/mnt/ubuntu18.04    【导入安装源】
- cobbler profile edit --name=ubuntu18.04-x86_64 --distro=ubuntu18.04-x86_64 --kickstart=/var/lib/cobbler/kickstarts/ubuntu18.04_xiyou.seed 指定发行版为ubuntu14，并指定 seed文件的名称和位置
- cobbler report 查看profile使用的seed等
"
#-v /data/cobbler/var/lib/cobbler/config/:/var/lib/cobbler/config/ \
#-v /data/cobbler/var/lib/cobbler/loaders/:/var/lib/cobbler/loaders/ \
