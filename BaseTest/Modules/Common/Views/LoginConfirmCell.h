//
//  LoginConfirmCell.h
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/9/13.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ContentBtnBlock)();

@interface LoginConfirmCell : UITableViewCell

//
@property (nonatomic ,weak)  UIButton *contentBtn;

// 上面的线
@property (nonatomic ,weak)  UIImageView *line1;
// 底部的线
@property (nonatomic ,weak)  UIImageView *line2;

//
@property (nonatomic ,assign)  CGFloat contentBtnX;
//
@property (nonatomic ,assign)  CGFloat contentBtnW;

@property (nonatomic ,assign)  CGFloat contentBtnH;


@property(nonatomic, copy) ContentBtnBlock btnBlock;

@end
