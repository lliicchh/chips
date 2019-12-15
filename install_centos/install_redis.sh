#!/bin/bash
cd /usr/local
# redis make test 依赖 tcl
# wget http://downloads.sourceforge.net/tcl/tcl8.6.1-src.tar.gz
# wget https://github.com/cpthree/download-tcl8.6.1/raw/master/tcl8.6.1-src.tar.gz
tar -xzvf tcl8.6.1-src.tar.gz
cd  /usr/local/tcl8.6.1/unix/
./configure  
make && make install

# install redis
#wget http://download.redis.io/releases/redis-5.0.7.tar.gz
#tar xzf redis-5.0.7.tar.gz
cd /usr/local/redis-5.0.7
make && make test && make install
