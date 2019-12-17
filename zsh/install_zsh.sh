#!/bin/bash

# install 
sudo yum install zsh -y

chsh -s /bin/zsh

# 安装给当前用户
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc