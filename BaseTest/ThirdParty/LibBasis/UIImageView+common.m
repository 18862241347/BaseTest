//
//  UIImageView+common.m
//  绿色家园
//
//  Created by yons on 15/12/30.
//  Copyright (c) 2015年 蒋玉顺. All rights reserved.
//

#import "UIImageView+common.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (common)

- (void)imageURL:(NSString *)imageName {
    [self setImage:[UIImage imageNamed:imageName]];
}
- (void)setImageUrl:(NSString *)imageURL {
    [self sd_setImageWithURL:[NSURL URLWithString:imageURL] ];

}
- (void)setImageUrl:(NSString *)imageURL placeholderImage:(NSString *)placeholder {

    [self setImageUrl:imageURL placeholderImage:placeholder options:0];

}
- (void)setImageUrl:(NSString *)imageURL placeholderImage:(NSString *)placeholder options:(SDWebImageOptions)options {

    NSString *imageStr = imageURL;
    if (![imageURL isKindOfClass:[NSString class]]) {
        imageStr = @"";
    }

    [self sd_setImageWithURL:[NSURL URLWithString:imageStr] placeholderImage:[UIImage imageNamed:placeholder] options:options];

}




+ (void)removeImageForKey:(NSString *)key
{
//    [[SDImageCache sharedImageCache]removeImageForKey:key];

}

+(UIImageView *)initWithBgColor:(UIColor *)bgColor
{
    UIImageView *img = [[UIImageView alloc]init];
      img.backgroundColor = bgColor;
    return img;
}


+(UIImageView *)initWithBgColor:(UIColor *)bgColor imageStr:(NSString *)imageStr
{
    UIImageView *img = [UIImageView initWithBgColor:bgColor];
    img.image = [UIImage imageNamed:imageStr];
    return img;
}

+(UIImageView *)initWithImageStr:(NSString *)imageStr
{
    UIImageView *img = [[UIImageView alloc]init];
    img.image = [UIImage imageNamed:imageStr];
    return img;
}

+(UIImageView *)initWithImageStr:(NSString *)imageStr contentMode:(UIViewContentMode)contentMode
{
    UIImageView *img = [UIImageView initWithImageStr:imageStr];
    img.contentMode = contentMode;
    return img;
}
@end
