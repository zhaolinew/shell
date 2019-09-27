#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-25
#FileName：		per33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
set -u
set -e
if [ "$#" -lt 1 ]; then
	echo "please follow atlast one argument for filename"; exit
elif [ ! -e "$1" ]; then
	echo "$1 is not exist,"; exit	
elif [ -r "$1" -a -w "$1" ]; then
	echo $1 is writable and Readable.
else 
	echo $1 is not Writable and Readable.
fi
