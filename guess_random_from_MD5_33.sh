#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-16
#FileName：		guess_random_from_MD5_33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
#后续六个字符串： efbaf275cd、 4be9c40b8b、 44b2395c46、 f8c8873ce0、 b902c16c8b、ad865d2f63
#是通过对随机数变量RANDOM随机 执行命令： echo $RANDOM|md5sum|cut –c1-10 后的结果
#请破解这些 字符串对应的RANDOM值
MD1=efbaf275cd
MD2=4be9c40b8b
MD3=44b2395c46
MD4=f8c8873ce0
MD5=b902c16c8b
MD6=ad865d2f63
time=1
echo "random	MD5"
for ((i=1;i<=32767;i++));do
	if [ $time -gt 6 ]; then
		break
	fi
	x=`echo $i | md5sum | cut -c1-10`
	for MD in $MD1 $MD2 $MD3 $MD4 $MD5 $MD6; do
		if [ $x == $MD ]; then  
			echo "$i	$MD"
			let time++
		fi
	done
done

