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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:HTImage(@"jingxuanhead") forBarMetrics:UIBarMetricsDefault];

    __weakSelf;
    [self setImage:HTImage(@"jingxuan") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
        detailN.title = @"我的资产";
        
        [detailN setImage:HTImage(@"Withdraw") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
            detailN.title = @"提现";
            
            [detailN setImage:HTImage(@"MyAsset") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                BaseDetailViewController *detail3 = [[BaseDetailViewController alloc] init];
                detail3.title = @"提现详情";
                __weak  BaseDetailViewController  *weakBase = detail3;
                [weakSelf.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
                [detail3 setImage:HTImage(@"zhekouxiangqing") WithTouchBlock:^(NSIndexPath *indexPath) {
                    
                    BaseDetailViewController *detail4 = [[BaseDetailViewController alloc] init];
                    detail4.title = @"鲜Life金融活动说明";
                    
                    [detail4 setImage:HTImage(@"tijiaodingdan") WithTouchBlock:^(NSIndexPath *indexPath) {
                        
                        BaseDetailViewController *detail5 = [[BaseDetailViewController alloc] init];
                        detail5.title = @"身份绑定";
                        
                        [detail5 setImage:HTImage(@"client_validate_name") WithTouchBlock:^(NSIndexPath *indexPath) {
                            
                            [weakSelf setAlerConten:@"恭喜您已获得减免提现手续费特权1次，仅供下次提现时使用~" withLeftBtn:nil rightBtn:@"我知道了"];
                            [weakBase refreshView:HTImage(@"zhekouxiangqing1")];
                            weakBase.view.userInteractionEnabled = NO;
                            
                        }];
                        detail5.hidesBottomBarWhenPushed = YES;
                        [weakSelf.navigationController pushViewController:detail5 animated:YES];
                        
                        
                    }];
                    detail4.hidesBottomBarWhenPushed = YES;
                    [weakSelf.navigationController pushViewController:detail4 animated:YES];
                    
                }];
                detail3.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:detail3 animated:YES];
                
            }];
            detailN.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:detailN animated:YES];
            
        }];
        detailN.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detailN animated:YES];

        
        
        
        
        
        
        
          }];
    
}
@end


