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
@property (nonatomic) UIButton *middlebtn;
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
    

}

- (void)setMiddleBtn
{
    [self.tabBar addSubview:self.middlebtn];
    [self.tabBar setBackgroundImage:HTImage(@"jingxuanhead1")];
}

- (UIButton *)middlebtn
{
    if (!_middlebtn) {
        _middlebtn =[[UIButton alloc]initWithFrame:CGRectMake(APPScreenWidth *.6, 0, APPScreenWidth*.4, 54)];
        [_middlebtn setImage:HTImage(@"jingxuanhead") forState:UIControlStateNormal];
        [_middlebtn setImage:HTImage(@"jingxuanhead") forState:UIControlStateHighlighted];
    }
    return _middlebtn;
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
    store.tabBarItem = [self tabbarItemWithTitle:@"附近" andItemImage:@"travel"];
    HTNavigationController *nav1 = [[HTNavigationController alloc] initWithRootViewController:store];
    nav1.isContentLight = YES;
    
    ViewController *cart = [[ViewController alloc]init];
    cart.tabBarItem = [self tabbarItemWithTitle:@"发现" andItemImage:@"direction"];
    HTNavigationController *nav2 = [[HTNavigationController alloc] initWithRootViewController:cart];
    nav2.isContentLight = YES;
    
    ViewController1 *find = [[ViewController1 alloc]init];
    find.tabBarItem = [self tabbarItemWithTitle:@"服务" andItemImage:@"commit"];
    find.btnFrame = CGRectMake(0, 60, APPScreenWidth, 200);
    HTNavigationController *nav3 = [[HTNavigationController alloc] initWithRootViewController:find];
    nav3.isContentLight = YES;
    
    ViewController2 *mySelf = [[ViewController2 alloc]init];
    mySelf.tabBarItem = [self tabbarItemWithTitle:@"我的" andItemImage:@"mySelf"];
    HTNavigationController *nav4 = [[HTNavigationController alloc] initWithRootViewController:mySelf];
    
    ViewController3 *viewC31 = [[ViewController3 alloc]init];
    viewC31.tabBarItem = [self tabbarItemWithTitle:@"消息" andItemImage:@"message"];
    HTNavigationController *viewC3 = [[HTNavigationController alloc] initWithRootViewController:viewC31];

    return @[nav1, nav2, nav3,viewC3, nav4];
}

- (UITabBarItem *)tabbarItemWithTitle:(NSString *)title andItemImage:(NSString *)imageStr
{
//    UIImage *selectImage = HTImage(HTSTR(@"%@H", imageStr));
    UIImage *normalImage = HTImage(HTSTR(@"%@", imageStr));
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:normalImage selectedImage:nil];
    
    return tabBarItem;
}


@end
