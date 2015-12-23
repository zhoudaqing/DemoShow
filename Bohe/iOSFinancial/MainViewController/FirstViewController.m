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

@interface FirstViewController ()

@property (nonatomic) UITapGestureRecognizer *tap;

@end

@implementation FirstViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.frame = CGRectMake(0, -20, APPScreenWidth, APPScreenHeight+40);
    __weakSelf;
    [self setImage:HTImage(@"shouye") WithTouchBlock:^(NSIndexPath *indexPath) {
        //  结算页面
        BaseDetailViewController *detail3 = [[BaseDetailViewController alloc] init];
        detail3.isHidnBar = YES;
        [weakSelf.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        [detail3 setImage:HTImage(@"xuanzeriqi") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *detail4 = [[BaseDetailViewController alloc] init];
            detail4.isHidnBar = YES;
            __weak BaseDetailViewController *weakBase = detail4;
            [detail4 setImage:HTImage(@"jilutizhong") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                if (weakBase.isOpen) {
                    CloudTabbarController *VC = [[CloudTabbarController alloc]init];
                    [VC showPromptView];
                    [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];

                }else
                {
                    BaseDetailViewController *detail5 = [[BaseDetailViewController alloc] init];
                    detail5.title = @"你购物我包邮";
                    
                    [detail5 setImage:HTImage(@"nigouwuwobaoyou") WithTouchBlock:^(NSIndexPath *indexPath) {
                        
                        
                        
                        BaseDetailViewController *detail9 = [[BaseDetailViewController alloc] init];
                        detail9.title = @"绑定验证";
                        
                        [detail9 setImage:HTImage(@"kaihuxingmingyanzheng") WithTouchBlock:^(NSIndexPath *indexPath) {
                            
                            [weakSelf setAlerConten:@"恭喜，您的薄荷金融服务已开通，同时也已获得了1元现金，连续7天记录体重即可每天都获得1元现金哦~" withLeftBtn:@"我知道了" rightBtn:nil];
                            [weakBase refreshView:HTImage(@"jilutizhongback")];
                            weakBase.isOpen = YES;
                        }];
                        detail9.hidesBottomBarWhenPushed = YES;
                        [weakSelf.navigationController pushViewController:detail9 animated:YES];
                        
                    }];
                    detail5.hidesBottomBarWhenPushed = YES;
                    [weakSelf.navigationController pushViewController:detail5 animated:YES];
                }
                
                
            }];
            detail4.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:detail4 animated:NO];
            
        }];
        detail3.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detail3 animated:YES];    }];
    
}

@end


