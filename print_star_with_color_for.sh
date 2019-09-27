#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-13
#FileName：		test3.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
read -p "please input row:" ROW
read -p "please input column:" COL
COLOR="\e["
for i in `seq $COL`;do 
  for j in `seq $ROW`;do 
    echo -e "$COLOR$[RANDOM%7+31];1m'*\c'${COLOR}0m"
  done 
  echo 
done

