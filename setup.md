# Steps to bring up the YAO components

## Install docker
```bash
curl -fsSL https://get.docker.com | sh
```


## Install nvidia driver


## Install Nvidia-docker
Read [NVIDIA/nvidia-docker](https://github.com/NVIDIA/nvidia-docker) for guidance.

Set default runtime to nvidia, see [Default runtime](https://github.com/NVIDIA/nvidia-docker/wiki/Advanced-topics#default-runtime).


## Init a docker swarm cluster
```bash
# on master node
docker swarm init

# Add other nodes to the cluster
docker swarm join --token A-LONG-TOKEN-STRING-HERE 192.168.0.1:2377
```


## Create an overlay network named `yao`
```bash
docker network create --driver overlay --attachable yao-net

# docker network create --driver overlay --attachable --opt encrypted yao-net
```

*Note: try remove encrypted when the containers cannot communicate cross nodes*


## Start HDFS cluster (Optional)
```bash
sbin/run_hdfs.sh
```

## Start GlusterFS cluster (Optional)
```bash
sbin/start_glusterfs.sh
```


## Start the agents in each YAO-Worker
```bash
sbin/run_agent_helper.sh

sbin/run_agent.sh
```

## Start the agent-master on YAO-Master
```bash
sbin/start_agent_master.sh
```


## Start mysql
```bash
sbin/start_mysql.sh
```

## Start yao-optimizer on Master Node
```bash
sbin/run_optimizer.sh
```

## Start yao-scheduler
```bash
sbin/start_scheduler.sh
```

## Start Redis
```bash
sbin/start_redis.sh
```

## Start the web portal
```bash
sbin/start_portal.sh
```

## Install

Visit `http://YOUR_IP/install.php`

