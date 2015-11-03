//
//  FirstViewController.m
//  CommonProject
//
//  Created by Mr.Yang on 15/10/19.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "FirstViewController.h"
#import "Shouye1ViewController.h"

@interface FirstViewController ()

@property (nonatomic) UITapGestureRecognizer *tap;

@end

@implementation FirstViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.tintColor = HTRedColor;
    [self.navigationController.navigationBar setBackgroundImage:HTImage(@"statusBar") forBarMetrics:UIBarMetricsDefault];
    self.title = @"";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    __weakSelf;
    [self setImage:HTImage(@"travel_content") WithTouchBlock:^(NSIndexPath *indexPath) {
        //  结算页面
        BaseDetailViewController *detail3 = [[BaseDetailViewController alloc] init];
        detail3.title = @"折扣详情";
        [weakSelf.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        [detail3 setImage:HTImage(@"zhekouxiangqing") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *detail4 = [[BaseDetailViewController alloc] init];
            detail4.title = @"提交订单";
            
            [detail4 setImage:HTImage(@"tijiaodingdan") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                
                BaseDetailViewController *detail5 = [[BaseDetailViewController alloc] init];
                detail5.title = @"待支付订单";
                
                [detail5 setImage:HTImage(@"daizhifudingdan") WithTouchBlock:^(NSIndexPath *indexPath) {
                    
                    BaseDetailViewController *detail6 = [[BaseDetailViewController alloc] init];
                    detail6.title = @"我的折扣";
                    
                    [detail6 setImage:HTImage(@"zhekoujiamo") WithTouchBlock:^(NSIndexPath *indexPath) {
                        
                        NSLog(@"添加提示 和跳转c端");
                        
                        
                    }];
                    detail6.hidesBottomBarWhenPushed = YES;
                    [weakSelf.navigationController pushViewController:detail6 animated:YES];
                    
                    
                }];
                detail5.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:detail5 animated:YES];
                
                
            }];
            detail4.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:detail4 animated:YES];
            
        }];
        detail3.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detail3 animated:YES];    }];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(300, 25, 70, 59)];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(qiandao) forControlEvents:UIControlEventTouchUpInside];

}

- (void)qiandao
{
    __weakSelf;
        //  结算页面
        BaseDetailViewController *detail3 = [[BaseDetailViewController alloc] init];
        detail3.title = @"签到";
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(300, 25, 70, 59)];
    [detail3.view addSubview:btn];
    [btn addTarget:detail3 action:@selector(invested) forControlEvents:UIControlEventTouchUpInside];
    [weakSelf.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];

        [detail3 setImage:HTImage(@"qiandao") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *detail4 = [[BaseDetailViewController alloc] init];
            detail4.title = @"穷游金融活动说明";
            
            [detail4 setImage:HTImage(@"qiandaohuodongshuoming") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                NSLog(@"我知道了  继续赚里程");
                BaseDetailViewController *detail5 = [[BaseDetailViewController alloc] init];
                detail5.title = @"验证激活";
                
                [detail5 setImage:HTImage(@"kaihuxingmingyanzheng") WithTouchBlock:^(NSIndexPath *indexPath) {
                    
                    BaseDetailViewController *detail6 = [[BaseDetailViewController alloc] init];
                    detail6.title = @"绑定银行卡号";
                    
                    [detail6 setImage:HTImage(@"setAccount") WithTouchBlock:^(NSIndexPath *indexPath) {
                        
                        NSLog(@"我知道了 和跳转c端");
                        
                        
                    }];
                    detail6.hidesBottomBarWhenPushed = YES;
                    [weakSelf.navigationController pushViewController:detail6 animated:YES];
                    
                    
                }];
                detail5.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:detail5 animated:YES];
                
                
            }];
            detail4.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:detail4 animated:YES];
            
        }];
        detail3.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detail3 animated:YES];
}

@end


