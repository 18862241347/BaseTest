

//
//  UILabel+Extension.m
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/8/21.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel(Extension)

+(UILabel*)initWithTextStr:(NSString*)textStr textColor:(UIColor*)textColor
{
    UILabel *label = [[UILabel alloc]init];
    label.text = textStr;
    label.textColor = textColor;
    return label;

}


+(UILabel *)initWithTextColor:(UIColor *)textColor font:(CGFloat )font
{
    UILabel *label = [[UILabel alloc]init];
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:font];
    return label;
}

+(UILabel *)initWithTextStr:(NSString *)textStr textColor:(UIColor *)textColor font:(CGFloat)font
{
    UILabel *label = [UILabel initWithTextStr:textStr textColor:textColor];
    label.font = [UIFont systemFontOfSize:font];
    return label;

}
+(UILabel *)initWithTextStr:(NSString *)textStr textColor:(UIColor *)textColor font:(CGFloat)font bgColor:(UIColor *)bgColor
{
    UILabel *label = [UILabel initWithTextStr:textStr textColor:textColor font:font];
    label.backgroundColor = bgColor;
    return label;
}
@end
