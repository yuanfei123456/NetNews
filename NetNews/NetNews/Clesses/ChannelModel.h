//
//  ChannelModel.h
//  NetNews
//
//  Created by 袁飞 on 2017/3/10.
//  Copyright © 2017年 Yuanfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChannelModel : NSObject

@property (nonatomic , copy) NSString *tid;
@property (nonatomic , copy) NSString *tname;
    
+ (NSArray *)getChannelArray;

@end
