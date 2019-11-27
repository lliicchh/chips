#!/bin/bash

# zookeeper
cd /usr/local
tar -zxvf zookeeper-3.5.5.tar.gz
mv zookeeper-3.5.5 zk
echo 'ZOOKEEPER_HOME=/usr/local/zk-3.5.5' | tee -a /etc/profile
echo 'PATH=$PATH:$ZOOKEEPER_HOME/bin'	  | tee -a /etc/profile
source /etc/profile

cd /usr/local/zk-3.5.5/conf && cp zoo_sample.cfg zoo.cfg

#vi zoo.cfg
#修改：dataDir=/usr/local/zk/data
#新增：
# 注意3888后面不能有空格，不然启动不了
#server.0=node-01:2888:3888
#server.1=node-02:2888:3888
#server.2=node-03:2888:3888

 
mkdir /usr/local/zk-3.5.5/data -p  && cd /usr/local/zk-3.5.5/data
touch myid
# 每个节点的myid 不一样0， 1， 2...
touch myid && echo '1' >> /usr/local/zk-3.5.5/data/myid
