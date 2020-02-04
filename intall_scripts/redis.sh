1. 安装
# 1.1 redis 依赖项
cd /usr/local
wget http://downloads.sourceforge.net/tcl/tcl8.6.1-src.tar.gz
tar -xzvf tcl8.6.1-src.tar.gz
cd  /usr/local/tcl8.6.1/unix/
./configure  
make && make install

# 也可以用yum 安装
yum instal tcl

# 1.2 redis  
cd /usr/local/
tar -zxvf redis-5.0.5.tar.gz
ln -s redis-5.0.5 redis
# 报错 zmalloc.h:50:31: error: jemalloc/jemalloc.h: No such file or directory
# 解决方法：  make MALLOC=libc
make MALLOC=libc && make test && make install

# 1.3 配置redis 为 daemon 进程
cp /usr/local/redis/utils/redis_init_script /etc/init.d/redis_6379
mkdir /etc/redis -p # （存放redis的配置文件）
mkdir /var/redis/6379 -p # （存放redis的持久化文件）
cp /usr/local/redis/redis.conf /etc/redis/6379.conf

# 1.4 修改conf文件
# daemonize    yes                            让redis以daemon进程运行
# pidfile        /var/run/redis_6379.pid     设置redis的pid文件位置
# port        6379                        设置redis的监听端口号
# dir         /var/redis/6379                设置持久化文件的存储位置

cd /etc/init.d
chmod 777 redis_6379

# ./redis_6379 start

# 1.5 让redis跟随系统启动自动启动
#在redis_6379脚本中，最上面，加入两行注释
vi /etc/init.d/redis_6379
# chkconfig:   2345 90 10
# description:  Redis is a persistent key-value database
chkconfig redis_6379 on


# 1.6 停止带密码的redis-server
redis-cli -a password shutdown
