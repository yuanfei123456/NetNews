//
//  NewsShowTableViewController.m
//  NetNews
//
//  Created by 袁飞 on 2017/3/10.
//  Copyright © 2017年 Yuanfei. All rights reserved.
//

#import "NewsShowTableViewController.h"
#import "NewsShowCell.h"
#import "NewsModel.h"
#import <YYModel.h>

static NSString *cellId = @"newsShow";
@interface NewsShowTableViewController ()

@property (nonatomic, strong) NSArray<NewsModel *> *newsArray;


@end

@implementation NewsShowTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
}
    
#pragma mark - 1.搭建界面
-(void)setupUI {
   
    [self.tableView registerClass:[NewsShowCell class] forCellReuseIdentifier:cellId];
    
}
    
#pragma mark - 2.数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsArray.count;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsShowCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    
    NewsModel *model = self.newsArray[indexPath.row];
    
    cell.textLabel.text = model.title;
    
    return cell;
    
}

- (void)setUrlStr:(NSString *)urlStr {

    _urlStr = urlStr;
    
    [NewsModel requestNewsModelArrayWithUrl:urlStr andCompletionBlock:^(NSArray *modelArray) {
        self.newsArray = modelArray;
       
        [self.tableView reloadData];
        
    }];
    

}


    
@end


