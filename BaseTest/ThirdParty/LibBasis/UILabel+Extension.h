//
//  UILabel+Extension.h
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/8/21.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

+(UILabel*)initWithTextStr:(NSString*)textStr textColor:(UIColor*)textColor;

+(UILabel*)initWithTextColor:(UIColor*)textColor font:(CGFloat)font;

+(UILabel*)initWithTextStr:(NSString*)textStr textColor:(UIColor*)textColor font:(CGFloat)font;

+(UILabel*)initWithTextStr:(NSString*)textStr textColor:(UIColor*)textColor font:(CGFloat)font bgColor:(UIColor*)bgColor;

@end
