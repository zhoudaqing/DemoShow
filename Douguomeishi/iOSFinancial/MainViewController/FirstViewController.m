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
    [self.navigationController.navigationBar setBackgroundImage:HTImage(@"FirstHead") forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setImage:HTImage(@"FirstImage") WithTouchBlock:^(NSIndexPath *indexPath) {
           }];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 339, APPScreenWidth, 60)];
    [self.tableView addSubview:btn];
    [btn addTarget:self action:@selector(tianqimaimai) forControlEvents:UIControlEventTouchUpInside];

}

- (void)tianqimaimai
{
    __weakSelf;
    //  结算页面
    BaseDetailViewController *detail3 = [[BaseDetailViewController alloc] init];
    detail3.isHidnBar = YES;
    detail3.btnFrame = CGRectMake(0, 529, APPScreenWidth, 80);
    [weakSelf.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [detail3 setImage:HTImage(@"tianqibaosong") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        BaseDetailViewController *detail4 = [[BaseDetailViewController alloc] init];
        detail4.isHidnBar = YES;
        [detail4 setImage:HTImage(@"goumaitianqibao") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            
            BaseDetailViewController *detail5 = [[BaseDetailViewController alloc] init];
            detail5.isHidnBar = YES;
            [detail5 setImage:HTImage(@"yunzhanghu") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                [weakSelf.navigationController popToRootViewControllerAnimated:YES];
                
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


