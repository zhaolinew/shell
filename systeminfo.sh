#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-05-20
#FileName：		systeminfo.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
COLOR="\033[1;35m"
COLOREND="\033[0m"
echo -e "OS Verion is $COLOR`cat /etc/redhat-release`$COLOREND "
echo -e  "kernel version is $COLOR`uname -r`$COLOREND"
echo -e "IPaddr is $COLOR`ifconfig eth0|grep -Eo '[0-9.]{7,15}'|head -n1`$COLOREND"
echo -e "CPU type is $COLOR`lscpu|grep 'Model name'|cut -d: -f2|tr -s ' '`$COLOREND"
echo -e "Disk space is $COLOR`lsblk|grep disk|tr -s ' ' |cut -d ' ' -f4`$COLOREND"
echo -e "Memory size is $COLOR`free -h|grep Mem|tr -s ' ' |cut -d' ' -f2`$COLOREND"
unset COLOR COLOREND
