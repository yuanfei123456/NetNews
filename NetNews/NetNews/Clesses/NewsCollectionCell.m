//
//  NewsCollectionCell.m
//  NetNews
//
//  Created by 袁飞 on 2017/3/10.
//  Copyright © 2017年 Yuanfei. All rights reserved.
//

#import "NewsCollectionCell.h"
#import "NewsShowTableViewController.h"

@implementation NewsCollectionCell
    
- (instancetype)initWithFrame:(CGRect)frame
    {
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
    
    NewsShowTableViewController *showVc = [[NewsShowTableViewController alloc] init];
    showVc.view.frame = self.bounds;
    
    showVc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1];
    
    [self.contentView addSubview:showVc.view];

    
}


    
@end
