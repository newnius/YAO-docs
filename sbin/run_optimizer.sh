#!/bin/bash

docker run \
	--gpus all \
	--name yao-optimizer \
	--hostname yao-optimizer \
	--network yao-net \
	--network-alias yao-optimizer \
	-d \
	--restart always \
	--detach=true \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	quickdeploy/yao-optimizer:dev
