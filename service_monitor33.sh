#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-13
#FileName：		service_monitor33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
SLEEPTIME=10
while :;do
	if ! killall -0 httpd &> /dev/null; then
		systemctl restart httpd &> /dev/null
		echo "At `date +'%F %T'` httpd is restarted" >> /var/log/monitor.log
	fi
	sleep $SLEEPTIME
done
