//
//  XLBannerView.m
//  LoveBaby
//
//  Created by 谢传波 on 15/8/17.
//  Copyright (c) 2015年 YeGuo. All rights reserved.
//

#define banner_button_base_tag 1000

#define span_width 6
#define timerTime 4.0

#import "XLBannerView.h"

@interface XLBannerView()
{
    //标记当前活动页
    NSInteger currentPage;
    
    //活动总页数
    NSInteger pageCount;
}
@property(nonatomic, retain) UIScrollView *activityScrollView;
@property(nonatomic, retain) NSArray *activityInfoData;
@property(nonatomic, retain) UIPageControl *imagePageControl;
//轮播活动图片
@property(nonatomic, retain) NSTimer *playImageTimer;

@end

@implementation XLBannerView
@synthesize delegate;
@synthesize activityScrollView;
@synthesize activityInfoData;
@synthesize imagePageControl, playImageTimer;

- (id)initWithFrame:(CGRect)frame withInfo:(NSArray *)infoData_
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.activityInfoData = [NSArray arrayWithArray:infoData_];
        
        CGRect scrollRect_ = CGRectMake(0, 0, frame.size.width, frame.size.height);
        UIScrollView *actScrollView_ = [[UIScrollView alloc] initWithFrame:scrollRect_];
        self.activityScrollView = actScrollView_;
        self.activityScrollView.delegate = self;
        [self addSubview:self.activityScrollView];
        
        pageCount = [self.activityInfoData count];
        if (pageCount == 1)
        {
            [self createOneBannerView];
        }
        else if (pageCount >= 2)
        {
            [self createMultipleBannerViews];
        }
        
    }
    
    return self;
    
}

//只有一组内容
- (void)createOneBannerView
{
    CGRect viewRect_ = self.frame;
    
    NSString *bannerImageUrl_ = [self.activityInfoData objectAtIndex:0];
    CGRect imageRect_ = CGRectMake(0, 0, viewRect_.size.width, viewRect_.size.height);
    UIImageView *imageView_ = [[UIImageView alloc] initWithFrame:imageRect_];
    [imageView_ sd_setImageWithURL:[NSURL URLWithString:bannerImageUrl_] placeholderImage:[UIImage imageNamed:@"loading_bg1"]];
    
    [self.activityScrollView addSubview:imageView_];
    
    UIButton *btn_ = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn_ setFrame:imageRect_];
    btn_.tag = banner_button_base_tag;;
    [btn_ addTarget:self action:@selector(bannerButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.activityScrollView addSubview:btn_];
    
}

//有多组内容
- (void)createMultipleBannerViews
{
    CGRect viewRect_ = self.frame;
    CGRect scrollRect_ = self.activityScrollView.frame;
    
    CGFloat xValue = 0.0;
    NSInteger count_ = pageCount+2;
    for (int i=0; i<count_; i++)
    {
        CGRect imageRect_ = CGRectMake(xValue, 0, scrollRect_.size.width, scrollRect_.size.height);
        NSString *bannerImageUrl_ = [NSString string];
        NSInteger btnTag_ = 0;
        if (i==0)
        {
            bannerImageUrl_ = [self.activityInfoData objectAtIndex:pageCount-1];
            btnTag_ = pageCount-1;
        }
        else if (i==count_-1)
        {
            bannerImageUrl_ = [self.activityInfoData objectAtIndex:0];
            btnTag_ = 0;
        }
        else
        {
            bannerImageUrl_ = [self.activityInfoData objectAtIndex:i-1];
            btnTag_ = i-1;
        }
        
        UIImageView *imageView_ = [[UIImageView alloc] initWithFrame:imageRect_];
        [imageView_ sd_setImageWithURL:[NSURL URLWithString:bannerImageUrl_] placeholderImage:[UIImage imageNamed:@"loading_bg1"]];

        [self.activityScrollView addSubview:imageView_];
        
        UIButton *btn_ = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_ setFrame:imageRect_];
        btn_.tag = btnTag_ + banner_button_base_tag;;
        [btn_ addTarget:self action:@selector(bannerButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.activityScrollView addSubview:btn_];
        
        xValue += scrollRect_.size.width;
        
    }
    
    self.activityScrollView.contentOffset = CGPointMake(scrollRect_.size.width, 0);
    currentPage = 1;
    
    self.activityScrollView.contentSize = CGSizeMake(xValue, scrollRect_.size.height);
    self.activityScrollView.pagingEnabled = YES;
    self.activityScrollView.showsHorizontalScrollIndicator = NO;
    
    CGRect pageRect_ = CGRectMake(SCREEN_WIDTH - 100, viewRect_.size.height-20, 90, 5);
    self.imagePageControl = [[UIPageControl alloc] initWithFrame:pageRect_];
    self.imagePageControl.numberOfPages = pageCount;
    self.imagePageControl.currentPageIndicatorTintColor = UICOLOR_HEX(0x43b5f6);
    self.imagePageControl.pageIndicatorTintColor  = UICOLOR_HEX(0x414753);

    [self addSubview:self.imagePageControl];
    
    self.playImageTimer = [NSTimer scheduledTimerWithTimeInterval:timerTime target:self selector:@selector(playActivityImages) userInfo:nil repeats:YES];
    
}

#pragma mark-
#pragma mark---button pressed

- (void)bannerButtonPressed:(id)sender
{
    NSLog(@"banner clicked");
    
    UIButton *btn_ = (UIButton *)sender;
    NSInteger tag_ = btn_.tag - banner_button_base_tag;
    if ([self.delegate respondsToSelector:@selector(activityClickedWithNum:)])
    {
        [self.delegate activityClickedWithNum:tag_];
    }
    
}

#pragma mark-
#pragma mark---私有方法

- (void)playActivityImages
{
    currentPage++;
    CGRect scrollRect_ = self.activityScrollView.frame;
    [UIView animateWithDuration:0.5 animations:^{
        
        self.activityScrollView.contentOffset = CGPointMake(scrollRect_.size.width*currentPage, 0);
        
    } completion:^(BOOL finished) {
        
        if (currentPage == pageCount+1)
        {
            currentPage = 1;
            self.activityScrollView.contentOffset = CGPointMake(scrollRect_.size.width, 0);
        }
        
        self.imagePageControl.currentPage = currentPage-1;
        
    }];
    
}

#pragma mark-
#pragma mark---UIScrollViewDelegate


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //手势滑动时停止定时器轮流播放
    if (self.playImageTimer&&[self.playImageTimer isValid])
    {
        [self.playImageTimer invalidate];
        self.playImageTimer = nil;
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

    self.playImageTimer = [NSTimer scheduledTimerWithTimeInterval:timerTime target:self selector:@selector(playActivityImages) userInfo:nil repeats:YES];
    
    CGPoint currentOffSet = scrollView.contentOffset;
    CGRect scrollRect_ = self.activityScrollView.frame;
    
    NSInteger currentScrollPage_ = currentOffSet.x/scrollRect_.size.width;
    if (currentScrollPage_ == 0)
    {
        self.activityScrollView.contentOffset = CGPointMake(scrollRect_.size.width*pageCount, 0);
        currentPage = pageCount;
    }
    else if (currentScrollPage_ == pageCount+1)
    {
        self.activityScrollView.contentOffset = CGPointMake(scrollRect_.size.width, 0);
        currentPage = 1;
    }
    else
    {
        currentPage = currentScrollPage_;
    }
    
    self.imagePageControl.currentPage = currentPage-1;
    
    
}

@end
