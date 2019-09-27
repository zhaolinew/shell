#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-24
#FileName：		busybox.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
set -u
set -e
FILE=`basename $0`
echo $FILE
if [ "$FILE" = 'rm' ]; then
	echo rm
elif [ "$FILE" = 'cp' ]; then
	echo cp
elif [ "$FILE" = 'mv' ]; then
	echo mv
else 
	echo busybox
fi

