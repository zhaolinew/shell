#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-09-26
#FileName：		test.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
dir=`dirname $0`
dir1=`pwd`
echo $dir $dir1
OS=`awk -F\" '/^NAME/{print $2}' /etc/os-release`
if [[ "$OS" =~ [u|U][b|B][u|U][n|N][t|T][u|U] ]]; then
   echo "ubuntu" 
elif [[ "$OS" =~ [c|C][e|E][n|N][t|T][o|O][s|S] ]]; then
	 echo "centos"
fi

