//
//  ViewController.m
//  GCD-基本概念
//
//  Created by 陈曦 on 16/9/30.
//  Copyright © 2016年 chenxi. All rights reserved.
//


/**
 *  基本概念
 1.任务: 常用两个用来执行任务的函数（函数！）
 同步_sync
 异步_async  具有开线程的能力
 
 2.队列:用来存放任务
 并发队列：可以让多个任务同时执行（自动开启多个线程执行任务）。并发队列只有在异步函数disptch _async 下才有效
 串行队列：任务一个接一个地执行

 
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark -------
#pragma Events
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self asyncConcurrent];
}

#pragma mark -------
#pragma Methods
//异步函数＋并发队列：会开启多条线程，队列任务并发执行
- (void)asyncConcurrent{
    //1.创建队列
    /*
     第一个参数:C语言的字符串,标签
     第二个参数:队列的类型
     DISPATCH_QUEUE_CONCURRENT:并发
     DISPATCH_QUEUE_SERIAL:串行
     */
    //获得队列的方法1
    //dispatch_queue_t queue = dispatch_queue_create("com.520it.download", DISPATCH_QUEUE_CONCURRENT);
    
    //获得队列的方法2:获得全局并发队列
    /*
     第一个参数:优先级
     第二个参数:
     */
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    
    NSLog(@"---satrt----");
    //2.1>封装任务2>添加任务到队列中
    /*
     第一个参数:队列
     第二个参数:要执行的任务
     */
    dispatch_async(queue, ^{
        NSLog(@"download1----%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download2----%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download3----%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download4-----%@",[NSThread currentThread]);
    });
    
    NSLog(@"---end----");

    
}


//异步函数+串行队列:会开线程,开一条线程,队列中的任务是串行执行的
-(void)asyncSerial
{
    //1.创建队列
    dispatch_queue_t queue = dispatch_queue_create("download", DISPATCH_QUEUE_SERIAL);
    
    //2.封装操作
    dispatch_async(queue, ^{
        NSLog(@"download1----%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download2----%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download3----%@",[NSThread currentThread]);
    });
}

//同步函数+并发队列:不会开线程,任务是串行执行的
-(void)syncConcurrent
{
    //1.创建队列
    dispatch_queue_t queue = dispatch_queue_create("com.520it.download", DISPATCH_QUEUE_CONCURRENT);
    
    NSLog(@"---start---");
    //2.封装任务
    dispatch_sync(queue, ^{
        NSLog(@"download1----%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download2----%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download3----%@",[NSThread currentThread]);
    });
    
    NSLog(@"---end---");
}

//同步函数+串行队列:不会开线程,任务是串行执行的
-(void)syncSerial
{
    //1.创建队列
    dispatch_queue_t queue = dispatch_queue_create("com.520it.download", DISPATCH_QUEUE_SERIAL);
    
    //2.封装任务
    dispatch_sync(queue, ^{
        NSLog(@"download1----%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download2----%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download3----%@",[NSThread currentThread]);
    });
}

//异步函数+主队列:所有任务都在主线程中执行,不会开线程
-(void)asyncMain
{
    //1.获得主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    //2.异步函数
    dispatch_async(queue, ^{
        NSLog(@"download1----%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download2----%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"download3----%@",[NSThread currentThread]);
    });
}

//同步函数+主队列:死锁
//注意:如果该方法在子线程中执行,那么所有的任务在主线程中执行,
-(void)syncMain
{
    //1.获得主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    NSLog(@"start----");
    //2.同步函数
    //同步函数:立刻马上执行,如果我没有执行完毕,那么后面的也别想执行
    //异步函数:如果我没有执行完毕,那么后面的也可以执行
    dispatch_sync(queue, ^{
        NSLog(@"download1----%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download2----%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"download3----%@",[NSThread currentThread]);
    });
    
    NSLog(@"end---");
}



@end
