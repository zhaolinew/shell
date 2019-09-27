#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-15
#FileName：		peach_monkey.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
while read -p "please input how many days:" NUM; do
	if [[ "$NUM" = [qQ] ]]; then
    break
  elif [[ ! "$NUM" =~ ^[[:digit:]]+$ ]]; then
    continue
	fi
	for ((x=1,i=1;i<$NUM;i++));do
		let	x=x*2+2
	done
	echo Peak total is $x
done
