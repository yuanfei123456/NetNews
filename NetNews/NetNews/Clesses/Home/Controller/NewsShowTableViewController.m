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


static NSString *basiID = @"basisID";
static NSString *bigID = @"bigImageID";
static NSString *imagesID = @"imagesID";
@interface NewsShowTableViewController ()

@property (nonatomic, strong) NSArray<NewsModel *> *newsArray;


@end

@implementation NewsShowTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    self.tableView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1];
    
}
    
#pragma mark - 1.搭建界面
-(void)setupUI {
   
    [self.tableView registerNib:[UINib nibWithNibName:@"basisImageCell" bundle:nil] forCellReuseIdentifier:basiID];
    [self.tableView registerNib:[UINib nibWithNibName:@"BIgImageCell" bundle:nil] forCellReuseIdentifier:bigID];
    [self.tableView registerNib:[UINib nibWithNibName:@"imagesCell" bundle:nil] forCellReuseIdentifier:imagesID];
    
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
}
    
#pragma mark - 2.数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsArray.count;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsModel *model = self.newsArray[indexPath.row];
    
    NewsShowCell *cell;
    
    
    if (model.imgextra.count == 2) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:imagesID forIndexPath:indexPath];
        
    } else if(model.imgType) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:bigID forIndexPath:indexPath];
        
    } else {
        
        cell = [tableView dequeueReusableCellWithIdentifier:basiID forIndexPath:indexPath];
    }
    
    
    cell.model = model;
    
    return cell;
}

#pragma mark - 3.下载数据
//接受从CollectionCell传递过来的Url 进行下载 并刷新数据
- (void)setUrlStr:(NSString *)urlStr {

    _urlStr = urlStr;
    
    [NewsModel requestNewsModelArrayWithUrl:urlStr andCompletionBlock:^(NSArray *modelArray) {
        self.newsArray = modelArray;
       
        
        [self.tableView reloadData];
        
    }];
}
 
@end


