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
{
    InvestViewController *cart;
}
@property (nonatomic, strong)   UIView *promptView;

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
    store.tabBarItem = [self tabbarItemWithTitle:@"金豆儿" andItemImage:@"tab_account"];
    HTNavigationController *nav1 = [[HTNavigationController alloc] initWithRootViewController:store];
    nav1.isContentLight = YES;
    
    cart = [[InvestViewController alloc]init];
    cart.isBuy = self.isBuy;
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



- (NSString *)promptText
{
    return @"";
}

- (void)showPromptView
{
    [self.view addSubview:self.promptView];
}

- (UIView *)promptView
{
    if (!_promptView) {
        _promptView = [[UIView alloc] initWithFrame:self.view.bounds];
        _promptView.backgroundColor = HTClearColor;
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:_promptView.bounds];
        imageView.image = HTImage(@"instruction");//instruction
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

- (void)changeMessageWith:(NSString *)message
{
    cart.notciceStr = message;
}

@end
