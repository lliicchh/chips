### 程序安装
1. 先下载再安装：安装命令 rpm   
```
rpm -i jdk-xxx_linux-x64_bin.rpm  
-q : query  
-a : all  
-i : install  
-e : erase
```

2. 软件管家：yum  
```
yum install xxxx
yum erase xxxx            
软件管家下载软件的地址：/etc/yum.repos.d/CentOS-Base.repo 里
```

3. 也可以直接下载xx_bin.tar.gz 包，将其解压，得到的文件夹里面有bin。然后设置环境变量。最后source 一下.bashrc
``` 
export JAVA_HOME=/root/jdk-XXX_linux-x64
export PATH=$JAVA_HOME/bin:$PATH
```
### 程序运行
运行程序的三种方式：
``` 
1. ./filename
2. nohup xxx >> /dev/null (no hung up： 不挂起) 
3. 以服务的方式运行：如mysql
```

![image-20191228135154099](C:\Users\ethan\AppData\Roaming\Typora\typora-user-images\image-20191228135154099.png)
