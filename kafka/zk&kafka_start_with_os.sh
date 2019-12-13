1. zk:
# vi /etc/rc.d/init.d/zookeeper
#写入
#!/bin/bash
#chkconfig:2345 20 90
#description:zookeeper
#processname:zookeeper
export JAVA_HOME=/usr/java/latest
case $1 in
        start) su root /usr/local/zk/bin/zkServer.sh start;;
        stop) su root /usr/local/zk/bin/zkServer.sh  stop;;
        status) su root /usr/local/zk/bin/zkServer.sh status;;
        restart) su root /usr/local/zk/bin/zkServer.sh restart;;
        *) echo "require start|stop|status|restart" ;;
esac

#2 kafka 
# vim /etc/rc.d/init.d/kafka
#写入
#!/bin/bash
export JAVA_HOME=/usr/java/latest
export PATH=$JAVA_HOME/bin:$PATH

#chkconfig:2345 20 90
#description:kafka
#processname:kafka
case $1 in
        start)su root /usr/local/kafka/bin/kafka-server-start.sh  /usr/local/kafka/config/server.properties;;
        stop) /usr/local/kafka/bin/kafka-server-stop.sh;;
        status) jps;;
        restart)
                /usr/local/kafka/bin/kafka-server-stop.sh
                /usr/local/kafka/bin/kafka-server-start.sh /usr/local/kafka/config/server.properties;;
        *) echo "require start|stop|status|restart";;
esac

# 设置开机启动
chmod +x kafka && chmod +x zookeeper
chkconfig --add kafka && chkconfig --add zookeeper
chkconfig --list #验证
chkconfig kafka on && chkconfig zookeeper on
