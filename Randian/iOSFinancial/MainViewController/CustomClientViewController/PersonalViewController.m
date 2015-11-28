//
//  PersonalViewController.m
//  FreshLife
//
//  Created by Mr.Yang on 15/10/16.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "PersonalViewController.h"
#import "UIBarButtonExtern.h"

@interface PersonalViewController ()

@end

@implementation PersonalViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBarTintColor:HTWhiteColor];
    [self.navigationController.navigationBar setTintColor:[UIColor jt_barTintColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor],NSFontAttributeName : [UIFont systemFontOfSize:18]}];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"个人中心";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonExtern buttonWithTitle:@"关闭" target:self andSelector:@selector(closeTabBar)];
    
    __weakSelf;
    [self setImage:HTImage(@"personalIndex") WithTouchBlock:^(NSIndexPath *indexPath) {
        [weakSelf doInvest];
    }];
    
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
