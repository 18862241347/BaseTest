//
//  GlobalUtils.h
//  TianyiClient
//
//  Created by 蒋玉顺 on 2017/4/31.
//  Copyright © 2017年 cn.tianyilm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface GlobalUtils : NSObject


//请求加载提示
+(void)showLogo_HUDEnabled:(BOOL)isEnabled;

//请求加载提示
+(void)show_HUDEnabled:(BOOL)isEnabled;






#pragma mark ************* showSuccess ***********
// 提示成功
+ (void)showSuccessMessageInWindow:(NSString *)message;
+ (void)showSuccessMessageInWindow:(NSString *)message CompleteWith:(void (^)(void))completeBlock;
+ (void)showSuccessMessageInWindow:(NSString *)message timer:(CGFloat)timer CompleteWith:(void (^)(void))completeBlock;

+ (void)showSuccessMessageInView:(NSString *)message;
+ (void)showSuccessMessageInView:(NSString *)message CompleteWith:(void (^)(void))completeBlock;
+ (void)showSuccessMessageInView:(NSString *)message timer:(CGFloat)timer CompleteWith:(void (^)(void))completeBlock;


+ (void)showSuccessMessageInView:(UIView *)view message:(NSString *)message;
+ (void)showSuccessMessageInView:(UIView *)view message:(NSString *)message CompleteWith:(void (^)(void))completeBlock;
+ (void)showSuccessMessageInView:(UIView *)view message:(NSString *)message timer:(CGFloat)timer CompleteWith:(void (^)(void))completeBlock;


// 提示多行文字
+ (void)showSuccessMessageInWindowMessage:(NSString *)message multiLine:(BOOL)multiLine CompleteWith:(void (^)(void))completeBlock;
+ (void)showSuccessMessageInView:(UIView *)view message:(NSString *)message multiLine:(BOOL)multiLine CompleteWith:(void (^)(void))completeBlock;


+ (void)showCustomIcon:(NSString *)iconName message:(NSString *)message isWindow:(BOOL)isWindow;



#pragma mark ************* showFail ***********
// 提示失败
+ (void)showFailMessageInWindow:(NSString *)message;
+ (void)showFailMessageInWindow:(NSString *)message CompleteWith:(void (^)(void))completeBlock;
+ (void)showFailMessageInWindow:(NSString *)message timer:(CGFloat)timer CompleteWith:(void (^)(void))completeBlock;

+ (void)showFailMessageInView:(NSString *)message;
+ (void)showFailMessageInView:(NSString *)message CompleteWith:(void (^)(void))completeBlock;
+ (void)showFailMessageInView:(NSString *)message timer:(CGFloat)timer CompleteWith:(void (^)(void))completeBlock;


+ (void)showFailMessageInView:(UIView *)view message:(NSString *)message;
+ (void)showFailMessageInView:(UIView *)view message:(NSString *)message CompleteWith:(void (^)(void))completeBlock;
+ (void)showFailMessageInView:(UIView *)view message:(NSString *)message timer:(CGFloat)timer CompleteWith:(void (^)(void))completeBlock;




#pragma mark ************* showError ***********
// 提示错误
+ (void)showErrorMessageInWindow:(NSString *)message;
+ (void)showErrorMessageInWindow:(NSString *)message CompleteWith:(void (^)(void))completeBlock;
+ (void)showErrorMessageInWindow:(NSString *)message timer:(CGFloat)timer CompleteWith:(void (^)(void))completeBlock;

+ (void)showErrorMessageInView:(NSString *)message;
+ (void)showErrorMessageInView:(NSString *)message CompleteWith:(void (^)(void))completeBlock;
+ (void)showErrorMessageInView:(NSString *)message timer:(CGFloat)timer CompleteWith:(void (^)(void))completeBlock;


+ (void)showErrorMessageInView:(UIView *)view message:(NSString *)message;
+ (void)showErrorMessageInView:(UIView *)view message:(NSString *)message CompleteWith:(void (^)(void))completeBlock;
+ (void)showErrorMessageInView:(UIView *)view message:(NSString *)message timer:(CGFloat)timer CompleteWith:(void (^)(void))completeBlock;




#pragma mark ************* showActivity ***********
+ (void)showActivityMessageInWindow:(NSString *)message;
+ (void)showActivityMessageInView:(NSString *)message;
+ (void)showActivityMessageInView:(UIView *)view message:(NSString *)message;

+ (void)showActivityMessageInWindow:(NSString *)message timer:(CGFloat)timer;
+ (void)showActivityMessageInView:(NSString *)message timer:(CGFloat)timer;
+ (void)showActivityMessageInView:(UIView *)view message:(NSString *)message timer:(CGFloat)timer;

+ (void)showActivityMessage:(NSString*)message isWindow:(BOOL)isWindow timer:(CGFloat)timer;







+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

//请求数据成功直接隐藏
+ (void)dismiss_HUD;


// 获取当前屏幕显示的VC
+(UIViewController *)getCurrentWindowVC;
+(UIViewController *)getCurrentUIVC;


@end
