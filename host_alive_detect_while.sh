#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-16
#FileName：		host_alive_detect_while.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
#提请示输网络地址，如192.168.0.0，判断输出的IP段中主机在线状态，并统计在线和离线主机各多少
while read -p "please input a legal net:" NET; do
	if [[ "$NET" = [qQ] ]]; then
    break
  elif [[ ! "$NET" =~ ^(([1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}\
([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$ ]]; then
    continue
  fi
	NETID=`echo $NET | cut -d'.' -f1-2`
	i=0
	j=1
	up=0
	down=0
	while [ $i -le 255 ]; do
		while [ $j -lt 255 ]; do
			if `ping -c1 -w1 $NETID.$i.$j &> /dev/null`;then
				echo host $NETID.$i.$j is up
				let up++
			else
				echo host $NETID.$i.$j is down
				let down++
			fi
			let j++
		done
		let i++
	done
done
echo the hosts up is $up
echo the hosts down is $down
		
	
