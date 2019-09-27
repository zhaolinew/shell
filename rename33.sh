#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-12
#FileName：		rename33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
DIR=/data/test
cd $DIR
for file in *; do
	#rev |cut -d. -f1 |rev
	#rev | cut -d. -f2- | rev
	F_NAME=`echo $file | sed -rn 's/(.*)\.(.*)$/\1/p'`
	F_EXT=`echo $file | sed -rn 's/(.*)(\..*)$/\2/p'`
	C_EXT=.123
	if [ -f "$file" -a -z "$F_NAME" ];then
	   mv $file $file$C_EXT
           echo "$file renamed by $file$C_EXT"
	elif [ -f "$file" -a "$F_EXT" != "$C_EXT" ]; then
	   mv $file $F_NAME$C_EXT
	   echo "$file renamed by $F_NAME$C_EXT"
	fi
done
