//
//  ViewController.m
//  ARC单例模式
//
//  Created by 陈曦 on 16/10/1.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "ViewController.h"
#import "CXTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{


    CXTool *t1 = [[CXTool alloc]init];
    CXTool *t2 = [[CXTool alloc]init];
    CXTool *t3 = [CXTool new];
    CXTool *t4 = [CXTool shareTool];
    CXTool *t5 = [t1 copy];
    CXTool *t6 = [t1 mutableCopy];
    
    NSLog(@"t1:%p t2:%p t3:%p t4:%p t5:%p t6:%p",t1,t2,t3,t4,t5,t6);
    
}
@end
