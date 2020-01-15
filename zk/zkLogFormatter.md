**1、环境变量**  
在 /etc/profile 中添加
export zkDir=/usr/local/zookeeper
export JAVA_OPTS="$JAVA_OPTS -Djava.ext.dirs=$zkDir:$zkDir/lib"


**2、事务日志可视化**  
java $JAVA_OPTS org.apache.zookeeper.server.LogFormatter 事务日志

**3、数据快照可视化**  
java $JAVA_OPTS  org.apache.zookeeper.server.SnapshotFormatter 数据快照文件