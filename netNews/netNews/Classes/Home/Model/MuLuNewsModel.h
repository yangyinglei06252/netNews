//
//  MuLuNewsModel.h
//  netNews
//
//  Created by yangyinglei on 2017/3/10.
//  Copyright © 2017年 yangyinglei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MuLuNewsModel : NSObject

@property (nonatomic, copy) NSString *tname;
@property (nonatomic, copy) NSString *tid;

+(NSArray *)loadMuluData;

@end
