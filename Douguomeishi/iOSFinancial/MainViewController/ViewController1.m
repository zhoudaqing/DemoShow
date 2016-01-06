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
    [self setImage:HTImage(@"ThirdImage") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        
        }];
    
    UIButton *btn =[[UIButton alloc]initWithFrame:CGRectMake(0, 458, APPScreenWidth, 60)];
    [self.tableView addSubview:btn];
    [btn addTarget:self action:@selector(jitizhong) forControlEvents:UIControlEventTouchUpInside];
}
- (void)jitizhong
{
    __weakSelf;
    
    BaseDetailViewController *detail9 = [[BaseDetailViewController alloc] init];
    detail9.isHidnBar = YES;
    detail9.hidesBottomBarWhenPushed = YES;
    [detail9 setImage:HTImage(@"ThirdImageTwo") WithTouchBlock:^(NSIndexPath *indexPath) {
        
    }];
    [weakSelf.navigationController pushViewController:detail9 animated:YES];

    
}
@end
