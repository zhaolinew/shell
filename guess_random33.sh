#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-13
#FileName：		guess_random33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
N=$[RANDOM%10+1]
while read -p "input a number(1-10):" NUM ; do
	if [[ ! $NUM =~ ^[[:digit:]]+$ ]]; then
		echo "please input a digit number:"
	elif [ $NUM -eq $N ]; then
		echo "you hit the jackpot"
		break
	elif [ $NUM -gt $N ]; then
		echo "the number you put in is large than that,try again"
	else
		echo "the number you put in is less than that,try again"
	fi
done
