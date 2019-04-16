#!/bin/bash

docker service create \
	--name yao-scheduler \
	--hostname yao-scheduler \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/data/yao/scheduler,target=/root/yao/ \
	quickdeploy/yao-scheduler:dev sleep infinity
