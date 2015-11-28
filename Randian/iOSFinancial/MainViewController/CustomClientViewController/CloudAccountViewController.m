//
//  CloudAccountViewController.m
//  FreshLife
//
//  Created by Mr.Yang on 15/10/16.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "CloudAccountViewController.h"
#import "UIBarButtonExtern.h"
#import "CloudTabbarController.h"

@interface CloudAccountViewController ()


@end

@implementation CloudAccountViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBarTintColor:HTWhiteColor];
    [self.navigationController.navigationBar setTintColor:[UIColor jt_barTintColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor],NSFontAttributeName : [UIFont systemFontOfSize:18]}];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"薄荷金融";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonExtern buttonWithTitle:@"关闭" target:self andSelector:@selector(closeTabBar)];
    
    __weakSelf;
    [self setImage:HTImage(@"unLoginIndex") WithTouchBlock:^(NSIndexPath *indexPath) {
        [weakSelf doNext];
    }];
    
}

- (void)doNext
{
    __weakSelf;
    
    CloudTabbarController *tabbar = (CloudTabbarController *)self.navigationController.tabBarController;
    if (!tabbar.isLogin) {
        
        BaseDetailViewController *buy = [[BaseDetailViewController alloc] init];
        buy.title = @"买入基金";
        [buy setImage:HTImage(@"buyStep0") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            //  验证真实姓名
            BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
            regedit.title = @"验证真实姓名";
            [regedit setImage:HTImage(@"validateUserName") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                //  设置密码
                BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                regedit.title = @"设置密码";
                [regedit setImage:HTImage(@"setPass") WithTouchBlock:^(NSIndexPath *indexPath) {
                    
                    //  绑定银行卡
                    BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                    regedit.title = @"绑定银行卡";
                    [regedit setImage:HTImage(@"setAccount") WithTouchBlock:^(NSIndexPath *indexPath) {
                        
                        //  登陆完成
                        CloudTabbarController *tabbar = (CloudTabbarController *)self.navigationController.tabBarController;
                        tabbar.isLogin = YES;
                        
                        BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                        regedit.title = @"买入金额";
                        [regedit setImage:HTImage(@"buyStep1") WithTouchBlock:^(NSIndexPath *indexPath) {
                            
                            BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                            regedit.title = @"输入验证码";
                            [regedit setImage:HTImage(@"buyStep2") WithTouchBlock:^(NSIndexPath *indexPath) {
                                
                                BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                                regedit.title = @"输入完成";
                                [regedit setImage:HTImage(@"client_invest_success") WithTouchBlock:^(NSIndexPath *indexPath) {
                                    
                                    [weakSelf.navigationController popToRootViewControllerAnimated:YES];
                                }];
                                
                                [weakSelf.navigationController pushViewController:regedit animated:YES];
                            }];
                            
                            [weakSelf.navigationController pushViewController:regedit animated:YES];
                            
                        }];
                        
                        [weakSelf.navigationController pushViewController:regedit animated:YES];
                        
                    }];
                    
                    [weakSelf.navigationController pushViewController:regedit animated:YES];
                    
                }];
                
                [weakSelf.navigationController pushViewController:regedit animated:YES];
                
            }];
            
            [weakSelf.navigationController pushViewController:regedit animated:YES];
            
        }];
        
        buy.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:buy animated:YES];
        
    }else {
        
        [weakSelf doInvest];
    }
}

- (void)doInvest
{
    __weakSelf;
    
    BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
    regedit.title = @"买入基金";
    [regedit setImage:HTImage(@"buyStep0") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
        regedit.title = @"买入金额";
        [regedit setImage:HTImage(@"buyStep1") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
            regedit.title = @"输入验证码";
            [regedit setImage:HTImage(@"buyStep2") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                regedit.title = @"输入完成";
                [regedit setImage:HTImage(@"client_invest_success") WithTouchBlock:^(NSIndexPath *indexPath) {
                    
                    [weakSelf.navigationController popToRootViewControllerAnimated:YES];
                }];
                
                regedit.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:regedit animated:YES];
            }];
            
            regedit.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:regedit animated:YES];
            
        }];
        
        regedit.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:regedit animated:YES];
        
    }];
    
    regedit.hidesBottomBarWhenPushed = YES;
    [weakSelf.navigationController pushViewController:regedit animated:YES];
}


- (void)closeTabBar
{
    [self dismissViewController];
}
@end
