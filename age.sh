#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-05-22
#FileName：		age.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
read -p "Input your age: " AGE
if [[ ! "$AGE" =~ ^[0-9]+$ ]];then
    echo "Please input a digit age"
    exit
elif [ $AGE -lt 18 ];then
    echo "Good good study"
elif [ $AGE -le 60 ];then
    echo "Good good work"
elif [ $AGE -le 120 ];then
    echo "enjoy life"
else 
    echo "welcome to the earth"
fi
