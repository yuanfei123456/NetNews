//
//  ChannelLabel.m
//  NetNews
//
//  Created by 袁飞 on 2017/3/11.
//  Copyright © 2017年 Yuanfei. All rights reserved.
//

#import "ChannelLabel.h"

@implementation ChannelLabel

- (void)setScalePresent:(CGFloat)scalePresent {
    _scalePresent = scalePresent;
    
    self.textColor = [UIColor colorWithRed:scalePresent green:0 blue:0 alpha:1];
    
    CGFloat currentPresent = 1 + scalePresent *0.3;
    self.transform = CGAffineTransformMakeScale(currentPresent, currentPresent);

}

@end
