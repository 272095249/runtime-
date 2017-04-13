//
//  NSObject+Category.m
//  runtime常用的用法
//
//  Created by HarrySun on 2017/4/13.
//  Copyright © 2017年 Mobby. All rights reserved.
//
//  四、runtime_给分类添加属性用

#import "NSObject+Category.h"
#import <objc/message.h>

@implementation NSObject (Category)

- (void)setName:(NSString *)name{
    
    // 将某个值跟某个对象关联起来，将某个值存储到某个对象中
    // object：给哪个对象添加属性
    // key：属性名，根据key去获取关联的对象
    // value：关联的值
    // policy：策越
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)name{
    
    return objc_getAssociatedObject(self, @"name");
}

@end
