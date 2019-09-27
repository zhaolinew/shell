#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-05-22
#FileName：		user.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
[ $# -eq 0 ] && { echo "Usage: `basename $0` USERNAME" ; exit 10; }
id $1 &> /dev/null && { echo "User $1 is exist"; exit 20; }
useradd $1 &> /dev/null && { echo $1 is created ;echo magedu |passwd --stdin $1 &> /dev/null ; } || {  echo " Error! " ; exit 30; }
