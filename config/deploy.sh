#安装wget
yum -y install wget
#安装yum库
wget https://copr.fedorainfracloud.org/coprs/librehat/shadowsocks/repo/epel-7/librehat-shadowsocks-epel-7.repo
cp librehat-shadowsocks-epel-7.repo /etc/yum.repos.d/
yum -y update
#安装ss
yum install zip unzip vim git shadowsocks-libev rng-tools jq java-1.8.0-openjdk -y
#启动rngd服务
rngd -r /dev/urandom
#下载安装v2ray和相关脚本
mkdir ~/v2
cd ~/v2
mkdir logs
wget --no-check-certificate https://raw.githubusercontent.com/freeeeeedom/CommonPackage/master/config/v2ray-linux-64.zip && unzip v2ray-linux-64.zip
wget --no-check-certificate https://raw.githubusercontent.com/freeeeeedom/CommonPackage/master/config/restart.sh -O restart.sh && chmod +x restart.sh
wget --no-check-certificate https://raw.githubusercontent.com/freeeeeedom/CommonPackage/master/config/config.json -O config.json


#防火墙开放端口 20710-20729
firewall-cmd --zone=public --add-port=20710-20729/tcp --permanent
firewall-cmd --reload

#安装bbr 
wget --no-check-certificate https://raw.githubusercontent.com/freeeeeedom/CommonPackage/master/config/bbr_install.sh -O bbr_install.sh && chmod +x bbr_install.sh && ./bbr_install.sh
