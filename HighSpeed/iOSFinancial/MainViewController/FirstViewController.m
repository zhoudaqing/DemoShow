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
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setBackgroundImage:HTImage(@"statusBar") forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    __weakSelf;
    [self setImage:HTImage(@"travel_content") WithTouchBlock:^(NSIndexPath *indexPath) {
        //  结算页面
        BaseDetailViewController *detail3 = [[BaseDetailViewController alloc] init];
        detail3.title = @"北京 至 石家庄";
        [weakSelf.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        [detail3 setImage:HTImage(@"zhekouxiangqing") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *detail4 = [[BaseDetailViewController alloc] init];
            detail4.title = @"北京 至 石家庄";
            
            [detail4 setImage:HTImage(@"tijiaodingdan") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                BaseDetailViewController *detail5 = [[BaseDetailViewController alloc] init];
                detail5.title = @"北京 至 石家庄";
                
                [detail5 setImage:HTImage(@"daizhifudingdan") WithTouchBlock:^(NSIndexPath *indexPath) {
                    
                    BaseDetailViewController *detail6 = [[BaseDetailViewController alloc] init];
                    detail6.title = @"预订车票";
                    
                    [detail6 setImage:HTImage(@"zhekoujiamo") WithTouchBlock:^(NSIndexPath *indexPath) {
                        
                        BaseDetailViewController *detail7 = [[BaseDetailViewController alloc] init];
                        detail7.title = @"保险选择";
                        
                        [detail7 setImage:HTImage(@"zhekoujiamo") WithTouchBlock:^(NSIndexPath *indexPath) {
                            
                            BaseDetailViewController *detail8 = [[BaseDetailViewController alloc] init];
                            detail8.title = @"高铁管家金融活动说明";
                            
                            [detail8 setImage:HTImage(@"zhekoujiamo") WithTouchBlock:^(NSIndexPath *indexPath) {
                                
                                BaseDetailViewController *detail9 = [[BaseDetailViewController alloc] init];
                                detail9.title = @"绑定验证";
                                
                                [detail9 setImage:HTImage(@"zhekoujiamo") WithTouchBlock:^(NSIndexPath *indexPath) {
                                    
                                    [weakSelf setAlerConten:@"恭喜您已获得交通意外保险一份，仅限高铁管家订票使用" withLeftBtn:@"我知道了" rightBtn:nil];
                                    
                                }];
                                detail9.hidesBottomBarWhenPushed = YES;
                                [weakSelf.navigationController pushViewController:detail9 animated:YES];
                                
                            }];
                            detail8.hidesBottomBarWhenPushed = YES;
                            [weakSelf.navigationController pushViewController:detail8 animated:YES];
                            
                        }];
                        detail7.hidesBottomBarWhenPushed = YES;
                        [weakSelf.navigationController pushViewController:detail7 animated:YES];

                        
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
    
}

@end


