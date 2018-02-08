//
//  LoginInputCell.h
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/9/13.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//  登录输入cell  可充当公共cell

#import <UIKit/UIKit.h>
typedef void(^ArrowBtnBlock)();

@interface LoginInputCell : UITableViewCell
// 标题
@property (nonatomic ,weak) UILabel *titleLabel;
// 输入框
@property (nonatomic ,weak) UITextField *inputTextField;
// 箭头img
@property (nonatomic ,weak)  UIButton *arrowBtn;
// 上面的线
@property (nonatomic ,weak)  UIImageView *line1;
// 底部的线
@property (nonatomic ,weak)  UIImageView *line2;


// 输入框X值
@property (nonatomic ,assign)  CGFloat inputTextFieldX;
// 输入框W
@property (nonatomic ,assign)  CGFloat inputTextFieldW;

@property(nonatomic, copy) ArrowBtnBlock btnBlock;

@end
