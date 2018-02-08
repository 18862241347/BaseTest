//
//  FunctionUtilities.h
//  GlobalUtil
//
//  Created by 蒋玉顺 on 14-11-7.
//  Copyright (c) 2014年 Sage. All rights reserved.
//  功能操作




#import <Foundation/Foundation.h>

@interface FunctionUtilities : NSObject

+ (UIViewController *)viewController:(UIView *)view;


/// 根据返回的html格式的标签字符串生成可用的字符串
+(NSString *)readHtml5Data:(NSString *)htmlStr_;

/// 删除两端的尖括号
+(NSString *)stringDeleteString:(NSString *)str;

/// 1000 转成1千
+(NSString *)teamStr:(NSString *)teamStr;


// 获取长度为stringLength的随机字符串,
// 随机数字字符混合类型字符串函数
+(NSString *)getRandomString:(NSInteger)stringLength;

// 判断字符串是否为空
+ (BOOL)isBlankString:(NSString *)string;

// 判断数组是否为空
+ (BOOL)isBlankArray:(NSArray *)array;

// 判断NSDictionary是否为空
+ (BOOL)isBlankDictionary:(NSDictionary *)dic;

// 判断字符串是否全为空格
+ (BOOL)isBlankSpaceString:(NSString *)string;


@end
