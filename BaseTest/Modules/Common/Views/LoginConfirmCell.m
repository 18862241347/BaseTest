

//
//  LoginConfirmCell.m
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/9/13.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import "LoginConfirmCell.h"
@interface LoginConfirmCell ()

@end
@implementation LoginConfirmCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initTheSubViews];
    }
    
    return self;
    
}
- (void)initTheSubViews {
    
    
    
    UIButton *contentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    contentBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    contentBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [contentBtn addTarget:self action:@selector(selectTypeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:contentBtn];
    self.contentBtn = contentBtn;
    
    
    

    UIImageView *line1 = [UIImageView initWithBgColor:kAppLineBackgroundColor1];
    line1.hidden = YES;
    [self.contentView addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.equalTo(self.contentView);
        make.height.mas_equalTo(kAppLineHEIGHT);
        
    }];
    self.line1 = line1;
    
    
    

    UIImageView *line2 = [UIImageView initWithBgColor:kAppLineBackgroundColor1];
    line2.hidden = YES;
    [self.contentView addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(kAppLineHEIGHT);
        
    }];
    
    
    self.line2 = line2;
    
}


-(void)setContentBtnW:(CGFloat)contentBtnW
{
    _contentBtnW = contentBtnW;
}
-(void)setContentBtnX:(CGFloat)contentBtnX
{
    _contentBtnX = contentBtnX;
}

-(void)setContentBtnH:(CGFloat)contentBtnH
{
    _contentBtnH = contentBtnH;

}










-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    
    CGFloat contentBtnX = 0;
    CGFloat contentBtnY = 0;
    CGFloat contentBtnW = self.width;
    CGFloat contentBtnH = self.height;

    
    if (_contentBtnX > 0) {
        contentBtnX = _contentBtnX;
    }
    if (_contentBtnW > 0) {
        contentBtnW = _contentBtnW;
    }
    
    if (_contentBtnH > 0) {
        contentBtnH = _contentBtnH;
    }

    contentBtnX  = (self.width - contentBtnW)/2.0;
    contentBtnY  = (self.height - contentBtnH)/2.0;

    self.contentBtn.frame  = CGRectMake(contentBtnX, contentBtnY, contentBtnW, contentBtnH );
    
    
}






#pragma mark --- button method
-(void)selectTypeBtn:(UIButton*)btn
{
    if (self.btnBlock) {
        self.btnBlock();
        
    }
}

@end
