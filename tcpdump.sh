#!/bin/bash
#
#******************************************************************* *
#Author:                Leo
#QQ:                    77961731
#Date:                  2019-09-05
#FileName：             tcpdump.sh
#URL:                   https://blog.51cto.com/127601
#Description：          The test script
#Copyright (C):        2019 All rights reserved
#********************************************************************
tcpdump -i ens32 -s 100 -G 60 -w /data/'%Y_%m%d_%H%M_%S'.pcap -Z root

