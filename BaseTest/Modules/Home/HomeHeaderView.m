


//
//  HomeHeaderView.m
//  BaseTest
//
//  Created by 蒋玉顺 on 2018/2/7.
//  Copyright © 2018年 蒋玉顺. All rights reserved.
//

#import "HomeHeaderView.h"

@implementation HomeHeaderView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {

        [self initTheSubViews];


    }
    return self;

}

-(void)initTheSubViews
{
    self.backgroundColor = [UIColor redColor];

    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"HomeHeaderView";
    titleLabel.frame = CGRectMake(5, 0, 200, 30);
    titleLabel.textColor = [UIColor redColor];
    titleLabel.backgroundColor = [UIColor whiteColor];
    [self addSubview:titleLabel];

    
}
@end
