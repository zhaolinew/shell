#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-13
#FileName：		test4.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
for ((i=1;i<=9;i++));do
	for ((j=1;j<=i;j++));do
		echo -e "${j}X${i}=$[$j*$i]\t\c"
	done
	echo
done
