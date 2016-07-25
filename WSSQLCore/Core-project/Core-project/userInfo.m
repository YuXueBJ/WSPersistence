//
//  userInfo.m
//  Core-project
//
//  Created by zhuhongwei on 16/7/25.
//  Copyright © 2016年 zhuhongwei. All rights reserved.
//

#import "userInfo.h"

static NSString * kuser_Name = @"name";
static NSString * kuser_sex = @"sex";
static NSString * kuser_id = @"id";
static NSString * kuser_des = @"des";

@implementation userInfo

- (id)initWithJson:(NSDictionary *)json {
    self = [super init];
    if(self) {
         self.name      = [json objectForKey:kuser_Name];
        self.sex      = [json objectForKey:kuser_sex];
        self.userID      = [json objectForKey:kuser_id];
        self.des      = [json objectForKey:kuser_des];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self){
        self.name      = [aDecoder decodeObjectForKey:kuser_Name];
        self.sex      = [aDecoder decodeObjectForKey:kuser_sex];
        self.userID      = [aDecoder decodeObjectForKey:kuser_id];
        self.des      = [aDecoder decodeObjectForKey:kuser_des];
    }
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:kuser_Name];
    [aCoder encodeObject:self.sex forKey:kuser_sex];
    [aCoder encodeObject:self.userID forKey:kuser_id];
    [aCoder encodeObject:self.des forKey:kuser_des];
}
-(NSString*)description{
    
    NSString *  result = @"";
                result = [result stringByAppendingFormat:@"name : %@\n",self.name];
    
    return result;
}
@end
