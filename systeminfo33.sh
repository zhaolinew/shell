#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-23
#FileName：		systeminfo33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
set -u
set -e
ColorStart="\e[1;32m"
ColorEnd="\e[0m"
echo -e "The system hostname is $ColorStart`hostname`$ColorEnd"
echo -e "The OS version is $ColorStart`cat /etc/redhat-release`$ColorEnd"
echo -e "Kernal version is $ColorStart `uname -r` $ColorEnd"
echo -e "The system IP is $ColorStart`ifconfig | egrep -o "(inet )([0-9]*\.){3}[0-9]*" | cut -d" " -f2 | head -1`$ColorEnd"
echo -e "CPU type is $ColorStart `lscpu | grep -E "Model name" | cut -d: -f2 | tr -s " "` $ColorEnd"
echo -e "Disk space is $ColorStart `lsblk | grep disk | tr -s " " | cut -d " " -f4` $ColorEnd"
echo -e "Memory size is $ColorStart `free -h | grep Mem |tr -s " " | cut -d " " -f2` $ColorEnd"
unset ColorStart ColorEnd
