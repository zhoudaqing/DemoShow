//
//  HTTabBarController.m
//  iOSFinancial
//
//  Created by Mr.Yang on 15/3/27.
//  Copyright (c) 2015年 Mr.Yang. All rights reserved.
//

#import "HTTabBarController.h"
#import "HTNavigationController.h"
#import "FirstViewController.h"
#import "ViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
@interface HTTabBarController ()

@end

@implementation HTTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tabBar.translucent = NO;
    
    self.viewControllers = [self subViewControllers];
    
    //  去掉顶部的阴影线
    self.tabBar.clipsToBounds = YES;
    
    [self changeShowdImageColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tongzhi) name:@"chongzhitongzhi" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tongzhi1) name:@"chongzhitongzhigeren" object:nil];

}

- (void)tongzhi
{
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
}
- (void)tongzhi1
{
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
}
//  改变阴影线颜色
- (void)changeShowdImageColor
{
    CGRect rect = CGRectMake(0, 0, APPScreenWidth, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,HTHexColor(0xefeeee).CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.tabBar setShadowImage:img];
    [self.tabBar setBackgroundImage:[[UIImage alloc]init]];
}
 
- (NSArray *)subViewControllers
{
    FirstViewController *store = [[FirstViewController alloc]init];
    store.tabBarItem = [self tabbarItemWithTitle:@"身边" andItemImage:@"travel"];
    HTNavigationController *nav1 = [[HTNavigationController alloc] initWithRootViewController:store];
    nav1.isContentLight = YES;
    
    ViewController *cart = [[ViewController alloc]init];
    cart.tabBarItem = [self tabbarItemWithTitle:@"信息" andItemImage:@"direction"];
    HTNavigationController *nav2 = [[HTNavigationController alloc] initWithRootViewController:cart];
    nav2.isContentLight = YES;

    ViewController1 *find = [[ViewController1 alloc]init];
    find.tabBarItem = [self tabbarItemWithTitle:@"动态" andItemImage:@"commit"];
    HTNavigationController *nav3 = [[HTNavigationController alloc] initWithRootViewController:find];
    nav3.isContentLight = YES;

    ViewController2 *mySelf = [[ViewController2 alloc]init];
    mySelf.tabBarItem = [self tabbarItemWithTitle:@"我的" andItemImage:@"workofart"];
    HTNavigationController *nav4 = [[HTNavigationController alloc] initWithRootViewController:mySelf];
    nav4.isContentLight = YES;

    ViewController3 *viewC31 = [[ViewController3 alloc]init];
    viewC31.tabBarItem = [self tabbarItemWithTitle:@"发现" andItemImage:@"mySelf"];
    HTNavigationController *viewC3 = [[HTNavigationController alloc] initWithRootViewController:viewC31];
    viewC3.isContentLight = YES;

    return @[nav1, nav2, nav3,viewC3, nav4];
}

- (UITabBarItem *)tabbarItemWithTitle:(NSString *)title andItemImage:(NSString *)imageStr
{
    //UIImage *selectImage = HTImage(HTSTR(@"%@H", imageStr));
    UIImage *normalImage = HTImage(HTSTR(@"%@", imageStr));
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:normalImage selectedImage:nil];
    [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:103/255.0 green:193/255.0 blue:254/255.0 alpha:1],NSFontAttributeName : [UIFont systemFontOfSize:12]}forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],NSFontAttributeName : [UIFont systemFontOfSize:12]}forState:UIControlStateSelected];
    return tabBarItem;
}


@end
