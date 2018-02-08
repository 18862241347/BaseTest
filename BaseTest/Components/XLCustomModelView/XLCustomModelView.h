//
//  XLCustomModelView.h
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/11/7.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XLCustomModelView;

@protocol XLCustomModelViewDelegate <NSObject>

@optional

//点击view的空白位置，
- (void)modelViewCacelTouch:(XLCustomModelView *)modelView;



- (void)modelViewDidTouch:(XLCustomModelView *)modelView;

@end
@interface XLCustomModelView : UIView


@property(nonatomic, assign) id<XLCustomModelViewDelegate>delegate;

@property(nonatomic, retain) UIView *contextView;

//半透明背景view
@property(nonatomic, retain) UIView *fullView;

@property(nonatomic, assign) BOOL  isDismiss;


- (void)showCustomModel;

- (void)dismissCustomModelWithAnimation:(BOOL)animation;

-(instancetype)initWithFullView:(UIView*)fullView;


@end
