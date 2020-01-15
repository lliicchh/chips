1. 安装
cd /usr/local
wget https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz
tar -zxf apache-maven-3.5.4-bin.tar.gz
ln -s apache-maven-3.5.4-bin.tar.gz maven

2.环境变量
echo 'M2_HOME=/usr/local/maven' | tee -a /etc/profile
echo 'PATH=$PATH:$M2_HOME/bin' | tee -a /etc/profile
source /etc/profile
echo 'JAVA_HOME=/usr/java/latest' | tee -a /home/ethan/.bashrc
echo 'PATH=$PATH:$JAVA_HOME/bin' | tee -a /home/ethan/.bashrc


# mvn -version

# 修改mvn 源
#cd /usr/local/maven/conf
#
#vi settings.xml
#
#<mirror>
#	<id>nexus-aliyun</id>
#	<mirrorOf>*</mirrorOf>
#	<name>Nexus aliyun</name>
#	<url>http://maven.aliyun.com/nexus/content/groups/public</url>
#</mirror>



