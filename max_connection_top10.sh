#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-30
#FileName：		test.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
top10ip=`netstat -tan| grep 'ESTAB' |awk '{print $5}'| cut -d: -f1 | grep "^[[:digit:]]\+.*" | sort | uniq -c| head`
echo "连接到本地主机最多的10个ip是：$top10ip"
