[TOC]   

#### volatile
##### 1、volatile 只能保证可见性，不能保证保证原子性：  
当变量基于其当前的值进行更改时，volatile不能保证线程安全。  
解释：对于volatile变量a，线程1对其进行修改后，将线程2本地缓存的变量值设为无效，线程2下次需要从本地缓存中取该变量值时，发现缓存无效，会去主动load主存中的最新值。但是如果线程2的a值已经被加载到了寄存器，参与运算，那么此时即使线程2的a值被设置为无效，那线程2的计算结果也会把线程2从主内存中加载到本地缓存的的值覆盖，导致数据错误。  

##### 2、volatile 的使用：  
1、使用其可见性：  
1.1 、使用volatile变量做标志位
```
/******** demo1 ********/
volatile boolean flag = false;
while(!flag){
    doWork();
}
public void setFlage(){
    flag  = true;
}

/******** demo2 ********/
volatile boolean inited = false;

// thread 1
context = init();
intited = true;

// thread 2
while(!inited){
    sleep();
}
```
1.2、使用其禁止代码重排序
```
public class Singleton{
    private volatile static singletonInstance;

    private Sigleton(){... }

    public Sigleton getInstance(){
        if (singletonInstance == null){
            sychronized (Singleton.class){
                if (singletonInstance == null){
                    singletonInstance = new Singleton();
                }
            }
        }
    }
}
```


