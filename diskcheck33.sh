#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-22
#FileName：		diskcheck33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
# Check disk space and get warning if more than $WAR

#DISKSPACE=`df | grep /dev/sd | tr -s " " % | cut -d% -f5 | sort -rn | head -1`

WAR=8
COLOR="\033[1;31m"
COLOREND="\033[0m"
COLOR1="\033[1;32m"
COLOREND1="\033[0m"
df | sed -nr '/\/dev\/sd/s/^([^[:space:]]+).* ([[:digit:]]+)%.*/\1 \2/p' | while read part use; do
	if [ "$use" -ge "$WAR" ] ; then
		echo -e Partition $part space is $use% more than ${COLOR}${WAR}%.${COLOREND}
	fi
done

