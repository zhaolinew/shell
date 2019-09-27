#!/bin/bash
#
#********************************************************************
#Author:		Leo
#QQ: 			77961731
#Date: 			2019-05-25
#FileName：		reset33.sh
#URL: 			https://blog.51cto.com/127601
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
vim_env(){
###setup vimrc for user###
cat >> /root/.vimrc << EOF
set ignorecase
set cursorline
set noautoindent
set tabstop=2
set nonumber
autocmd BufNewFile *.sh exec ":call SetTitle()"
func SetTitle()
        if expand("%:e") == 'sh'
	call setline(1,"#!/bin/bash")
	call setline(2,"#")
	call setline(3,"#******************************************************************* *")
	call setline(4,"#Author:                Leo")
	call setline(5,"#QQ:                    77961731")
	call setline(6,"#Date:                  ".strftime("%Y-%m-%d"))
	call setline(7,"#FileName：             ".expand("%"))
	call setline(8,"#URL:                   https://blog.51cto.com/127601")
	call setline(9,"#Description：          The test script")
	call setline(10,"#Copyright (C):        ".strftime("%Y")." All rights reserved")
	call setline(11,"#********************************************************************")
	call setline(12,"")
	endif
endfunc
autocmd BufNewFile * normal G
EOF
}

###########################
#####for redhat system ###
############################
redhat(){
##import yum repository###
mkdir -p /etc/yum.repos.d/backup
mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/backup
cat > /etc/yum.repos.d/base.repo << EOF
[localserver]
name=Local Server
baseurl=http://192.168.205.7/centos/\$releasever/os/x86_64
gpgcheck=0
[BASE]
name=Tsinghua Base
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos/\$releasever/os/x86_64/
gpgcheck=1
gpgkey=https://mirrors.tuna.tsinghua.edu.cn/centos/\$releasever/os/x86_64/RPM-GPG-KEY-CentOS-7
enabled=0
[TsinghuaExtras]
name=Tsinghua Extras
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos/\$releasever/extras/x86_64/
gpgcheck=0
enabled=0
EOF
cat > /etc/yum.repos.d/epel.repo << EOF
[EPEL]
name=Tsinghua epel
baseurl=https://mirrors.tuna.tsinghua.edu.cn/epel/\$releasever/x86_64/
gpgcheck=0
enabled=0
EOF

yum clean all
yum repolist
yum -y install tree vim

##setup alias for to bashrc###
cat >> /root/.bashrc << EOF
alias vi='/usr/bin/vim'
alias cdnet="cd /etc/sysconfig/network-scripts"
alias editnet="vim /etc/sysconfig/network-scripts/ifcfg-ens33"
alias epel="sed -i '/enabled=/s/enabled=0/enabled=1/' /etc/yum.repos.d/epel.repo"
alias epeldis="sed -i '/enabled=/s/enable=1/enabled=0/' /etc/yum.repos.d/epel.repo"
alias scandisk="echo '- - -' > /sys/class/scsi_host/host0/scan; echo '- - -' > /sys/class/scsi_host/host2/scan"
alias vie0="vim /etc/sysconfig/network-scripts/ifcfg-eth0"
alias sysr="systemctl restart"
alias syse="systemctl enable"
alias sethost="hostnamectl set-hostname"
EOF

## export enviroment variables ##
cat >> /etc/profile.d/env.sh << EOF
export PS1="\[\e[36m\][\u@\h \W]\\$\[\e[0m\]"
export PATH=/app/bin:$PATH
EOF

###setup ssh-copy ###
mkdir -pv /root/.ssh
chmod 700 /root/.ssh
cat > /root/.ssh/authorized_keys << EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDb5NnkJo2uLeHaI3FXzUwKDqzolsAJNodSKkrN67RN3ed5quLSIT4QD2roYvkHAV+ipSxK/5n3GEtJywfTSOCoYwlCzVRVi7Rmus5A51ElpcWLtQPb4fa4iR5x+9UrdroUb0Jxu+WFAEReDx3h8FNH+3o8XHAJV6G6nsKPfL22LZPY+6Ki6Z3IOQaM4KhvA2ezes6hcFfWzdRUt5rMHMllMiR8qUIjBzxqWkl4Jp41dSB+TKUoYNY2wlChq3EOpCVV1Q4VhvTd6FWrs/DUgKX40NPslmq7Pq24QFXXnDQbF0UrlbiXWla7T3fhc866KDYttKbkr3kZfq7Lz0X2dtlB root@centos7.localdomain
EOF
chmod 600 /root/.ssh/authorized_keys

###setup chrony ntpupdae###
yum -y install chrony
sed -i 's/^server.*/#&/' /etc/chrony.conf
echo server 192.168.205.7 iburst >> /etc/chrony.conf

###optimize sshd###
sed -i 's/^\#UseDNS.*/UseDNS no/' /etc/ssh/sshd_config
sed -i 's/^GSSAPIAuthentication.*/GSSAPIAuthentication no/' /etc/ssh/sshd_config

###disable selinux and firewall###
setenforce=0
sed -i 's/SELINUX=.*/SELINUX=disabled/' /etc/selinux/config
systemctl status firewalld &>/dev/null && systemctl disable firewalld &>/dev/null; systemctl stop firewalld &>/dev/null
}

###########################
#for ubuntu system        #
###########################
ubuntu(){
#install software
apt install -y tree vim
#import atp sources
cp /etc/apt/sources.list{,.bak}
cat > /etc/apt/sources.list << EOF
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
EOF
##setup alias for to bashrc###
cat >> /root/.bashrc << EOF
alias vi='/usr/bin/vim'
alias scandisk="echo '- - -' > /sys/class/scsi_host/host0/scan; echo '- - -' > /sys/class/scsi_host/host2/scan"
alias sysr="systemctl restart"
alias syse="systemctl enable"
alias sethost="hostnamectl set-hostname"
alias dockerrm="docker rm \`docker ps -aq -f status=exited\`"
EOF

###setup chrony ntpupdae###
apt -y install chrony
sed -i 's/^server.*/#&/' /etc/chrony.conf
echo server 17.18.18.7 iburst >> /etc/chrony.conf

###optimize sshd###
sed -i 's/PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/^\#UseDNS.*/UseDNS no/' /etc/ssh/sshd_config
sed -i 's/^GSSAPIAuthentication.*/GSSAPIAuthentication no/' /etc/ssh/sshd_config
}

OS=`awk -F\" '/^NAME/{print $2}' /etc/os-release`
if [[ "$OS" =~ [u|U][b|B][u|U][n|N][t|T][u|U] ]]; then
   vim_env
   ubuntu 
elif [[ "$OS" =~ [c|C][e|E][n|N][t|T][o|O][s|S] ]]; then
   vim_env
   redhat 
fi

