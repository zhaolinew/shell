#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-24
#FileName：		sumspace33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
set -e
[ -z "$1" -o -z "$2" ] && { echo "please use $0 file1 file2 format execute this comannd,"; exit; }
FILE1=`cat $1 | grep -o "[[:space:]]\.*" | wc -l`
FILE2=`cat $2 | grep -o "[[:space:]]\.*" | wc -l`
let TOTAL=FILE1+FILE2
echo "$1 and $2 total space is $TOTAL"
