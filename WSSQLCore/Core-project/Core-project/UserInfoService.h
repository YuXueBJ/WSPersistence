//
//  UserInfoService.h
//  Core-project
//
//  Created by zhuhongwei on 16/7/25.
//  Copyright © 2016年 zhuhongwei. All rights reserved.
//

#import "WSPersistenceService.h"
#import "userInfo.h"

@interface UserInfoService : WSPersistenceService
-(void)saveUserInfoDataList:(userInfo*)lisetObject;
- (NSArray *)getAllUserInfoData;
@end
