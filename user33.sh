#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-22
#FileName：		user33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
[ $# -eq 0 ] && { echo "please use `basename $0` username execute this command" ; exit 10; }
id $1 &> /dev/null && { echo "the user $1 is exist"; exit 20; }
useradd $1 &> /dev/null && { echo user $1 has been added; echo mageedu | passwd --stdin $1 &> /dev/null; }\
|| { echo "Error! " ; exit 30; }


