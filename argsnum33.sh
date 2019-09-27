#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-24
#FileName：		argsnum33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
set -e
[ "$#" -le 0 ] && { echo "please input at last one file on this command."; exit; }

[ -e "$1" ] && SPACE=`cat $1 2>/dev/null | grep -o "[[:space:]]\.*" | wc -l` \
|| { echo "the file not exist."; exit; } 

#  [ "$#" -le 0 ] && { echo "please input at last one file on this command."; exit; }
# SPACE=`cat $1 2>/dev/null | grep -o "[[:space:]]\.*" | wc -l` 
# [ "$?" -ne 0 ] && { echo "the file not exist."; exit; }
echo "the file $1 space total is $SPACE"
