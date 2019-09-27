#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-16
#FileName：		max_min_digit_arguments33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
#用两个以上的数字为参数，显示其中的最大值和最小值
MAX=$1
MIN=$MAX
while [ $# -ge 1 ]; do
	if [ $1 -gt $MAX ];then
		MAX=$1
	else
		MIN=$1
	fi
	shift
done
echo "MAX=$MAX MIN=$MIN"
