#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-23
#FileName：		backup.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
set -u
set -e
SOURCE="/etc/"
DEST="/data/backup-etc`date +%F`"
COLORS="\e[1;32m"
COLORE="\e[0m"
echo -e "$COLORS starting backup...$COLORE"
sleep 3
mkdir -p $DEST
cp -av $SOURCE $DEST && echo -e "\a $COLORS `date +'%F %T'`Backup is finished.$COLORE"
unset SOURCE DEST COLORS COLOR
