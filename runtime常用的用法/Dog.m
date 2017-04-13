//
//  Dog.m
//  runtime常用的用法
//
//  Created by HarrySun on 2017/4/13.
//  Copyright © 2017年 Mobby. All rights reserved.
//
//  一、runtime_消息机制用

#import "Dog.h"

@implementation Dog

- (void)eat{
    
    NSLog(@"对象方法----我要吃鱼了");
}

+ (void)eat{
    
    NSLog(@"类方法----我要吃鱼了");
}

@end
