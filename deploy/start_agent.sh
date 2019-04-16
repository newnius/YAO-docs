#!/bin/bash

docker service create \
	--name yao-agent-slave105 \
	--hostname yao-agent-slave105 \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--env ClientID=1 \
	--env ClientHost=yao-agent-slave105 \
	--env KafkaBrokers=kafka-node1:9092,kafka-node2:9092,kafka-node3:9092 \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
	quickdeploy/yao-agent
