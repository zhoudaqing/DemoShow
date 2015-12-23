//
//  FirstViewController.m
//  CommonProject
//
//  Created by Mr.Yang on 15/10/19.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "FirstViewController.h"
#import "CustomInvestGuideViewController.h"
#import "CloudTabbarController.h"
#import "UIBarButtonExtern.h"

@interface FirstViewController ()

@property (nonatomic) UITapGestureRecognizer *tap;

@end

@implementation FirstViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarItem.title = @"首页";
    [self.navigationController.navigationBar setBackgroundImage:HTImage(@"shouyehead") forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.leftBarButtonItem = [UIBarButtonExtern buttonWithTitle:@"" target:self andSelector:@selector(closeTabBar)];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.frame = CGRectMake(0, -20, APPScreenWidth, APPScreenHeight+40);
    __weakSelf;
    [self setImage:HTImage(@"shouye") WithTouchBlock:^(NSIndexPath *indexPath) {
        //  结算页面
        BaseDetailViewController *detail3 = [[BaseDetailViewController alloc] init];
        detail3.title = @"项目详情";
        [weakSelf.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        [detail3 setImage:HTImage(@"xiangmuxiangqing") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *detail4 = [[BaseDetailViewController alloc] init];
            detail4.title = @"下单";
            [detail4 setImage:HTImage(@"xiadan1") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                BaseDetailViewController *detail4 = [[BaseDetailViewController alloc] init];
                detail4.title = @"下单";
                [detail4 setImage:HTImage(@"xiadan2") WithTouchBlock:^(NSIndexPath *indexPath) {
                    
                    BaseDetailViewController *detail4 = [[BaseDetailViewController alloc] init];
                    detail4.title = @"下单";
                    [detail4 setImage:HTImage(@"xiadan3") WithTouchBlock:^(NSIndexPath *indexPath) {
                        
                        BaseDetailViewController *detail4 = [[BaseDetailViewController alloc] init];
                        detail4.title = @"提交订单";
                        __weak BaseDetailViewController *weakBase = detail4;
                        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 560, APPScreenWidth, 60)];
                        [btn addTarget:detail4 action:@selector(invested) forControlEvents:UIControlEventTouchUpInside];
                        [detail4.tableView addSubview:btn];
                        [detail4 setImage:HTImage(@"xiadan4") WithTouchBlock:^(NSIndexPath *indexPath) {
                            
                            if (weakBase.isOpen) {
                                [weakSelf.navigationController popToRootViewControllerAnimated:YES];
                            }else{
                                
                                BaseDetailViewController *detail5 = [[BaseDetailViewController alloc] init];
                                detail5.title = @"保险免费送";
                                
                                [detail5 setImage:HTImage(@"nigouwuwobaoyou") WithTouchBlock:^(NSIndexPath *indexPath) {
                                    
                                    
                                    
                                    BaseDetailViewController *detail9 = [[BaseDetailViewController alloc] init];
                                    detail9.title = @"绑定验证";
                                    
                                    [detail9 setImage:HTImage(@"kaihuxingmingyanzheng") WithTouchBlock:^(NSIndexPath *indexPath) {
                                        if (weakSelf.isOpen) {
                                            [weakSelf.navigationController popToRootViewControllerAnimated:YES];
                                        }else{
                                            [weakSelf setAlerConten:@"恭喜，您已获得由燃点提供的人身意外险一份，请返回查看" withLeftBtn:@"我知道了" rightBtn:nil];
                                            [weakBase refreshView:HTImage(@"xiadan4back")];
                                            weakBase.isOpen = YES;
                                        }
                                    }];
                                    detail9.hidesBottomBarWhenPushed = YES;
                                    [weakSelf.navigationController pushViewController:detail9 animated:YES];
                                    
                                }];
                                detail5.hidesBottomBarWhenPushed = YES;
                                [weakSelf.navigationController pushViewController:detail5 animated:YES];

                            }
                            
                            
                            
                            
                            
                        }];
                        detail4.hidesBottomBarWhenPushed = YES;
                        [weakSelf.navigationController pushViewController:detail4 animated:YES];
                        
                        
                    }];
                    detail4.hidesBottomBarWhenPushed = YES;
                    [weakSelf.navigationController pushViewController:detail4 animated:YES];
                    
                    
                }];
                detail4.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:detail4 animated:YES];
                
                
            }];
            detail4.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:detail4 animated:YES];
            
        }];
        detail3.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detail3 animated:YES];    }];
    
}

- (void)closeTabBar
{
    [self dismissViewController];
}


@end


