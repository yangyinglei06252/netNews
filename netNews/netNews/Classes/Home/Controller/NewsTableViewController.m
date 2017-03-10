//
//  NewsTableViewController.m
//  netNews
//
//  Created by yangyinglei on 2017/3/10.
//  Copyright © 2017年 yangyinglei. All rights reserved.
//

#import "NewsTableViewController.h"
#import <AFNetworking.h>

@interface NewsTableViewController ()

@end

@implementation NewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
    
    [self requestData];
}
-(void) requestData{
    
 //   NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/nc/article/headline/T1348647853363/0-20.html"];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://c.m.163.com/nc/article/list/"]];
    
    [[manager GET:@"T1348647853363/0-20.html" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error :%@",error);
    }] resume];
}


@end
