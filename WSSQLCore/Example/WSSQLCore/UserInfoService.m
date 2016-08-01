//
//  UserInfoService.m
//  Core-project
//
//  Created by zhuhongwei on 16/7/25.
//  Copyright © 2016年 zhuhongwei. All rights reserved.
//

#import "UserInfoService.h"

@interface UserInfoService ()

@property (nonatomic,strong)Class userInfoClass;
@end

@implementation UserInfoService

- (id)initWithContext:(WSPersistenceContext *)context {
    self = [super initWithContext:context];
    if (self) {
        
        self.userInfoClass = [userInfo class];
        [context registerClass:self.userInfoClass];
        
        
    }
    return self;
}
//保存
-(void)saveUserInfoDataList:(userInfo*)lisetObject
{
    [_context executeInTransaction:^(FMDatabase *db) {
        [self saveOrUpdateObject:lisetObject];
        
    }];
    
}
- (NSArray *)getUserListData:(NSNumber*)userId
{
//    由于coding保存是小写字母 所有存储到数据库的大写字母都转换成了小写并且在前面添加了_
    NSString *criteriaStr =[NSString stringWithFormat:@"where user_i_d ='%@'",userId];
    NSArray *resultList = (NSArray *)[self findObjectsByClass:self.userInfoClass criteria:criteriaStr];
    return resultList;
}
//获取全部
- (NSArray *)getAllUserInfoData
{
    NSArray * resultList = (NSArray *)[self findObjectsByClass:self.userInfoClass criteria:@""];
    
    return resultList;
}
//删除全部
- (void)deleteAllHomeList {
    [self deleteObjectsByClass:self.userInfoClass criteria:@""];
}
@end
