yum -y install wget
wget https://copr.fedorainfracloud.org/coprs/librehat/shadowsocks/repo/epel-7/librehat-shadowsocks-epel-7.repo
cp librehat-shadowsocks-epel-7.repo /etc/yum.repos.d/
yum -y update
yum install zip unzip vim git epel-release gcc gettext autoconf libtool automake make pcre-devel asciidoc xmlto c-ares-devel libev-devel libsodium-devel mbedtls-devel shadowsocks-libev rng-tools -y

rngd -r /dev/urandom
mkdir ~/v2
cd ~/v2
wget --no-check-certificate https://raw.githubusercontent.com/freeeeeedom/CommonPackage/master/config/restart.sh && chmod +x restart.sh
mkdir logs
wget https://github.com/v2ray/v2ray-core/releases/download/v4.19.1/v2ray-linux-64.zip
unzip v2ray-linux-64.zip
wget --no-check-certificate https://raw.githubusercontent.com/freeeeeedom/CommonPackage/master/config/config.json -O config.json

firewall-cmd --zone=public --add-port=10010/tcp --permanent
firewall-cmd --zone=public --add-port=10011/tcp --permanent
firewall-cmd --reload

cd ~
wget --no-check-certificate https://raw.githubusercontent.com/freeeeeedom/CommonPackage/master/config/spy.sh && chmod +x spy.sh && echo "*/1 * * * * /root/./spy.sh" >> /var/spool/cron/root
#安装bbr 
wget --no-check-certificate https://raw.githubusercontent.com/freeeeeedom/CommonPackage/master/config/bbr_install && chmod +x bbr_install && ./bbr_install