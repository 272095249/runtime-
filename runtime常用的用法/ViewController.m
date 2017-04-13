//
//  ViewController.m
//  runtime常用的用法
//
//  Created by HarrySun on 2017/4/13.
//  Copyright © 2017年 Mobby. All rights reserved.
//

#import "ViewController.h"
#import "Dog.h"                     // 消息机制用
#import <objc/message.h>            // 消息机制用
#import "Cat.h"                     // 动态添加方法用
#import "NSObject+Category.h"       // 给分类添加属性用

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"一、消息机制");
    // 一、消息机制
    // 调用对象方法做法1
    Dog *dog1 = [[Dog alloc] init];
    [dog1 eat];
    
    // 调用对象方法做法2
    Dog *dog2 = [[Dog alloc] init];
    [dog2 performSelector:@selector(eat)];
    
    // 调用类方法做法1
    [Dog eat];
    
    // 调用类方法做法2
    [[Dog class] eat];
    
    
    NSLog(@"------利用runtime发送消息------");
    // 让dog发送消息-对象
    Dog *dog3 = [[Dog alloc] init];
    objc_msgSend(dog3,@selector(eat));
    
    // 类方法使用runtime
    // 获取类对象
    Class dogClass = [Dog class];
    // 运行时
    objc_msgSend(dogClass, @selector(eat));
    
    
    
    NSLog(@"二、方法交换");
    // 二、方法交换
    UIImage *image = [UIImage imageNamed:@"runtime"];
    
    
    
    NSLog(@"三、动态添加方法");
    // 三、动态添加方法(在需要的地方动态添加方法,先引用头文件，然后通过performSelector调用方法)
    Cat *cat = [[Cat alloc] init];
    [cat performSelector:@selector(eat:) withObject:@22];
    
    
    
    NSLog(@"四、分类添加属性");
    // 四、分类添加属性
    NSObject *obj = [[NSObject alloc] init];
    obj.name = @"给分类添加属性";
    NSLog(@"%@",obj.name);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
