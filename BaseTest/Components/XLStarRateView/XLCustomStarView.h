//
//  XLCustomStarView.h
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/12/7.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XLCustomStarView;
@protocol XLCustomStarViewDelegate <NSObject>
@optional
/// 把当前选的星星传出去
- (void)XLCustomStarView:(XLCustomStarView *)XLCustomStarView scroePercentDidChange:(CGFloat)newScorePercent  btnTag:(NSInteger)btnTag;
@end
@interface XLCustomStarView : UIView
@property (nonatomic, weak) id<XLCustomStarViewDelegate>delegate;

// 星星的大小
@property (nonatomic, assign) CGSize starSize;

// 多少颗星 默认5个
@property (nonatomic, assign) NSInteger numberOfStars;


// 得分值，范围为0--1，默认为1
@property (nonatomic, assign) CGFloat scorePercent;


// 是否允许点击星星
@property (nonatomic, assign) BOOL isClick;

// 评分时是否允许不是整星，默认为NO
@property (nonatomic, assign) BOOL allowIncompleteStar;


// 是否允许动画，默认为NO
@property (nonatomic, assign) BOOL hasAnimation;


@end
