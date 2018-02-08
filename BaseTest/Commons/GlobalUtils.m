//
//  GlobalUtils.m
//  TianyiClient
//
//  Created by 蒋玉顺 on 2017/4/31.
//  Copyright © 2017年 cn.tianyilm. All rights reserved.
//

#import "GlobalUtils.h"

#define DELAYSeconds 1.5
#define Success_icon @"success"
#define Fail_icon @"error"
#define Error_icon @"error"


@implementation GlobalUtils

+(void)showLogo_HUDEnabled:(BOOL)isEnabled;
{


    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    //    bgView.backgroundColor  = [UIColor whiteColor];

    NSArray *imgArr  = @[@"loading_1",@"loading_2",@"loading_3",@"loading_4",@"loading_5",@"loading_6",@"loading_7",@"loading_8"];

    NSMutableArray *imageArr = [NSMutableArray array];
    for (NSInteger i = 0; i< imgArr.count; i++) {
        NSString *imgs = [imgArr objectAtIndex:i];
        UIImage *img = [UIImage imageNamed:imgs];
        [imageArr addObject:img];

    }



    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    imageView.animationImages = [NSArray arrayWithArray:imageArr];

    // 设置UIImageView的动画时间（动画用时）
    imageView.animationDuration = 1.0;

    // 永远重复（如果是1，就是1次，以此类推。。）
    imageView.animationRepeatCount = 0;

    // 开始动画
    [imageView startAnimating];
    // 添加到self.View上面

    [bgView addSubview:imageView];





    MBProgressHUD * hud = [[MBProgressHUD alloc] initWithView:[UIApplication sharedApplication].keyWindow];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = bgView;
    hud.customView.size = CGSizeMake(80, 80);
    hud.animationType = MBProgressHUDAnimationFade;


    hud.userInteractionEnabled = isEnabled;
    hud.tag = 100;

}
+(void)show_HUDEnabled:(BOOL)isEnabled
{
    MBProgressHUD *hud = [[MBProgressHUD alloc]init];
    hud.userInteractionEnabled = isEnabled;
    hud.tag = 100;
    [[[UIApplication sharedApplication].windows lastObject] addSubview:hud];
    [hud show:YES];

}







#pragma mark ************* showSuccess ***********
+ (void)showSuccessMessageInWindow:(NSString *)message
{
    [self showCustomIcon:Success_icon message:message isWindow:true];

}
+ (void)showSuccessMessageInWindow:(NSString *)message CompleteWith:(void (^)(void))completeBlock
{

    [self showCustomIcon:Success_icon message:message isWindow:true];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DELAYSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        completeBlock();

    });


}
+ (void)showSuccessMessageInWindow:(NSString *)message timer:(CGFloat)timer CompleteWith:(void (^)(void))completeBlock
{

    [self showCustomIcon:Success_icon message:message isWindow:true];

    double delayInSeconds = timer;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){

        completeBlock();


    });

}

+ (void)showSuccessMessageInView:(NSString *)message
{
    [self showCustomIcon:Success_icon message:message isWindow:false];

}
+ (void)showSuccessMessageInView:(NSString *)message CompleteWith:(void (^)(void))completeBlock
{
    [self showSuccessMessageInView:message timer:DELAYSeconds CompleteWith:^{
        completeBlock();
    }];

}
+ (void)showSuccessMessageInView:(NSString *)message timer:(CGFloat)timer CompleteWith:(void (^)(void))completeBlock
{

    [self showCustomIcon:Success_icon message:message isWindow:false];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timer * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        completeBlock();

    });


}


+ (void)showSuccessMessageInView:(UIView *)view message:(NSString *)message
{

    [self showCustomIcon:Success_icon message:message isWindow:false];

}
+ (void)showSuccessMessageInView:(UIView *)view message:(NSString *)message CompleteWith:(void (^)(void))completeBlock
{
    [self showCustomIcon:Success_icon message:message isWindow:false];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DELAYSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        completeBlock();

    });

}
+ (void)showSuccessMessageInView:(UIView *)view message:(NSString *)message timer:(CGFloat)timer CompleteWith:(void (^)(void))completeBlock
{

    [self showCustomIcon:Success_icon message:message isWindow:false];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timer * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        completeBlock();

    });

}

+ (void)showSuccessMessageInWindowMessage:(NSString *)message multiLine:(BOOL)multiLine CompleteWith:(void (^)(void))completeBlock
{

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.removeFromSuperViewOnHide = YES;
    hud.margin = 10.f;
    hud.yOffset = 15.f;
    if (multiLine == YES) {
        hud.detailsLabelText = message;
    }else
    {
        hud.labelText = message;

    }
    hud.labelFont = [UIFont systemFontOfSize:13];
    [hud hide:YES afterDelay:DELAYSeconds];

}

+ (void)showSuccessMessageInView:(UIView *)view message:(NSString *)message multiLine:(BOOL)multiLine CompleteWith:(void (^)(void))completeBlock
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.removeFromSuperViewOnHide = YES;
    hud.margin = 10.f;
    hud.yOffset = 15.f;
    if (multiLine == YES) {
        hud.detailsLabelText = message;
    }else
    {
        hud.labelText = message;

    }
    hud.labelFont = [UIFont systemFontOfSize:13];
    [hud hide:YES afterDelay:DELAYSeconds];


}

+ (void)showCustomIcon:(NSString *)iconName message:(NSString *)message isWindow:(BOOL)isWindow
{
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];

    UIImageView *customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", iconName]]];
    hud.customView = customView;
    hud.mode = MBProgressHUDModeCustomView;
    [hud hide:YES afterDelay:DELAYSeconds];
}





#pragma mark ************* showFail ***********
+ (void)showFailMessageInWindow:(NSString *)message
{
    [self showCustomIcon:Fail_icon message:message isWindow:true];

}
+ (void)showFailMessageInWindow:(NSString *)message CompleteWith:(void (^)(void))completeBlock
{
    [self showCustomIcon:Fail_icon message:message isWindow:true];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DELAYSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        completeBlock();

    });
}
+ (void)showFailMessageInWindow:(NSString *)message timer:(CGFloat)timer CompleteWith:(void (^)(void))completeBlock
{
    [self showCustomIcon:Fail_icon message:message isWindow:true];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timer * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        completeBlock();

    });
}

+ (void)showFailMessageInView:(NSString *)message
{
    [self showCustomIcon:Fail_icon message:message isWindow:false];


}
+ (void)showFailMessageInView:(NSString *)message CompleteWith:(void (^)(void))completeBlock
{
    [self showCustomIcon:Fail_icon message:message isWindow:false];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DELAYSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        completeBlock();

    });

}
+ (void)showFailMessageInView:(NSString *)message timer:(CGFloat)timer CompleteWith:(void (^)(void))completeBlock
{
    [self showCustomIcon:Fail_icon message:message isWindow:false];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timer * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        completeBlock();

    });
}


+ (void)showFailMessageInView:(UIView *)view message:(NSString *)message
{
    [self showCustomIcon:Fail_icon message:message isWindow:false];

}
+ (void)showFailMessageInView:(UIView *)view message:(NSString *)message CompleteWith:(void (^)(void))completeBlock
{
    [self showCustomIcon:Fail_icon message:message isWindow:false];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DELAYSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        completeBlock();

    });
}
+ (void)showFailMessageInView:(UIView *)view message:(NSString *)message timer:(CGFloat)timer CompleteWith:(void (^)(void))completeBlock
{
    [self showCustomIcon:Fail_icon message:message isWindow:false];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timer * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        completeBlock();

    });
}




#pragma mark ************* showError ***********
+ (void)showErrorMessageInWindow:(NSString *)message
{
    [self showCustomIcon:Error_icon message:message isWindow:true];

}
+ (void)showErrorMessageInWindow:(NSString *)message CompleteWith:(void (^)(void))completeBlock
{
    [self showCustomIcon:Error_icon message:message isWindow:true];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DELAYSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        completeBlock();

    });
}
+ (void)showErrorMessageInWindow:(NSString *)message timer:(CGFloat)timer CompleteWith:(void (^)(void))completeBlock
{
    [self showCustomIcon:Error_icon message:message isWindow:true];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timer * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        completeBlock();

    });
}

+ (void)showErrorMessageInView:(NSString *)message
{
    [self showCustomIcon:Error_icon message:message isWindow:false];

}
+ (void)showErrorMessageInView:(NSString *)message CompleteWith:(void (^)(void))completeBlock
{
    [self showCustomIcon:Error_icon message:message isWindow:false];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DELAYSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        completeBlock();

    });
}
+ (void)showErrorMessageInView:(NSString *)message timer:(CGFloat)timer CompleteWith:(void (^)(void))completeBlock
{
    [self showCustomIcon:Error_icon message:message isWindow:false];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timer * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        completeBlock();

    });
}


+ (void)showErrorMessageInView:(UIView *)view message:(NSString *)message
{
    [self showCustomIcon:Error_icon message:message isWindow:false];

}
+ (void)showErrorMessageInView:(UIView *)view message:(NSString *)message CompleteWith:(void (^)(void))completeBlock
{
    [self showCustomIcon:Error_icon message:message isWindow:false];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DELAYSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        completeBlock();

    });
}
+ (void)showErrorMessageInView:(UIView *)view message:(NSString *)message timer:(CGFloat)timer CompleteWith:(void (^)(void))completeBlock
{
    [self showCustomIcon:Error_icon message:message isWindow:false];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timer * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        completeBlock();

    });
}





#pragma mark ************* showActivity ***********
+ (void)showActivityMessageInWindow:(NSString *)message
{
    [self showActivityMessage:message isWindow:true timer:0];

}
+ (void)showActivityMessageInView:(NSString *)message
{
    [self showActivityMessage:message isWindow:false timer:0];

}
+ (void)showActivityMessageInView:(UIView *)view message:(NSString *)message
{
    [self showActivityMessage:message isWindow:false timer:0];

}

+ (void)showActivityMessageInWindow:(NSString *)message timer:(CGFloat)timer
{
    [self showActivityMessage:message isWindow:true timer:timer];

}
+ (void)showActivityMessageInView:(NSString *)message timer:(CGFloat)timer
{
    [self showActivityMessage:message isWindow:false timer:timer];

}
+ (void)showActivityMessageInView:(UIView *)view message:(NSString *)message timer:(CGFloat)timer
{
    [self showActivityMessage:message isWindow:true timer:timer];

}


+ (void)showActivityMessage:(NSString*)message isWindow:(BOOL)isWindow timer:(CGFloat)timer
{
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.labelText = @"";
    hud.mode = MBProgressHUDModeIndeterminate;
    if (timer>0) {
        [hud hide:YES afterDelay:timer];
    }
}


+ (MBProgressHUD*)createMBProgressHUDviewWithMessage:(NSString*)message isWindiw:(BOOL)isWindow
{
    UIView  *view = isWindow? (UIView*)[UIApplication sharedApplication].delegate.window:[GlobalUtils getCurrentUIVC].view;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText=message?message:@"加载中.....";
    hud.labelFont=[UIFont systemFontOfSize:15];
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}








+ (void)hideHUDForView:(UIView *)view
{
    [MBProgressHUD hideHUDForView:view animated:YES];

}

+ (void)hideHUD
{

    UIView  *view = (UIView*)[UIApplication sharedApplication].delegate.window;
    [MBProgressHUD hideHUDForView:view animated:YES];
    [MBProgressHUD hideHUDForView:[GlobalUtils getCurrentUIVC].view animated:YES];


}


//请求数据成功直接隐藏
+ (void)dismiss_HUD
{

    [self hideHUD];

}

//获取当前屏幕显示的viewcontroller
+(UIViewController *)getCurrentWindowVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tempWindow in windows)
        {
            if (tempWindow.windowLevel == UIWindowLevelNormal)
            {
                window = tempWindow;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
    {
        result = nextResponder;
    }
    else
    {
        result = window.rootViewController;
    }
    return  result;
}
+(UIViewController *)getCurrentUIVC
{
    UIViewController  *superVC = [GlobalUtils  getCurrentWindowVC];
    if ([superVC isKindOfClass:[UITabBarController class]]) {

        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;

        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {

            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }
    return superVC;
}


@end

