#!/bin/bash
#
#***********************************************************
#Author:                Jibill Chen
#QQ:                    417060833
#Date:                  2019-06-13
#FileName：             t29.sh
#URL:                   http://www.jibiao.work
#Description：          The test script
#**********************************************************
#function call
. hanio.main
layer=4
#select
clear
tput cup 1 0
echo -e "\t【1】Step by step to watch the Tower of Hanio"
echo -e "\t【2】The N layers of Hanio's step"
tput cup 0 0
read -p "what function do you select:" fc
if [ $fc -eq 2  ]; then
tput cup 4 0
read -p "How many layer of Hanio you want to see:" la
move1 $la A B C
elif [ $fc -eq 1 ] ; then
clear
#print hanio
tput cup 12 0
movetxt=$(move 3 A B C)
#echo $movetxt
for s in $(seq 7)
do
	mt=$(echo $movetxt | cut -c $[16*(s-1)+1]-$[16*(s-1)+16])
	step[s]=$mt
done
tput cup 0 0
echo "    A            B           C"
tput cup 0 0
echo
print_hanio $layer 0
print_gang $layer 2 12
print_gang $layer 2 24
num_of_fun=$(cat hanio.main|grep '^p[0-9]*[(][)]'|wc -l)
y=1
for p in $(seq $num_of_fun)
do

	sleep 0.2
	if [ $p -eq 1 -o $p -eq 9 -o $p -eq 18 -o $p -eq 27 -o $p -eq 36 -o $p -eq 47 -o $p -eq 57 ] ; then
		tput sc
		tput cup $[y+11] 0
		echo "${step[y]}"
		let y+=1
		tput rc
		
	fi
	p$[p] $layer
done
fi
