
//
//  UIViewControlle+KNSemiModal.h
//  TianyiClient
//
//  Created by 蒋玉顺 on 2017/6/10.
//  Copyright © 2017年 cn.tianyilm. All rights reserved.
//

#define kSemiModalDidShowNotification @"kSemiModalDidShowNotification"
#define kSemiModalDidHideNotification @"kSemiModalDidHideNotification"
#define kSemiModalWasResizedNotification @"kSemiModalWasResizedNotification"

#import <UIKit/UIKit.h>
extern const struct KNSemiModalOptionKeys {
	__unsafe_unretained NSString *traverseParentHierarchy; // boxed BOOL. default is YES.
	__unsafe_unretained NSString *pushParentBack;		   // boxed BOOL. default is YES.
	__unsafe_unretained NSString *animationDuration; // boxed double, in seconds. default is 0.5.
	__unsafe_unretained NSString *parentAlpha;       // boxed float. lower is darker. default is 0.5.
    __unsafe_unretained NSString *parentScale;       // boxed double default is 0.8
	__unsafe_unretained NSString *shadowOpacity;     // default is 0.8
	__unsafe_unretained NSString *transitionStyle;	 // boxed NSNumber - one of the KNSemiModalTransitionStyle values.
    __unsafe_unretained NSString *disableCancel;     // boxed BOOL. default is NO.
    __unsafe_unretained NSString *backgroundView;     // UIView, custom background.
} KNSemiModalOptionKeys;

typedef NS_ENUM(NSUInteger, KNSemiModalTransitionStyle) {
    KNSemiModalTransitionStyleSlideUp,
    KNSemiModalTransitionStyleFadeInOut,
    KNSemiModalTransitionStyleFadeIn,
    KNSemiModalTransitionStyleFadeOut,
};

typedef void (^KNTransitionCompletionBlock)(void);

@interface UIViewController (KNSemiModal)

-(void)presentSemiViewController:(UIViewController*)vc withOptions:(NSDictionary*)options;

-(void)dismissSemiModalView;

@end



@interface NSObject (YMOptionsAndDefaults)
- (void)ym_registerOptions:(NSDictionary *)options
                  defaults:(NSDictionary *)defaults;
- (id)ym_optionOrDefaultForKey:(NSString*)optionKey;
@end


