//
//  UserInfoService.m
//  Core-project
//
//  Created by zhuhongwei on 16/7/25.
//  Copyright © 2016年 zhuhongwei. All rights reserved.
//

#import "UserInfoService.h"

#import "WSPersistenceContext.h"

@implementation UserInfoService

- (id)initWithContext:(WSPersistenceContext *)context {
    self = [super initWithContext:context];
    if (self) {
        [context registerClass:[userInfo class]];
    }
    return self;
}
-(void)saveUserInfoDataList:(userInfo*)lisetObject
{
    [_context executeInTransaction:^(FMDatabase *db) {
        [self saveOrUpdateObject:lisetObject];
        
    }];
    
}
- (NSArray *)getAllUserInfoData
{
    NSArray * resultList = (NSArray *)[self findObjectsByClass:[userInfo class] criteria:@""];
    
    return resultList;
}
@end
