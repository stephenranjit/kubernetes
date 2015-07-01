#!/bin/sh

yum -y install openssh-server openssh-clients passwd

ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -P "" -N ""

echo "ALL : ALL" >> /etc/hosts.allow

cat > /etc/ssh/passwd <<- EOF
vagrant
vagrant
EOF

passwd < /etc/ssh/passwd

/usr/sbin/sshd -D