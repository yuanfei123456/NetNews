//
//  ChannelScrollView.h
//  NetNews
//
//  Created by 袁飞 on 2017/3/10.
//  Copyright © 2017年 Yuanfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChannelScrollView : UIScrollView

    
@property (nonatomic, strong) NSArray *channelArray;

@property (nonatomic , copy) void(^tagBlock)(int tag);

@property (nonatomic, assign) int index;

@end
