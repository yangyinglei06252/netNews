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

    self.tableView.backgroundColor = [UIColor clearColor];
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"BaseCell" bundle:nil] forCellReuseIdentifier:@"baseCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"BigCell" bundle:nil] forCellReuseIdentifier:@"bigCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ImagesCell" bundle:nil] forCellReuseIdentifier:@"imagesCell"];

    
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
    }
    else if (nm.imgextra.count == 2){
        cell = [tableView dequeueReusableCellWithIdentifier:@"imagesCell" forIndexPath:indexPath];
    
    }
    
    else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"baseCell" forIndexPath:indexPath];
    }
    cell.newsmodel = nm;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    newsModel *nm = _modelArray[indexPath.row];
    
    if (nm.imgType) {
        return 180;
    }else if (nm.imgextra.count == 2){
        return 150;
    }
    return 80;

}
@end
