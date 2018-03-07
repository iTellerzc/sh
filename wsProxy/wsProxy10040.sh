#!/bin/bash
#声明node拉流path
nodePath=/usr/local/ws-push-stream
#声明监听端口数组
httpPort=10040
wsPort=10041
logPath=/zhuawawa_config/shell/sh-log
echo 'http listening push stream port:'$httpPort
echo 'websocket listening pull stream port:'$wsPort
node $nodePath/stream-server.js 1234 $httpPort $wsPort > $logPath/http-$httpPort.out