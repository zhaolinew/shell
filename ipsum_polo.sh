#!/bin/bash
LOG=ipsum.log
echo "`date '+%F %T'`" >> $LOG
if [ -e /usr/bin/netstat ]; then
	netstat -nto | awk -F':| +' 'BEGIN{printf "%-15s %s\n","IPs","Counts"}!/::|^Proto|^Active|^State|0.0.0.0/{ip[$6]++}\
															 END{for(i in ip){printf "%-15s %s\n",i,ip[i]}}' |sort -t: -k3 -rn | tee -a $LOG
else
	ss -nto | awk -F':| +' 'BEGIN{printf "%-15s %s\n","IPs","Counts"}!/::|^Proto|^Active|^State|0.0.0.0/{ip[$6]++}\
                          END{for(i in ip){printf "%-15s %s\n",i,ip[i]}}' | sort -t: -k3 -rn | tee -a $LOG
fi
echo -e "log saved to file \e[1;31m$LOG\e[0m"
echo -e "\r\r">> $LOG


