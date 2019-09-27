#!/bin/bash
#******************************************************************* *
#Author:                Leo
#QQ:                    77961731
#Date:                  2019-09-10
#FileName：             ssd-copy.sh
#URL:                   https://blog.51cto.com/127601
#Description：          The test script
#Copyright (C):        2019 All rights reserved
#********************************************************************
#color functions
gecho() {
	echo -e "\e[1;4;32m $1 \e[0m"
	sleep 1
}
recho() {
	echo -e "\e[1;4;31m $1 \e[0m"
	sleep 1
}

#validate ip 
legal_ip(){
	if [[ "$IP" =~ ^(([1-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.)(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){2}([1-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$ ]]; then 
		return 0
	else
		return 1
	fi
}

#############################################################################
#generate key and copy key to localhost and copy .ssh folder to remote hosts#
#############################################################################
ssh_key(){
#generate key from localhost
read -s -p "input local host password:" local_pass
clear
gecho "Generate key and copy key to localhost..."
echo -e -n "Coping key to localhost...," 
rpm -q expect &>/dev/null || yum install -y expect
[ -e /root/.ssh/id_rsa ] || ssh-keygen -t rsa -N '' -f /root/.ssh/id_rsa -q

#copy key to localhost
expect >/dev/null 2>&1 <<EOF
set timeout 5
spawn ssh-copy-id root@127.0.0.1
expect {
    "yes/no" { send "yes\n";exp_continue }
    "password:" { send "${local_pass}\n" }
}
expect eof
EOF
echo -e " finish!"

#copy .ssh folder to remote hosts defined by a files
gecho "starting copy .ssh folder to hosts..."
for i in `seq $ROW` ; do 
	HOST=`sed -n "${i}p" $FILE`
	IP=`sed -n "${i}p" $FILE | awk '{print $1}'`
	PASS=`sed -n "${i}p" $FILE | awk '{print $2}'`
	if [[ "$HOST" =~ [:space:]*"#" ]]; then
		continue
	fi
	if [ -z "$HOST" ]; then
		continue
	fi
	legal_ip ${IP}
 	if [ $? -eq 0 ]; then
		echo -e -n "coping file to ${IP}...,"
expect >/dev/null 2>&1 <<EOF
set timeout 5
spawn scp -r /root/.ssh root@${IP}:/root/
expect {
"yes/no" { send "yes\r";exp_continue }
"password:" { send "${PASS}\r" }
}
expect eof
EOF
		echo -e " finish!"
  else
    echo -e "\e[1;4;31m$IP is not legal address, please veryfy ip in ${FILE}\e[0m"
		continue
	fi
done
}

##############################################################
#for bulk execute command on remote hosts, and return result.
##############################################################
ssh_cmd(){
for i in `seq $ROW` ; do 
  HOST=`sed -n "${i}p" $FILE`
  IP=`sed -n "${i}p" $FILE | awk '{print $1}'`
  if [[ "$HOST" =~ [:space:]*"#" ]]; then
    continue
  fi
  if [ -z "$HOST" ]; then
    continue
  fi
  legal_ip ${IP}
  if [ $? -eq 0 ]; then
    gecho "execute command $* to ${IP}"
		ssh $IP $*
		[ $? -eq 0 ] && gecho "successful!" || recho "failed!"
  else                                                                                                                  
    echo -e "\e[1;4;31m$IP is not legal address, please veryfy ip in $FILE\e[0m"
    continue
  fi
done
}

####################################
# starting copy file to remote hosts
####################################
scp_ok(){
  for i in $sour; do
    if [ ! -f $i -a ! -d $i ];then
      printf "%-20s%s\n" "$i" "No such file or not a regular file/directory"
    else
      declare -A FILES
      FILES[$i]=$i
    fi
  done
  if [ ${#FILES[*]} -eq 0 ];then
    exit
  fi
gecho "copying ${FILES[*]} to $IP"
scp -r ${FILES[*]} $IP:$dest
# echo "${FILES[*]} has been copied to $dest at $IP"       
}

###############################################################################
# validate IPs in file, invoking function scp_ok starting copy if IP is legaled
###############################################################################
scp_copy(){
for i in `seq $ROW` ; do 
  HOST=`sed -n "${i}p" $FILE`
  IP=`sed -n "${i}p" $FILE | awk '{print $1}'`
  if [[ "$HOST" =~ [:space:]*"#" ]]; then
    continue
  fi
  if [ -z "$HOST" ]; then
    continue
  fi
  legal_ip ${IP}
  if [ $? -eq 0 ]; then
    scp_ok
  else                                                                                                                  
    echo -e "\e[1;4;31m$IP is not legal address, please veryfy ip in $FILE\e[0m"
    continue
  fi
done
}

###########
#for help
###########
help_cmd(){
echo "Usage $0 -h <FILENAME> <OPTION>"
echo
echo "-h/H FILENAME                      hosts file, format:first column is IP, second is password "
echo "--help                             for help"
echo
echo "OPTION"
echo "key                                genrate key and copy key to hosts defined by FILE NAME"
echo "cmd \"COMMANDs\"                     execute command on remote hosts defined by FILE NAME"
echo "copy \"source files\" \"destination\"  copy files from local host to remote hosts"
echo
echo -e "ATTENTION: if you have multi commands or files you must use\"\"(quote),for cmd you must use;(semicolon) seprate between commands. otherwise will be overwrite unknow file on remote hosts"
}
############
#select menu
############
case $1 in
	-h|-H)
	  [ -z $2 ] && { help_cmd; exit; } 
		[ -e $2 ] && { FILE="$2"; ROW=`cat $FILE | wc -l`; } || { recho "file $2 does not exist"; exit; }
		case $3 in
			key)
				ssh_key
				;;
			cmd)
				[ -z "$4" ] && { echo "please follow the command, --help for help"; exit; }
				ssh_cmd $4
				;;
			copy)
				[ -z "$4" -o -z "$5" ] && { echo "please input sources and destination, --help for help"; exit; }
				sour=$4
				dest=$5
				scp_copy
				;;
			*)
				help_cmd
				;;
		esac
		;;
	--help)
    help_cmd
    ;;
	*)
		help_cmd
 		;;
esac
