#!/bin/bash

# 换成163源
yum install -y wget
sudo mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
#wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo

# 1.配置yum
yum clean all
yum makecache

# 2.更新
sudo yum -y update
sudo yum -y upgrade

# 3.安装常用软件
sudo yum install -y git
sudo yum install -y vim

sudo yum install -y net-tools lsof tcpdump telnet nc 

# 4.gcc
sudo yum install -y  gcc g++ make cmake
sudo yum -y install gcc-go
sudo yum install centos-release-scl -y
sudo yum install devtoolset-3-toolchain -y
sudo scl enable devtoolset-3 bash

# 5.账号权限升级
echo 'ethan ALL=(ALL) ALL'>> /etc/sudoers # 向配置文件中加入语句

# 6. 安装小工具：
sudo yum -y install lrzsz screen
sudo yum -y install socat nc nmap
sudo yum -y install tree
sudo yum -y install man-pages libstdc++-docs #安装开发手册
sudo yum install tcl.x86_64

# 7. java
sudo yum install  -y java java-1.8.0-openjdk-devel.x86_64
