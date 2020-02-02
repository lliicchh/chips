```
# 建立账号
CREATE USER 'ethan'@'%' IDENTIFIED BY '@#$licheng27';
# 授权
GRANT all privileges ON *.* TO 'ethan'@'%';
# 刷新
flush privileges;
```

