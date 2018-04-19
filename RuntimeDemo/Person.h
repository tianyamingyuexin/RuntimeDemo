//
//  Person.h
//  RuntimeDemo
//
//  Created by guangshu01 on 2018/4/17.
//  Copyright © 2018年 guangshu01. All rights reserved.
//

#import <Foundation/Foundation.h>

#define lu_encodeRuntime(A) \
- (void)encodeWithCoder:(NSCoder *)aCoder\
{\
unsigned int count = 0;\
Ivar *ivars = class_copyIvarList([self class], &count);\
for (int i = 0; i<count; i++)\
{\
    Ivar ivar = ivars[i];\
    const char *name = ivar_getName(ivar);\
    NSString *key = [NSString stringWithUTF8String:name];\
    id value = [self valueForKey:key];\
    [aCoder encodeObject:value forKey:key];\
}\
free(ivars);\
}
     
     
#define lu_initCoderRuntime(A) \
- (id)initWithCoder:(NSCoder *)aDecoder\
{\
if (self = [super init]){\
         unsigned int count = 0;\
         Ivar *ivars = class_copyIvarList([A class], &count);\
         for (int i = 0; i<count;i++)\
         {\
             Ivar ivar = ivars[i];\
             const char *name = ivar_getName(ivar);\
             NSString *key = [NSString stringWithUTF8String:name];\
             id value = [aDecoder decodeObjectForKey:key];\
             [self setValue:value forKey:key];\
         }\
         free(ivars);\
     }\
return self;\
}
     

@class TestModel;
@protocol PersonDelegate <NSObject>
- (void)test;
@end

@interface Person : NSObject
@property (nonatomic,strong)NSString *name;
@property (nonatomic,assign)NSInteger age;
@property (nonatomic,assign)BOOL sex;
@property (nonatomic,strong)TestModel *model;
@end
