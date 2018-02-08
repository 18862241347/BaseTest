

//
//  LoginViewController.m
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/9/13.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginInputCell.h"
#import "LoginConfirmCell.h"




// 登录接口
#define LOGIN_URL  @"m=default&c=login&a=login"

@interface LoginViewController ()<UITextFieldDelegate,XLHidenKeyboardViewDelegate>
{
    
    // 是否明文
    BOOL _isPlaintext[2];
    
    
    
}

// 输入手机号
@property (nonatomic ,weak) UITextField *phoneTextField;

// 密码
@property (nonatomic ,weak) UITextField *pswTextField;

// 记住密码图标
@property (nonatomic ,weak) UIImageView *saveImg;

@end

@implementation LoginViewController
- (void)initCustomNabBarView
{
    self.title = @"登录";
    
    self.customRightButton.hidden = NO;
    [self.customRightButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.customRightButton setTitleColor:kAppBlackColor forState:UIControlStateNormal];
    

}

- (void)initSettingData
{
    
    
    _isPlaintext[0] = ! _isPlaintext[0];
    _isPlaintext[1] = ! _isPlaintext[1];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initHeaderViews];
}


#pragma mark ---- init subviews
-(void)initHeaderViews
{
    
    
    UIView * headerView = [[UIView alloc]init];
    headerView.backgroundColor = [UIColor whiteColor];
    headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 0);
    self.tableView.tableHeaderView = headerView;
    
    
    
    UIImageView *line = [[UIImageView alloc]init];
    line.backgroundColor = AppBackGroundColor;
    [headerView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.equalTo(headerView);
        make.height.mas_equalTo(10);
        
    }];
    
    
    
    
    // 姓名
    UILabel *nameLabel = [UILabel initWithTextStr:@"账号" textColor:kAppBlackColor font:16];
    [headerView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.top.equalTo(line.mas_bottom).offset(0);
        make.left.equalTo(headerView).offset(15);
        make.height.mas_equalTo(40);
        
        
    }];
    
    
    UITextField  *phoneTextField = [UITextField initWithPromptStr:@"请输入登录手机号"  titleColor:kAppBlackColor font:16];
    phoneTextField.keyboardType = UIKeyboardTypePhonePad;
    phoneTextField.delegate = self;
    [headerView addSubview:phoneTextField];
    [phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(headerView).offset(-15);
        make.left.equalTo(nameLabel.mas_right).offset(10);
        make.height.mas_equalTo(40);
        make.centerY.equalTo(nameLabel);
        
        
    }];
    self.phoneTextField = phoneTextField;
    
    
    
    
    UIImageView *line1 = [UIImageView initWithBgColor:kAppLineBackgroundColor1];
    [headerView addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.top.equalTo(phoneTextField);
        make.left.right.equalTo(headerView);
        make.height.mas_equalTo(kAppLineHEIGHT);
        
        
    }];
    
    
    
    
    // 密码
    UILabel *pswLabel = [UILabel initWithTextStr:@"密码" textColor:kAppBlackColor font:16];
    [headerView addSubview:pswLabel];
    [pswLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(headerView).offset(15);
        make.top.equalTo(phoneTextField.mas_bottom).offset(10);
        
        
    }];
    
    
    UITextField  *pswTextField = [UITextField initWithPromptStr:@"请输入6-16位的登录密码"  titleColor:kAppBlackColor font:16];
    pswTextField.delegate = self;
    [headerView addSubview:pswTextField];
    [pswTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(pswLabel.mas_right).offset(10);
        make.height.equalTo(phoneTextField);
        make.centerY.equalTo(pswLabel);
        
        
        
    }];
    self.pswTextField = pswTextField;
    
    NSString *imgStr =   _isPlaintext[0] == YES?@"password-hiding":@"password-display";
    self.pswTextField.secureTextEntry = _isPlaintext;

    
    UIButton *arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [arrowBtn setImage:[UIImage imageNamed:imgStr] forState:UIControlStateNormal];
    arrowBtn.tag = 0;
    [arrowBtn addTarget:self action:@selector(selectTypeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:arrowBtn];
    [arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(headerView).offset(-15);
        make.centerY.equalTo(pswTextField);
        make.size.mas_equalTo(CGSizeMake(60, 30));
        
    }];
    
    
    
   
    UIImageView *line2 = [UIImageView initWithBgColor:kAppLineBackgroundColor1];
    [headerView addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(pswTextField);
        make.left.right.equalTo(headerView);
        make.height.mas_equalTo(kAppLineHEIGHT);
        
    }];
    
    
    UIImageView *line3 = [UIImageView initWithBgColor:kAppLineBackgroundColor1];
    [headerView addSubview:line3];
    [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(pswTextField);
        make.left.right.equalTo(headerView);
        make.height.mas_equalTo(kAppLineHEIGHT);
        
    }];
    
    
    
    UIView *dounView = [[UIView alloc]init];
    dounView.backgroundColor = AppBackGroundColor;
    [headerView addSubview:dounView];
    [dounView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(line3.mas_bottom).offset(0);
        make.bottom.left.right.equalTo(headerView);
        
    }];
    
    
    
    // 记住密码
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.tag = 1;
    [saveBtn addTarget:self action:@selector(savePswBtn:) forControlEvents:UIControlEventTouchUpInside];
    [dounView addSubview:saveBtn];
    
    
    
    UIImageView *saveImg = [[UIImageView alloc]init];
    saveImg.image = [UIImage imageNamed:@"duihao"];
    saveImg.contentMode = UIViewContentModeCenter;
    saveImg.clipsToBounds = YES;
    saveImg.layer.cornerRadius = 3;
    saveImg.layer.borderColor = kAppLineBackgroundColor1.CGColor;
    saveImg.layer.borderWidth = 0.5;
    [saveBtn addSubview:saveImg];
    [saveImg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(saveBtn);
        make.centerY.equalTo(saveBtn);
        make.size.mas_equalTo(CGSizeMake(15, 15));
        
    }];
    
    self.saveImg = saveImg;
    
    
    UILabel *saveLabel = [UILabel initWithTextStr:@"记住密码" textColor:UICOLOR_HEX(0x646464) font:12];
    [headerView addSubview:saveLabel];
    [saveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(saveImg.mas_right).offset(10);
        make.centerY.equalTo(saveBtn);
        
        
    }];
    
    
    [saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(dounView).offset(25);
        make.top.equalTo(dounView).offset(10);
        make.size.mas_equalTo(CGSizeMake(80, 25));
        
        
    }];
    
    
    
    // 忘记密码
    UIButton *forgetBtn = [UIButton initWithTitleStr:@"?忘记密码" titleColor:UICOLOR_HEX(0x646464) font:12];
    [forgetBtn addTarget:self action:@selector(forgetPswBtn:) forControlEvents:UIControlEventTouchUpInside];
    [dounView addSubview:forgetBtn];
    [forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(dounView).offset(-25);
        make.top.equalTo(dounView).offset(10);
        make.size.mas_equalTo(CGSizeMake(80, 25));
        
        
    }];
    
    
    // 登录按钮
    UIButton *loginBtn = [UIButton initWithTitleStr:@"登录" titleColor:kAppWhiteColor font:18];
    loginBtn.backgroundColor = kAppBlueColor;
    loginBtn.clipsToBounds = YES;
    loginBtn.layer.cornerRadius = 3*Ratio_6;
    [loginBtn addTarget:self action:@selector(confirmSubmitData:) forControlEvents:UIControlEventTouchUpInside];
    [dounView addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(dounView).offset(60*Ratio_6);
        make.centerX.equalTo(dounView);
        make.width.mas_equalTo(SCREEN_WIDTH - 101);
        
        
    }];

    
    
    
    headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH,  200);
    self.tableView.tableHeaderView = headerView;
    
    
    NSDictionary *userDic = [PathUtilities userInfoFrowLocal];

    NSString *login_name = [userDic objectForKey:@"uname"];
    self.phoneTextField.text = login_name;
    
    
    NSString *passwd = [userDic objectForKey:@"passwd"];
    self.pswTextField.text = passwd;



}

#pragma mark --- button method

- (void)customLeftButtonPressed:(id)sender
{
  
    if (self.type == LoginTypePush) {
        [self.navigationController popViewControllerAnimated:YES];

    }else  if (self.type == LoginTypeModal) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }else {
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    
}
// 选择明文密文
-(void)selectTypeBtn:(UIButton*)btn
{
     _isPlaintext[0] = ! _isPlaintext[0];
    
    
    NSString *imgStr =   _isPlaintext[0] == YES?@"password-hiding":@"password-display";
    [btn setImage:[UIImage imageNamed:imgStr] forState:UIControlStateNormal];
    self.pswTextField.secureTextEntry = _isPlaintext[0];
    
}
// 记住密码
-(void)savePswBtn:(UIButton*)btn
{
    _isPlaintext[1] = ! _isPlaintext[1];
    
    if (_isPlaintext[1]) {
        self.saveImg.image = [UIImage imageNamed:@"duihao"];
        
    }else
    {
        self.saveImg.image = [UIImage imageNamed:@""];
        
    }
    

}
// 忘记密码
-(void)forgetPswBtn:(UIButton*)btn
{
    
    
}



//  登录  校验数据
-(void)confirmSubmitData:(UIButton*)btn
{
    
    // 手机号
    NSString *phoneStr  = self.phoneTextField.text;
    
    
    // 密码
    NSString *passwdStr  = self.pswTextField.text;
    
    
    if ([phoneStr isEqualToString:@""]) {
        
//        [GlobalUtils fail_HUD:@"请输入手机号!" toView:self.view];
        return;
    }
    

    
    
    if ([passwdStr isEqualToString:@""]) {
//        [GlobalUtils fail_HUD:@"请输入登录密码!" toView:self.view];
        return;
    }
    if (passwdStr.length >= 17 || passwdStr.length < 6 ) {
//        [GlobalUtils fail_HUD:@"请输入6~16位登录密码!" toView:self.view];
        return;
    }
    
    
    
    [self submitLoginData];
    
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
    [self.view endEditing:YES];
}

#pragma mark-
#pragma mark---UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    [self.view endEditing:YES];
    
}



#pragma mark-
#pragma mark------request data
//  登录接口
-(void)submitLoginData
{
    NSMutableDictionary *paraDic_ = [NSMutableDictionary dictionary];
    
    
    // 手机号
    NSString *user_id  = self.phoneTextField.text;
    [paraDic_ setObject:user_id forKey:@"phone"];
    
    
    // 密码(需要MD5加密后传)
    NSString *passwdStr  = self.pswTextField.text;
    passwdStr = [FunctionBasis  md5HexDigest:passwdStr];
    [paraDic_ setObject:passwdStr forKey:@"passwd"];
    
    // 登陆状态(返回默认为1：1登录，2：未登录)
    NSString *token  = @"1";
    [paraDic_ setObject:token forKey:@"token"];
    
    
    
//    if (!self.serviceManager)
//    {
//        self.serviceManager = [[XLAFServiceManger alloc] init];
//    }
//    self.serviceManager.delegate = self;
//    [self.serviceManager postDataWithMethod:LOGIN_URL withDictionary:paraDic_];
    
}



#pragma mark-
#pragma mark---XLAFServiceMangerDelegate
//请求数据成功
- (void)dataSourceDidLoad:(NSDictionary *)info withMethod:(NSString *)method
{
    [GlobalUtils dismiss_HUD];
    NSInteger result =  [info[server_return_Result] integerValue];
    
    if ([method isEqualToString:LOGIN_URL])
    {

        if (result != 200)
        {
//            [GlobalUtils fail_HUD:info[server_return_Message] toView:self.view];
            return;

        }

        [self.view endEditing:YES];

        NSString *passwdStr = @"" ;
        if (_isPlaintext[1])
        {
            passwdStr = self.pswTextField.text;

        }
        NSDictionary *data = [info objectForKey:server_return_Data];
        NSMutableDictionary *userDic = [NSMutableDictionary dictionaryWithDictionary:data];
        [userDic setObject:passwdStr forKey:@"passwd"];

        [PathUtilities saveUserInfoToLocal:userDic];
        [JSessionInfo sharedInstance].userDic = [NSMutableDictionary dictionaryWithDictionary:userDic];

        NSString *uid = [userDic objectForKey:@"uid"];
        [JSessionInfo sharedInstance].user_id = uid;

        [self customLeftButtonPressed:nil];
        
        
    }
    
    
    
    [self.tableView reloadData];
    
    
    
}
-(void)dataSourceDidError:(NSDictionary *)info withMethod:(NSString *)method
{
    [GlobalUtils dismiss_HUD];
//    [GlobalUtils fail_HUD:info[server_return_Message] toView:self.view];
}

@end
