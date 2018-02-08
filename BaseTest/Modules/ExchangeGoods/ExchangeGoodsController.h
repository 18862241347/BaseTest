//
//  ExchangeGoodsController.h
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/8/25.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import "XLTableViewController.h"
typedef NS_ENUM(NSInteger, ExchangeGoodsType) {
    ExchangeGoodsTypeTreasure = 0,         // 珍品
    ExchangeGoodsTypeGoodShop,             // 优店
    ExchangeGoodsTypePrivateCollection,    // 私人藏馆

};
@interface ExchangeGoodsController : XLTableViewController
@property (nonatomic,assign) ExchangeGoodsType type;

@end
