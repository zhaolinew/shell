#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-12
#FileName：		fact.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
fact(){
	if [ $1 -eq 0 ]; then
		echo 1
	else 
		echo $[`fact $[$1-1]`*$1]
	fi
}
 fact $1
