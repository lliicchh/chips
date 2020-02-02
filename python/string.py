"""
1. 三个引号多行注释
2. '\' 转义
"""

# string 是 immutable
name = "licheng"
# 改写某个字符
# 错误方法 name[0] = "L"
# 正确方法1. name = "L" + name[1:]
# 正确方法2. name = name.replace('1', 'L')
name = name.replace('0', 'k')

# 常用操作
# join()/strip()/split()
name  = "cheng i, "
print(name.strip(', '))
print(name.split(" "))

if __name__ == '__main__':
    print(name.split(","))
