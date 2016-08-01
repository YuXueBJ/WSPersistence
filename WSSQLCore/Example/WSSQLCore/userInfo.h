//
//  userInfo.h
//  Core-project
//
//  Created by zhuhongwei on 16/7/25.
//  Copyright © 2016年 zhuhongwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WSPersistenceObject.h"

@interface userInfo : WSPersistenceObject<NSCoding>

@property (nonatomic,strong)NSString * name;
@property (nonatomic,strong)NSString * sex;
@property (nonatomic,strong)NSString * des;
@property (nonatomic,strong)NSNumber * userID;

- (id)initWithJson:(NSDictionary *)json;
@end
