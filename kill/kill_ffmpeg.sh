 #!/bin/bash
 for((i=10010; i<=10064; i=i+2))
   do
	    pid=$(netstat -nlp | grep :$i | awk '{print $7}' | awk -F"/" '{ print $1 }');
	    if [ $pid ]; then
	        echo "[${current_time}] The ffmpeg port:$i is listening" >> $log_path/monitor_$i.log
	        kill -9 $pid
	    else
	        echo "[${current_time}] The ffmpeg port:$i is not listening" >> $log_path/monitor_$i.log   
	    fi
	done