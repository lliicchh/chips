#!/bin/bash


# 启动集群的zk-3.5.5
for host in {node-01,node-02,node-03}; do
	echo ... checking $host ...
	ssh $host "/usr/local/zk/bin/zkServer.sh start"
done


# 检查一遍状态
for host in {node-01,node-02,node-03}; do
	echo ... checking $host ...
	ssh $host "/usr/local/zk/bin/zkServer.sh status"
done
