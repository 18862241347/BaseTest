//
//  XLModelContainView.h
//  Michelin
//
//  Created by 蒋玉顺 on 15/9/17.
//  Copyright (c) 2015年 Michelin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XLModelContainView;

@protocol XLModelContainViewDelegate <NSObject>

@optional

//点击view的空白位置，
- (void)modelViewCacelTouch:(XLModelContainView *)modelView;



- (void)modelViewDidTouch:(XLModelContainView *)modelView;

@end


@interface XLModelContainView : UIView

@property(nonatomic, assign) id<XLModelContainViewDelegate>delegate;

@property(nonatomic, retain) UIView *contextView;

//半透明背景view
@property(nonatomic, retain) UIView *fullView;

@property(nonatomic, assign) BOOL  isDismiss;


- (void)showCustomModel;

- (void)dismissCustomModelWithAnimation:(BOOL)animation;

-(instancetype)initWithFullView:(UIView*)fullView;
@end
