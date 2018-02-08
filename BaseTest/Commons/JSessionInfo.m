
//
//  JSessionInfo.m
//  TianyiClient
//
//  Created by 蒋玉顺 on 2017/5/4.
//  Copyright © 2017年 cn.tianyilm. All rights reserved.
//

#import "JSessionInfo.h"

static JSessionInfo *sessionInfo = nil;

@implementation JSessionInfo

@synthesize registerDic;
@synthesize userDic;

+ (JSessionInfo *)sharedInstance
{
    
    @synchronized(self){
        
        if (!sessionInfo)
        {
            sessionInfo = [[JSessionInfo alloc] init];
            
            sessionInfo.registerDic = [NSDictionary dictionary];
            sessionInfo.userDic = [NSMutableDictionary dictionary];
            sessionInfo.searchRecordArr = [NSMutableArray array];


        }
    }
    
    return sessionInfo;
}

- (id) copyWithZone:(NSZone*)zone
{
    return self;
}

-(id)init
{
    self=[super init];
    
    if (self)
    {
    }
    
    return self;
}


@end
