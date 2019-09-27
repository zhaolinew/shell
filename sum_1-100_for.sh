#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-13
#FileName：		test.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
sum=0
for i in {1..100}; do
	if [ $[i%2] -eq 0 ]; then
		sum=$[sum+=i]
	fi
done
echo even number sum is $sum
