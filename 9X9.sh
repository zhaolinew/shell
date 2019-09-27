#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-13
#FileName：		9X9.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
for i in {9..1}; do
  for j in `seq $i`; do
     echo -e "${j}X${i}=$[$j*$i]\t\c"
  done
  echo
done

