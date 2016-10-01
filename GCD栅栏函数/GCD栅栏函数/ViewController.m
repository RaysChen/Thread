//
//  ViewController.m
//  GCD栅栏函数
//
//  Created by 陈曦 on 16/10/1.
//  Copyright © 2016年 chenxi. All rights reserved.
//

/**
 *  GCD栅栏函数
 异步函数前添加栅栏函数，可以起到隔开的作用，会先执行完栅栏函数，在执行任务
 栅栏函数不能使用“全局并发队列”
 *
 *
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{


    //创建并发队列
  dispatch_queue_t queue =  dispatch_queue_create("download", DISPATCH_QUEUE_CONCURRENT);
    
    
    //异步函数
    dispatch_async(queue, ^{
    
        for (NSInteger i = 0; i<100; i++) {
            NSLog(@"download1_%zd_%@",i,[NSThread currentThread]);
        }
    
    });
    
    dispatch_async(queue, ^{
     
        for (NSInteger i = 0; i<100; i++) {
            NSLog(@"downoad2_%zd_%@",i,[NSThread currentThread]);
        }
    
    });
    
    //栅栏函数
    dispatch_barrier_async(queue, ^{
    
        NSLog(@"++++++++++");
    });
    
    
    dispatch_async(queue, ^{
        
        for (NSInteger i = 0; i<100; i++) {
            NSLog(@"downoad3_%zd_%@",i,[NSThread currentThread]);
        }
        
    });

    

}
@end
