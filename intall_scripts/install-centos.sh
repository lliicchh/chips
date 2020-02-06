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
sudo yum install -y git vim tree

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
sudo yum -y install pcre-devel openssl openssl-devel

# 7. java
sudo yum install  -y java java-1.8.0-openjdk-devel.x86_64

# others
yum -y install yum-utils
sudo yum-config-manager --add-repo https://openresty.org/yum/cn/centos/OpenResty.repo
yum -y install openresty

# goaccess
sudo yum install geoip-devel ncurses ncurses-devel glib2-devel -y
wget https://tar.goaccess.io/goaccess-1.3.tar.gz
tar -xzvf goaccess-1.3.tar.gz
cd goaccess-1.3/
./configure --enable-utf8 --enable-geoip=legacy
make
make install