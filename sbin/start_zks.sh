#!/bin/bash

docker service create \
	--name zookeeper-node1 \
	--hostname zookeeper-node1 \
	--detach=true \
	--replicas 1 \
	--network yao-net \
	--endpoint-mode dnsrr \
	--env ZOO_MY_ID=1 \
	--env ZOO_SERVERS="server.1=zookeeper-node1:2888:3888 server.2=zookeeper-node2:2888:3888 server.3=zookeeper-node3:2888:3888" \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	zookeeper:3.4

docker service create \
	--name zookeeper-node2 \
	--hostname zookeeper-node2 \
	--detach=true \
	--replicas 1 \
	--network yao-net \
	--endpoint-mode dnsrr \
	--env ZOO_MY_ID=2 \
	--env ZOO_SERVERS="server.1=zookeeper-node1:2888:3888 server.2=zookeeper-node2:2888:3888 server.3=zookeeper-node3:2888:3888" \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	zookeeper:3.4

docker service create \
	--name zookeeper-node3 \
	--hostname zookeeper-node3 \
	--replicas 1 \
	--detach=true \
	--network yao-net \
	--endpoint-mode dnsrr \
	--env ZOO_MY_ID=3 \
	--env ZOO_SERVERS="server.1=zookeeper-node1:2888:3888 server.2=zookeeper-node2:2888:3888 server.3=zookeeper-node3:2888:3888" \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	zookeeper:3.4
