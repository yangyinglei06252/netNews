//
//  HomeViewController.m
//  netNews
//
//  Created by yangyinglei on 2017/3/10.
//  Copyright © 2017年 yangyinglei. All rights reserved.
//

#import "HomeViewController.h"
#import "MuLuNewsModel.h"
#import <YYModel.h>

@interface HomeViewController ()

@property (nonatomic, strong) NSArray *muluArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}

-(void) loadData{
    
    _muluArray = [MuLuNewsModel loadMuluData];
    
}

@end
