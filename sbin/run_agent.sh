#!/bin/bash

docker run \
	--gpus all \
	--name yao-agent \
	--network yao-net \
	--network-alias $(hostname) \
	--hostname $(hostname) \
	-d \
	--restart always \
	--detach=true \
	--env ClientID=$(hostname) \
	--env ClientHost=$(hostname) \
	--env KafkaBrokers=kafka-node1:9092,kafka-node2:9092,kafka-node3:9092 \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
	quickdeploy/yao-agent

#--pid=host \
