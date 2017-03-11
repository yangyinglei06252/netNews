//
//  YYLCollectionViewCell.m
//  netNews
//
//  Created by yangyinglei on 2017/3/10.
//  Copyright © 2017年 yangyinglei. All rights reserved.
//

#import "YYLCollectionViewCell.h"
#import "NewsTableViewController.h"

@implementation YYLCollectionViewCell{

    NewsTableViewController *newsVC;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    
    newsVC = [[NewsTableViewController alloc] init];
    newsVC.tableView.frame = self.contentView.bounds;
    [self.contentView addSubview:newsVC.tableView];

    
}

-(void)setUrlStr:(NSString *)urlStr {
    _urlStr = urlStr;
    newsVC.urlStr = urlStr;

}
@end
