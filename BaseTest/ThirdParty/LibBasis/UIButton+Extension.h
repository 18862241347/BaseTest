//
//  UIButton+Extension.h
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/8/21.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

+(UIButton*)initWithTitleStr:(NSString*)titleStr titleColor:(UIColor*)titleColor;

+(UIButton*)initWithTitleColor:(UIColor*)titleColor font:(CGFloat)font;

+(UIButton*)initWithTitleStr:(NSString*)titleStr titleColor:(UIColor*)titleColor font:(CGFloat)font;

+(UIButton*)initWithTitleStr:(NSString*)titleStr titleColor:(UIColor*)titleColor font:(CGFloat)font bgColor:(UIColor*)bgColor;

+(UIButton*)initWithImageStr:(NSString*)imageStr ;

@end
