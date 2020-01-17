#!/bin/sh


# 安装openresty


mkdir -p /usr/servers  && cd /usr/servers/


yum install -y readline-devel pcre-devel openssl-devel gcc


wget http://openresty.org/download/ngx_openresty-1.7.7.2.tar.gz  
tar -xzvf ngx_openresty-1.7.7.2.tar.gz  


cd /usr/servers/ngx_openresty-1.7.7.2/bundle/LuaJIT-2.1-20150120/  
make clean && make && make install  
ln -sf luajit-2.1.0-alpha /usr/local/bin/luajit


cd /usr/servers/ngx_openresty-1.7.7.2/bundle
wget https://github.com/FRiCKLE/ngx_cache_purge/archive/2.3.tar.gz  
tar -xvf 2.3.tar.gz  


cd /usr/servers/ngx_openresty-1.7.7.2/bundle
wget https://github.com/yaoweibin/nginx_upstream_check_module/archive/v0.3.0.tar.gz  
tar -xvf v0.3.0.tar.gz  


cd /usr/servers/ngx_openresty-1.7.7.2  
./configure --prefix=/usr/servers --with-http_realip_module  --with-pcre  --with-luajit --add-module=./bundle/ngx_cache_purge-2.3/ --add-module=./bundle/nginx_upstream_check_module-0.3.0/ -j2  
make && make install


cd /usr/servers/  
/usr/servers/nginx/sbin/nginx -V
