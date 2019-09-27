#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-24
#FileName：		score33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
set -u
set -e
read -p "please input your score: " SCORE
if [[ ! SCORE =~ ^[0-9]+$ ]]; then
	echo "please input a digit!"
	exit
elif [ $SCORE -lt 60 ]; then
	echo "no pass!"
elif [ $SCORE -lt 80 ]; then 
	echo "keep going on"
elif [ $SCORE -le 100 ]; then
	echo "Excellent!!"
else
	echo "It is inpossible! try again"
fi
