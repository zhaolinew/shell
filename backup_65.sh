#!/bin/bash
#
#***********************************************************
#Autohor:             guocheng                              
#QQ:                  792402658                             
#Date:                2019-05-20 
#FileName:             backup.sh
#***********************************************************
echo "backup in ......"
sleep 3
cp -av /etc/   /root/etc`date +%F`
echo "baskup OK!"
