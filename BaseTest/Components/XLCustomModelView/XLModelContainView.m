//
//  XLModelContainView.m
//  Michelin
//
//  Created by 蒋玉顺 on 15/9/17.
//  Copyright (c) 2015年 Michelin. All rights reserved.
//

#import "XLModelContainView.h"

@interface XLModelContainView()



@end

@implementation XLModelContainView
-(void)setContextView:(UIView *)contextView
{
    _contextView = contextView;
    
}
-(instancetype)initWithFullView:(UIView*)fullView;
{
    if (self = [super init]) {
        
        _contextView = fullView;
        [self initTheSubViews];
        
        
    }return self;
}

-(void)initTheSubViews
{
    UIWindow *mainWindow = [[UIApplication sharedApplication].delegate window];
    
    //半透明背景
    CGRect fullScreenRect = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    if (self.fullView)
    {
        if ([self.fullView superview])
        {
            [self.fullView removeFromSuperview];
        }
        
        self.fullView = nil;
    }
    self.fullView = [[UIView alloc] initWithFrame:fullScreenRect];
    self.fullView.alpha = 0.0;
    self.fullView.backgroundColor = kAppBlackColor;
    [mainWindow addSubview:self.fullView];
    

    
    self.frame = fullScreenRect;
    self.backgroundColor = [UIColor clearColor];
    [mainWindow addSubview:self];
    
    if (self.contextView)
    {
        CGRect contextRect_ = self.contextView.frame;
        
        contextRect_.origin.x = (fullScreenRect.size.width-contextRect_.size.width)/2;
        contextRect_.origin.y = (fullScreenRect.size.height-contextRect_.size.height)/2;
        self.contextView.frame = contextRect_;
        self.contextView.alpha = 0.0f;
        
        [self addSubview:self.contextView];
        
        
        
    }
    
    [UIView animateWithDuration:0.1 animations:^{
        
        self.fullView.alpha = 0.5;
        
        self.contextView.alpha = 1.0;
        
        
    } completion:^(BOOL finished) {
        
    }];
    
    
}
#pragma mark-
#pragma mark---公有方法

//显示模态视图
- (void)showCustomModel
{
    UIWindow *mainWindow = [[UIApplication sharedApplication].delegate window];
    
    //半透明背景
    CGRect fullScreenRect = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    if (self.fullView)
    {
        if ([self.fullView superview])
        {
            [self.fullView removeFromSuperview];
        }
        
        self.fullView = nil;
    }
    self.fullView = [[UIView alloc] initWithFrame:fullScreenRect];
    self.fullView.alpha = 0.0;
    self.fullView.backgroundColor = [UIColor blackColor];
    [mainWindow addSubview:self.fullView];
    
    //点击手势
    /*
    UITapGestureRecognizer *tapGesture_ = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelTapMethod:)];
    [self addGestureRecognizer:tapGesture_];
    */
    
    self.frame = fullScreenRect;
    self.backgroundColor = [UIColor clearColor];
    [mainWindow addSubview:self];
    
    if (self.contextView)
    {
        CGRect contextRect_ = self.contextView.frame;
        
        contextRect_.origin.x = (fullScreenRect.size.width-contextRect_.size.width)/2;
        contextRect_.origin.y = (fullScreenRect.size.height-contextRect_.size.height)/2;
        self.contextView.frame = contextRect_;
        self.contextView.alpha = 0.0f;
        
        [self addSubview:self.contextView];
        
       
        
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.fullView.alpha = 0.5;
        
        self.contextView.alpha = 1.0;
        
        
    } completion:^(BOOL finished) {
        
    }];
    
}

-(void)setIsDismiss:(BOOL)isDismiss
{
    _isDismiss = isDismiss;
}
//隐藏模态视图
- (void)dismissCustomModelWithAnimation:(BOOL)animation
{
    [self dismissFromSupViewWithAnimation:animation];
}

#pragma mark-
#pragma mark---私有方法

- (void)cancelTapMethod:(UITapGestureRecognizer *)tapGesture
{
    [self dismissFromSupViewWithAnimation:YES];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(modelViewDidTouch:)])
    {
        [self.delegate modelViewDidTouch:self];
    }
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [super touchesBegan:touches withEvent:event];
    
    UITouch *currentTouch_ = [touches anyObject];
    CGPoint touchPoint_ = [currentTouch_ locationInView:self];
    CGRect contextRect_ = self.contextView.frame;
    if (CGRectContainsPoint(contextRect_, touchPoint_))
    {
        if (_isDismiss == YES) {
            [self dismissFromSupViewWithAnimation:YES];
        }
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(modelViewDidTouch:)])
        {
            [self.delegate modelViewDidTouch:self];
        }
    }else
    {

        if (self.delegate && [self.delegate respondsToSelector:@selector(modelViewCacelTouch:)])
        {
            [self.delegate modelViewCacelTouch:self];
        }
    }
    
}

//移除模态视图
- (void)dismissFromSupViewWithAnimation:(BOOL)animation
{
    if (animation)
    {
        [UIView animateWithDuration:0.5 animations:^{
            
            self.contextView.alpha = 0.0f;
            
            self.fullView.alpha = 0.0;
            
        } completion:^(BOOL finished) {
            
            if (self.fullView)
            {
                if (self.fullView.superview)
                {
                    [self.fullView removeFromSuperview];
                }
            }
            
            if (self.superview)
            {
                [self removeFromSuperview];
            }
            
        }];
    }
    else
    {
        if (self.fullView)
        {
            if (self.fullView.superview)
            {
                [self.fullView removeFromSuperview];
            }
            
            self.fullView = nil;
        }
        
        if (self.superview)
        {
            [self removeFromSuperview];
        }
    }
}



@end
