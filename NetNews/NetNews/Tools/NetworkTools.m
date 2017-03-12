//
//  NetworkTools.m
//  NetNews
//
//  Created by 袁飞 on 2017/3/10.
//  Copyright © 2017年 Yuanfei. All rights reserved.
//

#import "NetworkTools.h"


@implementation NetworkTools

+ (instancetype)sharedTools {
    
    static NetworkTools *tools;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = [[NetworkTools alloc] initWithBaseURL:[NSURL URLWithString:@"http://c.m.163.com/nc/article/list/"]];
    });
    return tools;
}
    
- (void)requestWithRequestType:(RequestType)requestType andUrl:(NSString *)urlStr andParameters:(id)parametrs andSuccess:(void(^)(id responseObject))successBlock andFailure:(void(^)(NSError *error))failureBlock {
   
    if (requestType == GET) {
        [self GET:urlStr parameters:parametrs progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            successBlock(responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failureBlock(error);
        }];

    } else {
    
        [self POST:urlStr parameters:parametrs progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            successBlock(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            failureBlock(error);
        }];
    }
}
    
@end
