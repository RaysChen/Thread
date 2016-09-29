//
//  ViewController.m
//  NSThread
//
//  Created by 陈曦 on 16/9/28.
//  Copyright © 2016年 chenxi. All rights reserved.
//

//用NSThread创建线程的三个常用的方法

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self createThread3];
}


- (void)createThread3{


    [self performSelectorInBackground:@selector(run:) withObject:@"1"];

}

- (void)createThread2{
    
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"1"];

}

- (void)createThread1{
    //创建线程
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(run:) object:@"1"];
    
    //开启线程
    [thread start];


}


- (void)run:(NSString *)param
{
    for (NSInteger i = 0; i<100; i++) {
        NSLog(@"-----run-----%@--%@", param, [NSThread currentThread]);
    }
}
@end


/**
 *  一些笔记
 1.与主线程相关的一些方法
 + (NSThread *)mainThread //获得主线程
 - (BOOL)isMainThread     //判断是否是主线程
 + (BOOL)isMainThread     //判断是否为主线程
 
 2.方法2和方法3快捷，但是拿不到对象，不能使用属性，不能进行更详细的设置
 
 */















