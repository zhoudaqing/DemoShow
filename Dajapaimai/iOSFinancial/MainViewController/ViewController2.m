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
    
    
    
    [self setImage:HTImage(@"wode") WithTouchBlock:^(NSIndexPath *indexPath) {
        
    }];
    
    self.tableView.frame = CGRectMake(0, -20, APPScreenWidth, APPScreenHeight+20);
    
    UIButton *yue = [[UIButton alloc]initWithFrame:CGRectMake(0, 190, APPScreenWidth, 44)];
    [yue addTarget:self action:@selector(yue) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:yue];
    
    UIButton *youhuiquan = [[UIButton alloc]initWithFrame:CGRectMake(0, 295, APPScreenWidth, 44)];
    [youhuiquan addTarget:self action:@selector(youhuiquan) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:youhuiquan];
    
    UIButton *louxia100 = [[UIButton alloc]initWithFrame:CGRectMake(0, 380, APPScreenHeight, 44)];
    [louxia100 addTarget:self action:@selector(louxia100) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:louxia100];
}

- (void)yue
{
    __weakSelf;
    
    BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
    detailN.title = @"账号明细";
    __weak  BaseDetailViewController  *weakBase = detailN;
    [detailN setImage:HTImage(@"woyaozu") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
        detailN.title = @"100金融活动说明";
        
        [detailN setImage:HTImage(@"woyaozuhuodongshuoming") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
            detailN.title = @"姓名电话认证";
            [detailN setImage:HTImage(@"client_validate_name") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                [weakSelf setAlerConten:@"恭喜您已获得楼下100双倍返现资格，完成订单即可返现至“我的余额”中。" withLeftBtn:@"我知道了" rightBtn:nil];
                [weakBase refreshView:HTImage(@"woyaozuback")];
                weakBase.tableView.userInteractionEnabled = NO;
                
            }];
            detailN.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:detailN animated:YES];
            
        }];
        detailN.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detailN animated:YES];
        
    }];
    detailN.hidesBottomBarWhenPushed = YES;
    [weakSelf.navigationController pushViewController:detailN animated:YES];
}

- (void)youhuiquan
{
    __weakSelf;
    
    BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
    detailN.title = @"我的优惠券";
    __weak  BaseDetailViewController  *weakBase = detailN;
    [detailN setImage:HTImage(@"miaobaozhengjin") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
        detailN.title = @"100金融活动说明";
        
        [detailN setImage:HTImage(@"miaobaozhengjinhuodong") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            CloudTabbarController *VC = [[CloudTabbarController alloc]init];
            [VC changeMessageWith:@"恭喜您已获得楼下100的20元优惠券，返回“我的优惠券”查看。"];
            VC.selectedIndex = 1;
            [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
            [weakBase refreshView:HTImage(@"miaobaozhengjinBack")];
            weakBase.tableView.userInteractionEnabled = NO;
            [self.navigationController popViewControllerAnimated:YES];
            
        }];
        detailN.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detailN animated:YES];
        
    }];
    detailN.hidesBottomBarWhenPushed = YES;
    [weakSelf.navigationController pushViewController:detailN animated:YES];
}

- (void)louxia100
{
    __weakSelf;
    
    CloudTabbarController *VC = [[CloudTabbarController alloc]init];
    [VC showPromptView];
    [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];

    
}
@end
