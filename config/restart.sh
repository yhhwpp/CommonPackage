ps -ef|grep v2ray|grep -v grep|grep -v controller|awk '{printf "kill -9 " $2}'|sh
cd ~/v2
nohup ./v2ray >run.log &