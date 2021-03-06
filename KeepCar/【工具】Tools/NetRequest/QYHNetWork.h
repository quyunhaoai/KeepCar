//
//  QYHNetWork.h
//  QYHNetWork
//
//  Created by QYH on 1/15/16.
//  Copyright © 2016 QYH. All rights reserved.
//

#import "AFNetworking.h"

//请求成功回调block
typedef void (^requestSuccessBlock)(NSDictionary *dic);

//请求失败回调block
typedef void (^requestFailureBlock)(NSError *error);

//请求方法define
typedef enum {
    GET,
    POST,
    PUT,
    DELETE,
    HEAD
} HTTPMethod;

@interface QYHNetWork : AFHTTPSessionManager

+ (instancetype)sharedManager;

+ (instancetype)sharedNetworkToolsWithoutBaseUrl;

- (void)requestWithMethod:(HTTPMethod)method
                        WithPath:(NSString *)path
                      WithParams:(NSDictionary*)params
                WithSuccessBlock:(requestSuccessBlock)success
                 WithFailurBlock:(requestFailureBlock)failure;
- (void)postWithUrl:(NSString *)url body:(NSData *)body showLoading:(BOOL)show success:(void(^)(NSDictionary *response))success failure:(void(^)(NSError *error))failure;

@end
