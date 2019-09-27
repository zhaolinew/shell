#!/bin/awk -f
BEGIN{FS=":"}
{if($1~/Savage/){print "this is command1"$1,$2}}
{if($1~/^Chet/){print "this is command2"$1,$3,$4,$5}}
{if($3=250){print "this is comannd3"$1,$3}}
