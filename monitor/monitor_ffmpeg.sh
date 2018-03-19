#!/bin/bash
log_path=/zhuawawa_config/shell/sh-log/
sh_path=/zhuawawa_config/shell/ffmpeg
while [ 1 ]
	do current_time=`date +"%Y-%m-%d %H:%M:%S"`
	   for((i=10010; i<=10064; i=i+2))
		   do
			    pidc=$(netstat -nlp | grep :$i | awk '{print $7}' | awk -F"/" '{ print $1 }' | wc -l);
			    if [ $pidc = 1 ]; then
			        echo "[${current_time}] The ffmpeg port:$i is listening" >> $log_path/monitor_$i.log
			    else
			        echo "[${current_time}] The ffmpeg port:$i is not listening" >> $log_path/monitor_$i.log   
			   		$sh_path/ffmpeg$i.sh
			    fi
			done
	sleep 60
done
