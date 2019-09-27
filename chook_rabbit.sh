#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-24
#FileName：		chook_rabbit.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
set -u
set -e
read -p "please input the head number: " head
read -p "please input the foot number: " foot
rabbit=$[foot/2-head]
chook=$[head-rabbit]
echo "rabbit:" $rabbit
echo "chook:" $chook

