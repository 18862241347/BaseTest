//
//  PathUtilities.h
//  TaiPing
//
//  Created by bbdtek on 11-8-31.
//  Copyright 2011 bbdtek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PathUtilities : NSObject 

//创建或向已存在的Plist文件写数据
+(void)updatePlist:(NSSearchPathDirectory)searchPathDirectory_ withFile:(NSString*)filename_ withDictionary:(NSDictionary *)infoDic_;

//跟新Plist文件(根目录文件为NSDictionary)一级目录下得某一个字段的内容
+(void)updatePlist:(NSSearchPathDirectory)searchPathDirectory_ withFile:(NSString*)filename_ wihtKey:(NSString*)key_ withValue:(id)value;

//创建或向已存在的Plist文件写数据
+(void)updatePlist:(NSSearchPathDirectory)searchPathDirectory_ withFile:(NSString*)filename_ withArray:(NSArray *)infoArray_;

//获取Plist文件内容(文件内容是Dictionary)
+(NSMutableDictionary *)readDictionaryPlistForKey:(NSSearchPathDirectory)searchPathDirectory_ withFile:(NSString*)filename_;

//读取Plist文件一级目录中的某一个字段
+(NSString *)readPlistForKey:(NSSearchPathDirectory)searchPathDirectory_ withFile:(NSString*)filename_ wihtKey:(NSString*)key_;

//获取Plist文件内容(文件内容是array)
+(NSMutableArray *)readArrayPlistForKey:(NSSearchPathDirectory)searchPathDirectory_ withFile:(NSString*)filename_;

//获取document目录下文件路径
+ (NSString *)documentFilePathWithFileName:(NSString*)fileName;
//获取library目录下文件路径
+ (NSString *)libraryFilePathWithFileName:(NSString*)fileName;

//指定路径上如果不存在文件，就自动创建文件夹
+ (BOOL)createDirectoryIfNotExistsAtPath:(NSString *)path;

//
//将资源文件的数据库文件写入沙盒中
+ (void) copyDatabaseIfNeededWithFileName:(NSString*)fileName  SearchPathDirectory:(NSSearchPathDirectory)searchPathDirectory;
//将资源文件的数据库文件写入沙盒中
+ (void) copyDatabaseIfNeededWithFileName:(NSString*)fileName  withFileType:(NSString *)fileType SearchPathDirectory:(NSSearchPathDirectory)searchPathDirectory;

//Wirte File
+ (NSString *)writeToFile:(NSData *)data  withFileName:(NSString *) fileName;


//判断文件是否存在
+(BOOL)fileExistsAtPath:(NSString *) filePath_;


//delete File
+ (void)deteleFileWithFilePath:(NSString*)filePath_;



//获取已登录用户信息， 判断是否需要登录
+(NSDictionary *)userInfoFrowLocal;

//登录用户信息本地保存，
+(void)saveUserInfoToLocal:(NSDictionary *)userInfoDic_;


// 用户登录后 更新或添加本地信息
+(void)updateUserInfoToLocalKeyStr:(NSString*)keyStr valueStr:(NSString*)valueStr;




@end
