#!/bin/bash

echo 'JAVA_HOME=/usr/java/latest' | tee -a /home/ethan/.bashrc
echo 'PATH=$PATH:$JAVA_HOME/bin' | tee -a /home/ethan/.bashrc

cd /usr/local
wget http://apache.fayea.com/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
tar -zxvf apache-maven-3.3.9-bin.tar.gz

echo 'MAVEN_HOME=/usr/local/apache-maven-3.3.9' | tee -a /home/ethan/.bashrc
echo 'PATH=$PATH:$MAVEN_HOME/bin' | tee -a /home/ethan/.bashrc
source /home/ethan/.bashrc

# mvn -version

# 修改mvn 源
#cd /usr/local/apache-maven-3.5.0/conf
#
#vi settings.xml
#
#<mirror>
#	<id>nexus-aliyun</id>
#	<mirrorOf>*</mirrorOf>
#	<name>Nexus aliyun</name>
#	<url>http://maven.aliyun.com/nexus/content/groups/public</url>
#</mirror>

