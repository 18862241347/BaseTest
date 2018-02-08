//
//  BaseViewController.h
//  TianyiClient
//
//  Created by 蒋玉顺 on 2017/4/24.
//  Copyright © 2017年 cn.tianyilm. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "XLBaseViewController.h"
@class EmptyShowView;

@interface BaseViewController : XLBaseViewController

/// 界面没有数据时展示View
@property(nonatomic, strong) EmptyShowView *tipsView;

/// 是否网络错误
@property(nonatomic, assign) BOOL isNetworkError;

@end
