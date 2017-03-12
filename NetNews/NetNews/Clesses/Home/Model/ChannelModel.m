//
//  ChannelModel.m
//  NetNews
//
//  Created by 袁飞 on 2017/3/10.
//  Copyright © 2017年 Yuanfei. All rights reserved.
//

#import "ChannelModel.h"
#import <YYModel.h>

@implementation ChannelModel

+ (NSArray *)getChannelArray {
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
    
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    
    NSDictionary *tempDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    
    NSArray *tempArr = [tempDict objectForKey:@"tList"];
    
    NSArray *channelArr = [NSArray yy_modelArrayWithClass:[ChannelModel class] json:tempArr];
    
    return channelArr.copy;
}
@end
