#!/bin/bash
IP="192.168.205.17"
USER="root"
PASS="root123"
SOUR="/data"
DEST="/u02"
HOUR=`date -d "last hour" +%H`
cd $SOUR
for FILES in *; do
  FHOUR=`echo "$FILES" | cut -c 11-12`
	if [ "$FHOUR" = "$HOUR" ]; then
		scp  $FILES $USER@$IP:$DEST  && rm -f $FILES; echo "`date +'%F %T'` $FILES has been copied to $DEST at $IP" >> scp.log
#	comment out above and remove comment below using expect if you are not using SSH key authentication
#	echo "copying $FILES to $IP"
#	expect >/dev/null 2>&1 <<EOF
#	set timeout -1
#	spawn scp $FILES $USER@$IP:$DEST
#	expect {
#	"yes/no" { send "yes\r";exp_continue }
#	"password" { send "$PASS\r" }
#	}
#	expect eof
#	EOF
	fi
done



