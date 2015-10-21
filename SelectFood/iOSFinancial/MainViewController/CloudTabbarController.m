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

@property (nonatomic, strong)   UIView *promptView;

@end

@implementation CloudTabbarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (NSString *)promptText
{
    return @"";
}

- (UIView *)promptView
{
    if (!_promptView) {
        _promptView = [[UIView alloc] initWithFrame:self.view.bounds];
        _promptView.backgroundColor = HTClearColor;
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:_promptView.bounds];
        imageView.image = HTImage(@"zhezhao");
        [_promptView addSubview:imageView];
//        UIView *alphaView = [[UIView alloc] initWithFrame:self.view.bounds];
//        alphaView.backgroundColor = HTBlackColor;
//        alphaView.alpha = 1;
//        [_promptView addSubview:alphaView];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.numberOfLines = 4;
        titleLabel.textColor = HTWhiteColor;
        titleLabel.text = [self promptText];
        CGSize size = [titleLabel sizeThatFits:CGSizeMake(300, 200)];
        titleLabel.size = size;
        titleLabel.center = _promptView.center;
        [_promptView addSubview:titleLabel];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureTaped)];
        
        [_promptView addGestureRecognizer:tap];
    }

    return _promptView;
}

- (void)tapGestureTaped
{
    [UIView animateWithDuration:.25 animations:^{
        _promptView.alpha = 0;
    } completion:^(BOOL finished) {
        _isPromptShowed = YES;
        [_promptView removeFromSuperview];
    }];
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
- (void)addPromptView;
{
    [self.view addSubview:[self promptView]];
}
@end
