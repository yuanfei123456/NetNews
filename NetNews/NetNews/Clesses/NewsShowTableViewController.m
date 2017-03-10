//
//  NewsShowTableViewController.m
//  NetNews
//
//  Created by 袁飞 on 2017/3/10.
//  Copyright © 2017年 Yuanfei. All rights reserved.
//

#import "NewsShowTableViewController.h"
#import "NewsShowCell.h"

static NSString *cellId = @"newsShow";
@interface NewsShowTableViewController ()

@end

@implementation NewsShowTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
    
#pragma mark - 1.搭建界面
-(void)setupUI {
    
}
    

    
#pragma mark - 2.数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsShowCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    
    return cell;
    
}
    
@end


