//
//  CustomInvestGuideViewController.m
//  NoMoneyTravel
//
//  Created by Mr.Yang on 15/11/3.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "CustomInvestGuideViewController.h"


@interface CustomInvestGuideViewController ()



@end

@implementation CustomInvestGuideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = HTWhiteColor;
    
    [self doStep1ValidateRealName];
}

- (void)doStep1ValidateRealName
{
    __weakSelf;
    self.title = @"绑定身份信息";
    [self setImage:HTImage(@"client_validate_name") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        [weakSelf showAlert:weakSelf.step1AlertMsg withButtons:weakSelf.step1AlertButtons andCompletionBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
            
            if (buttonIndex == 0) {
                [weakSelf dismissViewControllerAnimated:YES completion:nil];
                
            }else {
                [weakSelf doStep2BindBankCard];
            }
            
        }];
        
    }];
}

- (void)doStep2BindBankCard
{
    BaseDetailViewController *vc1 = [[BaseDetailViewController alloc] init];
    vc1.title = @"绑定银行卡";
    __weak BaseDetailViewController *weakVc = vc1;
    __weakSelf;
    [vc1 setImage:HTImage(@"client_validate_card") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        [weakVc showAlert:weakSelf.step2AlertMsg withButtons:weakSelf.step2AlertButtons andCompletionBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
            
            if (buttonIndex == 0) {
                [weakVc dismissViewControllerAnimated:YES completion:nil];
                
            }else {
                [weakSelf doStep3Invest];
            }
            
        }];
        
    }];
    
    [self.navigationController pushViewController:vc1 animated:YES];
}

- (void)doStep3Invest
{
    BaseDetailViewController *vc1 = [[BaseDetailViewController alloc] init];
    vc1.title = @"投资";
    [vc1 setImage:HTImage(@"client_Invest_list") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        BaseDetailViewController *vc1 = [[BaseDetailViewController alloc] init];
        vc1.title = @"投资详情";
        [vc1 setImage:HTImage(@"client_invest_detail") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *vc1 = [[BaseDetailViewController alloc] init];
            vc1.title = @"设置密码";
            [vc1 setImage:HTImage(@"client_validate_pass") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                BaseDetailViewController *vc1 = [[BaseDetailViewController alloc] init];
                vc1.title = @"投资金额";
                [vc1 setImage:HTImage(@"client_invest_buy") WithTouchBlock:^(NSIndexPath *indexPath) {
                    
                    BaseDetailViewController *vc1 = [[BaseDetailViewController alloc] init];
                    vc1.title = @"投资成功";
                    vc1.btnFrame = CGRectMake(0, 254, APPScreenWidth, 58);
                    [vc1 setImage:HTImage(@"client_invest_validate_message") WithTouchBlock:^(NSIndexPath *indexPath) {
                        
                        [self doStep3InvestSuccess];
                        
                    }];
                    
                    [self.navigationController pushViewController:vc1 animated:YES];
                }];
                
                [self.navigationController pushViewController:vc1 animated:YES];
            }];
            
            [self.navigationController pushViewController:vc1 animated:YES];
        }];
        
        [self.navigationController pushViewController:vc1 animated:YES];
    }];
    
    [self.navigationController pushViewController:vc1 animated:YES];
}

- (void)doStep3InvestSuccess
{
    BaseDetailViewController *vc1 = [[BaseDetailViewController alloc] init];
    
    __weak BaseDetailViewController *weakVc = vc1;
    __weakSelf;
    
    [vc1 setImage:HTImage(@"client_invest_success") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        [weakVc showAlert:weakSelf.step3AlertMsg withButtons:weakSelf.step3AlertButtons andCompletionBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
            
            [weakVc dismissViewControllerAnimated:YES completion:nil];
                
        }];
    }];
    
    [self.navigationController pushViewController:vc1 animated:YES];
}

@end
