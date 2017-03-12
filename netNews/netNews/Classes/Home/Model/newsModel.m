//
//  newsModel.m
//  netNews
//
//  Created by yangyinglei on 2017/3/10.
//  Copyright © 2017年 yangyinglei. All rights reserved.
//

#import "newsModel.h"
#import <YYModel.h>
#import "ImagesModel.h"

@implementation newsModel

+(NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"imgextra":[ImagesModel class]};

}


+ (void)requestNewsModelArrayWithUrlStr: (NSString *)urlStr andCompletionBlock: (void (^)(NSArray *modelArray))completionBlock{

    [[WebManager shareManager] requestWithRequestType:GET WithUrlStr:urlStr andParams:nil withSuccessBlock:^(id  _Nullable responseObject) {
        
        NSDictionary *dic = (NSDictionary *)responseObject;
        NSString *key = dic.allKeys.firstObject;
        NSArray *dicArry = [dic objectForKey:key];
        
        NSArray *modelArray = [NSArray yy_modelArrayWithClass:[newsModel class] json:dicArry];
        completionBlock(modelArray);
        //默认是请求完数据是回到主线程
//        NSLog(@"%@",[NSThread currentThread]);
        
    } withFailureBlock:^(NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    }];
        //这也是在主线程
//        NSLog(@"%@",[NSThread currentThread]);

}


@end
