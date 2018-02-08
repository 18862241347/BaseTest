

//
//  LoginInputCell.m
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/9/13.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import "LoginInputCell.h"
@interface LoginInputCell ()<UITextFieldDelegate,XLHidenKeyboardViewDelegate>

@end
@implementation LoginInputCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initTheSubViews];
    }
    
    return self;
    
}
- (void)initTheSubViews {
    
    
    ///  上传title
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textColor = kAppBlackColor;
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    
    
    UITextField *inputTextField  = [[UITextField alloc]init];
    inputTextField.font = [UIFont systemFontOfSize:16];
    inputTextField.textColor = kAppBlackColor;
    inputTextField.delegate = self;
    [self.contentView addSubview:inputTextField];
    self.inputTextField = inputTextField;
    
    
    
    
    UIButton *arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [arrowBtn addTarget:self action:@selector(selectTypeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:arrowBtn];
    [arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.contentView).offset(-15);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(20, 20));
        
    }];
    self.arrowBtn = arrowBtn;
    
    
    
    

    UIImageView *line1 = [UIImageView initWithBgColor:kAppLineBackgroundColor1];
    line1.hidden = YES;
    [self.contentView addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.equalTo(self.contentView);
        make.height.mas_equalTo(kAppLineHEIGHT);
        
    }];
    
    
    self.line1 = line1;
    
    UIImageView *line2 = [UIImageView initWithBgColor:kAppLineBackgroundColor1];
    [self.contentView addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(kAppLineHEIGHT);
        
    }];
    
    
    self.line2 = line2;
    
}
-(void)setInputTextFieldX:(CGFloat)inputTextFieldX
{
    _inputTextFieldX = inputTextFieldX;
}
-(void)setInputTextFieldW:(CGFloat)inputTextFieldW
{
    _inputTextFieldW = inputTextFieldW;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    
    CGFloat titleLabelX = 15;
    CGFloat titleLabelY = 0;
    CGFloat titleLabelW = [FunctionBasis returnText:self.titleLabel.text font:self.titleLabel.font weight:SCREEN_WIDTH].width;
    CGFloat titleLabelH = self.contentView.height;
    
    self.titleLabel.frame  = CGRectMake(titleLabelX, titleLabelY, titleLabelW, titleLabelH);
    
    
    CGFloat inputTextFieldX = CGRectGetMaxX(self.titleLabel.frame)+15;
    if (_inputTextFieldX >0) {
        inputTextFieldX = _inputTextFieldX;
    }
    CGFloat inputTextFieldY = 0;
    CGFloat inputTextFieldW = SCREEN_WIDTH - 15 - inputTextFieldX ;
    CGFloat inputTextFieldH = self.contentView.height;
    if (_inputTextFieldW >0) {
        inputTextFieldW = _inputTextFieldW;
    }
    
    self.inputTextField.frame  = CGRectMake(inputTextFieldX, inputTextFieldY, inputTextFieldW, inputTextFieldH);
    
    
}




#pragma mark --- button method
-(void)selectTypeBtn:(UIButton*)btn
{
    if (self.btnBlock) {
        self.btnBlock();
        
    }
}


#pragma mark-
#pragma mark---UITextFieldDelegate
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    CGRect hidenViewRect_ = CGRectMake(0, 0, SCREEN_WIDTH, 40);
    XLHidenKeyboardView *hidenKeyboardView_ = [[XLHidenKeyboardView alloc] initWithFrame:hidenViewRect_];
    hidenKeyboardView_.delegate = self;
    textField.inputAccessoryView = hidenKeyboardView_;
    
    return YES;
    
}
#pragma mark-
#pragma mark---XLHidenKeyboardViewDelegate

//完成输入后隐藏键盘
- (void)didFinishedInputToHidenKeyboard:(XLHidenKeyboardView *)hidenKeyboardView
{
    [self.inputTextField resignFirstResponder];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.inputTextField resignFirstResponder];
    
}




@end
