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
    self.title = @"琴行介绍";
    __weakSelf;
    [self setImage:HTImage(@"qinhangjieshao-mendian") WithTouchBlock:^(NSIndexPath *indexPath) {
        BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
        detailN.title = @"北京蓝色港湾店";
        __weak BaseDetailViewController *weakBase1 = detailN;
        [detailN setImage:HTImage(@"lansegangwandian") WithTouchBlock:^(NSIndexPath *indexPath) {
            BaseDetailViewController *detailN1 = [[BaseDetailViewController alloc] init];
            detailN1.title = @"星空金融活动说明";
            
            [detailN1 setImage:HTImage(@"lansegangwanhuodong") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                
                CloudTabbarController *VC = [[CloudTabbarController alloc]init];
                [VC changeMessageWith:@"恭喜您已获得星空琴行30元代金券，可用于报名星空琴行课程时抵现金使用。"];
                VC.selectedIndex = 1;
                [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
                [weakBase1 refreshView:HTImage(@"lansegangwandianback")];
                [weakSelf.navigationController popToViewController:weakSelf.navigationController.viewControllers[1] animated:NO];
                
            }];
            detailN1.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:detailN1 animated:YES];
            
        }];
        detailN.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detailN animated:YES];
    
    }];
    self.tableView.frame = CGRectMake(0, -20, APPScreenWidth, APPScreenHeight+40);
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 25, 129, 44)];
    [self.tableView addSubview:leftBtn];
    
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(leftBtn.right +25, 25, 129, 44)];
    [self.tableView addSubview:rightBtn];
    [rightBtn addTarget:self action:@selector(clickRightBtn) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
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
    [detailN setImage:HTImage(@"kechengjieshao") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
        detailN.title = @"课程介绍";
        __weak BaseDetailViewController *weakBase = detailN;
        [detailN setImage:HTImage(@"kechengjieshaoneirong") WithTouchBlock:^(NSIndexPath *indexPath) {
            BaseDetailViewController *detailN1 = [[BaseDetailViewController alloc] init];
            detailN1.title = @"星空金融活动说明";
            
            [detailN1 setImage:HTImage(@"kechengjieshaohuodong") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                
                CloudTabbarController *VC = [[CloudTabbarController alloc]init];
                [VC changeMessageWith:@"恭喜您已获得星空琴行的琴课体验券一张，可返回星空琴行查看。"];
                VC.selectedIndex = 1;
                [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
                [weakSelf.navigationController popToViewController:weakSelf.navigationController.viewControllers[2] animated:NO];
                [weakBase refreshView:HTImage(@"kechengjieshaoneirongback")];
            }];
            detailN1.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:detailN1 animated:YES];
            
        }];
        detailN.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detailN animated:YES];

        
    }];
    [weakSelf.navigationController pushViewController:detailN animated:NO];
}

@end
