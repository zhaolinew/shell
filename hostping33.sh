#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-24
#FileName：		hostping33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
set -e
# set color
CORS="\033[1;32m"
CORE="\033[0m"

if [ "$#" -lt 1 ]; then
	echo -e "$CORS please input a IP for this command $CORE"
	exit
fi

if [[ "$1" =~ ^(([1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}\
([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$ ]]; then
	ping -c1 -W1 $1 &> /dev/null && { echo "this host $1 is reachable"; exit; } || \
	echo "this host $1 is unreachable"
else 
	{ echo this is not legal ip, please input a legal IP; exit; }
fi

# [ "$?" -eq 0 ]&& { echo "this host $1 is reachable"; exit; }||echo "this host $1 is unreachable"
# ping -c1 -W1 $1 &> /dev/null &&  { echo "this host $1 is reachable"; exit; }||echo "this host $1 is unreachable"
