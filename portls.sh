#!/bin/bash
for((i=10010;i<10066;i++))
do
 echo '监听端口：'$i
 netstat -ap | grep $i
done