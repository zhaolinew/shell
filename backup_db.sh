#!/bin/bash
#
#******************************************************************* *
#Author:                Leo
#QQ:                    77961731
#Date:                  2019-07-16
#FileName：             backup_db.sh
#URL:                   https://blog.51cto.com/127601
#Description：          The test script
#Copyright (C):        2019 All rights reserved
#********************************************************************

read -p "please input username:" USER
read -s -p  "please input password:" PASS
echo
read -p "input backup directory:" DIR
DBS=`mysql -u$USER -p$PASS -e 'show databases' | grep -Ev '^(information_schema|performance_schema|Database)$'`
PS3="typing database name for backup(Q|q for quit):" 
select menu in $DBS; do
case $REPLY in
Q|q)
	exit
;;
*)
	for i in $DBS;do
		if [[ "$REPLY" =~ ^[:space:]+[:space:]^[:space:]+ ]]; then
				break
		fi
		if [ $REPLY = $i ]; then
				echo "$REPLY"
				mysqldump -u$USER -p$PASS -B $i --single-transaction --master-data=2 |gzip >$DIR/${i}.sql.gz
				echo "backup is success"
				break
		fi
	done
esac 
done
