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
        [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
        
    }];
    
    UIButton *btn =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, APPScreenWidth, 100)];
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
        [detail3 setImage:HTImage(@"meilishangcheng") WithTouchBlock:^(NSIndexPath *indexPath) {
            
                    CloudTabbarController *VC = [[CloudTabbarController alloc]init];
                    VC.selectedIndex = 1;
                    [VC changeMessageWith:@"魅力值已点亮！"];
                    [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
                    
                [self refreshView:HTImage(@"ThirdImageback")];
                [self.navigationController popToViewController:self.navigationController.viewControllers[1] animated:NO];
            }];
    
        detail3.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detail3 animated:YES];    
}
@end
