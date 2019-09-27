#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-15
#FileName：		ipscan.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
sed -nr 's/^([^[:space:]]+) .*/\1/p' access_log | sort | uniq -c > iplist.txt
while read count ip; do
	if [ $count -gt 100 ];then
		echo this ip $ip access count is $count >> crack.log
  fi
done < iplist.txt

