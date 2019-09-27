#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-15
#FileName：		sum_odd_number_1-100.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
#编写脚本，求100以内所有正奇数之和
i=1
sum=0
echo "this program is sum of all odd numbers less than digit number by you typing below"
while read -p "please input a digit number(q|Q for quit):" NUM; do
  if [[ "$NUM" = [qQ] ]]; then
    break
  elif [[ ! "$NUM" =~ ^[[:digit:]]+$ ]]; then
    continue
  fi
	while [ $i -le $NUM ];do
		let sum=sum+=$i
		let i=i+2
	done 
	echo sum of odd number within $NUM is $sum
done	
