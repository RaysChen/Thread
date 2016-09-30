//
//  ViewController.m
//  NSThread线程间的通信
//
//  Created by 陈曦 on 16/9/30.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation ViewController

#pragma mark------
#pragma Events

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [NSThread detachNewThreadSelector:@selector(download) toTarget:self withObject:nil];
    
}


#pragma mark------
#pragma Methods

//子线程下载图片，回到主线程刷新UI显示图片
- (void)download{
    
    //确定URL
    NSURL *url = [NSURL URLWithString:@"http://img4.duitang.com/uploads/blog/201310/18/20131018213446_smUw4.thumb.700_0.jpeg"];
 
    //根据URL下载图片二进制数据到本地
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    
    //转换图片格式
    UIImage *image = [UIImage imageWithData:imageData];
    
      NSLog(@"download----%@",[NSThread currentThread]);
    
    //回到主线程刷新UI（线程间的通信）
    
    //方法1    [self performSelectorOnMainThread:@selector(showImage:) withObject:image waitUntilDone:NO];
    
    //方法2    [self performSelector:@selector(showImage:) onThread:[NSThread mainThread] withObject:image waitUntilDone:YES];
    //方法3
    [self.imageView performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:YES];
}



//更新UI操作
-(void)showImage:(UIImage *)image
{
    self.imageView.image = image;
    NSLog(@"UI----%@",[NSThread currentThread]);
}

@end
