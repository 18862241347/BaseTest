

//
//  XLNavigationController.m
//  TianyiClient
//
//  Created by 蒋玉顺 on 2017/4/24.
//  Copyright © 2017年 cn.tianyilm. All rights reserved.
//

#import "XLNavigationController.h"

@interface XLNavigationController ()<UINavigationControllerDelegate>

@end

@implementation XLNavigationController


+ (void)initialize {
    

    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
    self.interactivePopGestureRecognizer.enabled = YES;
    self.interactivePopGestureRecognizer.delegate = (id)self;


//    self.navigationController.navigationBar.barTintColor = kAppWhiteColor;
//    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:18],NSForegroundColorAttributeName:kAppBlackColor};

    
}





@end
