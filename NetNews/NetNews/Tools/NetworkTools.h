//
//  NetworkTools.h
//  NetNews
//
//  Created by 袁飞 on 2017/3/10.
//  Copyright © 2017年 Yuanfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef enum : NSUInteger {
    GET,
    POST,
} RequestType;

@interface NetworkTools : AFHTTPSessionManager

+ (instancetype)sharedTools;
    
- (void)requestWithRequestType:(RequestType)requestType andUrl:(NSString *)urlStr andParameters:(id)parametrs andSuccess:(void(^)(id responseObject))successBlock andFailure:(void(^)(NSError *error))failureBlock;
    
@end
