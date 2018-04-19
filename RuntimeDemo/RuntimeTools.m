//
//  RuntimeTools.m
//  RuntimeDemo
//
//  Created by guangshu01 on 2018/4/17.
//  Copyright © 2018年 guangshu01. All rights reserved.
//

#import "RuntimeTools.h"
#import <objc/runtime.h>
@implementation RuntimeTools

/**
 根据类获取累名
 
 @param class 类
 @return 类名
 */
+ (NSString *)getClassNameWithClass:(Class)class
{
    const char *className = class_getName(class);
    
    return [NSString stringWithUTF8String:className];
}


/**
 获取成员变量
 
 @param class 类
 @return 结果
 */
+ (NSArray *)getIvarListWithClass:(Class)class
{
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(class, &count);
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count; i++)
    {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:2];
        const char *ivarName = ivar_getName(ivarList[i]);
        const char *ivarType = ivar_getTypeEncoding(ivarList[i]);
        dic[@"type"] = [NSString stringWithUTF8String:ivarType];
        dic[@"ivarName"] = [NSString stringWithUTF8String:ivarName];
        [mutableList addObject:dic];
    }
    free(ivarList);
    return [NSArray arrayWithArray:mutableList];
}


/**
 获取类的属性列表 包括使用属性和公有属性 以及定义在延展中的属性

 @param class 类
 @return 数组 里面是字符串
 */
+ (NSArray *)getPropertyWithClass:(Class)class
{
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList(class, &count);
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count; i++)
    {
        const char *propertyName = property_getName(propertyList[i]);
        [mutableList addObject:[NSString stringWithUTF8String:propertyName]];
    }
    free(propertyList);
    
    return [NSArray arrayWithArray:mutableList];
}


/**
 获取类的实例方法列表 getter，setter，对象方法等，当不能获取类方法`

 @param class 类
 @return 结果
 */
+ (NSArray *)getInstaceMethodListWithClass:(Class)class
{
    unsigned int count = 0;
    Method *methodList = class_copyMethodList(class, &count);
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i<count; i++)
    {
        Method method = methodList[i];
        SEL methodName = method_getName(method);
        [mutableList addObject:NSStringFromSelector(methodName)];
    }
    free(methodList);
    return [NSArray arrayWithArray:mutableList];
}


/**
 获取协议列表

 @param class 类
 @return 结果
 */
+ (NSArray *)getProtocolListWithClass:(Class)class
{
    unsigned int count = 0;
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList(class, &count);
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i<count; i++)
    {
        Protocol *protocol = protocolList[i];
        const char *protocolName = protocol_getName(protocol);
        [mutableList addObject:[NSString stringWithUTF8String:protocolName]];
        
    }
    return [NSArray arrayWithArray:mutableList];
    return nil;
}

/**
 往类上添加相应的方法与其实现
 @param fromclass 方法实现的类
 @param class 绑定方法的类
 @param methodSel 方法名
 @param methodselImp 对应方法实现的方法名
 */
+ (void)addMethodWithClass:(Class)class fromClass:(Class)fromclass method:(SEL)methodSel methodImp:(SEL)methodselImp
{
    Method method = class_getInstanceMethod(fromclass, methodSel);
    IMP methodIMP = method_getImplementation(method);
    const char *types = method_getTypeEncoding(method);
    class_addMethod(class, methodSel, methodIMP, types);
}


/**
 方法交换

 @param selone 方法1
 @param selTwo 方法2
 */
+ (void)exchangeMethodWithClsas:(Class)class Sel:(SEL)selone selTwo:(SEL)selTwo;
{
    Method firstMethod = class_getInstanceMethod(class, selone);
    Method secondMethod = class_getInstanceMethod(class, selTwo);
    method_exchangeImplementations(firstMethod, secondMethod);
}
@end
