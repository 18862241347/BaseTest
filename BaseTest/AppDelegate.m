//
//  AppDelegate.m
//  BaseTest
//
//  Created by 蒋玉顺 on 2017/12/27.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "RootTabViewController.h"
#import "LoginViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //注册本地通知
    [self initLocalNotification];

    //初始化参数
    [self initWithLocalData];

    //第三方注册
    [self registThirdPartInfo];

    self.window = [[UIWindow alloc] initWithFrame:SCREEN_BOUNDS];
    self.window.backgroundColor = [UIColor whiteColor];
    [self initRootViewController];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)initLocalNotification
{
    //登录用户退出登录，切换到登录页面
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(switchToLoginViewController:) name:SWITCH_TO_LOGINVC object:nil];



}

//获取本地保存数据
- (void)initWithLocalData
{
    NSDictionary *userDic = [PathUtilities userInfoFrowLocal];
    [JSessionInfo sharedInstance].userDic = [NSMutableDictionary dictionaryWithDictionary:userDic];

    NSString *uid = [userDic objectForKey:@"uid"];
    if (uid == nil || [uid isEqualToString:@""]) {
        uid = @"0";
    }
    [JSessionInfo sharedInstance].user_id = uid;




}

- (void)initRootViewController
{
    RootTabViewController *rootVC_ = [[RootTabViewController alloc] init];
    self.window.rootViewController = rootVC_;


    //    ViewController *rootVC_ = [[ViewController alloc] init];
    //    self.window.rootViewController = rootVC_;

}
//第三方注册信息
- (void)registThirdPartInfo
{

    /// 支付注册


}








//以模态形式显示登录页面
- (void)switchToLoginViewController:(NSNotification*)noti
{

    NSDictionary *notiDic = noti.object;
    NSInteger pushType = 0;
    pushType = [[notiDic objectForKey:@"pushType"] integerValue];


    LoginViewController *loginVC = [[LoginViewController alloc] init];
    loginVC.type = pushType;

    if (pushType == 0) {

        UITabBarController *rootNav = (UITabBarController*)[UIApplication sharedApplication].keyWindow.rootViewController;
        UINavigationController *nav = rootNav.selectedViewController;
        loginVC.hidesBottomBarWhenPushed = YES;
        [nav pushViewController:loginVC animated:YES];

        //        self.window.rootViewController = rootNav_;
    }else
    {

        UINavigationController *rootNav_ = [[UINavigationController alloc] initWithRootViewController:loginVC];
        [self.window.rootViewController presentViewController:rootNav_ animated:YES completion:nil];

    }



}


@end
