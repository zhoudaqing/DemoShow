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

@property (nonatomic) UIButton *middlebtn;

@end

@implementation FirstViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    [self.tabBarController.view addSubview:self.middlebtn];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    __weakSelf;
    [self setImage:HTImage(@"FirstImage") WithTouchBlock:^(NSIndexPath *indexPath) {
        //  结算页面
        BaseDetailViewController *detail3 = [[BaseDetailViewController alloc] init];
        detail3.isHidnBar = YES;
        [weakSelf.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        [detail3 setImage:HTImage(@"meilishangcheng") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            CloudTabbarController *VC = [[CloudTabbarController alloc]init];
            [VC changeMessageWith:@"已赠送魅力！"];
            VC.selectedIndex = 1;
            [weakSelf.navigationController presentViewController:VC animated:YES completion:^{
                
                [weakSelf.navigationController popToRootViewControllerAnimated:YES];
                [self refreshView:HTImage(@"FirstImageback")];
            }];

            
        }];
        detail3.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detail3 animated:YES];
    }];
    self.tableView.frame = CGRectMake(0, -20, APPScreenWidth, APPScreenHeight+40);
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 25, 129, 44)];
    [self.tableView addSubview:leftBtn];
    
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(leftBtn.right +25, 25, 129, 44)];
    [self.tableView addSubview:rightBtn];
    [rightBtn addTarget:self action:@selector(clickRightBtn) forControlEvents:UIControlEventTouchUpInside];

}
- (void)clickRightBtn
{
    __weakSelf;
    
    BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
    detailN.title = @"";
    detailN.isHidnBar = YES;
    detailN.tableView.frame = CGRectMake(0, -20, APPScreenWidth, APPScreenHeight+40);
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 25, 129, 44)];
    [leftBtn addTarget:detailN action:@selector(clickLeftBtn) forControlEvents:UIControlEventTouchUpInside];
    [detailN.tableView addSubview:leftBtn];
    [detailN setImage:HTImage(@"meilishangcheng") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        
                
                CloudTabbarController *VC = [[CloudTabbarController alloc]init];
                [VC changeMessageWith:@"已赠送魅力！"];
                VC.selectedIndex = 1;
                [weakSelf.navigationController presentViewController:VC animated:YES completion:^{
                    
                    [weakSelf.navigationController popToRootViewControllerAnimated:YES];
                    [self refreshView:HTImage(@"FirstImageback")];
                }];
                
        
        
        
    }];
    [weakSelf.navigationController pushViewController:detailN animated:NO];
}

- (UIButton *)middlebtn
{
    if (!_middlebtn) {
        _middlebtn =[[UIButton alloc]initWithFrame:CGRectMake((APPScreenWidth - 44)*.5, APPScreenHeight -30, 54, 54)];
        [_middlebtn setImage:HTImage(@"direction") forState:UIControlStateNormal];

    }
    return _middlebtn;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.middlebtn removeFromSuperview];
}

@end


