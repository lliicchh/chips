#!/bin/bash

# https://juejin.im/post/5c088b066fb9a049d4419985

# mysql# 使用163repo 才装上了，aliyun repo 总是下载mysql-server 失败
sudo yum localinstall https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
yum clean all && yum makecache
yum install mysql-community-server
#sudo systemctl enable mysqld
sudo systemctl enable mysqld.service
sudo systemctl start mysqld
sudo systemctl status mysqld

# 用临时密码登录root 账户，然后再更改密码，创建新用户并设置其密码
# 解决安装后没有root密码无法登录的问题
sudo systemctl status mysqld
# 用临时密码登录root 账户，然后再更改密码，创建新用户并设置其密码

###### 忘记root账户密码如何修改 ######
# 1 vim /etc/my.conf 末尾加一行： skip-grant-tables
# 2 update mysql.user set authentication_string=password('19910627LIcheng') where user='root' and Host ='localhost';
# 4 删除步骤1中新加那一行
# 设置之后用新的密码登录报错： ERROR 1820 (HY000): You must reset your password using ALTER USER statement before executing this statement.
# 解决方法：alter user 'root'@'localhost' identified by 'youpassword'; #注意新的密码要有符号大小写等，以符合mysql 设置密码的轻度要求

##### 新建账户密码 #########
# CREATE USER 'username'@'host' IDENTIFIED BY 'password';
# username : 账户名
# host：允许登陆的主机，% 表示允许任何主机登录
# password： 密码，自由设置

##### 授权 #########
# grant all privileges on databases_name.table_name  TO 'username'@'host';
# databases_name: 账户名
# table_name ：表名
# username： 用户名
# host: 主机名
