//
//  JSessionInfo.h
//  TianyiClient
//
//  Created by 蒋玉顺 on 2017/5/4.
//  Copyright © 2017年 cn.tianyilm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSessionInfo : NSObject

// 用户注册返回的信息
@property(nonatomic, retain) NSDictionary *registerDic;

// 用户登录返回信息
@property(nonatomic, retain) NSMutableDictionary *userDic;


/// 用户id
@property(nonatomic, copy) NSString *user_id;

/// 购物车商品数量
@property(nonatomic, assign) NSInteger goodsCount;

/// 400客服电话
@property(nonatomic, copy) NSString *telephone;

// 搜索记录
@property(nonatomic, retain) NSMutableArray *searchRecordArr;



+ (JSessionInfo *)sharedInstance;

@end
