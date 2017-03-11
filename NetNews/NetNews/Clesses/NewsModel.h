//
//  NewsModel.h
//  NetNews
//
//  Created by 袁飞 on 2017/3/10.
//  Copyright © 2017年 Yuanfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject
    
@property (nonatomic,copy) NSString *title;
// 新闻图标
@property (nonatomic,copy) NSString *imgsrc;
// 新闻来源
@property (nonatomic,copy) NSString *source;
// 新闻回复数
@property (nonatomic,strong) NSNumber *replyCount;
// 多张配图
@property (nonatomic, strong) NSArray *imgextra;
// 大图标记
@property (nonatomic, assign) BOOL imgType;
    
+ (void)requestNewsModelArrayWithUrl:(NSString *)urlStr andCompletionBlock:(void(^)(NSArray *modelArray))completionBlock;

@end
