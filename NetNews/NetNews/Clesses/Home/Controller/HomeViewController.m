//
//  HomeViewController.m
//  NetNews
//
//  Created by 袁飞 on 2017/3/10.
//  Copyright © 2017年 Yuanfei. All rights reserved.
//

#import "HomeViewController.h"
#import "ChannelScrollView.h"
#import "Masonry.h"
#import "NewsCollectionView.h"
#import "NewsFlowLayout.h"
#import <YYModel.h>
#import "ChannelModel.h"
#import "NewsCollectionCell.h"
#import "ChannelLabel.h"

static NSString *cellId = @"newsID";
@interface HomeViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) ChannelScrollView *channelView;
@property (nonatomic, strong) NewsCollectionView *newsView;

@property (nonatomic, strong) NSArray<ChannelModel *> *channelArray;

@property (nonatomic, strong) NSArray *channelLabelArray;
    
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
    [self loadJson];
}

#pragma mark - 1.搭建界面
-(void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"网易新闻";
    
    self.navigationController.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.channelView];
    
    [self.channelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.offset(0);
        make.height.offset(44);
        make.top.offset(0);
    }];
    
    
    [self.view addSubview:self.newsView];
    
    [self.newsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.channelView.mas_bottom);
        make.left.right.bottom.offset(0);
    }];
    
    
    __weak typeof(self) weakSelf = self;
    
    [self.channelView setTagBlock:^(int tag) {
        
//        weakSelf.newsView.contentOffset = CGPointMake(tag * self.view.frame.size.width, 0);
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:tag inSection:0];
        
        [weakSelf.newsView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    }];
}

#pragma mark - 4.滑动结束
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSInteger index = scrollView.contentOffset.x / self.newsView.frame.size.width;
    self.channelView.index = (int)index;
}

#pragma mark - 5.滑动中
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat floatIndex = scrollView.contentOffset.x / scrollView.frame.size.width;
    int intIndex = scrollView.contentOffset.x / scrollView.frame.size.width;
    //缩放百分比
    CGFloat precent = floatIndex - intIndex;
    //左边的的缩放百分比
    CGFloat leftPresent = 1 - precent;
    //右边的缩放百分比
    CGFloat rightPresent = precent;
    
    int leftIndex = intIndex;
    int rightIndex = intIndex + 1;
    
    self.channelLabelArray = self.channelView.channelLabelArray;
    ChannelLabel *leftLabel = self.channelLabelArray[leftIndex];
    leftLabel.scalePresent = leftPresent;
    
    if (rightIndex < self.channelLabelArray.count) {
        ChannelLabel *rightLabel = self.channelLabelArray[rightIndex];
        rightLabel.scalePresent = rightPresent;
    }
}

#pragma mark - 2.NewsView数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.channelArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NewsCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    //拼接Url并传递给Cell
    NSString *urlStr = [NSString stringWithFormat:@"%@/0-20.html", self.channelArray[indexPath.row].tid];
    
    cell.urlStr = urlStr;
    
    return cell;
}
    
#pragma mark - 3.解析本地JSON数据
- (void)loadJson {
    self.channelArray = [ChannelModel getChannelArray];
    
    //对数组进行排列
    self.channelArray = [self.channelArray sortedArrayUsingComparator:^NSComparisonResult(ChannelModel *obj1, ChannelModel *obj2) {
        
        return [obj1.tid compare:obj2.tid];
    }];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.channelView.contentSize = CGSizeMake(self.channelArray.count * 80, 0);
    
    self.channelView.channelArray = self.channelArray;
}

#pragma mark - 0.懒加载
- (ChannelScrollView *)channelView {
    if (!_channelView) {
        _channelView = [[ChannelScrollView alloc] init];
        
        _channelView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
    }
    return _channelView;
}
    
- (NewsCollectionView *)newsView {
    if (!_newsView) {
        
        NewsFlowLayout *layout = [[NewsFlowLayout alloc] init];
        _newsView = [[NewsCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _newsView.dataSource = self;
        _newsView.delegate = self;
        _newsView.backgroundColor = [UIColor whiteColor];
        _newsView.showsHorizontalScrollIndicator = NO;
        _newsView.showsVerticalScrollIndicator = NO;
        _newsView.bounces = NO;
        _newsView.pagingEnabled = YES;
        [_newsView registerClass:[NewsCollectionCell class] forCellWithReuseIdentifier:cellId];
    }
    return _newsView;
}

//- (NSArray *)channelLabelArray {
//    if (!_channelLabelArray) {
//        _channelLabelArray = [NSArray array];
//    }
//    return _channelLabelArray;
//}
@end
