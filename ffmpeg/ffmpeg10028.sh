#!/bin/bash
#视频推流path
pushStreamPath=rtmp://127.0.0.1:8080/live
#视频拉流path
pullStreamUrl=http://127.0.0.1
#logpath
logPath=/zhuawawa_config/shell/sh-log
#secret key
sk=1234
#宽度
#width=640
width=480
#高度
#height=480
height=360
#推流到websocket监听端口
wsProxyPort=10028
sourcePath='192.168.0.111video0' 
echo '娃娃机代理推流端口：'$wsProxyPort
echo '娃娃机原始拉流路径：'$sourcePath
nohup ffmpeg -i $pushStreamPath/$sourcePath -f mpeg1video -b:v 600k -r 10 $pullStreamUrl:$wsProxyPort/$sk/$width/$height > $logPath/ff-$wsProxyPort.out 2>&1 &
