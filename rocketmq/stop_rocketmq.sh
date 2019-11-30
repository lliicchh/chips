#!/bin/bash
# stop rocketmq
for host in {mq-master01,mq-master02,mq-slave01,mq-slave02}; do
	echo ... checking $host ...
	ssh $host "sh /usr/local/rocketmq/bin/mqshutdown broker"
done
for host in {mq-nameserver01,mq-nameserver02}; do
	echo ... checking $host ...
	ssh $host "sh /usr/local/rocketmq/bin/mqshutdown namesrv"
done


