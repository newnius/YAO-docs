#!/bin/bash

docker service create \
	--name yao-portal \
	--hostname yao-portal \
	--constraint node.role==manager \
	--network yao-net \
	--replicas 1 \
	--detach=true \
	--publish 80:80 \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/data/yao-portal/config/,target=/config/ \
	quickdeploy/yao-portal
