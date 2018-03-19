#!/bin/bash
#视频推流path
pushStreamPath=rtmp://127.0.0.1:8080/live
#视频拉流path
pullStreamUrl=http://127.0.0.1
#logPath
logPath=/zhuawawa_config/shell/sh-log
#secret key
sk=1234
#主摄像头宽度
width=480
#主摄像头高度
height=360
#推流到websocket监听端口
arrayPorts=(10010 10014 10018 10022 10026 10030 10034 10038 10042 10046 10050 10054 10058 10062)
echo '娃娃机代理推流频道数：'${#arrayPorts[@]}
sourceArrays=('192.168.0.138video1' '192.168.0.110video0' '192.168.0.117video0' '192.168.0.118video1' '192.168.0.111video1'
 '192.168.0.102video0' '192.168.0.127video0' '192.168.0.126video1' '192.168.0.121video0' '192.168.0.128video1'
 '192.168.8.105video0' '192.168.8.104video0' '192.168.0.116video0' '192.168.8.100video0')
for((i=0;i<${#arrayPorts[@]};i++))
do
 echo 'copy '${sourceArrays[$i]}' stream'
 nohup ffmpeg -i $pushStreamPath/${sourceArrays[$i]} -f mpeg1video -b:v 600k -r 30 $pullStreamUrl:${arrayPorts[$i]}/$sk/$width/$height >$logPath/ffmpeg-${arrayPorts[$i]}.out 2>&1 &
done
