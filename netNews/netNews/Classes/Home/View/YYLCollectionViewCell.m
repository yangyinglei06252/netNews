//
//  YYLCollectionViewCell.m
//  netNews
//
//  Created by yangyinglei on 2017/3/10.
//  Copyright © 2017年 yangyinglei. All rights reserved.
//

#import "YYLCollectionViewCell.h"
#import "NewsTableViewController.h"
#import "UILabel+CZAddition.h"

@implementation YYLCollectionViewCell{

    NewsTableViewController *newsVC;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    
    newsVC = [[NewsTableViewController alloc] init];
    newsVC.tableView.frame = self.contentView.bounds;
    [self.contentView addSubview:newsVC.tableView];

    UILabel *refreshLabel = [UILabel cz_labelWithText:@"下拉刷新中..." fontSize:14 color:[UIColor lightGrayColor]];
    [self.contentView insertSubview:refreshLabel atIndex:0];
    
    refreshLabel.frame = CGRectMake(150, 0, 120, 40);
}

-(void)setUrlStr:(NSString *)urlStr {
    _urlStr = urlStr;
    newsVC.urlStr = urlStr;
}
@end
