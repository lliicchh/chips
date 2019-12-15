#!/bin/bash
# 1. 换网易源
yum install -y wget
sudo mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo

# 1.1配置yum
yum clean all
yum makecache


# 2.更新
sudo yum -y update
sudo yum -y upgrade

# 3.安装git, vim
sudo yum install -y git
sudo yum install -y vim

# 4.升级gcc
sudo yum install centos-release-scl -y
sudo yum install devtoolset-3-toolchain -y
sudo yum install gcc-c++
sudo scl enable devtoolset-3 bash

# 5.账号权限升级
echo 'ethan ALL=(ALL) ALL'>> /etc/sudoers # 向配置文件中加入语句

# 6.必备软件
yum -y install gcc
yum -y install gcc-c++
yum -y install gcc-go
# 7. 安装小工具：
yum -y install lrzsz screen
yum -y install socat nc nmap
yum -y install tree
yum -y install man-pages libstdc++-docs #安装开发手册
