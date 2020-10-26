#!/bin/bash

cat >> /etc/systemd/system.conf << EOF
DefaultLimitNOFILE=1024000
DefaultLimitNPROC=1024000
EOF

#set ssh
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/#UseDNS yes/UseDNS no/' /etc/ssh/sshd_config
sed -i 's/#Port.*/Port 59878/' /etc/ssh/sshd_config
#sed -i 's/#PermitRootLogin yes/#PermitRootLogin no/' /etc/ssh/sshd_config
systemctl restart sshd
