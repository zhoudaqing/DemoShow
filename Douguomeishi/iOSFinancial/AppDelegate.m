//
//  AppDelegate.m
//  iOSFinancial
//
//  Created by Mr.Yang on 15/3/26.
//  Copyright (c) 2015年 Mr.Yang. All rights reserved.
//

#import "AppDelegate.h"
#import "YTKNetworkConfig.h"
#import "HTGuideManager.h"
#import "HTVersionManager.h"
#import "UIAlertView+RWBlock.h"
#import "SystemConfig.h"


#define UMSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define _IPHONE80_ 80000


@interface AppDelegate () <HTGuideManagerDelegate>


@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 
    [self initFinishLaunch:application andOption:launchOptions];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = self.tabBarController;

    [self.window makeKeyAndVisible];

    return YES;
}

- (HTTabBarController *)tabBarController
{
    if (!_tabBarController) {
        _tabBarController = [[HTTabBarController alloc] init];
    }

    return _tabBarController;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSString *token =
    [[[[deviceToken description] stringByReplacingOccurrencesOfString:@"<" withString:@""] stringByReplacingOccurrencesOfString:@">" withString:@""]stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    token = nil;
}

- (void)guideManagerWantDisappear:(HTGuideManager *)guideManager
{

}

#pragma mark - Appdelegate
#pragma mark -

- (void)initFinishLaunch:(UIApplication *)application  andOption:(NSDictionary *)launchOptions
{
    //  MARK:系统样式
    [self initAppStyle];
}

//  MARK: Setting
- (void)initAppStyle
{
    //  去掉tabbar底下的黑线 (顶部的阴影线 是 shoadowImage 造成的)
    [[UITabBar appearance] setTintColor:[UIColor redColor]];
    
    //  修改navigation Bar底下的黑色线
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setShadowImage:HTImage(@"")];//[[UIImage alloc] init]
    
    //修改返回按钮图片
    [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"returnH"]];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"returnH"]];
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor],NSFontAttributeName : [UIFont systemFontOfSize:18]}];
    [[UITableView appearance] setSeparatorColor:[UIColor jt_lineColor]];
    
    [[UISwitch appearance] setOnTintColor:[UIColor redColor]];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -160)
                                                         forBarMetrics:UIBarMetricsDefault];
}


@end
