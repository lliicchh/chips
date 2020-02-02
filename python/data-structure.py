# *常用数据结构：
l = []  # list
l = [1,2,4]
for item in l:
    print(item)

t = ()  # tuple
d = {}  # dictionary/set
print(t)


# 字符串：

# 多行注释
# """xxx"""

# 转义字符 \
# *
# 支持索引，切片和遍历等
# *
# name = "licheng"
# *
# for char in name:
#     *
# do_sth()
# *
# 是不可变的（immutable）
#
# *
# name = "licheng"
# *
# # wrong operation
# *
# name[1] = 'L'
# *
# # right operation
# *
# name = 'L' + name[1:]
# *
# name = name.replace('l', 'L')
# *
# 常用操作：join() / strip() / split()
# *
# 格式化函数：string.format(), 占位符
# {}（类似c中printf()）
# *
# 输入输出：
#
# *
# 标准输入输出input()
# *
# 文件I / O:
# with open...as ..:
#     *
# json.dump() / json.loads()
# *
# 条件与循环：
#
#
#
# # if
# if condtion1:
#     statment1
# elif condition2:
#     statement2
# else:
#     statement
#
# # for
# for item in < iterable >:
#     ...
# # 字典遍历
# for k in d:  # 遍历字典的键
#     ...
# for k in d.values():  # 遍历字典的值
#     ...
# for k, v in d.iterms():  # 遍历字典的键和值
#     ...
#
# # 遍历集合的索引和元素 enumerate()
# for index, item in enumerate(l):
#     ...
#
#     *
# 函数
#
# *
# 内部函数
# *
# 闭包
#
#
# def nth_power(exp):
#     def inner(base):
#         retrun
#         base ** exp
#
#     retrun
#     inner
#
#
# square = nth_power(2)  # 指定exp 为2
# res = square(3)  # 指定base 为 3
#
# *
# lambda
#
#         *
#         返回的是一个表达式，而非一个语句
#         *
#         lambda 的主体是只有一行的简单表达式，并不能扩展成一个多行的代码块
#         *
#         函数式编程
#
#         *
#         map()、filter() 和 reduce()，通常结合匿名函数 lambda 一起使用
#         *
#         map(function, iterable) 函数，前面的例子提到过，它表示，对
# iterable
# 中的每个元素，都运用
# function
# 这个函数，最后返回一个新的可遍历的集合
# *
# filter(function, iterable)
# 函数，它和
# map
# 函数类似，function
# 同样表示一个函数对象。filter()
# 函数表示对
# iterable
# 中的每个元素，都使用
# function
# 判断，并返回
# True
# 或者
# False，最后将返回
# True
# 的元素组成一个新的可遍历的集合。
# *
# 编码规范， pychram整合autopep8
#
# *
# Name：Autopep8（可以随便取）
# *
# - Tools
# settings:
# *
# - Programs：`autopep8的安装地址` （前提是你已经安装了哦）
# *
# - Parameters: `-- in -place - -aggressive - -aggressive $FilePath$`
# *
# - Working
# directory: `$ProjectFileDir$`
# *
# - 点击Output
# Filters→添加，在对话框中的：Regular
# expression
# to
# match
# output中输入：`$FILE_PATH$\:$LINE$\:$COLUMN$\:.*`
#
