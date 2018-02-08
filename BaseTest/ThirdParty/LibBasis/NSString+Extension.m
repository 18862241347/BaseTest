


//
//  NSString+Extension.m
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/8/22.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
+(NSString*)convertString:(NSString*)string
{
    
    NSCharacterSet* nonDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSInteger totalnum = [[string stringByTrimmingCharactersInSet:nonDigits] integerValue];
    
    double num = totalnum/10000.0;
    
    NSString * str = [NSString stringWithFormat:@"%.2f万",num];
    
    return str;
}



@end
@implementation NSAttributedString (Extension)

+(NSAttributedString*)changeString:(NSString *)string font:(CGFloat)font  idStr:(NSString *)idStr
{
    
    NSArray *strArr = [string componentsSeparatedByString:idStr];
    
    NSString *decollatorStr_ = [strArr firstObject];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:string];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:NSMakeRange(0, decollatorStr_.length)];
    
    return attributedString;
    
}

+(NSAttributedString *)changeString:(NSString *)string font:(CGFloat)font  range:(NSRange)range
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:string];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:range];
    return attributedString;

}

+(NSAttributedString *)changeString:(NSString *)string name:(NSString *)name value:(id)value range:(NSRange)range
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:string];
    [attributedString addAttribute:name value:value range:range];
    return attributedString;
}
@end
