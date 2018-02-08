



//
//  UITextField+Extension.m
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/10/30.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import "UITextField+Extension.h"

@implementation UITextField (Extension)

+(UITextField *)initWithPromptStr:(NSString *)promptStr
{
    UITextField *textField = [[UITextField alloc]init];
    textField.placeholder = promptStr ;
    return textField;
}
+(UITextField *)initWithPromptStr:(NSString *)promptStr titleColor:(UIColor *)titleColor
{
    UITextField *textField = [UITextField initWithPromptStr:promptStr];
    textField.textColor = titleColor;
    
    return textField;

}


+(UITextField *)initWithPromptStr:(NSString *)promptStr titleColor:(UIColor *)titleColor font:(CGFloat)font
{
    
    UITextField *textField = [UITextField initWithPromptStr:promptStr titleColor:titleColor];
    textField.font = [UIFont systemFontOfSize:font];

    return textField;

}
@end
