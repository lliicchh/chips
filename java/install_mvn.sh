#!/bin/bash

#下载
wget https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz

tar -zxf apache-maven-3.5.4-bin.tar.gz

M2_HOME=/usr/local/apache-maven-3.5.4
PATH=$PATH:$M2_HOME/bin

echo 'M2_HOME=/usr/local/apache-maven-3.5.4' | tee -a /etc/profile
echo 'PATH=$PATH:$M2_HOME/bin' | tee -a /etc/profile
source /etc/profile
