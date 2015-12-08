//
//  ViewController1.m
//  NoMoneyTravel
//
//  Created by Mr.Yan on 15/11/3.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "ViewController1.h"
#import "CloudTabbarController.h"
#import "UIBarButtonExtern.h"

@interface ViewController1 ()

@end

@implementation ViewController1
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:HTImage(@"ThirdHead") forBarMetrics:UIBarMetricsDefault];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    __weakSelf;
    [self setImage:HTImage(@"ThirdImage") WithTouchBlock:^(NSIndexPath *indexPath) {
        
                CloudTabbarController *VC = [[CloudTabbarController alloc]init];
                [VC showPromptView];
                [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
        
        
        }];
    
    UIButton *btn =[[UIButton alloc]initWithFrame:CGRectMake(0, 138, APPScreenWidth, 60)];
    [self.tableView addSubview:btn];
    [btn addTarget:self action:@selector(jitizhong) forControlEvents:UIControlEventTouchUpInside];
}
- (void)jitizhong
{
    __weakSelf;
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
        [weakSelf.navigationController pushViewController:detail3 animated:YES];    
}
@end
