//
//  ViewController.m
//  Core-project
//
//  Created by zhuhongwei on 16/7/25.
//  Copyright © 2016年 zhuhongwei. All rights reserved.
//

#import "ViewController.h"
#import "WSPersistenceContext.h"
#import "UserInfoService.h"
#import "userInfo.h"

@interface ViewController ()

@property (nonatomic,strong)WSPersistenceContext * homePersistenceContext;
@property (nonatomic,strong)UserInfoService * userInfoData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self startCreateSqlit];
    
//------------------------------------------------------------------
//初始化
    NSDictionary * dic = @{@"name":@"mo",
                           @"sex":@"女",
                           @"id":@(98),
                           @"des":@"回家第三方"};
    userInfo * data = [[userInfo alloc] initWithJson:dic];
//------------------------------------------------------------------
    
//------------------------------------------------------------------
//存数据库
    [self.userInfoData saveUserInfoDataList:data];
//------------------------------------------------------------------
    
  
//------------------------------------------------------------------
//获取全部数据
    NSArray * list = [self.userInfoData getAllUserInfoData];
    for (userInfo * temp in list ) {
        NSLog(@"%@",temp);
        NSLog(@"-----------");
        NSLog(@"%@",temp.name);
    }
//------------------------------------------------------------------
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)startCreateSqlit
{
    
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [documentPaths objectAtIndex:0];
    
    NSString *databaseFolderPath = [documentPath stringByAppendingPathComponent:@"DATABASE"];
    
//    NSString *userId = [NSString stringWithFormat:@"%@", @"test"];
//    NSLog(@"changeDBDir by userId : %@",userId);
//    databaseFolderPath = [databaseFolderPath stringByAppendingPathComponent:userId];
    databaseFolderPath = [databaseFolderPath stringByAppendingPathComponent:@"USERDATA"];
    NSString *userId = [NSString stringWithFormat:@"%@", @"xxxx"];
     databaseFolderPath = [databaseFolderPath stringByAppendingPathComponent:userId];
    
//    //删除用户缓存数据
//    if ([[NSFileManager defaultManager] fileExistsAtPath:databaseFolderPath]) {
//        NSNumber *isfirstLaunching = [[NSUserDefaults standardUserDefaults] objectForKey:APPCONTEXT.config.version];
//        if (!isfirstLaunching || isfirstLaunching.intValue == 0) {
//            BOOL removeSuccess = [[NSFileManager defaultManager] removeItemAtPath:databaseFolderPath error:nil];
//            NSAssert(removeSuccess, @"remove folder failed,%@", databaseFolderPath);
//            NSLog(@"removeSuccess==%d",removeSuccess);
//            [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:1] forKey:APPCONTEXT.config.version];
//        }
//    } else {
//        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:1] forKey:APPCONTEXT.config.version];
//    }
    
    
    BOOL createSuccess = [[NSFileManager defaultManager] createDirectoryAtPath:databaseFolderPath
                                                   withIntermediateDirectories:YES attributes:nil error:nil];
    NSAssert(createSuccess, @"create folder failed,%@", databaseFolderPath);
    NSLog(@"createSuccess==%d",createSuccess);
//    NSString *databaseFilePath = [databaseFolderPath stringByAppendingPathComponent:@"userInfo.sqlite"];
//    _userPersistenceContext = [[RSPersistenceContext alloc] initWithDbFilePath:databaseFilePath];
    
    NSString *databaseFilePath = [databaseFolderPath stringByAppendingPathComponent:@"userInfo.sqlite"];
    _homePersistenceContext = [[WSPersistenceContext alloc] initWithDbFilePath:databaseFilePath];
    
//    databaseFilePath = [databaseFolderPath stringByAppendingPathComponent:@"talkList.sqlite"];
//    _talkPersistenceContext = [[RSPersistenceContext alloc] initWithDbFilePath:databaseFilePath];
//    
//    databaseFilePath = [databaseFolderPath stringByAppendingPathComponent:@"campList.sqlite"];
//    _campPersistenceContext = [[RSPersistenceContext alloc] initWithDbFilePath:databaseFilePath];
//    
//    databaseFilePath = [databaseFolderPath stringByAppendingPathComponent:@"hotGirl.sqlite"];
//    _hotGirlPersistenceContext = [[RSPersistenceContext alloc] initWithDbFilePath:databaseFilePath];
//    
//    databaseFilePath = [databaseFolderPath stringByAppendingPathComponent:@"dreamList.sqlite"];
//    _dreamListPersistenceContext =[[RSPersistenceContext alloc] initWithDbFilePath:databaseFilePath];
//    
//    databaseFilePath = [databaseFolderPath stringByAppendingPathComponent:@"adsList.sqlite"];
//    _rSCoverListContext =[[RSPersistenceContext alloc] initWithDbFilePath:databaseFilePath];
    
    ////////////////////////////////////////////////////////////////////////
    [self userInfoData];

}
-(UserInfoService*)userInfoData
{
    if (!_userInfoData) {
        _userInfoData=[[UserInfoService alloc] initWithContext:self.homePersistenceContext];
    }
    return _userInfoData;
}
@end
