//
//  ViewController.m
//  NSThread线程安全（互斥锁，线程同步）
//
//  Created by 陈曦 on 16/9/29.
//  Copyright © 2016年 chenxi. All rights reserved.
//


//锁定一份代码只用一把锁，多把锁无效
//相关术语：线程同步
//        多条线程在同一条线上执行
//        互斥锁就是使用了线程同步技术


/**
 *  nonatomic与atomic
 nonatomic不默认对setter方法加锁
 建议使用nonatomic

 */


//@synchronized(锁对象：通常是self) {锁定的代码}

#import "ViewController.h"

@interface ViewController ()
//三条线程，代表三个售票员
@property (nonatomic , strong) NSThread *thread01;
@property (nonatomic , strong) NSThread *thread02;
@property (nonatomic , strong) NSThread *thread03;

//票的总数
@property (nonatomic , assign) NSInteger ticketCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ticketCount = 100;
    
    self.thread01 =  [[NSThread alloc]initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.thread01.name = @"01售票员";
    
    self.thread02 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.thread02.name = @"02售票员";
    
    self.thread03 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.thread03.name = @"03售票员";
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.thread01 start];
    [self.thread02 start];
    [self.thread03 start];
}

- (void)saleTicket{

    while (1) {
        @synchronized(self) {
            // 先取出总数
            NSInteger count = self.ticketCount;
            if (count > 0) {
                self.ticketCount = count - 1;
                NSLog(@"%@卖了一张票，还剩下%zd张", [NSThread currentThread].name, self.ticketCount);
            } else {
                NSLog(@"票已经卖完了");
                break;
            }
        }
    }

}

@end
