#!/bin/bash

#新建.ssh
ssh-keygen -t rsa

#绑定host
vim /etc/hosts
添加: ip hostname

#集群分发文件
xsync.sh
