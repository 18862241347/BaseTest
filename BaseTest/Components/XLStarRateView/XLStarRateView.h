//
//  XLStarRateView.h
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/9/18.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XLStarRateView;
@protocol XLStarRateViewDelegate <NSObject>
@optional
/// 把当前选的星星传出去
- (void)XLStarRateView:(XLStarRateView *)XLStarRateView scroePercentDidChange:(CGFloat)newScorePercent  btnTag:(NSInteger)btnTag;
@end

@interface XLStarRateView : UIView
@property (nonatomic, weak) id<XLStarRateViewDelegate>delegate;

// 多少颗星 默认5个
@property (nonatomic, assign) NSInteger numberOfStars;

// 循环创建的时候的  记录tag值
@property (nonatomic, assign) NSInteger btnTag;

// 得分值，范围为0--1，默认为1
@property (nonatomic, assign) CGFloat scorePercent;


// 是否允许点击星星
@property (nonatomic, assign) BOOL isClick;

// 评分时是否允许不是整星，默认为NO
@property (nonatomic, assign) BOOL allowIncompleteStar;


// 是否允许动画，默认为NO
@property (nonatomic, assign) BOOL hasAnimation;





@end
