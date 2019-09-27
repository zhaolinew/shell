#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-16
#FileName：		cecute_command_copy_files33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
#(1) 提示用户输入一个可执行命令名称
#(2) 获取此命令所依赖到的所有库文件列表
#(3) 复制命令至某目标目录(例如/mnt/sysroot)下的对应路径下
#如：/bin/bash ==> /mnt/sysroot/bin/bash
#    /usr/bin/passwd ==> /mnt/sysroot/usr/bin/passwd
#(4) 复制此命令依赖到的所有库文件至目标目录下的对应路径下：
#如：/lib64/ld-linux-x86-64.so.2 ==> /mnt/sysroot/lib64/ld-linux-x86-64.so.2
#(5)每次复制完成一个命令后，不要退出，而是提示用户键入新的要复制的命令，并重复完成上述功能；直到用户输入quit退出
while read -p "please input command:" CMD; do
	if [[ "$CMD" = [qQ][uU][iI][tT] ]]; then
		break
	elif `which $CMD &> /dev/null` ; then
		CMD1=`which $CMD`
		mkdir -p /mnt/sysroot/$CMD
		mkdir -p /mnt/sysroot/lib64
		cp $CMD1 /mnt/sysroot/$CMD
		echo "the bin file has been copied to /mnt/sysroot/$CMD"
	else
		clear
		echo "no this command, input a existed command."
		continue

	fi
	for i in `ldd $CMD1 |grep -Eo "/lib64/.*"|sed -r 's#(.*)\(.*\)#\1#'`; do
		cp $i /mnt/sysroot/lib64
	done
	echo "lib files has been copied to /mnt/sysroot/lib64"
done


