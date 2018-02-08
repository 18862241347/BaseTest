//
//  NSString+Extension.h
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/8/22.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)
/*
 *  将一个字符串数字 转为*.*万
 */
+(NSString*)convertString:(NSString*)string;




@end


@interface NSAttributedString(Extension)

/*
 *  改变字符串中从0到某个字符的字体大小
 */

+(NSAttributedString*)changeString:(NSString *)string font:(CGFloat)font  idStr:(NSString *)idStr;
/*
 *  改变字符串某个范围内的字体大小
 */
+(NSAttributedString *)changeString:(NSString *)string font:(CGFloat)font  range:(NSRange)range;

/*
 *  改变字符串某个范围内 某种属性
 */
+(NSAttributedString *)changeString:(NSString *)string name:(NSString*)name value:(id)value  range:(NSRange)range;
@end
