//
//  ChannelScrollView.m
//  NetNews
//
//  Created by 袁飞 on 2017/3/10.
//  Copyright © 2017年 Yuanfei. All rights reserved.
//

#import "ChannelScrollView.h"
#import "ChannelModel.h"

@implementation ChannelScrollView
    
    
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
    
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}
    
- (void)setupUI {
    
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.bounces = NO;
}

- (void)setChannelArray:(NSArray *)channelArray {
    _channelArray = channelArray;
    
  
    for (NSInteger i = 0; i < channelArray.count; i++) {
        
        ChannelModel *model = channelArray[i];
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(i * 80, 0, 80, 44);
        label.text = model.tname;
        label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label];
        
    }

}

@end
