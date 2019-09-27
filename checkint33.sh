#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-25
#FileName：		checkint33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
set -u
set -e
read -p "please input a number:" NUM
if [[ $NUM =~ ^[0-9]+$ ]]; then
	echo $NUM is a integer
else 
	echo $NUM is not a integer
fi

