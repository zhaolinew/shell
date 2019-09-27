#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-16
#FileName：		international_chess_while33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
CLO1="\e[45;1m"
CLO2="\e[43;1m"
CLOEND="\e[0m"
i=1
while [ $i -le 8 ];do
	j=1
  while [ $j -le 8 ];do
		if [ $[$i%2] -eq 0 ]; then
	    if [ $[$j%2] -eq 0 ]; then
  	    echo -e "$CLO1  $CLOEND\c"
   		 else 
    	  echo -e "$CLO2  $CLOEND\c"
   		 fi
		else
			if [ $[$j%2] -eq 0 ]; then
        echo -e "$CLO2  $CLOEND\c"
      else 
        echo -e "$CLO1  $CLOEND\c"
      fi
		fi
			let j++
  done
  echo
	let i++
done        
