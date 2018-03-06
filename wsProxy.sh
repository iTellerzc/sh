#!/bin/bash
#声明node拉流path
nodePath=/home/push-stream
#声明监听端口数组
arrayPorts=(10010 10011 10012 10013)
apl=${#arrayPorts[@]}
echo '娃娃机代理拉流频道数:' $[apl/2]
for((i=0;i<${#arrayPorts[@]};i=i+2))
do
   echo 'http listening push stream port:'${arrayPorts[$i]}
   echo 'websocket listening pull stream port:'${arrayPorts[$i+1]}
   node $nodePath/stream-server.js 1234 ${arrayPorts[$i]} ${arrayPorts[$i+1]} > ./sh-log/ws-${arrayPorts[$i+1]}.out
   #echo 'http push stream port listened:'${arrayPorts[$i]}', websocket pull stream port listened:'${arrayPorts[$i+1]}
done
