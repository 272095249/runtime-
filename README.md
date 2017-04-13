# runtime常用的用法
## 记录runtime开发中常用的一些用法

## 4月13日 记录整理runtime开发中常用的用法

#### [[简书]iOS开发_runtime常用的用法](http://www.jianshu.com/p/d8bcf1792e1d)


### 方法简介：

##### 一、消息机制
##### 二、方法交换
##### 三、动态添加方法
##### 四、分类添加属性

### 用到的方法

```objc

// 一
objc_msgSend()


// 二
class_getClassMethod(<#__unsafe_unretained Class cls#>, <#SEL name#>)
method_exchangeImplementations(<#Method m1#>, <#Method m2#>)


// 三
class_addMethod(<#__unsafe_unretained Class cls#>, <#SEL name#>, <#IMP imp#>, <#const char *types#>)


// 四
objc_setAssociatedObject(<#id object#>, <#const void *key#>, <#id value#>, <#objc_AssociationPolicy policy#>)
objc_getAssociatedObject(<#id object#>, <#const void *key#>)


```


