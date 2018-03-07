#!/bin/bash
#视频推流path
pushStreamPath=rtmp://101.132.99.221:8080/live
#视频拉流path
pullStreamUrl=http://101.132.99.221
#secret key
sk=1234
#宽度
width=480
#高度
height=360
#推流到websocket监听端口
arrayPorts=(10011 10013 10015 10017 10019 10021 10023 10025 10027 10029 10031 10033 10035 10037
 10039 10041 10043 10045 10047 10049 10051 10053 10055 10057 10059 10061 10063 10065)
echo '娃娃机代理推流频道数：'${#arrayPorts[@]}
sourceArrays=('192.168.0.108video1' '192.168.0.108video0' '192.168.0.110video0' '192.168.0.110video1' '192.168.0.117video0' '192.168.0.117video1'
 '192.168.0.118video1' '192.168.0.118video0' '192.168.0.111video1' '192.168.0.111video0' '192.168.0.102video0' '192.168.0.102video1' '192.168.0.127video0'
 '192.168.0.127video1' '192.168.0.119video1' '192.168.0.119video0' '192.168.0.125video0' '192.168.0.125video1' '192.168.0.134video1' '192.168.0.134video0'
 '192.168.8.105video0' '192.168.8.105video1' '192.168.8.104video0' '192.168.8.104video1' '192.168.0.116video0' '192.168.0.116video1' '192.168.8.100video0'
 '192.168.8.100video1')
for((i=0;i<${#arrayPorts[@]};i++))
do
 ffmpeg -i $pushStreamPath/${sourceArrays[$i]} -f mpeg1video -b:v 600k -r 30 $pullStreamUrl:${arrayPorts[$i]}/$sk/$width/$height
done
