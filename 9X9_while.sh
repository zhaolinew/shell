#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-16
#FileName：		9X9_while.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
i=1
while [ $i -le 9 ]; do
	j=1
	while [ $j -le $i ]; do
		echo -e "${j}X${i}=$[$i*$j]\t\c"
		let j++
	done
	let i++
	echo
done

