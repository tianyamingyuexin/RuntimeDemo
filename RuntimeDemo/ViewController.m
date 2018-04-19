//
//  ViewController.m
//  RuntimeDemo
//
//  Created by guangshu01 on 2018/4/17.
//  Copyright © 2018年 guangshu01. All rights reserved.
//

#import "ViewController.h"
#import "RuntimeTools.h"
#import "Person.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //获取类名
//    NSString *name = [RuntimeTools getClassNameWithClass:[NSNotificationCenter class]];
//    NSLog(@"%@",name);
    
    //获取成员变量
    NSArray *ivarArray = [RuntimeTools getIvarListWithClass:[Person class]];
    for (NSDictionary *dic in ivarArray)
    {
        NSLog(@"%@",dic);
    }
    
    //获取成员属性
//    NSArray *ivarArray = [RuntimeTools getPropertyWithClass:[Person class]];
//
//    NSLog(@"%@",ivarArray);
    
    //获取类的实例方法
//        NSArray *ivarArray = [RuntimeTools getInstaceMethodListWithClass:[Person class]];
//    
//        NSLog(@"%@",ivarArray);
    
    //获取协议列表
//    NSArray *ivarArray = [RuntimeTools getProtocolListWithClass:[Person class]];
//
//    NSLog(@"%@",ivarArray);
    
//    [RuntimeTools addMethodWithClass:[Person class] fromClass:[self class] method:@selector(testOne) methodImp:@selector(testOne)];
//    Person *pss = [[Person alloc] init];
//    [pss performSelector:@selector(testOne) withObject:nil withObject:nil];
    
//
//    [RuntimeTools exchangeMethodWithClsas:[self class] Sel:@selector(testOne) selTwo:@selector(testTwo)];
//    [self testOne];
}

- (void)testOne
{
    NSLog(@"testOne");
}
- (void)testTwo
{
    NSLog(@"testTwo");
}


@end
