//
//  LoginViewController.h
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/9/13.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//  登录界面 

#import "XLTableViewController.h"
typedef NS_ENUM(NSInteger, LoginType) {
    LoginTypePush = 0,            // 导航进入
    LoginTypeModal,               // 模态进入
    LoginTypeOther,               // 其他

};
@interface LoginViewController : XLTableViewController
@property (nonatomic,assign) LoginType type;

@end
