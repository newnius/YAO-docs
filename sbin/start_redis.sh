#! /bin/bash

docker service create \
	--name redis \
	--hostname redis \
	--network yao-net \
	--replicas 1 \
	--detach=true \
	--endpoint-mode dnsrr \
	redis redis-server --appendonly yes
