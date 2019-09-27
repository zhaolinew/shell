#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-15
#FileName：		host_alive_detect.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
while read -p "please input a legal net:" NET; do
	if [[ ! "$NET" =~ ^(([1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}\
([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$ ]]; then
		continue
	fi
	SUBNET=`echo $NET | cut -d "." -f1-2`
	for ((i=1;i<=255;i++));do
{
		for ((j=1;j<=255;j++));do
			{
			netip=$SUBNET.$i.$j
			ping -w1 -c1 $netip &> /dev/null && echo "$netip is up"
			}&
		done
}&
	done

done

		
			
