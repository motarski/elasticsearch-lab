#!/bin/bash

readonly ES_VERSION=2.4.2

echo "[TASK 1] Update Elastic search hosts in hosts /etc/hosts file"
cat >>/etc/hosts<<EOF
192.168.1.200 elastic-lab.local elastic-lab
192.168.1.201 elastic-lab1.local elastic-lab1
192.168.1.202 elastic-lab2.local elastic-lab2
192.168.1.203 elastic-lab3.local elastic-lab3
EOF

echo "[TASK 2] Enable ssh password authentication"
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl reload sshd

echo "[TASK 3] Set root password"
echo "ansible" | passwd --stdin root >/dev/null 2>&1

echo "[TASK 4] Update vagrant user's bashrc file"
echo "export TERM=xterm" >> /etc/bashrc

echo "[TASK 5] Install packages on all VM's"
sudo apt-get update
sudo apt-get install sshpass bash-completion -y
cp elasticsearch-${ES_VERSION}.zip /home/vagrant
