yum -y install wget
wget https://copr.fedorainfracloud.org/coprs/librehat/shadowsocks/repo/epel-7/librehat-shadowsocks-epel-7.repo
cp librehat-shadowsocks-epel-7.repo /etc/yum.repos.d/
yum -y update
yum install zip unzip vim git epel-release gcc gettext autoconf libtool automake make pcre-devel asciidoc xmlto c-ares-devel libev-devel libsodium-devel mbedtls-devel shadowsocks-libev rng-tools -y

rngd -r /dev/urandom
mkdir ~/v2
cd ~/v2
mkdir logs
wget https://github.com/v2ray/v2ray-core/releases/download/v4.19.1/v2ray-linux-64.zip
unzip v2ray-linux-64.zip
wget https://raw.githubusercontent.com/freeeeeedom/resume/master/config.json -O config.json

#流量控制初始化
iptables -P INPUT ACCEPT
iptables -F
iptables -A OUTPUT -p tcp --sport 10010
iptables -A INPUT -p tcp --dport 10010

firewall-cmd --zone=public --add-port=10010/tcp --permanent
firewall-cmd --reload

#安装bbr 
wget --no-check-certificate https://raw.githubusercontent.com/freeeeeedom/resume/master/bbr_install && chmod +x bbr_install && ./bbr_install
reboot