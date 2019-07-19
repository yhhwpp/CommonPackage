yum -y install wget
wget https://copr.fedorainfracloud.org/coprs/librehat/shadowsocks/repo/epel-7/librehat-shadowsocks-epel-7.repo
cp librehat-shadowsocks-epel-7.repo /etc/yum.repos.d/
yum -y update
yum install zip unzip vim git shadowsocks-libev rng-tools -y

rngd -r /dev/urandom
mkdir ~/v2
cd ~/v2
mkdir logs
wget --no-check-certificate https://raw.githubusercontent.com/freeeeeedom/CommonPackage/master/config/restart.sh -O restart.sh && chmod +x restart.sh
wget --no-check-certificate https://raw.githubusercontent.com/freeeeeedom/CommonPackage/master/config/config.json -O config.json
wget --no-check-certificate https://github.com/v2ray/v2ray-core/releases/download/v4.20.0/v2ray-linux-64.zip
unzip v2ray-linux-64.zip

firewall-cmd --zone=public --add-port=10010/tcp --permanent
firewall-cmd --zone=public --add-port=10011/tcp --permanent
firewall-cmd --reload

#安装bbr 
wget --no-check-certificate https://raw.githubusercontent.com/freeeeeedom/CommonPackage/master/config/bbr_install -O bbr_install && chmod +x bbr_install && ./bbr_install