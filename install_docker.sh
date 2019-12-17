#!/bin/bash

sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum-config-manager --enable docker-ce-nightly

sudo yum-config-manager --enable docker-ce-test

sudo yum -y install docker-ce docker-ce-cli containerd.io

sudo systemctl start docker

sudo systemctl enable docker

# aliyun 加速
sudo mkdir -p /etc/docker
touch /etc/docker/daemon.json
echo -e '{\n    "registry-mirrors": ["https://gzfb1qey.mirror.aliyuncs.com"]\n}' | sudo tee /etc/docker/daemon.json 
sudo systemctl daemon-reload
sudo systemctl restart docker
