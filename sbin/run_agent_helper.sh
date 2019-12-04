#!/bin/bash

docker run \
	--name yao-agent-helper \
	-d \
	--restart always \
	--detach=true \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
	docker:latest sleep 86400000
