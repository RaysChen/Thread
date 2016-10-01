//
//  CXTool.m
//  ARC单例模式
//
//  Created by 陈曦 on 16/10/1.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXTool.h"

@implementation CXTool

//0.提供全局变量
static CXTool *_instance;


//1.重写alloc方法
+ (instancetype)allocWithZone:(struct _NSZone *)zone{

    //本身就线程安全
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}


//2.提供类方法
+ (instancetype)shareTool{

    return [[self alloc]init];
    
}


//3.为了严谨
- (id)copyWithZone:(NSZone *)zone{


    return _instance;
    
}

- (id)mutableCopyWithZone:(NSZone *)zone{
    
    return _instance;
}



@end
