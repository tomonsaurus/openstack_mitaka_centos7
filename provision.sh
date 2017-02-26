#!/usr/bin/env bash
################################################

echo "**exec user:"
whoami


################################################
#●
#sudo passwd
#でrootのパスワードを
#vagrant
#に設定　インストール時に聞かれるので設定しておく。

echo "vagrant" | sudo passwd --stdin root

################################################
#●
#SELinuxの設定
#再起動の際もSELinuxの状態を保持したい場合は、/etc/selinux/configを直接編集します。
#1
#sudo vi /etc/selinux/config
#SELINUX=enforcing
#→
#SELINUX=permissive

sudo sed -i "s/^SELINUX=enforcing/SELINUX=permissive/g" /etc/selinux/config


################################################
echo "**yum install"

sudo systemctl disable firewalld
sudo systemctl stop firewalld
sudo systemctl disable NetworkManager
sudo systemctl stop NetworkManager
sudo systemctl enable network
sudo systemctl start network



################################################
#最新のcentos7の公式イメージではパスワード認証が無効化されている。
#有効化する




sudo sed -i "s/^PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config

sudo systemctl restart sshd
sudo systemctl restart network


################################################

sudo yum install -y https://repos.fedorapeople.org/repos/openstack/openstack-mitaka/rdo-release-mitaka-5.noarch.rpm

sudo yum update -y
sudo yum install -y openstack-packstack
sudo sed -i "s/^enabled=1/enabled=0/g" /etc/yum.repos.d/rdo-release.repo



################################################
# todo
#packstack --gen-answer-file answer.txt

#packstack --install-hosts=192.168.33.10  --answer-file answer.txt

#packstack --install-hosts=192.168.33.10  















################################################
















echo "**end"
