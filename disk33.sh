#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-24
#FileName：		disk33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
set -u
set -e
echo "The system partition maximum used `df | grep /dev/sd | grep -o "[0-9]\{1,3\}%" | sort -rn | head -1`"
