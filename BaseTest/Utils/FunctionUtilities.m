//
//  FunctionUtilities.m
//  GlobalUtil
//
//  Created by 蒋玉顺 on 14-11-7.
//  Copyright (c) 2014年 Sage. All rights reserved.
//

#import "FunctionUtilities.h"
#import <AVFoundation/AVFoundation.h>

@implementation FunctionUtilities

+ (UIViewController *)viewController:(UIView *)view{
    
    UIResponder *responder = view;
    while ((responder = [responder nextResponder]))
        if ([responder isKindOfClass: [UIViewController class]])
            return (UIViewController *)responder;
    
    return nil;
}


+(NSString *)readHtml5Data:(NSString *)htmlStr_
{
    
    NSString *htmlString_ = [NSString stringWithFormat:@"<html><head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=no\"><style>img{max-width: 100%@; width:auto; height:auto;}</style></head><body>%@</body></html>", @"%", htmlStr_];
    
    return htmlString_;
    
}

+(NSString *)stringDeleteString:(NSString *)str
{
    //删除字符串两端的尖括号
    NSMutableString *mString = [NSMutableString stringWithString:str];
    //第一个参数是要删除的字符的索引，第二个是从此位开始要删除的位数
    [mString deleteCharactersInRange:NSMakeRange(0, 1)];
    [mString deleteCharactersInRange:NSMakeRange(mString.length-1, 1)];
    return mString;
}


+(NSString *)teamStr:(NSString *)teamStr
{
    NSString *viewCount = @"";
    if (teamStr.length>4) {
        NSString *str1 = [teamStr substringToIndex:1];
        NSRange rang = NSMakeRange(1, 1);
        NSString *str2 = [teamStr substringWithRange:rang];
        NSString *str3 = [NSString stringWithFormat:@"%@.%@",str1,str2];
        viewCount = [NSString stringWithFormat:@"%@万",str3];
    }else if(teamStr.length>3){
        NSString *str1 = [teamStr substringToIndex:1];
        NSRange rang = NSMakeRange(1, 1);
        NSString *str2 = [teamStr substringWithRange:rang];
        NSString *str3 = [NSString stringWithFormat:@"%@.%@",str1,str2];
        viewCount = [NSString stringWithFormat:@"%@千",str3];
    }else{
        viewCount = [NSString stringWithFormat:@"%@人",teamStr];
    }
    
    return viewCount;

}

//随机数字字符混合类型字符串函数
+(NSString *)getRandomString:(NSInteger)stringLength
{
    NSMutableString *randomString_ = [NSMutableString string];
    NSString *baseString_ = @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    for (int i=0; i<stringLength; i++)
    {
        NSInteger count_ = arc4random()%(baseString_.length);
        NSString *subStr_ = [baseString_ substringWithRange:NSMakeRange(count_, 1)];
        [randomString_ appendString:subStr_];
    }
    
    return randomString_;

    
}

//判断字符串是否为空
+ (BOOL)isBlankString:(NSString *)string
{
    if (string == nil || string == NULL)
    {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    if (![string isKindOfClass:[NSString class]])
    {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

//判断字符串是否为空
+ (BOOL)isBlankArray:(NSArray *)array
{
    if (array == nil || array == NULL)
    {
        return YES;
    }
    if ([array isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    if (![array isKindOfClass:[NSArray class]])
    {
        return YES;
    }
    if ([array count] == 0)
    {
        return YES;
    }

    return NO;
}

//判断NSDictionary是否为空
+ (BOOL)isBlankDictionary:(NSDictionary *)dic
{
    if (dic == nil || dic == NULL)
    {
        return YES;
    }
    if ([dic isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    if (![dic isKindOfClass:[NSDictionary class]])
    {
        return YES;
    }
    if ([[dic allKeys] count] == 0)
    {
        return YES;
    }

    return NO;
}
+ (BOOL)isBlankSpaceString:(NSString *)string
{
    if(!string)
    {
        return YES;

    }
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimedString = [string stringByTrimmingCharactersInSet:set];

    if([trimedString length] == 0)
    {
        return YES;

    }
    return NO;


}
@end


