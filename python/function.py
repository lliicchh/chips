def func():
    print("function")


# 内部函数


# 闭包
def out(i):
    def inner(j):
        return i ** j
    return inner

# 设置i = 2,可以看做是返回了一个inner
s = out(2)
res = s(5) # res = 2 ** 5
res = s(3) # res = 2 ** 3
print(res)
