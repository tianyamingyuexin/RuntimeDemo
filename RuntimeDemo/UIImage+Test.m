//
//  UIImage+Test.m
//  RuntimeDemo
//
//  Created by guangshu01 on 2018/4/17.
//  Copyright © 2018年 guangshu01. All rights reserved.
//

#import "UIImage+Test.h"
#import <objc/runtime.h>
@implementation UIImage (Test)

- (NSString *)urlImage
{
    return objc_getAssociatedObject(self,  (const void*)@"urlImage");
}
- (void)setUrlImage:(NSString *)urlImage
{
    // objc_setAssociatedObject（将某个值跟某个对象关联起来，将某个值存储到某个对象中）
    
    // object:给哪个对象添加属性
    
    // key:属性名称
    
    // value:属性值
    
    // policy:保存策略
    objc_setAssociatedObject(self, (const void*)@"urlImage", urlImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
