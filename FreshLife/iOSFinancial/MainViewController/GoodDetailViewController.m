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
    __weakSelf;
    detail.title = @"授权页面";
    detail.hidesBottomBarWhenPushed = YES;
    [weakSelf.navigationController pushViewController:detail animated:YES];
    detail.view.hidden = YES;
    detail.view.hidden = NO;
    
    [detail setImage:HTImage(@"jianGuoDetail") WithTouchBlock:^(NSIndexPath *indexPath) {
        [self changeBottomView];
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(50, -280, APPScreenWidth - 100, 60)];
        lable.text = @"恭喜授权成功~！";
        lable.textAlignment = NSTextAlignmentCenter;
        lable.backgroundColor = [UIColor  blackColor];
        lable.textColor = [UIColor whiteColor];
        [self.bottomView addSubview:lable];
        
        //创建通知
        NSNotification *notification =[NSNotification notificationWithName:@"huodongtongzhi" object:nil userInfo:nil];
        //通过通知中心发送通知
        [[NSNotificationCenter defaultCenter] postNotification:notification];
        
        [UIView animateWithDuration:1.8 animations:^{
            lable.alpha = 0.3;
        } completion:^(BOOL finished) {
            [lable removeFromSuperview];
        }];
        [weakSelf dismissViewController];
        [self.view bringSubviewToFront:self.bottomView];
    }];
}

- (void)changeBottomView
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(101, 0, 135, 44)];
    view.backgroundColor = [UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1];
    [self.bottomView addSubview:view];
}

- (NSString *)title
{
    return @"-";
}

@end
