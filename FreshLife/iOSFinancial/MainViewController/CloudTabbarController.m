//
//  CloudTabbarController.m
//  FreshLife
//
//  Created by Mr.Yang on 15/10/16.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "CloudTabbarController.h"
#import "CloudAccountViewController.h"
#import "InvestViewController.h"
#import "PersonalViewController.h"


@interface CloudTabbarController ()

@end

@implementation CloudTabbarController

- (void)refreshView
{
    //  投资
    if (_showType == ShowTypeInvest) {
        
        //  选中投资页面
        self.selectedIndex = 1;
        
        //  有广告页
        if (_actionImage) {
            [self showActionPageViewController];
            
        }
        
    }else {
        
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)showActionPageViewController
{
    BaseDetailViewController *action = [[BaseDetailViewController alloc] init];
    
    __weak BaseDetailViewController *weakAction = action;
    [action setImage:_actionImage WithTouchBlock:^(NSIndexPath *indexPath) {
        [weakAction dismissViewController];
    }];
    
    [self presentViewController:action animated:NO completion:nil];
}

- (NSArray *)subViewControllers
{
    CloudAccountViewController *store = [[CloudAccountViewController alloc]init];
    store.tabBarItem = [self tabbarItemWithTitle:@"云账户" andItemImage:@"tab_account"];
    HTNavigationController *nav1 = [[HTNavigationController alloc] initWithRootViewController:store];
    nav1.isContentLight = YES;

    InvestViewController *cart = [[InvestViewController alloc]init];
    cart.tabBarItem = [self tabbarItemWithTitle:@"我要理财" andItemImage:@"tab_invest"];
    HTNavigationController *nav2 = [[HTNavigationController alloc] initWithRootViewController:cart];
    nav2.isContentLight = YES;
    
    PersonalViewController *find = [[PersonalViewController alloc]init];
    find.tabBarItem = [self tabbarItemWithTitle:@"个人中心" andItemImage:@"tab_personal"];
    HTNavigationController *nav3 = [[HTNavigationController alloc] initWithRootViewController:find];
    nav3.isContentLight = YES;
    
    return @[nav1, nav2, nav3];
}

- (UITabBarItem *)tabbarItemWithTitle:(NSString *)title andItemImage:(NSString *)imageStr
{
    UIImage *selectImage = HTImage(HTSTR(@"%@_2", imageStr));
    UIImage *normalImage = HTImage(HTSTR(@"%@_1", imageStr));
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:normalImage selectedImage:selectImage];
    
    return tabBarItem;
}

@end
