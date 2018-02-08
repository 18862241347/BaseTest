//
//  XLBannerView.h
//  LoveBaby
//
//  Created by 谢传波 on 15/8/17.
//  Copyright (c) 2015年 YeGuo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

@class XLBannerView;

@protocol XLBannerViewDelegate <NSObject>

@optional

//标记选中的banner
- (void)activityClickedWithNum:(NSInteger)activityNum;

- (void)activityClickedWithInfo:(id)activityInfo;

- (void)activityClicked:(XLBannerView *)activityView_;

- (void)closeActivity:(XLBannerView *)activityView_;

@end

@interface XLBannerView : UIView<UIScrollViewDelegate>

@property(nonatomic, assign) id<XLBannerViewDelegate>delegate;

- (id)initWithFrame:(CGRect)frame withInfo:(NSArray *)infoData_;


@end
