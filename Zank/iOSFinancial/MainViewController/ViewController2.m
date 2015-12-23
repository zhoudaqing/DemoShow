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
    self.title = @"我的";
    [self setImage:HTImage(@"mine") WithTouchBlock:^(NSIndexPath *indexPath) {
        
    }];
    
    UIButton *woyaozu = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, APPScreenWidth, 100)];
    [woyaozu addTarget:self action:@selector(dianlianghuiyuan) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:woyaozu];
    
    UIButton *mianbaiozhengjin = [[UIButton alloc]initWithFrame:CGRectMake(0, 400, APPScreenWidth, 150)];
    [mianbaiozhengjin addTarget:self action:@selector(zankJinrong) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:mianbaiozhengjin];

    UIButton *huiyuan = [[UIButton alloc]initWithFrame:CGRectMake(0, 320, APPScreenWidth, 80)];
    [huiyuan addTarget:self action:@selector(huiyuanshengji) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:huiyuan];
   
}

- (void)dianlianghuiyuan
{
    __weakSelf;

    __weak  BaseDetailViewController  *weakBase = self;

    
    BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
    detailN.title = @"身份等级说明";
    
    [detailN setImage:HTImage(@"shenfendengjishuoming") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        CloudTabbarController *VC = [[CloudTabbarController alloc]init];
        [VC changeMessageWith:@"身份已经点亮~！"];
        VC.selectedIndex = 1;
        [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
        [weakBase refreshView:HTImage(@"mineback")];
        [self.navigationController popViewControllerAnimated:YES];
        
    }];
    detailN.hidesBottomBarWhenPushed = YES;
    [weakSelf.navigationController pushViewController:detailN animated:YES];
}

- (void)zankJinrong
{
    CloudTabbarController *VC = [[CloudTabbarController alloc]init];
    [self.navigationController presentViewController:VC animated:YES completion:nil];
}

- (void)huiyuanshengji
{
    __weakSelf;
    
    BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
    detailN.title = @"会员等级购买";
    
    [detailN setImage:HTImage(@"huiyuandengjigoumai") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        [weakSelf setAlerConten:@"你想以30.00元的价格购买3个月的ZANK会员吗？" withLeftBtn:@"普通支付" rightBtn:@"ZANK支付"];
        
    }];
    detailN.hidesBottomBarWhenPushed = YES;
    [weakSelf.navigationController pushViewController:detailN animated:YES];
}

@end
