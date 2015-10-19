//
//  AppDelegate.m
//  Tiaoshi
//
//  Created by Mr.Yan on 15/10/12.
//  Copyright © 2015年 Mr.Yan. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //1.创建Window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
         //a.初始化一个tabBar控制器
    UITabBarController *tb=[[UITabBarController alloc]init];
    //设置控制器为Window的根控制器
    self.window.rootViewController=tb;
    
         //b.创建子控制器
    UIViewController *c1=[[UIViewController alloc]init];
    c1.view.backgroundColor=[UIColor grayColor];
    c1.view.backgroundColor=[UIColor greenColor];
    c1.tabBarItem.title=@"首页";
    c1.tabBarItem.image=[UIImage imageNamed:@"tabbar_home"];
    c1.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_homeH@2x"];
    UIImageView *c1Image = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [c1Image setImage:[UIImage imageNamed:@"IMG_1456"]];
    [c1.view addSubview:c1Image];
    

    
    UIViewController *c2=[[UIViewController alloc]init];
    c2.view.backgroundColor=[UIColor brownColor];
    c2.tabBarItem.title=@"订单";
    c2.tabBarItem.image=[UIImage imageNamed:@"tabbar_itemlist"];
    c2.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_itemlistH@2x"];
    UIImageView *c2Image = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [c2Image setImage:[UIImage imageNamed:@"IMG_1455"]];
    [c2.view addSubview:c2Image];

    ViewController  *c=[[ViewController alloc]init];
    UINavigationController *c3 = [[UINavigationController alloc]initWithRootViewController:c];
    c3.tabBarItem.title=@"我的";
    c3.tabBarItem.image=[UIImage imageNamed:@"tabbar_usercenter"];
    

         //c.添加子控制器到ITabBarController中
         //c.1第一种方式
     //    [tb addChildViewController:c1];
     //    [tb addChildViewController:c2];
    
         //c.2第二种方式
    tb.viewControllers=@[c1,c2,c3];
    
    
         //2.设置Window为主窗口并显示出来
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
