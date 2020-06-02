#!/bin/bash

ip=`hostname --ip-address`

docker run \
	--gpus all \
	--name yao-agent \
	--network yao-net \
	--network-alias $(hostname) \
	--hostname $(hostname) \
	-d \
	--restart always \
	--detach=true \
	--publish 8000:8000 \
	--env ClientID=$(hostname) \
	--env ClientHost=$(hostname) \
	--env ClientExtHost=${ip} \
	--env Port=8000 \
	--env HeartbeatInterval=5 \
	--env KafkaBrokers=kafka-node1:9092,kafka-node2:9092,kafka-node3:9092 \
	--env EnableEventTrigger=true \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
	quickdeploy/yao-agent

#--pid=host \
