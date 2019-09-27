#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-13
#FileName：		test6.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
for ((i=0;i<10;i++)); do
	for ((j=0;j<10;j++));do
		if [ $j -eq 5 ]; then
			break 2
		fi
		echo j=$j
	done
	echo i=$i
done
echo finish
