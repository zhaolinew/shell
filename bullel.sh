#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-06-18
#FileName：		bullel.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
#!/bin/sh
declare -a rand
declare -i sub=
echo "Please input the numbers you want to sort:"
read -a rand
for ((i=0;i<${#rand[*]}-1;i++));do
	for ((j=0;j<${#rand[*]}-i-1;j++));do
		if [ ${rand[$j]} -gt ${rand[$j+1]} ];then
			sub=${rand[$j+1]}
			rand[$j+1]=${rand[$j]}
			rand[$j]=$sub
		fi
	done
done
echo "The numbers have been sorted:${rand[*]}"
