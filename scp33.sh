#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-22
#FileName：		scp33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		automatically copy file use scp command to remote host
#Copyright (C): 	2019 All rights reserved
#********************************************************************
IP="192.168.205.6"
USER="root"
PASS="root123"
DEST="/data/scripts37/"
if [ $# -eq 0 ];then
	echo "Usage $0 FILE_NAME ..."
	exit
else
	for i in $*;do
		if [ ! -f $i -a ! -d $i ];then
			printf "%-20s%s\n" "$i" "No such file or not a regular file/directory"
		else
			declare -A FILE
			FILE[$i]=$i
		fi
	done
	if [ ${#FILE[*]} -eq 0 ];then
		exit
	fi
fi
echo "copying ${FILE[*]} to $IP"
expect >/dev/null 2>&1 <<EOF
set timeout -1
spawn scp -r ${FILE[*]} $USER@$IP:$DEST
expect {
"yes/no" { send "yes\r";exp_continue }
"password" { send "$PASS\r" }
}
expect eof
EOF
echo "${FILE[*]} has been copied to $DEST at $IP"
