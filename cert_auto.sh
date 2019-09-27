#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-22
#FileName：		cert_auto.sh
#URL: 			https://blog.51cto.com/127601
#Description：		Auto generate and issue certficates
#Copyright (C): 	2019 All rights reserved
#********************************************************************
CA="/etc/pki/CA/"
PRIVATE="/etc/pki/CA/private/"

#create requested files
[ rpm -qi openssl &> /dev/null ] || yum -y install openssl &> /dev/null
[ -e $CA/index.txt ]             || touch /etc/pki/CA/index.txt
[ -s $CA/serial ]                || echo 00 > /etc/pki/CA/serial

#for select menu
PS3="please iput a number(Enter for menu):"
select CMD in \
'Gen private key for CA' \
'Gen Self-sig Cert for CA' \
'Check self-sig Cert for CA' \
'Gen key and request for client' \
'Issue a cert' \
'Revok a cert' \
'Update CRL' \
'Quit'; do
case $REPLY in

#generate private key for CA server
1)
	cd $PRIVATE
	if [ ! -e ${PRIKEY}private.key ]; then
		(umask 077; openssl genrsa -out ${PRIKEY}private.key 4096 &> /dev/null)
		echo "$PRIVATE$CA_private.key has been generated at"
	else
		echo "${PRIKEY}private.key aleady exist"
	fi
	;;
#generate CA root certificate,if key exist and root certificate doesn't exist
2)
	if [ -e ${PRIVATE}private.key -a ! -e ${CA}CA_ROOT.pem ]; then
expect <<EOF
spawn openssl req -new -x509 -key ${PRIVATE}private.key -out ${CA}CA_ROOT.pem -days 3650
expect	":" { send "CN\n"}
expect	":" { send "beijing\n" }
expect	":" { send "beijing\n" }
expect	":" { send "iata\n" }
expect	":" { send "M37\n" }
expect	":" { send "ca.iata.org\n"}
expect	":" { send "zhaoq@iata.org\n" }
expect eof
EOF
		echo "self-sig certifacate ${CA}CA_ROOT.pem has been generated"
	elif [ -e ${CA}CA_ROOT.pem ]; then
		echo "CA self-sig ${CA}CA_ROOT.pem already exist." 
	else 
		echo "please do step 1 first"
	fi
	;;
#list CA root certificate info
3)
	if [ -e ${CA}CA_ROOT.pem ];then	
		openssl x509 -in ${CA}CA_ROOT.pem -noout -text
	else
		echo "please do 1 and 2 first"
	fi
	;;
#connect client use ssh and generate key, csr and copy csr to CA
4)
	read -p "please input client IP:" IP
	read -s -p "please input Password:" PASS
expect <<EOF
set timeout 10
spawn ssh root@$IP
expect {
"yes/no" { send "yes\n";exp_continue }
"password" { send "$PASS\n" }
}
expect "#" { send "(umask 077; openssl genrsa -out ${IP}.key 1024)\n" }
expect "#" { send "openssl req -new -key ${IP}.key -out ${IP}.csr\n" }
expect ":" { send "CN\n"}
expect ":" { send "beijing\n" }
expect ":" { send "beijing\n" }
expect ":" { send "iata\n" }
expect ":" { send "M37\n" }
expect ":" { send "ca.iata.org\n"}
expect ":" { send "zhaoq@iata.org\n" }
expect ":" { send "\n"}
expect ":" { send "\n"}
expect "]#" { send "scp /root/${IP}.csr root@192.168.205.129:$CA\n"}
expect {
"yes/no" { send "yes\n"; exp_continue }
"password" { send "$PASS\n" }
}
expect "]#" { send "exit\n" }
expect eof
EOF
	if [ $? -eq 0 ];then
		echo -e "\e[31;1m${IP}.key and ${IP}.csr have been generated and copied to $CA\e[0m\n"
	fi
	;;
#issue a certificate at /etc/pki/CA
5)
	read -p "please input a request host ip:" IP
	if [ -e $CA${IP}.csr ]; then
openssl ca -in $CA${IP}.csr -out $CA${IP}.crt -days 365 <<EOF
y
y
EOF
		echo "the certificate has been issued $CA${IP}.crt"
	else
		echo "please do step 4 first"
	fi
	;;
#list issued certificate and select one to revoke
6)
	cat ${CA}index.txt
	read -p "please input a number of certificate:" NUM
	openssl ca -revoke ${CA}newcerts/${NUM}.pem
	echo "the ${NUM}.pem has been ivoked"
	;;
#update revoked certificates 
7)
	if [ ! -e ${CA}crlnumber -o -s ${CA}crlnumber ];then
		echo 1F >${CA}crlnumber
	fi
		openssl ca -gencrl -out /etc/pki/CA/crl.pem
	;;
#for exit
8)
	break 1
	;;
*)
	;;
esac
done
