


//
//  TableViewCell+Extension.m
//  BaseTest
//
//  Created by 蒋玉顺 on 2017/4/7.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import "TableViewCell+Extension.h"

@implementation UITableViewCell (Extension)

+ (UINib *)returnNib {
    
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
}

+ (NSString *)returnDefaultReuseIdentifier {
    
    return NSStringFromClass(self);
    
}
//  注册一个 cellNib
+ (void)autoRegistNibForTableView:(UITableView *)tableView {
    
    NSString *Id = [self returnDefaultReuseIdentifier];
    [self autoRegistNibForTableView:tableView identifier:Id];
    
}
//  注册一个 cellClass
+ (void)autoRegistClassForTableView:(UITableView *)tableView {
    
    NSString *Id = [self returnDefaultReuseIdentifier];
    [self autoRegistClassForTableView:tableView identifier:Id];
    
}

//  取出cell
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    NSString *Id = [self returnDefaultReuseIdentifier];
    UITableViewCell *cell = [self cellWithTableView:tableView identifier:Id];
    return cell;
    
    
}
//  注册自定义classcell
+ (void)autoRegistClassForTableView:(UITableView *)tableView identifier:(NSString*)identifier{
    
    [tableView registerClass:self forCellReuseIdentifier:identifier];
    
}

//  注册自定义Nibcell
+ (void)autoRegistNibForTableView:(UITableView *)tableView  identifier:(NSString*)identifier{
    
    [tableView registerNib:[self returnNib] forCellReuseIdentifier:identifier];
    
}


//  取出自定义cell
+(instancetype)cellWithTableView:(UITableView *)tableView identifier:(NSString*)identifier
{
    NSString *Id = identifier;
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:Id];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Id];
        
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
    
    
}

@end

@implementation UIView (common)
+ (UINib *)returnNib {
    
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
}

+ (NSString *)returnDefaultReuseIdentifier {
    
    return NSStringFromClass(self);
    
}


// 注册class类型
+ (void)autoRegistClassForHeaderFooterViewTableView:(UITableView *)tableView
{
    NSString *Id = [self returnDefaultReuseIdentifier];
    [self autoRegistClassForHeaderFooterViewTableView:tableView identifier:Id];
    
}
// 注册Nib类型
+ (void)autoRegistNibForHeaderFooterViewTableView:(UITableView *)tableView
{
    NSString *Id = [self returnDefaultReuseIdentifier];
    [self autoRegistNibForHeaderFooterViewTableView:tableView identifier:Id];
    
}
//  取出view
+ (instancetype)dequeueReusableHeaderFooterWithTableView:(UITableView *)tableView
{
    NSString *Id = [self returnDefaultReuseIdentifier];
    UIView *headerView = [self dequeueReusableHeaderFooterWithTableView:tableView identifier:Id];
    return headerView;
    
}
//  注册自定义classView
+ (void)autoRegistClassForHeaderFooterViewTableView:(UITableView *)tableView identifier:(NSString*)identifier
{
    [tableView registerClass:[self class] forHeaderFooterViewReuseIdentifier:identifier];
    
}

//  注册自定义NibView
+ (void)autoRegistNibForHeaderFooterViewTableView:(UITableView *)tableView identifier:(NSString*)identifier
{
    [tableView registerNib:[self returnNib] forHeaderFooterViewReuseIdentifier:identifier];
    
}
//  取出自定义view
+ (instancetype)dequeueReusableHeaderFooterWithTableView:(UITableView *)tableView identifier:(NSString*)identifier
{
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (headerView == nil)
    {
        headerView = [[self alloc] initWithReuseIdentifier:identifier];
        
    }
    return headerView;
    
}




// 注册class类型
+ (void)autoRegistClassForHeaderFooterViewCollectionView:(UICollectionView *)collectionView Kind:(NSString *)kind
{
    NSString *Id = [self returnDefaultReuseIdentifier];
    [collectionView registerClass:[self class] forSupplementaryViewOfKind:kind withReuseIdentifier:Id];
    
}

// 注册Nib类型
+ (void)autoRegistNibForHeaderFooterViewCollectionView:(UICollectionView *)collectionView
{
    NSString *Id = [self returnDefaultReuseIdentifier];
    [collectionView registerNib:[self returnNib] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:Id];
    
}

+ (instancetype)dequeueReusableHeaderFooterWithCollectionView:(UICollectionView *)collectionView  Kind:(NSString *)kind indexPath:(NSIndexPath*)indexPath
{
    NSString *Id = [self returnDefaultReuseIdentifier];
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:Id forIndexPath:indexPath];
    return headerView;
    
}
@end

@implementation UICollectionViewCell (Extension)

+ (UINib *)returnNib {
    
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
}
+ (NSString *)returnDefaultReuseIdentifier
{
    return NSStringFromClass(self);
}


// 注册一个NibCell
+ (void)autoRegistNibForCollectionView:(UICollectionView *)collectionView
{
    NSString *Id = [self returnDefaultReuseIdentifier];
    [self autoRegistNibForCollectionView:collectionView identifier:Id];
    
}

// 注册一个ClassCell
+ (void)autoRegistClassForCollectionView:(UICollectionView *)collectionView
{
    NSString *Id = [self returnDefaultReuseIdentifier];
    [self autoRegistClassForCollectionView:collectionView identifier:Id];
    
}

// 注册一个Cell  解决它的重用
+ (instancetype)collectionViewWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath*)indexPath
{
    
    NSString *Id = [self returnDefaultReuseIdentifier];
    UICollectionViewCell *cell = [self collectionViewWithCollectionView:collectionView indexPath:indexPath identifier:Id];
    
    return cell;
}
//  注册自定义classCell
+ (void)autoRegistClassForCollectionView:(UICollectionView *)collectionView identifier:(NSString*)identifier
{
    [collectionView registerClass:self forCellWithReuseIdentifier:identifier];
    
}

//  注册自定义NibCell
+ (void)autoRegistNibForCollectionView:(UICollectionView *)collectionView identifier:(NSString*)identifier
{
    [collectionView registerNib:[self returnNib] forCellWithReuseIdentifier:identifier];
    
}


//  取出自定义Cell
+ (instancetype)collectionViewWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath*)indexPath identifier:(NSString*)identifier
{
    NSString *Id = identifier;
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Id forIndexPath:indexPath];
    return cell;
}


@end



