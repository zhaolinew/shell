#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-16
#FileName：		Fibonacci_sequence33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
#斐波那契数列⼜称⻩⾦分割数列，因数学家列昂纳多·斐波那契以兔子繁殖为例子而引入，
#故又称为“兔子数列”，指的是这样一个数列：0、1、1、2、3、5、8、13、21、34、……，
#斐波纳契数列以如下被以递归的方法定义：F（0）=0，F（1）=1，F（n）=F(n-1)+F(n-2)（n≥2）
#利用函数，求n阶斐波那契数列
	
#!/bin/sh
fibonacci()
{
if [ $1 -eq 0 ];then
	echo 0
elif [ $1 -le 1 ];then
	echo 1
else
	echo $[$(fibonacci $[$1-1])+$(fibonacci $[$1-2])]
fi
}
fibonacci $1
