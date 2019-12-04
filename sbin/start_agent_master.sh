#!/bin/bash

docker service create \
	--name yao-agent-master \
	--network yao-net \
	--constraint node.role==manager \
	--mode global \
	--detach=true \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
	quickdeploy/yao-agent-master:dev
