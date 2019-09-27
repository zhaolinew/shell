#!/bin/bash

backupDir='/backup'
mkdir -p $backupDir
cp -a /etc/ $backupDir/etc`date +%F` && echo "`date +'%F %T'`: /etc backup success."
