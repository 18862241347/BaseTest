



//
//  XLStarRateView.m
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/9/18.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import "XLStarRateView.h"
#define FOREGROUND_STAR_IMAGE_NAME @"star-red"
#define BACKGROUND_STAR_IMAGE_NAME @"star-gray"




@interface XLStarRateView ()

{
    NSInteger _count;
   
}
@property (nonatomic, strong) UIView *foregroundStarView;
@property (nonatomic, strong) UIView *backgroundStarView;


@end
@implementation XLStarRateView


-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        _count = 0;
        _numberOfStars = 5;
        _isClick = NO;
        _scorePercent = 0.2;
        [self initTheSubViews];
        
        
    }
    return  self;
}


-(void)initTheSubViews
{
    
    
    
    self.backgroundStarView = [[UIView alloc]initWithFrame:self.bounds];
    [self createStarViewWith:self.backgroundStarView imageName:BACKGROUND_STAR_IMAGE_NAME];
    [self addSubview:self.backgroundStarView];
    
    
    self.foregroundStarView = [[UIView alloc]initWithFrame:self.bounds];
    [self createStarViewWith:self.foregroundStarView imageName:FOREGROUND_STAR_IMAGE_NAME];
    [self addSubview:self.foregroundStarView];
    

    
}



-(void)setNumberOfStars:(NSInteger)numberOfStars
{
    _numberOfStars = numberOfStars;
    
    if (_numberOfStars <= 0) {
        return;
        
    }
    
    
    [self createStarViewWith:self.backgroundStarView imageName:BACKGROUND_STAR_IMAGE_NAME];
    
    [self createStarViewWith:self.foregroundStarView imageName:FOREGROUND_STAR_IMAGE_NAME];

    
    
}
-(void)setIsClick:(BOOL)isClick
{
    _isClick = isClick;
    if (_isClick == YES) {
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTapRateView:)];
        tapGesture.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tapGesture];
        
    }else
    {
        
    }
}

- (void)userTapRateView:(UITapGestureRecognizer *)gesture {
    
    CGPoint tapPoint = [gesture locationInView:self];
    CGFloat offset = tapPoint.x;
    CGFloat realStarScore = offset / (self.bounds.size.width / self.numberOfStars);
    CGFloat starScore = self.allowIncompleteStar ? realStarScore : ceilf(realStarScore);
    ///   判断点击的比例 取出值 赋值比值
    CGFloat count = starScore / self.numberOfStars;
    // 精确的值+
    CGFloat   accurateCount = count*5;
    NSInteger probablyCount = count*5;
    
    /// 标准做法应该在probablyCount+0.5 但是最后一个一般不好点击
    if (accurateCount >= probablyCount) {
        CGFloat A = probablyCount/5.0+0.2 ;
        if (A <= 0.1) {
            _count++;

        }else
        {
            self.scorePercent = A;
            
        }
    }else
    {
        CGFloat B = probablyCount/5.0 ;
        if (B <= 0.2) {
            _count++;
            if (_count == 2) {
                self.scorePercent = 0;
            }else
            {
                self.scorePercent = B;
                _count = 1;
            }
            
        }else
        {
            self.scorePercent = B;
            
        }
    }
    
    
}


- (void)setScorePercent:(CGFloat)scroePercent
{
   
    _scorePercent = scroePercent;
    
    if (_scorePercent < 0) {
        _scorePercent = 0;
    } else if (_scorePercent > 1) {
        _scorePercent = 1;
    } else {
        _scorePercent = scroePercent;
    }
    
    if ([self.delegate respondsToSelector:@selector(XLStarRateView:scroePercentDidChange:btnTag:)]) {
        [self.delegate XLStarRateView:self scroePercentDidChange:scroePercent btnTag:self.btnTag];
    }
    
    [self setNeedsLayout];
}



- (void)createStarViewWith:(UIView*)view  imageName:(NSString *)imageName {
    
    for (UIImageView *img in view.subviews) {
        [img removeFromSuperview];
    }
    view.clipsToBounds = YES;
    view.backgroundColor = [UIColor clearColor];
    
    for (NSInteger i = 0; i < _numberOfStars; i ++)
    {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:imageName];
        imageView.frame = CGRectMake(i * self.width / _numberOfStars, 0, self.width / _numberOfStars, self.height);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [view addSubview:imageView];
    }
    
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    
    __weak XLStarRateView *weakSelf = self;
    CGFloat animationTimeInterval = self.hasAnimation ? 0.2 : 0;
    [UIView animateWithDuration:animationTimeInterval animations:^{
        CGFloat W = weakSelf.width * _scorePercent;
        CGFloat H = weakSelf.height;
        weakSelf.foregroundStarView.frame = CGRectMake(0, 0, W, H);
    }];
}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    NSSet *allTouches = [event allTouches];
    UITouch *touch = [allTouches anyObject];
    CGPoint tapPoint = [touch locationInView:[touch view]];



    CGFloat offset = tapPoint.x;
    CGFloat realStarScore = offset / (self.bounds.size.width / self.numberOfStars);
    CGFloat starScore = self.allowIncompleteStar ? realStarScore : ceilf(realStarScore);
    if (starScore <= 0) {
        return;
    }
    if (starScore > self.numberOfStars) {
        starScore = self.numberOfStars - 0.2;
    }
    ///   判断点击的比例 取出值 赋值比值
    CGFloat count = starScore / self.numberOfStars;
    // 精确的值+
    CGFloat   accurateCount = count*5;
    NSInteger probablyCount = count*5;

    /// 标准做法应该在probablyCount+0.5 但是最后一个一般不好点击
    if (accurateCount >= probablyCount) {
        CGFloat A = probablyCount/5.0+0.2 ;
        if (A <= 0.1) {
            _count++;

        }else
        {
            self.scorePercent = A;

        }
    }else
    {
        CGFloat B = probablyCount/5.0 ;
        if (B <= 0.2) {
            _count++;
            if (_count == 2) {
                self.scorePercent = 0;
            }else
            {
                self.scorePercent = B;
                _count = 1;
            }

        }else
        {
            self.scorePercent = B;

        }
    }

}

@end
