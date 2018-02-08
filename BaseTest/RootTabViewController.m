//
//  RootTabViewController.m
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/7/26.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import "RootTabViewController.h"

#import "HomeController.h"
#import "ClassifyController.h"
#import "ExchangeGoodsController.h"
#import "CertificationController.h"
#import "MineController.h"

#import "XLNavigationController.h"


@interface RootTabViewController ()<UITabBarControllerDelegate>

@end

@implementation RootTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.delegate = self;
    //    self.tabBar.tintColor = kAppRedColor;
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateSelected];
    
    [self addViewControllers];
    
}

-(void)addViewControllers
{
    
    
    HomeController *homeVC = [[HomeController alloc]init];
    [self addOneChildVC:homeVC title:@"首页" imageName:@"home_gray" selectedImageName:@"home_blue"];
    
    
    ClassifyController *classiftyVC = [[ClassifyController alloc]init];
    [self addOneChildVC:classiftyVC title:@"分类" imageName:@"classify_gray" selectedImageName:@"classify_blue"];
    
    
    ExchangeGoodsController *discoverVC = [[ExchangeGoodsController alloc]init];
    [self addOneChildVC:discoverVC title:@"易品汇" imageName:@"ExchangeGoods_gray" selectedImageName:@"ExchangeGoods_blue"];
    
    CertificationController *certificationVC = [[CertificationController alloc]init];
    [self addOneChildVC:certificationVC title:@"认证馆" imageName:@"certification_gray" selectedImageName:@"certification_blue"];
    
    
    
    MineController *mineVC = [[MineController alloc]init];
    [self addOneChildVC:mineVC title:@"个人中心" imageName:@"mine_gray" selectedImageName:@"mine_blue"];
    
    
    
    
    
}



-(void)addOneChildVC:(UIViewController*)childVC title:(NSString*)title imageName:(NSString*)imageName selectedImageName:(NSString*)selectedImageName
{
  
    childVC.tabBarItem.title = title;

    //    childVC.title = title;
    
    childVC.tabBarItem.image = [UIImage imageNamed:imageName];
    childVC.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    
    
    XLNavigationController* nav = [[XLNavigationController alloc]initWithRootViewController:childVC];
    [self addChildViewController:nav];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    
    UIViewController *selected = [tabBarController selectedViewController];
    
    NSArray *subViewControllers_ = [tabBarController viewControllers];
    NSInteger tabSeletedIndex_ = [subViewControllers_ indexOfObject:viewController];
    //TabBar切换界面
    [[NSNotificationCenter defaultCenter] postNotificationName:TABBAR_SELECTVC object:@{@"tabSeletedIndex":[NSNumber numberWithInteger:tabSeletedIndex_]}];
    
    
    if ([selected isEqual:viewController]) {
        return NO;
    }
    return YES;
}


@end
