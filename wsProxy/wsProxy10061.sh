#!/bin/bash
#声明node拉流path
nodePath=/usr/local/ws-push-stream
#声明监听端口数组
httpPort=10060
wsPort=10061
logPath=/zhuawawa_config/shell/sh-log
echo 'http listening ffmpeg push stream port:'$httpPort
echo 'websocket listening pull stream port:'$wsPort
nohup node $nodePath/stream-server.js 1234 $httpPort $wsPort > $logPath/ws-$wsPort.out 2>&1 &