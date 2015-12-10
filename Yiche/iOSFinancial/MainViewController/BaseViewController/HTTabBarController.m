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
    store.tabBarItem = [self tabbarItemWithTitle:@"头条" andItemImage:@"travel"];
    HTNavigationController *nav1 = [[HTNavigationController alloc] initWithRootViewController:store];
    
    ViewController *cart = [[ViewController alloc]init];
    cart.tabBarItem = [self tabbarItemWithTitle:@"社区" andItemImage:@"direction"];
    HTNavigationController *nav2 = [[HTNavigationController alloc] initWithRootViewController:cart];
    
    ViewController1 *find = [[ViewController1 alloc]init];
    find.tabBarItem = [self tabbarItemWithTitle:@"选车" andItemImage:@"commit"];
    HTNavigationController *nav3 = [[HTNavigationController alloc] initWithRootViewController:find];
    
    ViewController2 *mySelf = [[ViewController2 alloc]init];
    mySelf.tabBarItem = [self tabbarItemWithTitle:@"我的" andItemImage:@"mySelf"];
    HTNavigationController *nav4 = [[HTNavigationController alloc] initWithRootViewController:mySelf];
    
    ViewController3 *viewC31 = [[ViewController3 alloc]init];
    viewC31.tabBarItem = [self tabbarItemWithTitle:@"优惠" andItemImage:@"workofart"];
    HTNavigationController *viewC3 = [[HTNavigationController alloc] initWithRootViewController:viewC31];

    return @[nav1, nav2, nav3,viewC3, nav4];
}

- (UITabBarItem *)tabbarItemWithTitle:(NSString *)title andItemImage:(NSString *)imageStr
{
    //UIImage *selectImage = HTImage(HTSTR(@"%@H", imageStr));
    UIImage *normalImage = HTImage(HTSTR(@"%@", imageStr));
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:normalImage selectedImage:nil];
    
    return tabBarItem;
}


@end
