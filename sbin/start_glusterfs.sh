#!/bin/bash

# Setup
docker run \
	--name gluster_server \
	--restart always \
	-d \
	--privileged=true \
	--net=host \
	-v /data/gluster/configuration:/etc/glusterfs:z \
	-v /data/gluster/metadata:/var/lib/glusterd:z \
	-v /data/gluster/logs:/var/log/glusterfs:z \
	-v /data/gluster/data:/data \
	gluster/gluster-centos

exit 0;


# Init
gluster peer probe 192.168.100.101
gluster peer probe 192.168.100.102
gluster peer probe 192.168.100.103
gluster peer probe 192.168.100.104
gluster peer probe 192.168.100.105
gluster peer probe 192.168.100.106
gluster peer status


# Create & Start Volume
gluster volume create yao replica 3 192.168.100.101:/data/yao 192.168.100.102:/data/yao 192.168.100.103:/data/yao 192.168.100.104:/data/yao 192.168.100.105:/data/yao 192.168.100.106:/data/yao

gluster volume start yao

gluster volume status

# Client Mount
sudo yum install glusterfs glusterfs-fuse attr -y

sudo mkdir -p /dfs && sudo chmod -R 777 /dfs

sudo mount -t glusterfs 192.168.100.102:/yao /dfs

sudo chmod 777 /dfs
