#!/bin/bash
#视频推流path
pushStreamPath=rtmp://101.132.99.221:8080/live
pullStreamUrl=http://192.168.1.56
sk=1234
width=480
height=360
#推流到websocket监听端口
arrayPorts=(10010 10012)
echo '娃娃机代理推流频道数：'${#arrayPorts[@]}
sourceArrays=('192.168.0.108video1' '192.168.0.108video0')
for((i=0;i<${#arrayPorts[@]};i++))
do
 ffmpeg -i $pushStreamPath/${sourceArrays[$i]} -f mpeg1video -b:v 600k -r 30 $pullStreamUrl:${arrayPorts[$i]}/$sk/$width/$height
done
