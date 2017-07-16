# README

## 未完成
## 仕様
* vagrant
* centos7
* openstack mitaka

## ssh
vagrant ssh
か
poderosaでssh 接続　vagrant / vagrant

最新のcentos7の公式イメージではパスワード認証が無効化されている。有効化

```
sudo vi /etc/ssh/sshd_config
# => PasswordAuthentication yes

sudo systemctl restart sshd 
```
## root passwd
sudo passwd
でrootのパスワードを
vagrant
に設定　インストール時に聞かれるので設定しておく。

## SELinuxの設定
再起動の際もSELinuxの状態を保持したい場合は、/etc/selinux/configを直接編集します。
1
```
sudo vi /etc/selinux/config
SELINUX=enforcing
```
→
```
SELINUX=permissive
```

```
## service settings
sudo systemctl disable firewalld
sudo systemctl stop firewalld
sudo systemctl disable NetworkManager
sudo systemctl stop NetworkManager
sudo systemctl enable network
sudo systemctl start network

## yum install
sudo yum install https://repos.fedorapeople.org/repos/openstack/openstack-mitaka/rdo-release-mitaka-5.noarch.rpm
sudo yum update -y
sudo yum install -y openstack-packstack
sudo sed -i "s/^enabled=1/enabled=0/g" /etc/yum.repos.d/rdo-release.repo
```

現在、mitakaではなくおそらくnewtonが最新で入ってしまう（rdoがバージョンアップしている）
```
cat /etc/yum.repos.d/rdo-release.repo
```
で確認できるみたい。

参照：
http://noaboutsnote.hatenablog.com/entry/packstack_old_version
最新版newtonではnagiosが出ない　openstack-statusコマンドがないなどいろいろ違いや問題がある。

```
packstack --install-hosts=192.168.33.10
```


