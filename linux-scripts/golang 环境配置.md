## golang 环境配置

1. 修改golang 环境变量

```shell
# go env -w : 修改golang 环境变量
# 修改gopath:
go env -w GOPATH=xxx
# 七牛云go get 代理：
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn,direct
```



2. goland 使用 go module

* go env 设置使用gomod和代理( go get 下载的包在 $GOPATH/pkg 下面了)
* 安装vgo : go get -u [golang.org/x/vgo](http://golang.org/x/vgo)
* 打开goland，项目里建gomod文件



3. goland 中run 文件，有些客户端需要gcc，需要在win10装gcc 64，可以直接下载binary 文件https://www.cnblogs.com/ghj1976/p/3540257.html