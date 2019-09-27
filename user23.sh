#!/bin/bash
#
#***********************************************************
#Author:		Jibill Chen
#QQ: 			417060833
#Date: 			2019-05-22
#FileName：		user23.sh
#URL: 			http://thson.blog.csdn.net
#Description：		The test script
#**********************************************************
CO_RED='\e[1;31m'
CO_GREEN='\e[1;32m'
LOR='\e[0m'
[ $# -lt 2 ] && echo -e "${CO_RED}you must input unless two argument!\n1st arg is username;2nd arg is password!${LOR}" && exit 1
useradd $1 &> /dev/null
[ $? -eq 9 ] && echo -e "${CO_RED}user $1 existed!${LOR}" && exit 9 || [ $? -ne 0 ] && echo -e "${CO_RED}create user ERROR${LOR}"
echo $2 | passwd --stdin $1 &> /dev/null
[ $? -eq 0 ] && echo -e "${CO_GREEN}create user complete!" || echo "something ERROR!"
