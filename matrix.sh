#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-18
#FileName：		matrix.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#*******************************************************************
#read -p "please input row of  matrix:" ROW
#read -P "Please input col of matrix:" COL
#arr=([00]=1 [01]=2 [02]=3 [10]=4 [11]=5 [12]=6 [20]=7 [21]=8 [22]=9)
MAT0=(1 2 3)
MAT1=(4 5 6)
MAT2=(7 8 9)
echo -e "the Matrix is below:\n${MAT0[@]}\n${MAT1[@]}\n${MAT2[@]}"
for ((i=0;i<3;i++)); do
	for ((j=i;j<3;j++)); do
		if [ $i -ne $j ]; then
			 MATi=MAT$i
			 MID=${$MATi[$j]}
				echo $MID
			 MAT$i[$j]=${$MATj[$i]}
			 MAT$j[$i]=$MID
		fi
	done
done
echo -e "the after convert is below:\n${MAT0[@]}\n${MAT1[@]}\n${MAT2[@]}"

	

