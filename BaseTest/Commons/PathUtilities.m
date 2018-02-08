

//
//  PathUtilities.m
//  TaiPing
//
//  Created by bbdtek on 11-8-31.
//  Copyright 2011 bbdtek. All rights reserved.
//

#import "PathUtilities.h"


@implementation PathUtilities


//创建或向已存在的Plist文件写数据
+(void)updatePlist:(NSSearchPathDirectory)searchPathDirectory_ withFile:(NSString*)filename_ withDictionary:(NSDictionary *)infoDic_
{
    
    //获取Document或Library目录
    NSArray *paths = NSSearchPathForDirectoriesInDomains(searchPathDirectory_, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    ////获取文件路径
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",filename_]];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //指定路径下的文件不存在先创建文件再向文件中写数据，如果文件存在直接向文件写数据
    if (![fileManager fileExistsAtPath: plistPath])
    {
        [[NSFileManager defaultManager] createFileAtPath:plistPath contents:nil attributes:nil];
    }
    
    [infoDic_ writeToFile: plistPath  atomically:YES];
    
}

//跟新Plist文件(根目录文件为NSDictionary)一级目录下得某一个字段的内容
+(void)updatePlist:(NSSearchPathDirectory)searchPathDirectory_ withFile:(NSString*)filename_ wihtKey:(NSString*)key_ withValue:(id)value
{
    
    NSMutableDictionary *info_ = [self readDictionaryPlistForKey:searchPathDirectory_ withFile:filename_];
    if (!info_)
    {
        info_ = [NSMutableDictionary dictionary];
    }
    [info_ setObject:value forKey:key_];
    
    [self updatePlist:searchPathDirectory_ withFile:filename_ withDictionary:info_];
    
}

//跟新文件
+(void)updatePlist:(NSSearchPathDirectory)searchPathDirectory_ withFile:(NSString*)filename_ withArray:(NSArray *)infoArray_
{
    //获取Document或Library目录
    NSArray *paths = NSSearchPathForDirectoriesInDomains(searchPathDirectory_, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    ////获取文件路径
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",filename_]];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //指定路径下的文件不存在先创建文件再向文件中写数据，如果文件存在直接向文件写数据
    if (![fileManager fileExistsAtPath: plistPath])
    {
        [[NSFileManager defaultManager] createFileAtPath:plistPath contents:nil attributes:nil];
    }
    
    [infoArray_ writeToFile: plistPath  atomically:YES];
}

//获取Plist文件内容
+(NSMutableDictionary *)readDictionaryPlistForKey:(NSSearchPathDirectory)searchPathDirectory_ withFile:(NSString*)filename_
{
    //获取Document或Library目录
    NSArray *paths = NSSearchPathForDirectoriesInDomains(searchPathDirectory_, NSUserDomainMask, YES);
    NSString *documentsDirectory = [NSString stringWithFormat:@"%@/",[paths objectAtIndex:0]];
    
    //获取文件路径
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",filename_]];
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]initWithContentsOfFile : plistPath];
    return dictionary;
    
}

//获取Plist文件(根目录为NSDictionary)的一级目录下某一个字段
+(NSString *)readPlistForKey:(NSSearchPathDirectory)searchPathDirectory_ withFile:(NSString*)filename_ wihtKey:(NSString*)key_
{

    NSMutableDictionary *info_ = [self readDictionaryPlistForKey:searchPathDirectory_ withFile:filename_];
    
    NSString *readInfo_ = [info_ objectForKey:key_];
    
    return readInfo_;
    
}

//获取Plist文件内容
+(NSMutableArray *)readArrayPlistForKey:(NSSearchPathDirectory)searchPathDirectory_ withFile:(NSString*)filename_
{
    //获取Document或Library目录
    NSArray *paths = NSSearchPathForDirectoriesInDomains(searchPathDirectory_, NSUserDomainMask, YES);
    NSString *documentsDirectory = [NSString stringWithFormat:@"%@/",[paths objectAtIndex:0]];
    
    //获取文件路径
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",filename_]];

    NSMutableArray *infoArray_ = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];

    return infoArray_;
}

+ (NSString *)documentFilePathWithFileName:(NSString*)fileName
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
														NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
	return filePath;
}
//
+ (NSString *)libraryFilePathWithFileName:(NSString*)fileName{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,
                                                         NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
	NSString *filePath = [libraryDirectory stringByAppendingPathComponent:fileName];
	return filePath;
}

//创建文件夹
+ (BOOL)createDirectoryIfNotExistsAtPath:(NSString *)path{
    BOOL result = NO;
    NSFileManager *fileManger = [NSFileManager defaultManager];
    BOOL exists = [fileManger fileExistsAtPath:path];
    if (!exists) {
        result = [fileManger createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }else {
        result = YES;
    }
    
    return result;
}

//将资源文件的数据库文件写入沙盒中
+ (void) copyDatabaseIfNeededWithFileName:(NSString*)fileName  SearchPathDirectory:(NSSearchPathDirectory)searchPathDirectory{
    //Using NSFileManager we can perform file system operations.
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    //find file path
    NSArray *paths = NSSearchPathForDirectoriesInDomains(searchPathDirectory , NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    NSString *dbPath = [documentsDir stringByAppendingPathComponent:fileName];
    BOOL success = [fileManager fileExistsAtPath:dbPath];
    
    if(!success) {
        NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
        success = [fileManager copyItemAtPath:defaultDBPath toPath:dbPath error:&error];
        
        if (!success)
            NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
    }
    
}

//将资源文件的数据库文件写入沙盒中
+ (void) copyDatabaseIfNeededWithFileName:(NSString*)fileName  withFileType:(NSString *)fileType SearchPathDirectory:(NSSearchPathDirectory)searchPathDirectory{
    //Using NSFileManager we can perform file system operations.
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    //find file path
    NSArray *paths = NSSearchPathForDirectoriesInDomains(searchPathDirectory , NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    NSString *dbPath = [documentsDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", fileName, fileType]];
    BOOL isExist_ = [fileManager fileExistsAtPath:dbPath];
    
    if(!isExist_)
    {
        NSString *defaultDBPath = [[NSBundle mainBundle] pathForResource:fileName ofType:fileType];
        BOOL isSuccess_ = [fileManager copyItemAtPath:defaultDBPath toPath:dbPath error:&error];
        
        if (!isSuccess_)
        {
            NSLog(@"create appSetting info failed");
            /*
             NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
             */
        }
        
    }
    
}

//
//
+ (NSString *)writeToFile:(NSData *)data withFileName:(NSString *)fileName{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath] == NO){
        NSLog(@"file not exist,create it...");
        [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
    }else {
        NSLog(@"file exist!!!");
    }
    
    [data writeToFile:filePath atomically:YES];

    return filePath;
    
}

+(BOOL)fileExistsAtPath:(NSString *) filePath_
{
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath_])
        return  YES;
    
    else
        return  NO;
}

+ (void)deteleFileWithFilePath:(NSString*)filePath_
{
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    if ([defaultManager fileExistsAtPath:filePath_])
    {
        [defaultManager removeItemAtPath:filePath_ error:nil];
    }
    
}






//获取已登录用户信息， 判断是否需要登录
+(NSDictionary *)userInfoFrowLocal
{
    NSMutableDictionary *infoDic_ = [PathUtilities readDictionaryPlistForKey:NSDocumentDirectory withFile:USER_LOGIN_INFO];
    
    NSDictionary *userInfoDic_ = [NSDictionary dictionaryWithDictionary:infoDic_];
    
    return userInfoDic_;
}

//登录用户信息本地保存，下次使用该软件不用再次登录
+(void)saveUserInfoToLocal:(NSDictionary *)userInfoDic_
{
    [PathUtilities updatePlist:NSDocumentDirectory withFile:USER_LOGIN_INFO withDictionary:userInfoDic_];
    
}

+(void)updateUserInfoToLocalKeyStr:(NSString*)keyStr valueStr:(NSString*)valueStr
{
    NSMutableDictionary *userDic = [JSessionInfo sharedInstance].userDic;
    [userDic setObject:valueStr forKey:keyStr];
    [PathUtilities saveUserInfoToLocal:userDic];
    [JSessionInfo sharedInstance].userDic = [NSMutableDictionary dictionaryWithDictionary:userDic];

}



 @end
