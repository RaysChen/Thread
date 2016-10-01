//
//  CXTool.h
//  ARC单例模式
//
//  Created by 陈曦 on 16/10/1.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CXTool : NSObject<NSCopying, NSMutableCopying>
//类方法
//1.方便访问
//2.标明身份
//3.注意:share+类名|default + 类名 | share | default | 类名
+(instancetype)shareTool;

@end
