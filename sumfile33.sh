#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-24
#FileName：		sumfile33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
set -u
set -e
ETC=`ls -l /etc | grep ^d | wc -l`
VAR=`ls -l /var | grep ^d | wc -l`
USR=`ls -l /usr | grep ^d | wc -l`
let TOTAL=ETC+VAR+USR
echo "directory /etc /var /usr total is $TOTAL"

