//
//  NewsModel.m
//  NetNews
//
//  Created by 袁飞 on 2017/3/10.
//  Copyright © 2017年 Yuanfei. All rights reserved.
//

#import "NewsModel.h"
#import "NetworkTools.h"
#import <YYModel.h>
#import "ImagesModel.h"

@implementation NewsModel

+ (void)requestNewsModelArrayWithUrl:(NSString *)urlStr andCompletionBlock:(void(^)(NSArray *modelArray))completionBlock {
    
    [[NetworkTools sharedTools] requestWithRequestType:GET andUrl:urlStr andParameters:nil andSuccess:^(id responseObject) {
        
        NSDictionary *dict = (NSDictionary *)responseObject;
        
        NSString *key = dict.allKeys.lastObject;
        NSArray *dictArray = [dict objectForKey:key];
        NSArray *modelArray = [NSArray yy_modelArrayWithClass:[NewsModel class] json:dictArray];
        
        completionBlock(modelArray);
        
    } andFailure:^(NSError *error) {
        
    }];
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"imgextra" : [ImagesModel class]};
}

@end
