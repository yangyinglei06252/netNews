//
//  MuLuNewsModel.m
//  netNews
//
//  Created by yangyinglei on 2017/3/10.
//  Copyright © 2017年 yangyinglei. All rights reserved.
//

#import "MuLuNewsModel.h"
#import <YYModel.h>

@implementation MuLuNewsModel

- (NSString *)description {
    NSString *str = [NSString stringWithFormat: @"%@,%@",_tname,_tid];
    return str;
}

+(NSArray *)loadMuluData{

    NSURL *url = [[NSBundle mainBundle] URLForResource:@"topic_news.json" withExtension:nil];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSArray *array = dic[@"tList"];
  
    NSArray *muluArr = [NSArray yy_modelArrayWithClass:[MuLuNewsModel class] json:array];
    
    muluArr = [muluArr sortedArrayUsingComparator:^NSComparisonResult(MuLuNewsModel *obj1, MuLuNewsModel *obj2) {
        return [obj1.tid compare:obj2.tid];
    }];
    
//    for (MuLuNewsModel *mu in muluArr) {
//        NSLog(@"%@",mu);
//    }
    return muluArr;
}


@end
