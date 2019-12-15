#!/bin/bash
# 关闭防火墙
systemctl stop firewalld.service
systemctl disable firewalld.service

# 安装 ifconfig 
yum -y install net-tools

# 安装gcc
yum -y install gcc

# Nmap 网络映射器用来分析网络，通过运行它可以发现网络的映射关系。
yum install -y nmap

# 多个gcc版本共存管理
# 
# yum install -y centos-release-scl # 安装scl源 
# yum install -y scl-utils-build 	  # 要启用和运行 SCL 中的应用，你还需要安装下列包：
# yum install -y devtoolset-4-toolchain #安装高版本的gcc
# scl --list		     #查看scl安装的软件列表 
# scl enable devtoolset-4 bash #使用devtoolset-4的环境 
