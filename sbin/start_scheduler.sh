#!/bin/bash

docker service create \
	--name yao-scheduler \
	--hostname yao-scheduler \
	--constraint node.role==manager \
	--network yao-net \
	--replicas 1 \
	--detach=true \
	--env KafkaBrokers=kafka-node1:9092,kafka-node2:9092,kafka-node3:9092 \
	--env KafkaTopic=yao \
	--env SchedulerPolicy=fair \
	--env ListenAddr='0.0.0.0:8080' \
	--env HDFSAddress='' \
	--env HDFSBaseDir='/user/yao/output/' \
	--env DFSBaseDir='/dfs/yao-jobs/' \
	--env EnableShareRatio=1.75 \
	--env ShareMaxUtilization=1.30 \
	--env EnablePreScheduleRatio=1.75 \
	--env PreScheduleExtraTime=15 \
	--env PreScheduleTimeout=300 \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	quickdeploy/yao-scheduler:dev

        #--env HDFSAddress='http://192.168.100.104:50070/' \
        #--env LoggerOutputDir='log/' \
        #quickdeploy/yao-scheduler:dev sleep infinity
