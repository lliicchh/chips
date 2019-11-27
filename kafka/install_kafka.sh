#!/bin/bash
# 1. kafka依赖zk, 先装zk 
# 2. kafka依赖scala
cd /usr/local
tar -zxvf scala-2.11.4.tgz
mv scala-2.11.4 scala
echo 'SCALA_HOME=/usr/local/scala'	| tee -a /etc/profile
echo 'PATH=$PATH:$SCALA_HOME/bin'	| tee -a /etc/profile
source /etc/profile

# 3. 装kafka
cd /usr/local
tar -zxvf kafka_2.11-0.11.0.2.tgz
mv kafka_2.11-0.11.0.2 kafka


# 4. 配置kafka
# vi /usr/local/kafka/config/server.properties
# broker.id：依次增长的整数，0、1、2，集群中Broker的唯一id
# zookeeper.connect=192.168.31.187:2181,192.168.31.19:2181,192.168.31.227:2181

#解决kafka Unrecognized VM option 'UseCompressedOops'问题
# vi /usr/local/kafka/bin/kafka-run-class.sh
# if [ -z "$KAFKA_JVM_PERFORMANCE_OPTS" ]; then
# 	  KAFKA_JVM_PERFORMANCE_OPTS="-server  -XX:+UseCompressedOops -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:+CMSScavengeBeforeRemark -XX:+DisableExplicitGC -Djava.awt.headless=true"
# fi
# 去掉-XX:+UseCompressedOops即可

# 每台机器都关掉zk和kafka 监听端口防火墙,不然别的节点连不上
firewall-cmd --permanent --add-port=9092/tcp   # kafka 监听的端口
firewall-cmd --permanent --add-port=2181/tcp  # zk 监听的端口
firewall-cmd --permanent --add-port=2888/tcp  # zk leader 和 follwer 之间正常通信的端口号 
firewall-cmd --permanent --add-port=3888/tcp  #zk 各个节点之间选举时的通信端口号
firewall-cmd --permanent --add-port=3306/tcp
firewall-cmd --reload
firewall-cmd --state

# 也可以关掉防火墙
systemctl stop firewalld.service
systemctl disable firewalld.service

# 检查是否安装成功

#测试
#使用基本命令检查kafka是否搭建成功
# 1 新建topic
bin/kafka-topics.sh --zookeeper zkip1:2181,zkip2:2181,zkip3:2181 --topic test --replication-factor 1 --partitions 1 --creating

# 2 生产消息
bin/kafka-console-producer.sh --broker-list  kafkaIP1:9092,kafkaIP2:9092,kafkaIP3:9092  --topic test

# 3 消费消息
bin/kafka-console-consumer.sh --zookeeper  zkip1:2181,zkip2:2181,zkip3:2181   --topic test --from-beginning

