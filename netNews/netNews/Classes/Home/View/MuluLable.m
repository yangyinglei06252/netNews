//
//  MuluLable.m
//  netNews
//
//  Created by yangyinglei on 2017/3/12.
//  Copyright © 2017年 yangyinglei. All rights reserved.
//

#import "MuluLable.h"

@implementation MuluLable

- (void)setStateWithPercent:(CGFloat) percent{

   self.font = [UIFont systemFontOfSize:15 * (1 + percent * 0.3)];
    self.textColor = [UIColor colorWithRed:percent green:0 blue:0 alpha:1];
}

@end
