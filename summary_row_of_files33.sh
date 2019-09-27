#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-16
#FileName：		summary_row_of_files33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
#⽤⽂件名做为参数，统计所有参数⽂件的总⾏数
SUM=0
for ((i=1;i<=$#;i++));do
	SUM=$[$SUM+`cat $1 | wc -l`]
done
echo total number of row for files is $SUM
 
