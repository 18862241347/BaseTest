//
//  XLHidenKeyboardView.h
//  Michelin
//
//  Created by 蒋玉顺 on 15/9/14.
//  Copyright (c) 2015年 Michelin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XLHidenKeyboardView;

@protocol XLHidenKeyboardViewDelegate <NSObject>

@optional

//完成输入后隐藏键盘
- (void)didFinishedInputToHidenKeyboard:(XLHidenKeyboardView *)hidenKeyboardView;
//取消输入隐藏键盘
- (void)cancelInputToHidenKeyboard:(XLHidenKeyboardView *)hidenKeyboardView;


@end


@interface XLHidenKeyboardView : UIView

@property(nonatomic, retain) id<XLHidenKeyboardViewDelegate>delegate;
/// 是否显示取消按钮
@property(nonatomic, assign) BOOL isCancelBtn;


@end
