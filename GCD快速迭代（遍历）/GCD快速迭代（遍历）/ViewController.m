//
//  ViewController.m
//  GCD快速迭代（遍历）
//
//  Created by 陈曦 on 16/10/1.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self applyDemo];
}

-(void)forDemo
{
    //同步
    for (NSInteger i = 0; i<10; i++) {
        NSLog(@"%zd---%@",i,[NSThread currentThread]);
    }
}

//开子线程和主线程一起完成遍历任务,任务的执行时并发的
-(void)applyDemo
{
    /*
     第一个参数:遍历的次数
     第二个参数:队列(并发队列)
     第三个参数:index 索引
     */
    dispatch_apply(10, dispatch_get_global_queue(0, 0), ^(size_t index) {
        NSLog(@"%zd---%@",index,[NSThread currentThread]);
    });
}


@end
