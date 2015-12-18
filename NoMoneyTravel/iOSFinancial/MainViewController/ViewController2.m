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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setBackgroundImage:HTImage(@"mineStatus") forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    __weakSelf;
//    1.我的钱包 -账户资产 （理财）C端 2.随便花 head随便花 8000.00
    [self setImage:HTImage(@"mine") WithTouchBlock:^(NSIndexPath *indexPath) {
        

    }];
    
    UIButton *btnqianbao = [[UIButton alloc]initWithFrame:CGRectMake(0, 550, APPScreenWidth,44)];
    [btnqianbao addTarget:self action:@selector(myqianbao) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:btnqianbao];
    
    UIButton *btnsuibianhua = [[UIButton alloc]initWithFrame:CGRectMake(0, 600, APPScreenWidth,44)];
    [btnsuibianhua addTarget:self action:@selector(suibianhua) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:btnsuibianhua];
}

- (void)myqianbao
{
    __weakSelf;
    
        BaseDetailViewController *detail3 = [[BaseDetailViewController alloc] init];
        detail3.title = @"我的钱包";
        [weakSelf.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        [detail3 setImage:HTImage(@"wodeqianbao") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            CloudTabbarController *VC = [[CloudTabbarController alloc]init];
            VC.isBuy = NO;
            [VC showPromptView];
            [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
            
        }];
        detail3.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detail3 animated:YES];
    
}

- (void)suibianhua
{
    __weakSelf;
    
    BaseDetailViewController *detail3 = [[BaseDetailViewController alloc] init];
    detail3.title = @"余额页面";
    [weakSelf.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [detail3 setImage:HTImage(@"yueyemian") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        [weakSelf.navigationController popToRootViewControllerAnimated:YES];
        
    }];
    detail3.hidesBottomBarWhenPushed = YES;
    [weakSelf.navigationController pushViewController:detail3 animated:YES];

}

@end
