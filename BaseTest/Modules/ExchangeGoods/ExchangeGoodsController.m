


//
//  ExchangeGoodsController.m
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/8/25.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import "ExchangeGoodsController.h"





@interface ExchangeGoodsController ()
@end

@implementation ExchangeGoodsController
- (void)initCustomNabBarView
{
    [self.navigationItem setTitle:@"易品 . 汇"];
    NSString *titleStr = @"易品 . 汇";
    NSAttributedString * titleAttStr = [NSAttributedString changeString:titleStr font:18 idStr:@". 汇"];
    UILabel *titleLabel = [UILabel initWithTextColor:kAppBlackColor font:15];
    titleLabel.frame = CGRectMake(0, 0, SCREEN_WIDTH, 30);
    titleLabel.attributedText = titleAttStr;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView  = titleLabel;
    
    
    self.customLeftButton.hidden = YES;

    
}

- (void)initSettingData
{
    
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    

}

@end
