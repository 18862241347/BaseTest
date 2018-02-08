
//  XLBaseViewController.m
//  TianyiClient
//
//  Created by 蒋玉顺 on 2017/4/24.
//  Copyright © 2017年 cn.tianyilm. All rights reserved.
//


#import "XLBaseViewController.h"

@interface XLBaseViewController ()

@end

@implementation XLBaseViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createCustomeNavBarView];
    
    
    
}

//自定义navigationbar
- (void)createCustomeNavBarView
{
    UIButton *customLeftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    customLeftButton.frame = CGRectMake(0, 0, 30, 30);
    [customLeftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    customLeftButton .imageView.contentMode = UIViewContentModeScaleAspectFit;
    customLeftButton.adjustsImageWhenHighlighted = NO;
    [customLeftButton addTarget:self action:@selector(customLeftButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    self.customLeftButton = customLeftButton;
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView: self.customLeftButton];
    self.navigationItem.leftBarButtonItem = backItem;
    
    
    UIButton *customRightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    customRightButton.frame = CGRectMake(0, 0, 30, 30);
    [customRightButton setTitleColor:kAppBlackColor forState:UIControlStateNormal];
    customRightButton.titleLabel.font = [UIFont systemFontOfSize:15];
    customRightButton .imageView.contentMode = UIViewContentModeScaleAspectFit;
    customRightButton.hidden = YES;
    customRightButton.adjustsImageWhenHighlighted = NO;
    [customRightButton addTarget:self action:@selector(customRightButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    self.customRightButton = customRightButton;
    UIBarButtonItem *resignItem = [[UIBarButtonItem alloc] initWithCustomView:customRightButton];
    self.navigationItem.rightBarButtonItem = resignItem;
    
    

    //    UINavigationBar *navBar = [UINavigationBar appearance];
    //    navBar.barTintColor = kAppWhiteColor;
    //    navBar.tintColor = kAppWhiteColor;
    //    navBar.titleTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:18],NSForegroundColorAttributeName:kAppBlackColor};
    //
    //    [navBar setShadowImage:[UIImage imageWithColor:kAppLineBackgroundColor1]];




}

-(void)setIsBlackNav:(BOOL)isBlackNav
{
    _isBlackNav = isBlackNav;

    if (_isBlackNav == YES)
    {

        self.navigationController.navigationBar.translucent = NO;
        self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]};
        [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:UICOLOR_HEX(0x3C3C3C)]];
        self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
        self.navigationController.navigationBar.barTintColor = UICOLOR_HEX(0x3C3C3C);
        self.navigationController.navigationBar.tintColor = UICOLOR_HEX(0x3C3C3C);

    }else
    {
        self.navigationController.navigationBar.translucent = YES;
        self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:18],NSForegroundColorAttributeName:kAppBlackColor};
        [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:kAppLineBackgroundColor1]];
        self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
        self.navigationController.navigationBar.barTintColor = kAppWhiteColor;
        self.navigationController.navigationBar.tintColor = kAppWhiteColor;


    }
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    if (self.serviceManager)
//    {
//        self.serviceManager.delegate = self;
//    }

    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
//    if (self.serviceManager)
//    {
//        self.serviceManager.delegate = nil;
//    }
}



#pragma mark-
#pragma mark---public methods customer button methods

- (void)customLeftButtonPressed:(id)sender
{
    DLog(@"back btn pressed");
    if (self.customLeftButtonBlock) {
        self.customLeftButtonBlock();
        return;
    }

    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)customRightButtonPressed:(id)sender
{
    if (self.customRightButtonBlock) {
        self.customRightButtonBlock();
        return;
    }
    DLog(@"next btn pressed");
}


#pragma mark-
#pragma mark---XLAFServiceMangerDelegate

//请求数据出错
- (void)dataSourceDidError:(NSDictionary *)info withMethod:(NSString *)method
{
    NSInteger returnCode_ = [[info objectForKey:server_return_Code] integerValue];
    if (returnCode_ == -100)
    {
        //请求服务失败
        NSString *errorMessage_ = [info objectForKey:server_return_Message];
//        [GlobalUtils fail_HUD:errorMessage_  toView:self.view];

    }
    else if (returnCode_ == -200)
    {
        //返回的数据结构不是NSDictionary类型
        NSString *errorMessage_ = [info objectForKey:server_return_Message];
//        [GlobalUtils fail_HUD:errorMessage_ toView:self.view];

    }
    else if (returnCode_ == server_return_UnLogIn)
    {
        //登录失效
        //        [[NSNotificationCenter defaultCenter] postNotificationName:switchToRootLoginVC object:nil];
    }
}


@end


