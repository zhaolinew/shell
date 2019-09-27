#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-15
#FileName：		create_HTML_file_named_by_Nxxxxxxx.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
#在/testdir目录下创建10个html文件,文件件名格式为数字N（从1到10）加随机8个字母，如：1AbCdeFgH.html
for ((i=1;i<=10;i++));do
	NAME1=`cat /dev/urandom | tr -dc [^[:alnum:]] | head -c 8`
	touch ../testdir/$i${NAME1}.html 
	echo "file $i$NAME1 is created"
done

