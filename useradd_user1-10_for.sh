#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-13
#FileName：		test1.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
for i in {1..10}; do
  useradd user$i
  password=`tr -dc '[:alnum:]' < /dev/urandom | head -c 8`
  echo user$i:$password | tee -a pass.txt | chpasswd
# echo $password | passwd --stdin -e user$i &> /dev/null
  passwd -e user$i &> /dev/null
  if [ $i -eq 10 ]; then
    echo "user1-$i is created"
  fi
done
