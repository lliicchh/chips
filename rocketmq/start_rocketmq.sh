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


