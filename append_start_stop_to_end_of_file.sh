#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-15
#FileName：		append_start_stop_to_end_of_file.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
#etc/rc.d/rc3.d⽬录下分别有多个以K开头和以S开头的⽂件；分别读取每个⽂件， 以K开头的输出为⽂件加stop，以S开头的输出为⽂件名加start，如K34filename stop S66filename start

DIR="/etc/rc.d/rc3.d"
for i in `ls $DIR`; do
	[[ "$i" =~ ^S.* ]] && echo $i start
	[[ "$i" =~ ^K.* ]] && echo $i stop
done
