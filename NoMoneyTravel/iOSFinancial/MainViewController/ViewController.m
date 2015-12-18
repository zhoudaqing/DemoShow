//
//  ViewController.m
//  NoMoneyTravel
//
//  Created by Mr.Yang on 15/11/3.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "ViewController.h"
#import "CustomInvestGuideViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setBackgroundImage:HTImage(@"mudidiStatus") forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    __weakSelf;
    // 中国   折扣详情   提交订单=保险详情 订单确认 支付
    [self setImage:HTImage(@"mudidi") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        BaseDetailViewController *detail3 = [[BaseDetailViewController alloc] init];
        detail3.isHidnBar = YES;
        [weakSelf.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        [detail3 setImage:HTImage(@"zhekouxiangqing") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *detail4 = [[BaseDetailViewController alloc] init];
            detail4.title = @"提交订单";
            UIButton *btnsuibianhua = [[UIButton alloc]initWithFrame:CGRectMake(0, 190, APPScreenWidth,44)];
            [btnsuibianhua addTarget:detail4 action:@selector(invested) forControlEvents:UIControlEventTouchUpInside];
            [detail4.tableView addSubview:btnsuibianhua];
            [detail4 setImage:HTImage(@"tijiaodingdan") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                BaseDetailViewController *detail5 = [[BaseDetailViewController alloc] init];
                detail5.title = @"待支付订单";
                [detail5 setImage:HTImage(@"daizhifudingdan") WithTouchBlock:^(NSIndexPath *indexPath) {
                    
                    BaseDetailViewController *detail6 = [[BaseDetailViewController alloc] init];
                    detail6.isHidnBar = YES;
                    [detail6 setImage:HTImage(@"zhekoujiamo") WithTouchBlock:^(NSIndexPath *indexPath) {
                        
//                        [weakSelf.navigationController popToRootViewControllerAnimated:YES];
                        [weakSelf setAlerConten:@"支付成功" withLeftBtn:nil rightBtn:@"我知道了"];
                        
                    }];
                    [weakSelf.navigationController pushViewController:detail6 animated:NO];
                    
                }];
                [weakSelf.navigationController pushViewController:detail5 animated:YES];
                
                
            }];
            [weakSelf.navigationController pushViewController:detail4 animated:YES];
            
        }];
        detail3.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detail3 animated:YES];
    }];


    
}


@end
