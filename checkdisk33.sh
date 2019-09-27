#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-25
#FileName：		checkdisk33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
set -u
set -e
INODE=`df -i | grep /dev/sd | tr -s " " % | cut -d% -f5 | sort -rn | head -1`
SPACE=`df | grep /dev/sd | tr -s " " % | cut -d% -f5 | sort -rn | head -1`
if [ "$INODE" -ge 80 -o "$SPACE" -ge 80 ]; then
	echo Warning The inode or disk space over 80%!
else
	echo The system maximum used Inode:$INODE%, Disk is: $SPACE%  
fi
