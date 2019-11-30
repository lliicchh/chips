#!/bin/bash

#可选择新版本
# wget http://mirrors.tuna.tsinghua.edu.cn/apache/rocketmq/4.3.2/rocketmq-all-4.3.2-source-release.zip
# unzip rocketmq-all-4.3.2-source-release.zip
# mv rocketmq-all-4.3.2 rocketmq 
# cd rocketmq
# mvn -Prelease-all -DskipTests clean install -U

cd /usr/local
wget https://mirrors.tuna.tsinghua.edu.cn/apache/rocketmq/4.6.0/rocketmq-all-4.6.0-bin-release.zip 
unzip rocketmq-all-4.6.0-bin-release.zip
mv rocketmq-all-4.6.0-bin-release rocketmq

# 创建存储路径
mkdir -p /usr/local/rocketmq/store
mkdir -p /usr/local/rocketmq/store/commit
mkdir -p /usr/local/rocketmq/store/consum
mkdir -p /usr/local/rocketmq/store/index

cd /usr/local/rocketmq/conf
sed -i 's#${user.home}#/usr/local/rocketmq/data#g' *.xml

