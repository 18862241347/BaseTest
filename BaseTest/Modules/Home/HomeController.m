
//
//  HomeController.m
//  StoneNet
//
//  Created by 蒋玉顺 on 2017/7/26.
//  Copyright © 2017年 蒋玉顺. All rights reserved.
//

#import "HomeController.h"
#import "HomeHeaderView.h"

#import "HomeCollectionCell.h"
#import "HomeCollectionReusableView.h"



@interface HomeController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic ,weak) UICollectionView *collectonView;

@end

@implementation HomeController
- (void)initCustomNabBarView
{
    self.isGrouped = YES;
    self.tableView.hidden = YES;
    
}

- (void)initSettingData
{

}



- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [UITableViewCell autoRegistClassForTableView:self.tableView];
//    [HomeHeaderView  autoRegistClassForHeaderFooterViewTableView:self.tableView];


    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing      = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.headerReferenceSize=CGSizeMake(self.view.frame.size.width, 50);


    UICollectionView *collectonView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectonView.showsHorizontalScrollIndicator = NO;

    collectonView.backgroundColor = [UIColor whiteColor];
    collectonView.delegate = self;
    collectonView.dataSource = self;
    [self.view addSubview:collectonView];
    [collectonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.view);
    }];

    self.collectonView = collectonView;





    [HomeCollectionCell autoRegistNibForCollectionView:self.collectonView identifier:@"tonView"];
//    [self.collectonView registerClass:[HomeCollectionReusableView class ]   forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeCollectionReusableView"];
    [HomeCollectionReusableView  autoRegistClassForHeaderFooterViewCollectionView:self.collectonView Kind:UICollectionElementKindSectionHeader];



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


    cell.contentView.backgroundColor = kAppBlueColor;

    if (indexPath.section%2 == 0) {
        cell.contentView.backgroundColor = kAppRedColor;
    }
    return cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rowHeight = 80;

    return rowHeight;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    CGFloat headerH = 13;
    return  headerH;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    HomeHeaderView *headerView = [HomeHeaderView dequeueReusableHeaderFooterWithTableView:tableView];

    return headerView;


}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{



}





#pragma mark ---
#pragma mark ------ UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 30;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger itemCount = 1;

    return itemCount;

}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath

{

    HomeCollectionCell *cell = [HomeCollectionCell collectionViewWithCollectionView:collectionView indexPath:indexPath identifier:@"tonView"];


    cell.contentView.backgroundColor = kAppBlueColor;

    if (indexPath.section%2 == 0) {
        cell.contentView.backgroundColor = kAppRedColor;
    }

    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    CGSize  size = CGSizeMake(SCREEN_WIDTH,125);
    return size;
}



-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{

    if (section == 0) {
        return UIEdgeInsetsMake(0, 5, 0, 5);

    }

    return UIEdgeInsetsMake(0, 0, 0, 5);
}

//  返回头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //如果是头视图
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {

        HomeCollectionReusableView *header = [HomeCollectionReusableView dequeueReusableHeaderFooterWithCollectionView:collectionView Kind:kind indexPath:indexPath];

        header.backgroundColor = [UIColor purpleColor];

        return header;
    }

    return nil;
}


@end
