#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-24
#FileName：		links33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
set -u
set -e
echo "the system connected remote host IP and number is:`netstat -tan | grep ESTAB | tr -s " " : |cut -d: -f6 | uniq -c | sort -rn`"
