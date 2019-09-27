#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-31
#FileName：		diskspace33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
lsblk | sed -nr 's/(^sd[[:lower:]]{1}).*/\1/p'
DISKNUM=`lsblk | sed -nr '/^sd[[:lower:]]{1}/p'|wc -l`
LASTDISK=`lsblk | sed -nr 's/(^sd[[:lower:]]{1}).*/\1/p' | sed -n "$[DISKNUM]"p`
if [ "$DISKNUM" -gt 0 ]; then
	fdisk -l /dev/$LASTDISK
else
	echo "the system no harddisk"
fi
