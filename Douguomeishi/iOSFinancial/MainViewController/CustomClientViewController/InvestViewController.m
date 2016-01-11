//
//  InvestViewController.m
//  FreshLife
//
//  Created by Mr.Yang on 15/10/16.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "InvestViewController.h"
#import "UIBarButtonExtern.h"
#import "CloudTabbarController.h"

@interface InvestViewController ()

@property (nonatomic)UIView *promptView;

@end

@implementation InvestViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBarTintColor:HTWhiteColor];
    [self.navigationController.navigationBar setTintColor:[UIColor jt_barTintColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor],NSFontAttributeName : [UIFont systemFontOfSize:18]}];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"我要理财";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonExtern buttonWithTitle:@"关闭" target:self andSelector:@selector(closeTabBar)];
    
    if (self.isBuy) {
        [self doInvest];
    }else{
    
    __weakSelf;
    [self setImage:HTImage(@"InvestIndex") WithTouchBlock:^(NSIndexPath *indexPath) {
        [weakSelf doNext];
    }];
    }
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, APPScreenWidth, 44)];
    [self.tableView addSubview:btn];
    [btn addTarget:self action:@selector(pushHongbao) forControlEvents:UIControlEventTouchUpInside];
}

- (void)doNext
{
    __weakSelf;
    
    CloudTabbarController *tabbar = (CloudTabbarController *)self.navigationController.tabBarController;
    if (!tabbar.isLogin) {
        
        BaseDetailViewController *buy = [[BaseDetailViewController alloc] init];
        buy.title = @"买入基金";
        int btnY;
        if (is55Inch) {
            btnY = APPScreenHeight;
        }else
        {
            btnY = APPScreenHeight+95;
        }
        buy.btnFrame = CGRectMake(0, btnY, APPScreenWidth, 60);
        [buy setImage:HTImage(@"buyStep0") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            //  验证真实姓名
            BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
            regedit.title = @"验证真实姓名";
            regedit.btnFrame = CGRectMake(0, 198, APPScreenWidth, 58);
            [regedit setImage:HTImage(@"validateUserName") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                //  设置密码
                BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                regedit.title = @"设置密码";
                regedit.btnFrame = CGRectMake(0, 243, APPScreenWidth, 58);
                [regedit setImage:HTImage(@"setPass") WithTouchBlock:^(NSIndexPath *indexPath) {
                    
                    //  绑定银行卡
                    BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                    regedit.title = @"绑定银行卡";
                    regedit.btnFrame = CGRectMake(0, 256, APPScreenWidth, 58);
                    [regedit setImage:HTImage(@"setAccount") WithTouchBlock:^(NSIndexPath *indexPath) {
                        
                        //  登陆完成
                        CloudTabbarController *tabbar = (CloudTabbarController *)self.navigationController.tabBarController;
                        tabbar.isLogin = YES;
                        
                        BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                        regedit.title = @"买入金额";
                        regedit.btnFrame = CGRectMake(0, 268, APPScreenWidth, 58);
                        [regedit setImage:HTImage(@"buyStep1") WithTouchBlock:^(NSIndexPath *indexPath) {
                            
                            BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                            regedit.title = @"输入验证码";
                            regedit.btnFrame = CGRectMake(0, 118, APPScreenWidth, 58);
                            [regedit setImage:HTImage(@"buyStep2") WithTouchBlock:^(NSIndexPath *indexPath) {
                                
                                BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                                regedit.title = @"输入完成";
//                                [regedit setAlerConten:self.notciceStr withLeftBtn:@"我知道了" rightBtn:nil];
                                regedit.btnFrame = CGRectMake(0, 254, APPScreenWidth, 58);
                                [regedit setImage:HTImage(@"client_invest_success") WithTouchBlock:^(NSIndexPath *indexPath) {
                                    
                                    weakSelf.tabBarController.selectedIndex = 0;

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
    int btnY;
    if (is55Inch) {
        btnY = APPScreenHeight;
    }else
    {
        btnY = APPScreenHeight+95;
    }
    regedit.btnFrame = CGRectMake(0, btnY, APPScreenWidth, 60);
    [regedit setImage:HTImage(@"buyStep0") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
        regedit.title = @"买入金额";
        regedit.btnFrame = CGRectMake(0, 268, APPScreenWidth, 58);
        [regedit setImage:HTImage(@"buyStep1") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
            regedit.title = @"输入验证码";
            regedit.btnFrame = CGRectMake(0, 118, APPScreenWidth, 58);
            [regedit setImage:HTImage(@"buyStep2") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                regedit.title = @"输入完成";
                regedit.btnFrame = CGRectMake(0, 254, APPScreenWidth, 58);
                if (self.isBuy) {
                    [regedit setAlerConten:self.notciceStr withLeftBtn:@"我知道了" rightBtn:nil];
                }
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

- (void)pushHongbao
{
    [self.view addSubview:self.promptView];
}

- (UIView *)promptView
{
    if (!_promptView) {
        _promptView = [[UIView alloc] initWithFrame:self.view.bounds];
        _promptView.backgroundColor = HTClearColor;
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:_promptView.bounds];
        imageView.image = HTImage(@"pushhongbao");//instruction
        [_promptView addSubview:imageView];
        //        UIView *alphaView = [[UIView alloc] initWithFrame:self.view.bounds];
        //        alphaView.backgroundColor = HTBlackColor;
        //        alphaView.alpha = 1;
        //        [_promptView addSubview:alphaView];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.numberOfLines = 4;
        titleLabel.textColor = HTWhiteColor;
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
        [_promptView removeFromSuperview];
        [self refreshView:HTImage(@"InvestIndexback")];
    }];
}

@end
