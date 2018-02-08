//
//  BaseViewController.m
//  TianyiClient
//
//  Created by 蒋玉顺 on 2017/4/24.
//  Copyright © 2017年 cn.tianyilm. All rights reserved.
//
#import "BaseViewController.h"

@interface BaseViewController ()
@end

@implementation BaseViewController
-(void)setIsNetworkError:(BOOL)isNetworkError
{
    _isNetworkError = isNetworkError;
    
    if (_isNetworkError == YES)
    {
        

    }else
    {

        
    }
    
}


//空方法，在各ViewController中自定义
- (void)initCustomNabBarView
{
    
}

- (void)initSettingData
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    //初始化导航栏
    [self initCustomNabBarView];
    
    [self initSettingData];
    
}





@end
