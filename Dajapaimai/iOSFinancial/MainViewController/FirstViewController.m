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
    [self.navigationController.navigationBar setBackgroundImage:HTImage(@"xiawuchahead") forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    [self setImage:HTImage(@"xiawucha") WithTouchBlock:^(NSIndexPath *indexPath) {
        
}];
    
    self.tableView.frame = CGRectMake(0, -20, APPScreenWidth, APPScreenHeight+20);
    
    UIButton *woyaozu = [[UIButton alloc]initWithFrame:CGRectMake(0, 280, APPScreenWidth, 100)];
    [woyaozu addTarget:self action:@selector(woyaozu) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:woyaozu];
    
//    UIButton *mianbaiozhengjin = [[UIButton alloc]initWithFrame:CGRectMake(0, 400, APPScreenWidth, 150)];
//    [mianbaiozhengjin addTarget:self action:@selector(mianbaiozhengjin) forControlEvents:UIControlEventTouchUpInside];
//    [self.tableView addSubview:mianbaiozhengjin];

}
- (void)woyaozu
{
    __weakSelf;
    
    BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
    detailN.title = @"楼下-冷饮店";
    __weak  BaseDetailViewController  *weakBase = detailN;
    detailN.isAddBtn = YES;
    [detailN setImage:HTImage(@"lengyindian") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
        detailN.title = @"100金融活动说明";
        
        [detailN setImage:HTImage(@"xiawuchashuoming") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
            detailN.title = @"姓名电话绑定";
            
            [detailN setImage:HTImage(@"client_validate_name") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
                detailN.title = @"银行卡绑定";
                
                [detailN setImage:HTImage(@"client_validate_card") WithTouchBlock:^(NSIndexPath *indexPath) {
                    
                    [weakSelf setAlerConten:@"恭喜您获得楼下100免邮资格，下单即可体验。" withLeftBtn:nil rightBtn:@"我知道了"];
                    [weakBase refreshView:HTImage(@"lengyindianback")];
                
                }];
                detailN.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:detailN animated:YES];
  
                
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

- (void)mianbaiozhengjin
{
    __weakSelf;
    
    BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
    detailN.title = @"";
    detailN.isHidnBar = YES;
    __weak  BaseDetailViewController  *weakBase = detailN;
    [detailN setImage:HTImage(@"miaobaozhengjin") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
        detailN.title = @"100金融活动说明";
        
        [detailN setImage:HTImage(@"miaobaozhengjinhuodong") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            CloudTabbarController *VC = [[CloudTabbarController alloc]init];
            [VC changeMessageWith:@"恭喜您完成本次投资，您可以自由去参拍啦！"];
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

@end


