#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-25
#FileName：		filetype33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
#set -u
#set -e
#read -p "please input your file name:" FILE
#if [ -z $FILE ]; then
#	echo "you are not input your file name."; exit
#elif [ -e $FILE ]; then
#	echo "$FILE is not exist." 
#elif [ -b $FILE ]; then
#	echo "$FILE is Block file." 
#elif [ -c $FILE ]; then
#	echo "$FILE is byte file."
#elif [ -d $FILE ]; then
#	echo "$FILE is directory." 
#elif [ -L $FILE ]; then
#	echo "$FILE is a link file."
#elif [ -f $FILE ]; then
#	echo "$FILE is a general file." 
#elif [ -p $FILE ]; then
#	echo "$FILE is a pipe file."
#elif [ -S $FILE ]; then
#	echo "$FILE is a socket file."
#else
#	echo "$FILE is other file."
#fi

# use case
# FILE=`ls -ld $1 | grep -o "^."`

if [ -z "$1" ]; then
       echo "you are not input your file name."; exit
elif [ ! -e "$1" ]; then
       echo "$1 is not exist."; exit
else
FILE=`ls -ld $1 | grep -o "^."`   
case $FILE in
-)
	echo "$1 common file" ;;
d)
	echo "$1 is directory" ;;
l)
	echo "$1 is a link file" ;;
*)
	echo "$1 is other file" ;;
esac

fi
