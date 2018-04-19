//
//  NSObject+LuTranslate.h
//  RuntimeDemo
//
//  Created by guangshu01 on 2018/4/18.
//  Copyright © 2018年 guangshu01. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ModelDelegate <NSObject>

@optional
//【提供一个协议，只要遵守这个协议的类，都能把数组中的字典转模型】
//【用在三级数组转换】
+ (NSDictionary *)arrayContainModelClass;

@end

@interface NSObject (LuTranslate)

//modol 里面无model 无数组 字典转模型-->字典的 key 和模型的属性不匹配「模型属性数量大于字典键值对数」
+ (instancetype)modelWithDict:(NSDictionary *)dict;

//字典转模型-->模型中嵌套模型「模型属性是另外一个模型对象」

+ (instancetype)modelWithDict2:(NSDictionary *)dict;

// 字典转模型-->数组中装着模型「模型的属性是一个数组，数组中是字典模型对象」
+ (instancetype)modelWithDict3:(NSDictionary *)dict;

//字典转模型 包括以上三种
+ (instancetype)translateModelFromDic:(NSDictionary *)dict;
@end
