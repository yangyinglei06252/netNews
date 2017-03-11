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
#import "NewsTableViewCell.h"

@interface NewsTableViewController ()

@property (nonatomic, strong) NSArray *modelArray;

@end

@implementation NewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"BaseCell" bundle:nil] forCellReuseIdentifier:@"baseCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"BigCell" bundle:nil] forCellReuseIdentifier:@"bigCell"];
    

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
    newsModel *nm = _modelArray[indexPath.row];
    NewsTableViewCell *cell;
    if (nm.imgType) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"bigCell" forIndexPath:indexPath];
    }else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"baseCell" forIndexPath:indexPath];
    }
    cell.newsmodel = nm;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    newsModel *nm = _modelArray[indexPath.row];
    
    if (nm.imgType) {
        return 180;
    }
    return 80;

}
@end
