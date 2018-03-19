#!/bin/bash
#视频推流path
pushStreamPath=rtmp://127.0.0.1:8080/live
#视频拉流path
pullStreamUrl=http://127.0.0.1
#logPath
logPath=/zhuawawa_config/shell/sh-log
#secret key
sk=1234
#侧摄像头宽度
width=480
#侧摄像头高度
height=360
#推流到websocket监听端口
arrayPorts=(10012 10016 10020 10024 10028 10032 10036 10040 10044 10048 10052 10056 10060 10064)
echo '娃娃机代理推流侧频道数:'${#arrayPorts[@]}
sourceArrays=('192.168.0.138video0' '192.168.0.110video1' '192.168.0.117video1' '192.168.0.118video0'
 '192.168.0.111video0' '192.168.0.102video1' '192.168.0.127video1' '192.168.0.126video0' '192.168.0.121video1'
 '192.168.0.128video0' '192.168.8.105video1' '192.168.8.104video1' '192.168.0.116video1' '192.168.8.100video1')
for((i=0;i<${#arrayPorts[@]};i++))
do
 echo 'copy '${sourceArrays[$i]}' stream'
 nohup ffmpeg -i $pushStreamPath/${sourceArrays[$i]} -f mpeg1video -b:v 600k -r 30 $pullStreamUrl:${arrayPorts[$i]}/$sk/$width/$height >$logPath/ffmpeg-${arrayPorts[$i]}.out 2>&1 &
done
