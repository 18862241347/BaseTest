//
//  TableViewCell+Extension.h
//  BaseTest
//
//  Created by 蒋玉顺 on 2017/4/7.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Extension)

+ (UINib *)returnNib;


+ (NSString *)returnDefaultReuseIdentifier;

/**
 *   注册一个 CellNib
 *
 */
+ (void)autoRegistNibForTableView:(UITableView *)tableView;


/**
 *   注册一个 CellClass
 *
 */
+ (void)autoRegistClassForTableView:(UITableView *)tableView;



/**
 *   注册一个 Cell  解决它的重用
 *
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

/**
 *   注册自定义NibCell
 *
 */
+ (void)autoRegistNibForTableView:(UITableView *)tableView identifier:(NSString*)identifier;

/**
 *   注册自定义classCell
 *
 */
+ (void)autoRegistClassForTableView:(UITableView *)tableView identifier:(NSString*)identifier;

/**
 *   取出自定义Cell
 *
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView identifier:(NSString*)identifier;



@end
@interface UIView (common)

+ (UINib *)returnNib;

/**
 *   获取view的字符串名称
 *
 */
+ (NSString *)returnDefaultReuseIdentifier;


/**
 *   注册class类型
 *
 */
+ (void)autoRegistClassForHeaderFooterViewTableView:(UITableView *)tableView;

/**
 *   注册Nib类型
 *
 */
+ (void)autoRegistNibForHeaderFooterViewTableView:(UITableView *)tableView;


/**
 *   取出view
 *
 */
+ (instancetype)dequeueReusableHeaderFooterWithTableView:(UITableView *)tableView;


/**
 *   注册自定义classView
 *
 */
+ (void)autoRegistClassForHeaderFooterViewTableView:(UITableView *)tableView identifier:(NSString*)identifier;

/**
 *   注册自定义NibView
 *
 */
+ (void)autoRegistNibForHeaderFooterViewTableView:(UITableView *)tableView identifier:(NSString*)identifier;

/**
 *   取出自定义view
 *
 */
+ (instancetype)dequeueReusableHeaderFooterWithTableView:(UITableView *)tableView identifier:(NSString*)identifier;



/**
 *   注册class类型
 *
 */
+ (void)autoRegistClassForHeaderFooterViewCollectionView:(UICollectionView *)collectionView Kind:(NSString *)kind;

/**
 *   注册Nib类型
 *
 */
+ (void)autoRegistNibForHeaderFooterViewCollectionView:(UICollectionView *)collectionView;

/**
 *   取出view
 *
 */
+ (instancetype)dequeueReusableHeaderFooterWithCollectionView:(UICollectionView *)collectionView  Kind:(NSString *)kind indexPath:(NSIndexPath*)indexPath;




@end
@interface UICollectionViewCell (Extension)

+ (UINib *)returnNib;


+ (NSString *)returnDefaultReuseIdentifier;

/**
 *   注册一个NibCell
 *
 */
+ (void)autoRegistNibForCollectionView:(UICollectionView *)collectionView;
/**
 *   注册一个ClassCell
 *
 */
+ (void)autoRegistClassForCollectionView:(UICollectionView *)collectionView;


/**
 *   注册一个Cell  解决它的重用
 *
 */
+ (instancetype)collectionViewWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath*)indexPath;


/**
 *   注册自定义classCell
 *
 */
+ (void)autoRegistClassForCollectionView:(UICollectionView *)collectionView identifier:(NSString*)identifier;

/**
 *   注册自定义NibCell
 *
 */
+ (void)autoRegistNibForCollectionView:(UICollectionView *)collectionView identifier:(NSString*)identifier;


/**
 *   取出自定义Cell
 *
 */
+ (instancetype)collectionViewWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath*)indexPath identifier:(NSString*)identifier;






@end

