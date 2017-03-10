//
//  NewsFlowLayout.m
//  NetNews
//
//  Created by 袁飞 on 2017/3/10.
//  Copyright © 2017年 Yuanfei. All rights reserved.
//

#import "NewsFlowLayout.h"

@implementation NewsFlowLayout

- (void)prepareLayout {
    self.itemSize = CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.height);
    
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
}
    
@end
