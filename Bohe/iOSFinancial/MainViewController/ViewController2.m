    //
//  ViewController2.m
//  NoMoneyTravel
//
//  Created by Mr.Yan on 15/11/3.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "ViewController2.h"
#import "CloudTabbarController.h"
@interface ViewController2 ()

@end

@implementation ViewController2


- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weakSelf;
    __weak BaseDetailViewController *weakBase = self;
    [self setImage:HTImage(@"travel_content") WithTouchBlock:^(NSIndexPath *indexPath) {
        //  结算页面
        BaseDetailViewController *detail3 = [[BaseDetailViewController alloc] init];
        detail3.title = @"商品详情";
        [weakSelf.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        [detail3 setImage:HTImage(@"zhekouxiangqing") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *detail4 = [[BaseDetailViewController alloc] init];
            detail4.title = @"购物车页";
            
            [detail4 setImage:HTImage(@"tijiaodingdan") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                BaseDetailViewController *detail5 = [[BaseDetailViewController alloc] init];
                detail5.title = @"填写订单";
                __weak BaseDetailViewController *weakBase1 = detail5;
                UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, APPScreenHeight - 95, APPScreenWidth, 44)];
                btn.backgroundColor = [UIColor redColor];
                [btn setBackgroundImage:HTImage(@"btnimage") forState:UIControlStateNormal];
                [detail5.view addSubview:btn];
                [btn addTarget:detail5 action:@selector(invested) forControlEvents:UIControlEventTouchUpInside];
                [detail5 setImage:HTImage(@"daizhifudingdan") WithTouchBlock:^(NSIndexPath *indexPath) {
                    
                        BaseDetailViewController *detail7 = [[BaseDetailViewController alloc] init];
                        detail7.title = @"你购物 我包邮";
                        
                        [detail7 setImage:HTImage(@"baoxianxuanze") WithTouchBlock:^(NSIndexPath *indexPath) {
                            
                            BaseDetailViewController *detail8 = [[BaseDetailViewController alloc] init];
                            detail8.title = @"绑定验证";
                            
                            [detail8 setImage:HTImage(@"kaihuxingmingyanzheng") WithTouchBlock:^(NSIndexPath *indexPath) {
                                
                                [weakSelf setAlerConten:@"恭喜，您的薄荷金融服务已开通，同时也已获得了薄荷免邮券一张，请返回查看" withLeftBtn:@"我知道了" rightBtn:nil];
                                    [weakBase1 refreshView:HTImage(@"daizhifudingdanback")];
                                    [weakBase1 returnBackRootView:weakBase];
                               
                                
                            }];
                            detail8.hidesBottomBarWhenPushed = YES;
                            [weakSelf.navigationController pushViewController:detail8 animated:YES];
                            
                        }];
                        detail7.hidesBottomBarWhenPushed = YES;
                        [weakSelf.navigationController pushViewController:detail7 animated:YES];
                    
                }];
                detail5.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:detail5 animated:YES];
                
                
            }];
            detail4.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:detail4 animated:YES];
            
        }];
        detail3.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detail3 animated:YES];    }];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:HTImage(@"StorestatusBar") forBarMetrics:UIBarMetricsDefault];
}

@end
