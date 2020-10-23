#!/bin/sh
echo "run in docker cobbler to start tftp dhcpd "
cobbler sync
systemctl restart dhcpd
systemctl restart tftp
cobbler import --name="ubuntu18.04" --path=/mnt
cobbler profile edit --name=ubuntu18.04-x86_64 --distro=ubuntu18.04-x86_64 --kickstart=/var/lib/cobbler/kickstarts/ubuntu18.04_xiyou.seed
