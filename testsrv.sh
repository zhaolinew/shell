#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-16
#FileName：		testsrv.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
#chkconfig:- 96 07
#description test sevice
. /etc/rc.d/init.d/functions 

[ ! -f /etc/rc.d/init.d/`basename $0` ] && /bin/cp `basename $0` /etc/rc.d/init.d/`basename $0` &> /dev/null
chkconfig --add `basename $0`

start(){
  if [ -f /var/lock/subsys/`basename $0` ]; then
		echo "the `basename $0` has been already started"
	else
		touch /var/lock/subsys/`basename $0` 
		action "`basename $0` is running" true
	fi
}

stop(){
	if [ ! -f /var/lock/subsys/`basename $0` ]; then
		echo "the `basename $0` has been already stopped"
	else
		rm -f /var/lock/subsys/`basename $0` 
		action "`basename $0` is stopped" true
	fi
}

status(){
	if [ -f /var/lock/subsys/`basename $0` ];then
		action "`basename $0` is running" true
	else
		action "`basename $0` is stopped" true
	fi
}

restart(){
	if [ -f /var/lock/subsys/`basename $0` ]; then
		stop
		start
	else
		start
	fi
}


case $1 in
start)
	start
	;;
stop)
	stop
	;;
restart)
	restart
	;;
status)
	status
	;;
*)
	echo "Usage:/etc/init.d/`basename $0` {start|stop|status|restart}"
	;;
esac
