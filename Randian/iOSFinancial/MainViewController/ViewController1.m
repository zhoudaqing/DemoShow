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


- (void)viewDidLoad {
    [super viewDidLoad];
    __weakSelf;
    [self setImage:HTImage(@"lvxingfuwu") WithTouchBlock:^(NSIndexPath *indexPath) {
        
                CloudTabbarController *VC = [[CloudTabbarController alloc]init];
                [VC showPromptView];
                [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
        
        
        }];
    
    UIButton *btn =[[UIButton alloc]initWithFrame:CGRectMake(0, 158, APPScreenWidth, 60)];
    [self.tableView addSubview:btn];
    [btn addTarget:self action:@selector(jitizhong) forControlEvents:UIControlEventTouchUpInside];
}
- (void)jitizhong
{
    __weakSelf;
        //  结算页面
        BaseDetailViewController *detail3 = [[BaseDetailViewController alloc] init];
        detail3.title = @"我的优惠券";
        __weak BaseDetailViewController *weakBase = detail3;
        [detail3 setImage:HTImage(@"xuanzeriqi") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *detail4 = [[BaseDetailViewController alloc] init];
            detail4.title = @"优惠券免费领取";
            [detail4 setImage:HTImage(@"jilutizhong") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                    CloudTabbarController *VC = [[CloudTabbarController alloc]init];
                    [VC changeMessageWith:@"恭喜您已获得燃点30元优惠券，可用于预约燃点课程支付时抵现金使用，返回查看。"];
                    VC.selectedIndex = 1;
                    [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
                    [weakBase refreshView:HTImage(@"xuanzeriqiback")];
                    [weakSelf.navigationController popToViewController:weakBase animated:YES];
                    weakBase.tableView.userInteractionEnabled = NO;
                
                
            }];
            detail4.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:detail4 animated:NO];
            
        }];
        detail3.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detail3 animated:YES];    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"我的";
}
@end
