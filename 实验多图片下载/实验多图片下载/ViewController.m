//
//  ViewController.m
//  实验多图片下载
//
//  Created by 陈曦 on 16/10/2.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "ViewController.h"
#import "CXAPP.h"

@interface ViewController ()
@property (nonatomic, strong)NSArray *apps;

@end

@implementation ViewController

#pragma mark----lazy loading
-(NSArray *)apps
{
    if (_apps == nil) {
        
        //字典数组
        NSArray *arrayM = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"apps.plist" ofType:nil]];
        
        //字典数组---->模型数组
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSDictionary *dict in arrayM) {
            [arrM addObject:[CXAPP appWithDict:dict]];
        }
        _apps = arrM;
    }
    return _apps;
   

}

#pragma mark----UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//
 //   return self.apps.count;
//}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.apps.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *ID = @"app";
    //1.创建cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //2.设置cell的数据
    
    //2.1 拿到该行cell对应的数据
    CXAPP *appM = self.apps[indexPath.row];
    
    //2.2 设置标题
    cell.textLabel.text = appM.name;
    
    //2.3 设置子标题
    cell.detailTextLabel.text = appM.download;
    
    //2.4 设置图标
    NSURL *url = [NSURL URLWithString:appM.icon];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:imageData];
    cell.imageView.image = image;
    NSLog(@"%zd-----",indexPath.row);

    
        
    //3.返回cell
    return cell;
}
@end
