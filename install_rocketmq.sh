#!/bin/bash

#可选择新版本
 wget http://mirrors.tuna.tsinghua.edu.cn/apache/rocketmq/4.3.2/rocketmq-all-4.3.2-source-release.zip
unzip rocketmq-all-4.3.2-source-release.zip
mv rocketmq-all-4.3.2 rocketmq 
cd rocketmq
mvn -Prelease-all -DskipTests clean install -U
