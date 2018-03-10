#!/bin/bash
#声明node拉流path
nodePath=/usr/local/ws-push-stream
logPath=/zhuawawa_config/shell/sh-log
#声明监听端口数组
arrayPorts=(10010 10011 10012 10013 10014 10015 10016 10017 10018 10019 10020 10021 10022 10023 10024 10025 10026 10027 10028 10029 10030 10031 10032 10033 10034 10035 10036 10037
 10038 10039 10040 10041 10042 10043 10044 10045 10046 10047 10048 10049 10050 10051 10052 10053 10054 10055 10056 10057 10058 10059 10060 10061 10062 10063 10064 10065)
apl=${#arrayPorts[@]}
echo '娃娃机代理拉流频道数:' $[apl/2]
for((i=0;i<${#arrayPorts[@]};i=i+2))
do
   echo 'http listening push stream port:'${arrayPorts[$i]}
   echo 'websocket listening pull stream port:'${arrayPorts[$i+1]}
   nohup node $nodePath/stream-server.js 1234 ${arrayPorts[$i]} ${arrayPorts[$i+1]} > $logPath/ws-${arrayPorts[$i+1]}.out 2>&1 &
done
