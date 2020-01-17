#!/bin/bash

#可选择新版本
# wget http://mirrors.tuna.tsinghua.edu.cn/apache/rocketmq/4.3.2/rocketmq-all-4.3.2-source-release.zip
# unzip rocketmq-all-4.3.2-source-release.zip
# mv rocketmq-all-4.3.2 rocketmq 
# cd rocketmq
# mvn -Prelease-all -DskipTests clean install -U

1. 安装
cd /usr/local
wget https://mirrors.tuna.tsinghua.edu.cn/apache/rocketmq/4.6.0/rocketmq-all-4.6.0-bin-release.zip 
unzip rocketmq-all-4.6.0-bin-release.zip
ln -s rocketmq-all-4.6.0-bin-release rocketmq

# 创建存储路径
mkdir -p /usr/local/rocketmq/store
mkdir -p /usr/local/rocketmq/store/commit
mkdir -p /usr/local/rocketmq/store/consum
mkdir -p /usr/local/rocketmq/store/index

cd /usr/local/rocketmq/conf
sed -i 's#${user.home}#/usr/local/rocketmq/data#g' *.xml

2. 集群启动
#!/bin/bash
# stop rocketmq
for host in {mq-nameserver01,mq-nameserver02}; do
	echo ... checking $host ...
	ssh $host "nohup sh /usr/local/rocketmq/bin/mqnamesrv &"
done

ssh mq-master01 "nohup sh /usr/local/rocketmq/bin/mqbroker /usr/local/rocketmq/conf/2m-2s-async/broker-a.properties &"
ssh mq-master02 "nohup sh /usr/local/rocketmq/bin/mqbroker /usr/local/rocketmq/conf/2m-2s-async/broker-b.properties &"
ssh mq-slave01 "nohup sh /usr/local/rocketmq/bin/mqbroker /usr/local/rocketmq/conf/2m-2s-async/broker-a-s.properties &"
ssh mq-slave02 "nohup sh /usr/local/rocketmq/bin/mqbroker /usr/local/rocketmq/conf/2m-2s-async/broker-b-s.properties &"


3. 集群停止
# stop rocketmq
for host in {mq-master01,mq-master02,mq-slave01,mq-slave02}; do
	echo ... checking $host ...
	ssh $host "sh /usr/local/rocketmq/bin/mqshutdown broker"
done
for host in {mq-nameserver01,mq-nameserver02}; do
	echo ... checking $host ...
	ssh $host "sh /usr/local/rocketmq/bin/mqshutdown namesrv"
done




