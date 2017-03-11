//
//  WebManager.m
//  netNews
//
//  Created by yangyinglei on 2017/3/10.
//  Copyright © 2017年 yangyinglei. All rights reserved.
//

#import "WebManager.h"

@implementation WebManager

+(instancetype)shareManager{
    static WebManager *wm ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        wm = [[WebManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://c.m.163.com/nc/article/list/"]];
    });

    return wm;
}


-(void) requestWithRequestType:(RequsetType)requsetType WithUrlStr:(NSString *)URLStr andParams:(id)parameters  withSuccessBlock:(void(^)(id  _Nullable responseObject))successBlock withFailureBlock:(void(^)(NSError * _Nonnull error))failureBlock {
    

    if (requsetType == GET) {
        [[self GET:URLStr parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            successBlock(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failureBlock(error);
        }] resume];
    }else{
    
    [[self POST:URLStr parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }] resume];
    
    }    

}

@end
