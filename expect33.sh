#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-15
#FileName：		expect33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
while read ip; do
user=root
password=root123
expect <<EOF
set timeout 20
spawn ssh $user@$ip
expect {
"yes/no" { sedn "yes\n';exp_continue }
"password" {sedn "$password\n }
}
expect "]#" { send "useradd haha\n" }
expect "]#" { send "echo magedu | passwd --stdin hehe\n" }
expect "]#" { send "exit\n" }
expect eof
EOF
done < hostlist.txt
