//
//  Person.m
//  RuntimeDemo
//
//  Created by guangshu01 on 2018/4/17.
//  Copyright © 2018年 guangshu01. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
@interface Person()<NSCoding>

@end
@implementation Person

//【用在三级数组转换】
+ (NSDictionary *)arrayContainModelClass
{
    return @{@"model" : @"TestModel"};
}

//- (void)encodeWithCoder:(NSCoder *)aCoder
//{
//    [aCoder encodeObject:_name forKey:@"name"];
//    [aCoder encodeInteger:_age forKey:@"age"];
//    [aCoder encodeBool:_sex forKey:@"sex"];
//    [aCoder encodeObject:_model forKey:@"model"];
//}
//
//- (instancetype)initWithCoder:(NSCoder *)aDecoder
//{
//    self = [super init];
//    if (self)
//    {
//        self.name  = [aDecoder decodeObjectForKey:@"name"];
//        self.age   = [aDecoder decodeIntegerForKey:@"age"];
//        self.sex   = [aDecoder decodeBoolForKey:@"sex"];
//        self.model = [aDecoder decodeObjectForKey:@"model"];
//    }
//
//    return self;
//
//}
//
//- (void)encodeWithCoder:(NSCoder *)encoder
//
//{
//
//    unsigned int count = 0;
//
//    Ivar *ivars = class_copyIvarList([self class], &count);
//
//
//
//    for (int i = 0; i<count; i++)
//    {
//         // 取出i位置对应的成员变量
//
//         Ivar ivar = ivars[i];
//
//         // 查看成员变量
//
//         const char *name = ivar_getName(ivar);
//
//         // 归档
//
//         NSString *key = [NSString stringWithUTF8String:name];
//
//         id value = [self valueForKey:key];
//
//         [encoder encodeObject:value forKey:key];
//
//    }
//
//         free(ivars);
//
//}
//
//
//
//- (id)initWithCoder:(NSCoder *)adecoder
//{
//
//        if (self = [super init])
//        {
//
//            unsigned int count = 0;
//
//            Ivar *ivars = class_copyIvarList([self class], &count);
//
//            for (int i = 0; i<count;i++)
//            {
//
//                 // 取出i位置对应的成员变量
//
//                 Ivar ivar = ivars[i];
//
//                 // 查看成员变量
//
//                 const char *name = ivar_getName(ivar);
//
//                 // 归档
//
//                 NSString *key = [NSString stringWithUTF8String:name];
//
//                 id value = [adecoder decodeObjectForKey:key];
//
//                 // 设置到成员变量身上
//
//                 [self setValue:value forKey:key];
//
//             }
//
//                free(ivars);
//
//            }
//
//            return self;
//}
//



lu_encodeRuntime(self)

lu_initCoderRuntime(self)

@end
