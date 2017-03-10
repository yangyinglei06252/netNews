//
//  YYLCollectionViewCell.m
//  netNews
//
//  Created by yangyinglei on 2017/3/10.
//  Copyright © 2017年 yangyinglei. All rights reserved.
//

#import "YYLCollectionViewCell.h"
#import "NewsTableViewController.h"

@implementation YYLCollectionViewCell

-(void)awakeFromNib {
    [super awakeFromNib];
    
//    self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
    NewsTableViewController *newsVC = [[NewsTableViewController alloc] init];
    newsVC.tableView.frame = self.contentView.bounds;
    [self.contentView addSubview:newsVC.tableView];
    
}

@end
