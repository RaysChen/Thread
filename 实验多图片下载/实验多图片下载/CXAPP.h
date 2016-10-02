//
//  CXAPP.h
//  实验多图片下载
//
//  Created by 陈曦 on 16/10/2.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CXAPP : NSObject

//APP的名称
@property (nonatomic, strong) NSString *name;
//APP图片的URL地址
@property (nonatomic, strong) NSString *icon;
//APP的下载量
@property (nonatomic, strong) NSString *download;


+ (instancetype)appWithDict:(NSDictionary*)dict;



@end
