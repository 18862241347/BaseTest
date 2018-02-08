//
//  XLTableViewController.m
//  TianyiClient
//
//  Created by 蒋玉顺 on 2017/4/24.
//  Copyright © 2017年 cn.tianyilm. All rights reserved.
//

#import "XLTableViewController.h"


@interface XLTableViewController ()<UITableViewDataSource,UITableViewDelegate>


@end

@implementation XLTableViewController


-(void)setIsGrouped:(BOOL)isGrouped
{
    _isGrouped = isGrouped;
}

-(UITableView *)tableView
{
    if (_tableView == nil)
    {
        UITableView *tableView;
        CGFloat tableViewY = 0;
        if (_isGrouped == YES)
        {
            tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, tableViewY, SCREEN_WIDTH, SCREEN_HEIGHT- tableViewY) style:UITableViewStyleGrouped];
        }else
        {
            tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, tableViewY, SCREEN_WIDTH, SCREEN_HEIGHT-tableViewY) style:UITableViewStylePlain];
        }
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.estimatedRowHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.backgroundColor = AppBackGroundColor;
        [self.view addSubview:tableView];
        _tableView = tableView;
        
    }
    return _tableView;
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.isBlackNav = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = 40;
    
    
    [self setRegisterNotification];

}

/// 注册通知
-(void)setRegisterNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resetCartNum:) name:NOTIFICATION_CARTNUM object:nil];
    
}

// 查询购物车数量
-(void)resetCartNum:(NSNotification*)noti
{
    // state: 1 查询购物车数量  2 更新对应的UI
    //    NSInteger state = [[noti.object objectForKey:@"state"] integerValue];
    
    
    
}
#pragma mark ----
#pragma mark ----UITableViewDelegate----

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  1;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell cellWithTableView:tableView];
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return self.isGrouped ?0.5:0;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *bgView = [[UIView alloc]init];
    bgView.backgroundColor = AppBackGroundColor;
    return bgView;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return self.isGrouped ?0.5:0;
//}
//
//
//-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *bgView = [[UIView alloc]init];
//    bgView.backgroundColor = AppBackGroundColor;
//    return bgView;
//    
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
}

@end
