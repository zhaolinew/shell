#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-16
#FileName：		international_chess33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
#编写脚本，实现打印国际象棋棋盘
CLO1="\e[45;1m"
CLO2="\e[43;1m"
CLOEND="\e[0m"
for ((i=0;i<8;i++));do
	for ((j=0;j<4;j++));do
		if [ $[$i%2] -eq 0 ]; then
			echo -e "$CLO1  $CLOEND$CLO2  $CLOEND\c"
		else 
			echo -e "$CLO2  $CLOEND$CLO1  $CLOEND\c"
		fi
	done
	echo
done
