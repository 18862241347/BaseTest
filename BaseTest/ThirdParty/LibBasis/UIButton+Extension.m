

//
//  UIButton+Extension.m
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/8/21.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

+(UIButton *)initWithTitleStr:(NSString *)titleStr titleColor:(UIColor *)titleColor
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:titleStr forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    
    return btn;
}
+(UIButton *)initWithTitleColor:(UIColor *)titleColor font:(CGFloat)font
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    
    return btn;
}

+(UIButton *)initWithTitleStr:(NSString *)titleStr titleColor:(UIColor *)titleColor font:(CGFloat)font
{
    UIButton *btn = [UIButton initWithTitleStr:titleStr titleColor:titleColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    
    return btn;
}
+(UIButton *)initWithTitleStr:(NSString *)titleStr titleColor:(UIColor *)titleColor font:(CGFloat)font bgColor:(UIColor *)bgColor
{
    UIButton *btn = [UIButton initWithTitleStr:titleStr titleColor:titleColor font:font];
    btn.backgroundColor = bgColor;
    
    return btn;
}

+(UIButton*)initWithImageStr:(NSString*)imageStr
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    btn.adjustsImageWhenHighlighted = NO;
    return btn;
}
@end
