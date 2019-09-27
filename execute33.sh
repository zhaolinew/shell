#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-25
#FileName：		excute33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
set -u
set -e
if [ "$#" -lt 1 ]; then
	echo "please input at last one argument followed by filename."; exit
elif [ ! -e "$1" ]; then
	echo "$1 is not exist."; exit	
elif [[ "$1" =~ .*\.sh$ ]]; then
	chmod +x $1
	echo $1 is executable file.
else
	echo $1 is not script file.
fi
