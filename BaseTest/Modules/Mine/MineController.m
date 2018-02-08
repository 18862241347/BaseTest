

//
//  MineController.m
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/7/26.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import "MineController.h"


#import "LoginViewController.h"




//  个人中心一级页面的接口
#define MINE_CENTER_URL  @"m=default&c=user&a=index"

@interface MineController ()


@property (nonatomic ,strong) NSArray *titleArr;
@property (nonatomic ,strong) NSArray *iconArr;


@property (nonatomic ,strong) NSDictionary *infoDic;

@end

@implementation MineController
- (void)initCustomNabBarView
{
    self.isGrouped = YES;
    self.tableView.y =  -20;
    
    
    
}

- (void)initSettingData
{
    
    
    self.titleArr = @[@"管理收货地址",@"消息中心",@"意见反馈",@"关于我们",@"客服中心"];
    self.iconArr = @[@"mine_address",@"mine_message",@"feedbank",@"about-us",@"mine_ call"];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];

}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.contentInset = UIEdgeInsetsMake(300, 0, 0, 0);

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -300, [UIScreen mainScreen].bounds.size.width, 300)];

    imageView.image = [UIImage imageNamed:@"2017-03-04 205014"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.tag = 101;

    [self.tableView addSubview:imageView];


    
}



#pragma mark ----
#pragma mark ----UITableViewDelegate----
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger sectionCount = 20;
    
    return sectionCount;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rowCount = 1;

    return rowCount;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [UITableViewCell cellWithTableView:tableView];

    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rowHeight = 40;

    return rowHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    CGFloat headerH = 10;
    if (section == 0 )
    {
        headerH = 225*Ratio_6;
        
    }
    return  headerH;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *bgView = [[UIView alloc]init];
    bgView.backgroundColor = AppBackGroundColor;
    return bgView;
    
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    if (point.y < -300) {
        CGRect rect = [self.tableView viewWithTag:101].frame;
        rect.origin.y = point.y;
        rect.size.height = -point.y;
        [self.tableView viewWithTag:101].frame = rect;
    }
}





@end
