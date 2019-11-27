#!/bin/bash
# 检查一遍状态
for host in {centos-01,centos-02,centos-03}; do
	echo ... checking $host ...
	ssh $host "/usr/local/kafka/bin/kafka-server-start.sh -daemon /usr/local/kafka/config/server.properties"
done

