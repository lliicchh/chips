#!/bin/bash

# Centos7 gcc版本默认4.8.3，Red Hat 为了软件的稳定和版本支持，yum 上版本也是4.8.3，所以无法使用yum进行软件更新，所以使用scl。 
# scl软件集(Software Collections),是为了给 RHEL/CentOS 用户提供一种以方便、安全地安装和使用应用程序和运行时环境的多个（而且可能是更新的）版本的方式，同时避免把系统搞乱。

# 1. install software colletions
yum install centos-release-scl scl-utils-build
# 2. list all avilable scl
yum list all --enablerepo='centos-sclo-rh'
