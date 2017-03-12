//
//  ChannelScrollView.m
//  NetNews
//
//  Created by 袁飞 on 2017/3/10.
//  Copyright © 2017年 Yuanfei. All rights reserved.
//

#import "ChannelScrollView.h"
#import "ChannelModel.h"
#import "ChannelLabel.h"


@interface ChannelScrollView ()



@end

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

#pragma mark - 1.添加Label
- (void)setChannelArray:(NSArray *)channelArray {
    _channelArray = channelArray;
    
  
    for (int i = 0; i < channelArray.count; i++) {
        
        ChannelModel *model = channelArray[i];
        
        ChannelLabel *label = [[ChannelLabel alloc] init];
        label.frame = CGRectMake(i * 80, 0, 80, 44);
//        label.text = model.tname; /
        label.text = [NSString stringWithFormat:@"%d", i];
        label.textAlignment = NSTextAlignmentCenter;
        
        label.tag = i;
        label.userInteractionEnabled = YES;
        [self addSubview:label];
        
         UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapChannelLabelAction:)];
        [label addGestureRecognizer:tapGesture];
        
        [self.channelLabelArray addObject:label];
        //设置第一个label的缩放比
        if (i == 0) {
            label.scalePresent = 1;
        }
    }
}

#pragma mark - 2.手势
- (void)tapChannelLabelAction:(UITapGestureRecognizer *)gesture {
    
    ChannelLabel *label = (ChannelLabel *)gesture.view;
    
    if (self.tagBlock) {
        self.tagBlock((int)label.tag);
    }
    
    [self scrollChannelLabel:label];
}

- (void)setIndex:(int)index {
    _index = index;
    ChannelLabel *label = self.channelLabelArray[index];
    
    [self scrollChannelLabel:label];

}

- (void)scrollChannelLabel: (ChannelLabel *)channelLabel {
    
    CGFloat ChannelLabelCenterX = channelLabel.center.x;
    CGFloat contentOffSectX = ChannelLabelCenterX - self.frame.size.width * 0.5;
    
    CGFloat MinContentOffSectX = 0;
    CGFloat MaxContentOffSectX = self.contentSize.width - self.frame.size.width;
    
    if (contentOffSectX < MinContentOffSectX) {
        contentOffSectX = MinContentOffSectX;
    }
    
    if (contentOffSectX > MaxContentOffSectX) {
        contentOffSectX = MaxContentOffSectX;
    }
    
    self.contentOffset = CGPointMake(contentOffSectX, 0);
    
}

- (NSMutableArray *)channelLabelArray {
    if (!_channelLabelArray) {
        _channelLabelArray = [NSMutableArray array];
    }
    return _channelLabelArray;
}

@end
