#!/bin/bash
#视频推流path
pushStreamPath=rtmp://101.132.99.221:8080/live
#视频拉流path
pullStreamUrl=http://127.0.0.1
#secret key
sk=1234
#宽度
width=480
#高度
height=360
#推流到websocket监听端口
wsProxyPort=10032
sourcePath='192.168.0.102video1' 
echo '娃娃机代理推流端口：'$wsProxyPort
echo '娃娃机原始拉流路径：'$sourcePath
ffmpeg -i $pushStreamPath/$sourcePath -f mpeg1video -b:v 600k -r 30 $pullStreamUrl:$wsProxyPort/$sk/$width/$height