
//  XLBaseViewController.h
//  TianyiClient
//
//  Created by 蒋玉顺 on 2017/4/24.
//  Copyright © 2017年 cn.tianyilm. All rights reserved.
//


#import <UIKit/UIKit.h>
//#import "XLAFServiceManger.h"
typedef void(^ButtonBlock)();
@interface XLBaseViewController : UIViewController



@property(nonatomic, strong) UIButton *customLeftButton;
@property(nonatomic, strong) UIButton *customRightButton;


//自定义右边导航按钮方法
@property(nonatomic, copy) ButtonBlock customRightButtonBlock;
@property(nonatomic, copy) ButtonBlock customLeftButtonBlock;


//  显示黑色导航背景条
@property(nonatomic, assign) BOOL isBlackNav;

@end


