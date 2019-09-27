#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-15
#FileName：		equl_trangel.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
#打印等腰三角形
while read -p "please input a digit number for layer of trangle(q|Q for quit):" NUM; do
	if [[ "$NUM" = [qQ] ]]; then
		break
	elif [[ ! "$NUM" =~ ^[[:digit:]]+$ ]]; then
  	continue
	fi
	for ((i=1;i<=$NUM;i++)); do
		for ((j=i;j<$NUM;j++)); do
			echo -e " \c"
		done
		for ((x=1;x<=$[i*2-1];x++));do
			echo -e "\e[$[$RANDOM%7+31];1m*\e[0m\c"
		done
		echo -e "\n"
	done
done
