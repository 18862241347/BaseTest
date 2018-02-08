//
//  FunctionBasis.h
//  TianyiClient
//
//  Created by 蒋玉顺 on 2017/6/26.
//  Copyright © 2017年 cn.tianyilm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import <CommonCrypto/CommonDigest.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface FunctionBasis : NSObject


// NSDictionary或NSArray转换为NSData
+(NSData *)toJSONData:(id)theData;

//NSDictionary或NSArray转换为NSString
+(NSString *)toJSONString:(id)theData;

//把NSString转化成jsonStr
+(NSString *)JSONString:(NSString*)aString;

//替换掉Json字符串中的换行符
+(NSString *)ReplacingNewLineAndWhitespaceCharactersFromJson:(NSString *)jsonStr_;



//判断字符串是否为空
+ (BOOL)isBlankString:(NSString *)string;

//判断数组是否为空
+ (BOOL)isBlankArray:(NSArray *)array;

//判断NSDictionary是否为空
+ (BOOL)isBlankDictionary:(NSDictionary *)dic;


//获取长度为stringLength的随机字符串,
//随机数字字符混合类型字符串函数
+(NSString *)getRandomString:(NSInteger)stringLength;

//随机数字类型字符串函数
+(NSString *)getRandomNumberString:(NSInteger)stringLength;

//随机字符类型字符串函数
+(NSString *)getRandomCharacterString:(NSInteger)stringLength;

//判断字符串是否是纯数字
+(BOOL)isPureNumber:(NSString *)string;



/**
 点击当前cell 返回的偏移量
 */
+ (CGPoint)IndexPath:(NSIndexPath*)IndexPath tableView:(UITableView*)tableView totalHeight:(CGFloat)totalHeight;


/**
 计算文本所占大小
 */
+ (CGSize)returnText:(NSString *)string font:(UIFont*)fsize weight:(CGFloat)weight;

/**
 计算文本所占大小
 */
+ (CGSize)returnText:(NSString *)string fontSize:(int)fsize weight:(CGFloat)weight;


/**
 *  获取相机权限
 */
+ (BOOL)isCannontUseCamera;




/// MD5加密
+(NSString *)md5HexDigest:(NSString *)str;

/// data转base64
+ (NSString*) base64Encode:(NSData *)data;

/// string转Data
+ (NSData*) base64Decode:(NSString *)string;



// 获取wifi信号 method
+(NSString*) currentWifiSSID;

// 获取设备的UUID
+(NSString *)gen_uuid;



// 当前时间的之间戳("yyyyMMddHHmmss")
+(NSString*)currentTime;

///  秒转 日期字符串
+(NSString *)convertStrToTime:(NSString *)timeStr;





//当Label的行数为1时，根据字符串长度动态改变UILabel的宽度
+(void)changeLabelWidth:(UILabel *)label_ withString:(NSString *)str_;

//当Label的宽度一定时，根据字符串长度动态改变UILabel的高度
+(void)changeLabelHeight:(UILabel *)label_ withString:(NSString *)str_;

//当Label的行数为1时，根据字符串长度动态改变UILabel的宽度
+(CGFloat)widthLabel:(UILabel *)label_ withString:(NSString *)str_;

//当Label的宽度一定时，根据字符串长度动态改变UILabel的高度
+(CGFloat)heightLabel:(UILabel *)label_ withString:(NSString *)str_;

@end
