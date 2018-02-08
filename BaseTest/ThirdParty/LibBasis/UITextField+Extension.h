//
//  UITextField+Extension.h
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/10/30.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Extension)

+(UITextField*)initWithPromptStr:(NSString*)promptStr ;

+(UITextField*)initWithPromptStr:(NSString*)promptStr titleColor:(UIColor*)titleColor;

+(UITextField*)initWithPromptStr:(NSString*)promptStr titleColor:(UIColor*)titleColor font:(CGFloat)font;

@end
