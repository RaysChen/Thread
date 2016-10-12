//
//  CXAPP.m
//  实验多图片下载
//
//  Created by 陈曦 on 16/10/2.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXAPP.h"

@implementation CXAPP

+ (instancetype)appWithDict:(NSDictionary *)dict{

    CXAPP *appM = [[CXAPP alloc]init];
    //KVC
    [appM setValuesForKeysWithDictionary:dict];
    
    return appM;
}
@end
