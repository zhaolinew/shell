#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-18
#FileName：		tower_of_hanoi.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
#!/bin/sh
step=0
move (){
	let step++
	echo "$step: move disk $1 $2 -----> $3"
}
hanoi(){
if [ $1 -eq 1 ];then
	move $1 $2 $4
else
	hanoi "$[$1-1]" $2 $4 $3
	move $1 $2 $4
	hanoi "$[$1-1]" $3 $2 $4
fi
}
read -p "please input the number of plates: " number
hanoi $number A B C
