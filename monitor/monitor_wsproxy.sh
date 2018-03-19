#!/bin/bash
#日志path
log_path=/zhuawawa_config/shell/sh-log/
sh_path=/zhuawawa_config/shell/wsProxy
while [ 1 ]
	do current_time=`date +"%Y-%m-%d %H:%M:%S"`
	   for((i=10011; i<=10065; i=i+2))
		   do
			    pidc=$(netstat -nlp | grep :$i | awk '{print $7}' | awk -F"/" '{ print $1 }' | wc -l);
			    if [ $pidc = 1 ]; then
			        echo "[${current_time}] The node port:$i is listening" >> $log_path/monitor_$i.log
			    else
			        echo "[${current_time}] The node port:$i is not listening" >> $log_path/monitor_$i.log   
			   		$sh_path/wsProxy$i.sh
			    fi
			done
	sleep 60
done