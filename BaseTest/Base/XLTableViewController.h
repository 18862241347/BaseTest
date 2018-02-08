//
//  XLTableViewController.h
//  TianyiClient
//
//  Created by 蒋玉顺 on 2017/4/24.
//  Copyright © 2017年 cn.tianyilm. All rights reserved.
//

#import "BaseViewController.h"

@class EmptyShowView;

@interface XLTableViewController : BaseViewController

@property(nonatomic, strong) UITableView *tableView;

/// tableView的样式
@property(nonatomic, assign) BOOL isGrouped;



@end
