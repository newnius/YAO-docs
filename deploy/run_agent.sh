#!/bin/bash

docker run \
	-d \
	--name yao-agent \
	--pid=host \
	-p 8000:8000 \
	-e ClientID=1 \
	-e ClientHost=yao-agent \
	-e KafkaBrokers=kafka:9092 \
	--mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
	--add-host=kafka:192.168.100.105 \
	quickdeploy/yao-agent
