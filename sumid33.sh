#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-24
#FileName：		sumid33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		sum 10st and 20st ID in /etc/passwd file
#Copyright (C): 	2019 All rights reserved
#********************************************************************
set -u
set -e
USER10=`cat /etc/passwd | head -10 | tail -1 | cut -d: -f3`
USER20=`cat /etc/passwd | head -20 | tail -1 | cut -d: -f3`
SUMID=$[$USER10 + $USER20]
echo "10st user ID and 20 User ID sum is $SUMID"
