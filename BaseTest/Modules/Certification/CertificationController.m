

//
//  CertificationController.m
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/8/21.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import "CertificationController.h"





@interface CertificationController ()
@end

@implementation CertificationController
- (void)initCustomNabBarView
{
    
    NSString *titleStr = @"认证体验 . 馆";
    NSAttributedString * titleAttStr = [NSAttributedString changeString:titleStr font:18 idStr:@". 馆"];
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
