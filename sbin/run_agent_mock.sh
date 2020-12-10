#!/bin/bash

# Example: NUM=100 bash sbin/run_agent_mock.sh

# docker ps -a | grep yao-agent:mock | awk '{print $1}' | xargs docker rm -f

docker run \
	--name yao-agent-mock-$(hostname) \
	--network yao-net \
	--network-alias node-mock-$(hostname) \
	--hostname node-mock-$(hostname) \
	-d \
	--restart always \
	--detach=true \
	--env NUMS=${NUM} \
	--env ClientHost=node-mock-$(hostname) \
	--env ReportAddress='http://yao-scheduler:8080/?action=agent_report' \
	--env PYTHONUNBUFFERED=1 \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
	quickdeploy/yao-agent:mock
