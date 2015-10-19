//
//  GoodDetailViewController.m
//  FreshLife
//
//  Created by Mr.Yang on 15/10/15.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "GoodDetailViewController.h"
#import "UIView+BorderColor.h"
#import "StoreDetailViewController.h"
#import "CloudTabbarController.h"


@interface GoodDetailViewController ()

@property (nonatomic, strong) UIImageView *bottomView;

@property (nonatomic, strong) UITapGestureRecognizer *tap;

@end

@implementation GoodDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    [self setImage:HTImage(@"goodDetail") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        
    }];
    
    [self.view addSubview:self.bottomView];
    self.bottomView.bottom = self.view.bottom;
    
    UIButton *cartButton = [self button];
    cartButton.tag = 1000;
    cartButton.frame = CGRectMake(0, 0, 58, 44);
    
    UIButton *addCard = [self button];
    addCard.tag = 1001;
    addCard.frame = CGRectMake(APPScreenWidth - 140, 0, 140, 44);
    
    [self.bottomView addSubview:cartButton];
    [self.bottomView addSubview:addCard];
    
}

- (void)buttonClicked:(UIButton *)button
{
    
    //  购物车
    self.tabBarController.selectedIndex = 1;
    [self.navigationController popToRootViewControllerAnimated:NO];
    
    return;
    /*
    if (button.tag == 1000) {
        //  购物车
        self.tabBarController.selectedIndex = 1;
        [self.navigationController popToRootViewControllerAnimated:NO];
        
    }else {
        
    }
     */
    
}

- (UIButton *)button
{
    UIButton *cartButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cartButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return cartButton;
}

- (void)viewWillLayoutSubviews
{
    self.bottomView.bottom = self.view.bottom;
}

- (UIImageView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APPScreenWidth, 44)];
        _bottomView.image = HTImage(@"bottomBar");
        _bottomView.userInteractionEnabled = YES;
        [_bottomView addGestureRecognizer:self.tap];
        
    }

    return _bottomView;
}

- (UITapGestureRecognizer *)tap
{
    if (!_tap) {
        _tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showgoodsList)];
    }
    return _tap;
}

- (void)showgoodsList
{
    StoreDetailViewController *detail = [[StoreDetailViewController alloc] init];
    detail.title = @"活动详情";
    __weakSelf;
    
    detail.hidesBottomBarWhenPushed = YES;
    [weakSelf.navigationController pushViewController:detail animated:YES];
    detail.view.hidden = YES;
    detail.view.hidden = NO;
    
    [detail setImage:HTImage(@"jianGuoDetail") WithTouchBlock:^(NSIndexPath *indexPath) {
        CloudTabbarController *tabbar = [[CloudTabbarController alloc] init];
        tabbar.selectedIndex = 1;
        [weakSelf presentViewController:tabbar animated:YES completion:nil];
    }];
}

- (NSString *)title
{
    return @"商品列表";
}

@end
