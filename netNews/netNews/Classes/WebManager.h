//
//  WebManager.h
//  netNews
//
//  Created by yangyinglei on 2017/3/10.
//  Copyright © 2017年 yangyinglei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
typedef enum : NSUInteger {
    GET,
    POST,
} RequsetType;

@interface WebManager : AFHTTPSessionManager

//+ (nullable instancetype)shareManager;
//
//- (void) requestWithRequestType:(RequsetType)requsetType WithUrlStr:(nullable NSString *)URLStr andParams:(nullable id)parameters  withSuccessBlock:(nullable void(^)(id  _Nullable responseObject))successBlock withFailureBlock:(nullable void(^)(NSError * _Nonnull error))failureBlock;

+ ( instancetype)shareManager;

- (void) requestWithRequestType:(RequsetType)requsetType WithUrlStr:( NSString *)URLStr andParams:( id)parameters  withSuccessBlock:( void(^)(id   responseObject))successBlock withFailureBlock:( void(^)(NSError * error))failureBlock;

@end
