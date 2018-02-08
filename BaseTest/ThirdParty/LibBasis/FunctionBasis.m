

//
//  FunctionBasis.m
//  TianyiClient
//
//  Created by 蒋玉顺 on 2017/6/26.
//  Copyright © 2017年 cn.tianyilm. All rights reserved.
//

#import "FunctionBasis.h"



@implementation FunctionBasis


//NSDictionary或NSArray转换为NSData
+(NSData *)toJSONData:(id)theData
{
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theData options:NSJSONWritingPrettyPrinted error:&error];
    
    if ([jsonData length] > 0 && error == nil)
    {
        return jsonData;
    }
    else
    {
        return nil;
    }
    
}

//NSDictionary或NSArray转换为NSString
+(NSString *)toJSONString:(id)theData
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theData options:NSJSONWritingPrettyPrinted error:&error];
    
    if ([jsonData length] > 0 && error == nil)
    {
        NSString *jsonStr_ = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return jsonStr_;
    }
    else
    {
        return nil;
    }
}
+(NSString *)JSONString:(NSString*)aString
{
    NSMutableString *s = [NSMutableString stringWithString:aString];
    [s replaceOccurrencesOfString:@"\"" withString:@"\\\"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"/" withString:@"\\/" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\n" withString:@"\\n" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\b" withString:@"\\b" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\f" withString:@"\\f" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\r" withString:@"\\r" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\t" withString:@"\\t" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    return [NSString stringWithString:s];
}

//替换掉Json字符串中的换行符
+(NSString *)ReplacingNewLineAndWhitespaceCharactersFromJson:(NSString *)jsonStr_
{
    NSScanner *scanner = [[NSScanner alloc] initWithString:jsonStr_];
    [scanner setCharactersToBeSkipped:nil];
    NSMutableString *result = [[NSMutableString alloc] init];
    
    NSString *temp;
    NSCharacterSet*newLineAndWhitespaceCharacters = [ NSCharacterSet newlineCharacterSet];
    // 扫描
    while (![scanner isAtEnd])
    {
        temp = nil;
        [scanner scanUpToCharactersFromSet:newLineAndWhitespaceCharacters intoString:&temp];
        if (temp) [result appendString:temp];
        
        // 替换换行符
        if ([scanner scanCharactersFromSet:newLineAndWhitespaceCharacters intoString:NULL]) {
            if (result.length > 0 && ![scanner isAtEnd]) // Dont append space to beginning or end of result
                [result appendString:@"|"];
        }
    }
    return result;
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
    if ([[dic allKeys] count] == 0)
    {
        return YES;
    }
    
    return NO;
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

//随机数字类型字符串函数
+(NSString *)getRandomNumberString:(NSInteger)stringLength
{
    NSMutableString *randomString_ = [NSMutableString string];
    NSString *baseString_ = @"0123456789";
    for (int i=0; i<stringLength; i++)
    {
        NSInteger count_ = arc4random()%(baseString_.length);
        NSString *subStr_ = [baseString_ substringWithRange:NSMakeRange(count_, 1)];
        [randomString_ appendString:subStr_];
    }
    
    return randomString_;
}

//随机字符类型字符串函数
+(NSString *)getRandomCharacterString:(NSInteger)stringLength
{
    NSMutableString *randomString_ = [NSMutableString string];
    NSString *baseString_ = @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    for (int i=0; i<stringLength; i++)
    {
        NSInteger count_ = arc4random()%(baseString_.length);
        NSString *subStr_ = [baseString_ substringWithRange:NSMakeRange(count_, 1)];
        [randomString_ appendString:subStr_];
    }
    
    return randomString_;
}

//判断字符串是否是纯数字
+(BOOL)isPureNumber:(NSString *)string
{
    NSString *numberRegex = @"([0-9][0-9]*||[0-9][0-9]+)";
    NSPredicate *idCardNumberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    
    BOOL isPureNum_ = [idCardNumberTest evaluateWithObject:string];
    
    return isPureNum_;
    
}





+ (CGPoint)IndexPath:(NSIndexPath*)IndexPath tableView:(UITableView*)tableView totalHeight:(CGFloat)totalHeight

{
    UIWindow *window1= [UIApplication sharedApplication].keyWindow;
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:IndexPath];
    CGRect rect = [cell.superview convertRect:cell.frame toView:window1];
    
    
    UIWindow *window2 = [UIApplication sharedApplication].keyWindow;
    CGFloat delta = CGRectGetMaxY(rect) - (window2.bounds.size.height - totalHeight);
    CGPoint offset = tableView.contentOffset;
    offset.y += delta;
    if (offset.y < 0) {
        offset.y = 0;
    }
    return offset;
    
}



+ (CGSize)returnText:(NSString *)string font:(UIFont*)fsize weight:(CGFloat)weight
{
    
    NSString *value = string;
    NSString*Str=@"";
    
    if ((NSNull *)value == [NSNull null]) {
        Str=@"";
    }else
    {
        Str=string;
        
    }
    
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fsize.pointSize]};
    CGSize size = [Str boundingRectWithSize:CGSizeMake(weight, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    return size;
}

+ (CGSize)returnText:(NSString *)string fontSize:(int)fsize weight:(CGFloat)weight
{
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fsize]};
    CGSize size = [string boundingRectWithSize:CGSizeMake(weight, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    return size;
}


+ (BOOL)isCannontUseCamera {
    
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
        NSLog(@"相机权限受限");
        return YES;
    }
    return NO;
}


/*MD5加密*/
+(NSString *)md5HexDigest:(NSString *)str
{
    const char *original_str = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (int)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
    {
        [hash appendFormat:@"%02X", result[i]];
    }
    NSString * mdfiveString = [hash lowercaseString];
    
    
    return mdfiveString;
}


+ (NSData*) base64Decode:(NSString *)string
{
    unsigned long ixtext, lentext;
    unsigned char ch, inbuf[4], outbuf[4];
    short i, ixinbuf;
    Boolean flignore, flendtext = false;
    const unsigned char *tempcstring;
    NSMutableData *theData;
    
    if (string == nil) {
        return [NSData data];
    }
    
    ixtext = 0;
    
    tempcstring = (const unsigned char *)[string UTF8String];
    
    lentext = [string length];
    
    theData = [NSMutableData dataWithCapacity: lentext];
    
    ixinbuf = 0;
    
    while (true) {
        if (ixtext >= lentext){
            break;
        }
        
        ch = tempcstring [ixtext++];
        
        flignore = false;
        
        if ((ch >= 'A') && (ch <= 'Z')) {
            ch = ch - 'A';
        } else if ((ch >= 'a') && (ch <= 'z')) {
            ch = ch - 'a' + 26;
        } else if ((ch >= '0') && (ch <= '9')) {
            ch = ch - '0' + 52;
        } else if (ch == '+') {
            ch = 62;
        } else if (ch == '=') {
            flendtext = true;
        } else if (ch == '/') {
            ch = 63;
        } else {
            flignore = true;
        }
        
        if (!flignore) {
            short ctcharsinbuf = 3;
            Boolean flbreak = false;
            
            if (flendtext) {
                if (ixinbuf == 0) {
                    break;
                }
                
                if ((ixinbuf == 1) || (ixinbuf == 2)) {
                    ctcharsinbuf = 1;
                } else {
                    ctcharsinbuf = 2;
                }
                
                ixinbuf = 3;
                
                flbreak = true;
            }
            
            inbuf [ixinbuf++] = ch;
            
            if (ixinbuf == 4) {
                ixinbuf = 0;
                
                outbuf[0] = (inbuf[0] << 2) | ((inbuf[1] & 0x30) >> 4);
                outbuf[1] = ((inbuf[1] & 0x0F) << 4) | ((inbuf[2] & 0x3C) >> 2);
                outbuf[2] = ((inbuf[2] & 0x03) << 6) | (inbuf[3] & 0x3F);
                
                for (i = 0; i < ctcharsinbuf; i++) {
                    [theData appendBytes: &outbuf[i] length: 1];
                }
            }
            
            if (flbreak) {
                break;
            }
        }
    }
    
    return theData;
}
+ (NSString*) base64Encode:(NSData *)data
{
    static char base64EncodingTable[64] = {
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
        'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
        'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
        'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/'
    };
    int length = [data length];
    unsigned long ixtext, lentext;
    long ctremaining;
    unsigned char input[3], output[4];
    short i, charsonline = 0, ctcopy;
    const unsigned char *raw;
    NSMutableString *result;
    
    lentext = [data length];
    if (lentext < 1)
        return @"";
    result = [NSMutableString stringWithCapacity: lentext];
    raw = [data bytes];
    ixtext = 0;
    
    while (true) {
        ctremaining = lentext - ixtext;
        if (ctremaining <= 0)
            break;
        for (i = 0; i < 3; i++) {
            unsigned long ix = ixtext + i;
            if (ix < lentext)
                input[i] = raw[ix];
            else
                input[i] = 0;
        }
        output[0] = (input[0] & 0xFC) >> 2;
        output[1] = ((input[0] & 0x03) << 4) | ((input[1] & 0xF0) >> 4);
        output[2] = ((input[1] & 0x0F) << 2) | ((input[2] & 0xC0) >> 6);
        output[3] = input[2] & 0x3F;
        ctcopy = 4;
        switch (ctremaining) {
            case 1:
                ctcopy = 2;
                break;
            case 2:
                ctcopy = 3;
                break;
        }
        
        for (i = 0; i < ctcopy; i++)
            [result appendString: [NSString stringWithFormat: @"%c", base64EncodingTable[output[i]]]];
        
        for (i = ctcopy; i < 4; i++)
            [result appendString: @"="];
        
        ixtext += 3;
        charsonline += 4;
        
        if ((length > 0) && (charsonline >= length))
            charsonline = 0;
    }
    return result;
}




//获取wifi信号 method
+(NSString*) currentWifiSSID
{
    NSString *ssid = nil;
    NSArray *ifs = (__bridge  id)CNCopySupportedInterfaces();
    for (NSString *ifnam in ifs)
    {
        NSDictionary *info = (__bridge  id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        ssid = [info objectForKey:@"SSID"];
        if (ssid)
            break;
    }
    
    
    return ssid;
    
}

//获取设备的UUID
+(NSString *)gen_uuid
{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    
    CFRelease(uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString*)uuid_string_ref];
    
    CFRelease(uuid_string_ref);
    return uuid;
}

+(NSString*)currentTime
{
    NSDate *currentDate_ = [NSDate date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSString *dataStr_ = [dateFormatter stringFromDate:currentDate_];
    
    return dataStr_;
}

+(NSString *)convertStrToTime:(NSString *)timeStr
{
    long long time=[timeStr longLongValue];
    
    NSDate *d = [[NSDate alloc]initWithTimeIntervalSince1970:time];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString*timeString=[formatter stringFromDate:d];
    
    return timeString;
    
}



//当Label的行数为1时，根据字符串长度动态改变UILabel的宽度
+(void)changeLabelWidth:(UILabel *)label_ withString:(NSString *)str_
{
    CGRect labelRect_ = label_.frame;
    UIFont *font = label_.font;
    CGSize size = CGSizeMake(MAXFLOAT,labelRect_.size.height);
    CGRect rect = [str_ boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)  attributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName] context:nil];
    
    labelRect_.size.width = rect.size.width;
    label_.frame = labelRect_;
}

//当Label的宽度一定时，根据字符串长度动态改变UILabel的高度
+(void)changeLabelHeight:(UILabel *)label_ withString:(NSString *)str_
{
    label_.numberOfLines = 0;
    CGRect labelRect_ = label_.frame;
    UIFont *font = label_.font;
    NSDictionary *attributesDic_ = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    CGSize size = CGSizeMake(labelRect_.size.width, MAXFLOAT);
    CGRect rect = [str_ boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)  attributes:attributesDic_ context:nil];
    
    labelRect_.size.height = rect.size.height;
    label_.frame = labelRect_;
}

//当Label的行数为1时，根据字符串长度动态改变UILabel的宽度
+(CGFloat)widthLabel:(UILabel *)label_ withString:(NSString *)str_
{
    
    CGRect labelRect_ = label_.frame;
    UIFont *font = label_.font;
    CGSize size = CGSizeMake(MAXFLOAT,labelRect_.size.height);
    CGRect rect = [str_ boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)  attributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName] context:nil];
    
    return rect.size.width;
}

//当Label的宽度一定时，根据字符串长度动态改变UILabel的高度
+(CGFloat)heightLabel:(UILabel *)label_ withString:(NSString *)str_
{
    CGRect labelRect_ = label_.frame;
    UIFont *font = label_.font;
    CGSize size = CGSizeMake(labelRect_.size.width,MAXFLOAT);
    CGRect rect = [str_ boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)  attributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName] context:nil];
    
    return rect.size.height;
}






@end
