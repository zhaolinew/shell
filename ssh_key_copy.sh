#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-24
#FileName：		ssh_key_copy.sh
#URL: 			https://blog.51cto.com/127601
#Description：		generate key and copy key automatically
#Copyright (C): 	2019 All rights reserved
#********************************************************************
. functions33
PASS=root123
if [ -e /root/.ssh/id_rsa ]; then
	echo "ssh-key already exist, skip generate ssh-key"
else
	ssh-keygen -t rsa -P "" -f /root/.ssh/id_rsa &> /dev/null && echo "ssh-key has been created." 
fi
if [ ! -s host.txt ];then
  echo "file host.txt not exist or empty"
  exit
fi  
rpm -q expect &> /dev/null || yum -y install expect &> /dev/null 
while read ip; do
legalip $ip
if [ $? -eq 2 ];then
	if [[ -z $ip ]]; then
		continue
	fi
	echo "$ip is not legal ip in host.txt"
	continue
else
echo -e "copying ssh-pub-key to $ip \c"
expect >/dev/null 2>&1 <<EOF
set timeout 10
spawn ssh-copy-id -i /root/.ssh/id_rsa.pub root@$ip 
expect {
"yes/no" { send "yes\n";exp_continue }
"password" { send "$PASS\n" }
}
expect eof
EOF
	if [ $? -eq 0 ];then
		echo -e "\e[32;1msuccess\e[0m"
	else
		echo -e "\e[31;1mfailed\e[0m"
	fi
fi
done < host.txt
