#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-15
#FileName：		array33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
declare -A DISK
WAR=3
df | grep '^/dev/sd' > df.log
while read line; do
	INDEX=`echo $line | sed -rn 's#^([^[:space:]]+) .*#\1#p'`
	DISK[$INDEX]=`echo $line| sed -rn 's#^.* ([0-9]+)%.*#\1#p'`
	if [ ${DISK[$INDEX]} -gt $WAR ]; then
		wall $INDEX : ${DISK[$INDEX]}
	fi
done < df.log
