#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-15
#FileName：		sum_1-n.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
while read -p "please input a digit number:" NUM; do
if [[ ! "$NUM" =~ ^[[:digit:]]+$ ]]; then
	continue
else
	for (( sum=0,i=1;i<=${NUM};i++)); do		
		let sum+=i
	done
	echo "sum is $sum"
	break
fi
done
