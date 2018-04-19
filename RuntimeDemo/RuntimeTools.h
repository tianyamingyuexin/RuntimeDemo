//
//  RuntimeTools.h
//  RuntimeDemo
//
//  Created by guangshu01 on 2018/4/17.
//  Copyright © 2018年 guangshu01. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RuntimeTools : NSObject




// 根据类获取类名
+ (NSString *)getClassNameWithClass:(Class)class;


// 获取成员变量
+ (NSArray *)getIvarListWithClass:(Class)class;

//获取成员属性
+ (NSArray *)getPropertyWithClass:(Class)class;

//获取类的实例方法列表 getter，setter，对象方法等，不能获取类方法
+ (NSArray *)getInstaceMethodListWithClass:(Class)class;

//获取协议列表
+ (NSArray *)getProtocolListWithClass:(Class)class;

//动态添加方法实现
+ (void)addMethodWithClass:(Class)class fromClass:(Class)fromclass method:(SEL)methodSel methodImp:(SEL)methodselImp;

//方法实现交换
+ (void)exchangeMethodWithClsas:(Class)class Sel:(SEL)selone selTwo:(SEL)selTwo;
@end
