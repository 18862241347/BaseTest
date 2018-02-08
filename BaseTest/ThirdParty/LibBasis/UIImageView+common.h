//
//  UIImageView+common.h
//  绿色家园
//
//  Created by yons on 15/12/30.
//  Copyright (c) 2015年 蒋玉顺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDWebImageManager.h"

@interface UIImageView (common )


- (void)setImageUrl:(NSString *)imageURL;

- (void)setImageUrl:(NSString *)imageURL placeholderImage:(NSString *)placeholder;

- (void)setImageUrl:(NSString *)imageURL placeholderImage:(NSString *)placeholder options:(SDWebImageOptions)options;



+ (void)removeImageForKey:(NSString *)key;





+(UIImageView*)initWithBgColor:(UIColor*)bgColor;

+(UIImageView*)initWithBgColor:(UIColor*)bgColor  imageStr:(NSString *)imageStr;

+(UIImageView*)initWithImageStr:(NSString *)imageStr;

+(UIImageView*)initWithImageStr:(NSString *)imageStr contentMode:(UIViewContentMode)contentMode;

@end
