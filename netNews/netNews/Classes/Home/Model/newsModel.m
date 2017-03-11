//
//  newsModel.m
//  netNews
//
//  Created by yangyinglei on 2017/3/10.
//  Copyright © 2017年 yangyinglei. All rights reserved.
//

#import "newsModel.h"
#import <YYModel.h>

@implementation newsModel

+ (void)requestNewsModelArrayWithUrlStr: (NSString *)urlStr andCompletionBlock: (void (^)(NSArray *modelArray))completionBlock{

    [[WebManager shareManager] requestWithRequestType:GET WithUrlStr:urlStr andParams:nil withSuccessBlock:^(id  _Nullable responseObject) {
        
        NSDictionary *dic = (NSDictionary *)responseObject;
        NSString *key = dic.allKeys.firstObject;
        NSArray *dicArry = [dic objectForKey:key];
        
        NSArray *modelArray = [NSArray yy_modelArrayWithClass:[newsModel class] json:dicArry];
        completionBlock(modelArray);
        
    } withFailureBlock:^(NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    }];


}

@end
