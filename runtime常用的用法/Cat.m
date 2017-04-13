//
//  Cat.m
//  runtime常用的用法
//
//  Created by HarrySun on 2017/4/13.
//  Copyright © 2017年 Mobby. All rights reserved.
//
//  三、runtime_动态添加方法用

#import "Cat.h"
#import <objc/message.h>

// 动态添加方法，首先实现这个resolveInstanceMethod
// resolveInstanceMethod调用：当调用了没有实现的方法就会调用resolveInstanceMethod
// resolveInstanceMethod作用：就知道那些方法没有实现，从而动态添加方法
// sel：没有实现的方法

@implementation Cat

// 定义函数
// 没有返回值,参数(id,SEL)
// void(id,SEL)
void eatFunc(id self, SEL _cmd, id num){
    
    NSLog(@"调用了eat %@  %@  %@",self,NSStringFromSelector(_cmd),num);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    
    NSLog(@"没有实现的方法 === %@",NSStringFromSelector(sel));
    
    // 动态添加eat方法
    if (sel == @selector(eat:)) {
        
        // cls：给哪个类添加方法
        // name：添加方法的方法编号是什么
        // imp：方法实现，函数入口，函数名
        // types：方法类型 可查看官方文档查询：Type Encodings    ( @:对象 :SEL )
        // class_addMethod(<#__unsafe_unretained Class cls#>, <#SEL name#>, <#IMP imp#>, <#const char *types#>)
        
        class_addMethod(self, sel, (IMP)eatFunc, "v@:@");
        
        // 处理完
        return YES;
    }
    
    return [super resolveInstanceMethod:sel];
}

@end
