//
//  ViewController.m
//  NoMoneyTravel
//
//  Created by Mr.Yang on 15/11/3.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "ViewController.h"
#import "CustomInvestGuideViewController.h"
#import "CloudTabbarController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"我的课程";
    __weakSelf;
    [self setImage:HTImage(@"wodekecheng") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        
        BaseDetailViewController *detail11 = [[BaseDetailViewController alloc] init];
        detail11.title = @"课程预约";
        
        [detail11 setImage:HTImage(@"yuyueshangke") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *detail8 = [[BaseDetailViewController alloc] init];
            detail8.title = @"课程申请";
            
            [detail8 setImage:HTImage(@"kechengshenqing") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                BaseDetailViewController *detail9 = [[BaseDetailViewController alloc] init];
                detail9.title = @"星空金融活动说明";
                
                [detail9 setImage:HTImage(@"xingkongjinrong1") WithTouchBlock:^(NSIndexPath *indexPath) {
                    
                    BaseDetailViewController *detail10 = [[BaseDetailViewController alloc] init];
                    detail10.title = @"姓名电话绑定";
                    [detail10 setImage:HTImage(@"client_validate_name") WithTouchBlock:^(NSIndexPath *indexPath) {
                        
                        BaseDetailViewController *detail11 = [[BaseDetailViewController alloc] init];
                        detail11.title = @"云账户";
                        
                        [detail11 setImage:HTImage(@"jinrulicai") WithTouchBlock:^(NSIndexPath *indexPath) {
                            
                            CloudTabbarController *VC = [[CloudTabbarController alloc]init];
                            [VC changeMessageWith:@"您的10000元体验金已开始为您赚钱啦，7日后所获得的利息将可直接提现到您的银行卡中，请继续关注。"];
                            VC.selectedIndex = 1;
                            [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
                            [weakSelf.navigationController popToRootViewControllerAnimated:NO];
                            
                            
                        }];
                        
                        
                        [weakSelf.navigationController pushViewController:detail11 animated:YES];
                        
                        
                    }];
                    
                    
                    [weakSelf.navigationController pushViewController:detail10 animated:YES];
                    
                }];
                
                
                [weakSelf.navigationController pushViewController:detail9 animated:YES];
                
            }];
            
            [weakSelf.navigationController pushViewController:detail8 animated:NO];

            
            
        }];
        
        detail11.hidesBottomBarWhenPushed = YES;

        [weakSelf.navigationController pushViewController:detail11 animated:YES];
        
        
        
    }];

    
    
}


@end
