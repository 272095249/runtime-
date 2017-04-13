//
//  UIImage+Category.m
//  runtime常用的用法
//
//  Created by HarrySun on 2017/4/13.
//  Copyright © 2017年 Mobby. All rights reserved.
//
//  二、runtime_交换方法用

#import "UIImage+Category.h"
#import <objc/message.h>

@implementation UIImage (Category)

+ (void)load{
    
    // 交换方法实现，方法都是定义在类里面
    // class_getInstanceMethod：获取对象
    // class_getClassMethod：获取类方法
    // IMP：方法实现
    
    // imageNamed
    // Class：获取哪个类方法
    // SEL：获取方法编号，根据SEL就能去对应的类找方法
    Method imageNamedMethod = class_getClassMethod([UIImage class], @selector(imageNamed:));
    
    // sh_imageNamed
    Method sh_imageNamedMethod = class_getClassMethod([UIImage class], @selector(sh_imageNamed:));
    
    // 交换方法实现
    method_exchangeImplementations(imageNamedMethod, sh_imageNamedMethod);
}

// sh_imageNamed
+ (UIImage *)sh_imageNamed:(NSString *)imageName{
    
    // 1.加载图片
    UIImage *image = [UIImage sh_imageNamed:imageName];
    
    // 2.判断功能
    if (image == nil) {
        
        NSLog(@"图片为空");
    }
    
    return image;
}

@end
