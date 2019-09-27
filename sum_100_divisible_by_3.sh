#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-15
#FileName：		sum_100_divisible_by_3.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
#计算100以内所有能被3整除的整数之和
for ((sum=0,i=1;i<=100;i++)); do
	if [ $[$i%3] -eq 0 ]; then
		let sum+=$i
	fi
done
echo sum=$sum
