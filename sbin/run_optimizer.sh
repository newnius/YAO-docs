#!/bin/bash

docker run \
        --name yao-optimizer \
        --hostname yao-optimizer \
        --network yao-net \
        --network-alias yao-optimizer \
        -d \
        --restart always \
        --detach=true \
        --env PYTHONUNBUFFERED=1 \
        --mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
        quickdeploy/yao-optimizer:dev

#--gpus all \
#--gpus '"device=1"' \
