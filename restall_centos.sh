#!/bin/bash

#新建.ssh
# ssh-keygen -t rsa
# 
##绑定host
# vim /etc/hosts
# 添加: ip hostname
# 
##集群分发文件
# xsync.sh

# VBoxManage clonevm node-01  --mode all --name node-02 --register

# 1. 换网易源
sudo mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
#cp CentOS7-Base-163.repo etc/yum.repos.d/CentOS-Base.repo

# 1.1配置yum
yum clean all
yum makecache
yum install wget

# 2.更新
sudo yum -y update
sudo yum -y upgrade


# 3.安装git
sudo yum install -y git

# 4.升级gcc
sudo yum install centos-release-scl -y
sudo yum install devtoolset-3-toolchain -y
sudo yum install gcc-c++
sudo scl enable devtoolset-3 bash

# 7 JDK
# 7.1将jdkxxxx.rpm通过WinSCP上传到虚拟机中
cd /usr/local
rpm -ivh jdk-11.0.4_linux-x64_bin.rpm
# 7.2 配置jdk相关的环境变量
echo 'JAVA_HOME=/usr/java/latest' | tee -a /etc/profile
echo 'PATH=$PATH:$JAVA_HOME/bin' | tee -a /etc/profile
source /etc/profile
# 7.3 java11 转到Java8
# rpm -qa | grep jdk
# yum -y remove  以上命令的结果
# rpm -ivh jdk-8u221-linux-x64.rpm

# 8 Golang
# 8.安装golang
# 8.1 先从win上传golang
sudo tar -zxvf /usr/local/go1.12.7.linux-amd64.tar.gz -C /usr/local
# 8.2 环境变量
echo 'export GOROOT=/usr/local/go' | sudo tee -a /etc/profile
echo 'export PATH=$PATH:/usr/local/go/bin' | sudo tee -a /etc/profile
source /etc/profile
echo 'export GOPATH=/home/ethan/code/go' | sudo tee -a /home/ethan/.bashrc
source /home/ethan/.bashrc
