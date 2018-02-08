//
//  XLHidenKeyboardView.m
//  Michelin
//
//  Created by 蒋玉顺 on 15/9/14.
//  Copyright (c) 2015年 Michelin. All rights reserved.
//

#define line_color [UIColor colorWithRed:178/255.0 green:178/255.0 blue:178/255.0 alpha:1]

#define background_color [UIColor colorWithRed:236/255.0 green:237/255.0 blue:239/255.0 alpha:1]

#define button_gray_color [UIColor colorWithRed:131/255.0 green:133/255.0 blue:136/255.0 alpha:1]

#define button_red_color [UIColor colorWithRed:234/255.0 green:56/255.0 blue:64/255.0 alpha:1]

#import "XLHidenKeyboardView.h"

@implementation XLHidenKeyboardView
@synthesize delegate;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = line_color;
        
        [self initTheSubViews];
        
    }
    
    return self;
    
}

#pragma mark-
#pragma mark---init

- (void)initTheSubViews
{
    CGRect frame_ = self.frame;
    UIView *backView_ = [[UIView alloc] initWithFrame:CGRectMake(0, 1, frame_.size.width, frame_.size.height-2)];
    backView_.backgroundColor = background_color;
    [self addSubview:backView_];
    
    [self createButtons];
    
}

- (void)createButtons
{
    CGRect viewRect_ = self.frame;
    
    
    
    //取消按钮
    UIButton *submitBtn_ = [UIButton buttonWithType:UIButtonTypeCustom];
    submitBtn_.frame = CGRectMake(viewRect_.size.width-15-45, 5, 45, 30);
    [submitBtn_ setTitle:@"完成" forState:UIControlStateNormal];
    [submitBtn_ setTitleColor:button_red_color forState:UIControlStateNormal];
    [submitBtn_ addTarget:self action:@selector(submitButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:submitBtn_];
    
    
}
-(void)setIsCancelBtn:(BOOL)isCancelBtn
{
    _isCancelBtn=isCancelBtn;
    
    //取消按钮
    UIButton *cancelBtn_ = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn_.frame = CGRectMake(15, 5, 45, 30);
    [cancelBtn_ setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn_ setTitleColor:button_gray_color forState:UIControlStateNormal];
    [cancelBtn_ addTarget:self action:@selector(cancelButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    if (_isCancelBtn==YES) {
        [self addSubview:cancelBtn_];
        
    }else{
        
    }
}

//取消
- (void)cancelButtonPressed:(id)sender
{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(cancelInputToHidenKeyboard:)])
    {
        [self.delegate cancelInputToHidenKeyboard:self];
    }
    
}

//完成
- (void)submitButtonPressed:(id)sender
{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(didFinishedInputToHidenKeyboard:)])
    {
        [self.delegate didFinishedInputToHidenKeyboard:self];
    }
    
}


@end


