#!/bin/bash

docker service create \
	--name yao-portal \
	--hostname yao-portal \
	--constraint node.role==manager \
	--network yao-net \
	--replicas 1 \
	--detach=true \
	--publish 80:80 \
	--env SITE_SCHEDULER_ADDR=http://yao-scheduler:8080 \
	--env SITE_BASE_URL=http://210.28.132.13 \
	--env MYSQL_HOST=mysql \
	--env MYSQL_PORT=3306 \
	--env MYSQL_DATABASE=yao \
	--env MYSQL_USER=root \
	--env MYSQL_PASSWORD=123456 \
	--env REDIS_HOST=redis \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	quickdeploy/yao-portal:dev
