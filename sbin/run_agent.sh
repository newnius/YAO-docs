#!/bin/bash

docker run \
	-d \
	--name yao-agent \
	--pid=host \
	-p 8000:8000 \
	-e ClientID=1 \
	-e ClientHost=yao-agent \
	-e KafkaBrokers=kafka-node1:9092,kafka-node2:9092,kafka-node3:9092 \
	--add-host=kafka-node1:192.168.0.1 \
	--add-host=kafka-node2:192.168.0.2 \
	--add-host=kafka-node3:192.168.0.3 \
	--mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
	quickdeploy/yao-agent
