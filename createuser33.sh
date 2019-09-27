#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-25
#FileName：		createuser33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
set -u
set -e
read -p "please input username:" USER

if [ -z "$USER" ]; then
	echo "please input username for create user"; exit
elif id $USER &> /dev/null; then
	echo "user $USER exist."; exit
else
	useradd $USER
	echo "user $USER has been created, ID:`id -u $USER`"
fi
