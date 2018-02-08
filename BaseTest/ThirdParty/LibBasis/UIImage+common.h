//
//  UIImage+common.h
//  绿色家园
//
//  Created by yons on 15/12/30.
//  Copyright (c) 2015年 蒋玉顺. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/// 返回一张可以随意拉伸不变形的图片
+ (UIImage *)resizableImage:(NSString *)name;

/// 剪切一张正方形图片
+ (UIImage*)clipSquareImage:(UIImage*)image;

/// 将图片截成圆形图片
+ (UIImage *)clipCircularImage:(UIImage *)image;


/// 对图片尺寸进行压缩
+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;


/// 按照比例生成缩略图
+ (UIImage *)generatePhotoThumbnail:(UIImage *)image widthScale:(CGFloat)scale_w heightScale:(CGFloat)scale_h;


///  改变图片的着色
-(UIImage*)imageWithColor:(UIColor*)color;
-(UIImage*)imageWithColor:(UIColor*)color level:(CGFloat)level;
-(UIImage*)imageWithColor:(UIColor*)color rect:(CGRect)rect;
-(UIImage*)imageWithColor:(UIColor*)color rect:(CGRect)rect level:(CGFloat)level;


+(UIImage*)imageWithColor:(UIColor*)color;


/**
 *  根据图片url获取网络图片尺寸
 */
+ (CGSize)getImageSizeWithURL:(id)URL;
@end
