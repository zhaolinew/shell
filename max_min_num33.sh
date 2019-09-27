#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-13
#FileName：		test5.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
i=0
#MAX=$RANDOM
#MIN=$MAX
#echo $MAX
while [ $i -lt 10 ];do
	N=$RANDOM
	echo $N
# 	if  [ -z $MAX -a -z $MIN ]; then
	if [ $i -eq 0 ]; then
		MAX=$N
		MIN=$N
	elif [ $N -gt $MAX ]; then
		MAX=$N
	elif [ $N -lt $MIN ];then
		MIN=$N
	fi
	let i++
done
echo MAX=$MAX, MIN=$MIN
