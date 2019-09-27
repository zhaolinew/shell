#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-16
#FileName：		aaa.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************

restart(){
  [ -f /var/lock/subsys/`basename $0` ] && { stop; start } || start
}

