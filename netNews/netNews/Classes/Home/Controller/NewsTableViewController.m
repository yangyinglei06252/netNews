//
//  NewsTableViewController.m
//  netNews
//
//  Created by yangyinglei on 2017/3/10.
//  Copyright © 2017年 yangyinglei. All rights reserved.
//

#import "NewsTableViewController.h"
#import <AFNetworking.h>
#import "WebManager.h"
#import "newsModel.h"

@interface NewsTableViewController ()

@property (nonatomic, strong) NSArray *modelArray;

@end

@implementation NewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

}
-(void)setUrlStr:(NSString *)urlStr {
    
    _urlStr = urlStr;
    
    [newsModel requestNewsModelArrayWithUrlStr:urlStr andCompletionBlock:^(NSArray *modelArray) {
        _modelArray = modelArray;
        [self.tableView reloadData];
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _modelArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    newsModel *nm = _modelArray[indexPath.row];
    cell.textLabel.text = nm.title;
    return cell;
}
@end
