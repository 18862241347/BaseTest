//
//  CertificationController.h
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/8/21.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import "XLTableViewController.h"
typedef NS_ENUM(NSInteger, CertificationType) {
    CertificationTypeResale = 0,            // 转售馆
    CertificationTypeCollection,            // 藏品馆
    CertificationTypeCenter,                // 认证中心
    
};
@interface CertificationController : XLTableViewController
@property (nonatomic,assign) CertificationType type;

@end
