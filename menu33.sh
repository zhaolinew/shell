#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-24
#FileName：		menu.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
set -u
set -e
#cat << eof
#1:Chook
#2:Goose
#3:Duck
#4:Lobster
#5:exit
#eof
PS3="please input a  number"
select menu in chook goose duck lobster quit; do

# while read -p "choose a number:" NUM; do
case $REPLY in
1)
	echo price is 50.
	;;
2)
	echo price is 80
	;;
3)
	echo price is 100.
	;;
4)
	echo price is 200.
	;;
5)
	break
	;;
*)
	echo "please choose correct number"
esac
done

