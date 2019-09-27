#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-15
#FileName：		file_type33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
DIR="/var"
a=0
b=0
c=0
d=0
e=0
f=0
g=0
cd $DIR
for i in $(find $DIR) ;do
	[ -L "$i" ] && { echo the $i is link file; let a++; continue; }
	[ -d "$i" ] && { echo the $i is directory; let b++; continue; }
	[ -f "$i" ] && { echo the $i is general file; let c++; continue; }
	[ -b "$i" ] && { echo the $i is block file; let d++; continue; }
	[ -S "$i" ] && { echo the $i is taojie file; let e++; continue; }
	[ -p "$i" ] && { echo the $i is pipe file; let f++; continue; }
	[ -c "$i" ] && { echo the $i is character file; let g++; continue; }
done
echo total link file $a
echo total directory $b
echo total general file $c
echo total block file $d
echo total tajie file $e
echo total pipe file $f
echo total charecter file $g
