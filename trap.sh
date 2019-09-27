#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-15
#FileName：		trap.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
trap 'echo press ctrl+c' int
trap -p
for ((i=0;i<10;i++));do
	echo $i
  sleep 1
done
trap '' 2
trap -p
for ((i=10;i<20;i++));do
	echo $i
	sleep 1
done
trap '-' 2
trap -p
for ((i=20;i<30;i++));do
	echo $i
	sleep 1
done
finish(){
	echo finish is excuted
}
trap finish exit
for ((i=0;i<5;i++));do
	echo $i
	sleep 1
done

