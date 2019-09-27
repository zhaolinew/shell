#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-22
#FileName：		rm33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
TEMPDIR=`date +%F%s`
ROOTDIR="/tmp"

mkdir -p $ROOTDIR/$TEMPDIR
mv $* $ROOTDIR/$TEMPDIR
echo "the files are mv to $ROOTDIR/$TEMPDIR"
