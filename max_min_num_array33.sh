#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-15
#FileName：		max_min_num_array33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
declare -a RAND
for ((i=0;i<10;i++));do
	RAND[$i]=$RANDOM
	if [ $i -eq 0 ];then
		MAX=${RAND[$i]}
		MIN=$MAX
	else
		[ ${RAND[$i]} -gt $MAX ] && { MAX=${RAND[$i]}; continue; }
		[ ${RAND[$i]} -lt $MIN ] && MIN=${RAND[$i]}
	fi
done
echo All Random are ${RAND[*]}
echo max=$MAX, min=$MIN

