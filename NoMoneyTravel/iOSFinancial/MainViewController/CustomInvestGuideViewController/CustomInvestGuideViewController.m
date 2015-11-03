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
    
    [self doStep1ValidateRealName];
}

- (void)doStep1ValidateRealName
{
    __weakSelf;
    [self setImage:HTImage(@"client_validate_name") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        [weakSelf alertViewWithButtonsBlock:^NSArray *{
            return weakSelf.step1AlertButtons;
            
        } andHandleBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
            
            if (buttonIndex == 0) {
                // 消失
                [weakSelf dismissViewController:^{
                    
                }];
                
            }else {
                [weakSelf doStep2BindBankCard];
            }
            
        } andMessage:weakSelf.step1AlertMsg];
        
    }];
}

- (void)doStep2BindBankCard
{
    BaseDetailViewController *vc1 = [[BaseDetailViewController alloc] init];
    __weak BaseDetailViewController *weakVc = vc1;
    [vc1 setImage:HTImage(@"client_validate_card") WithTouchBlock:^(NSIndexPath *indexPath) {
//        
//        [weakVc alertViewWithButtonsBlock:^NSArray *{
//            return _step2AlertButtons;
//            
//        } andHandleBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
//            
//            if (buttonIndex == 0) {
//                // 消失
//                [weakVc dismissViewController:^{
//                    
//                }];
//                
//            }else {
//                [self doStep3Invest];
//            }
//            
//        } andMessage:_step2AlertMsg];
        
    }];
    
    [self.navigationController pushViewController:vc1 animated:YES];
}

- (void)doStep3Invest
{
    BaseDetailViewController *vc1 = [[BaseDetailViewController alloc] init];
    [vc1 setImage:HTImage(@"client_Invest_list") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        BaseDetailViewController *vc1 = [[BaseDetailViewController alloc] init];
        [vc1 setImage:HTImage(@"client_invest_detail") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *vc1 = [[BaseDetailViewController alloc] init];
            [vc1 setImage:HTImage(@"client_validate_pass") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                BaseDetailViewController *vc1 = [[BaseDetailViewController alloc] init];
                [vc1 setImage:HTImage(@"client_invest_buy") WithTouchBlock:^(NSIndexPath *indexPath) {
                    
                    BaseDetailViewController *vc1 = [[BaseDetailViewController alloc] init];
                    [vc1 setImage:HTImage(@"client_invest_validate_message") WithTouchBlock:^(NSIndexPath *indexPath) {
                        
                        [self doStep3InvestSuccess];
                        
                    }];
                    
                    [vc1.navigationController pushViewController:vc1 animated:YES];
                }];
                
                [vc1.navigationController pushViewController:vc1 animated:YES];
            }];
            
            [vc1.navigationController pushViewController:vc1 animated:YES];
        }];
        
        [vc1.navigationController pushViewController:vc1 animated:YES];
    }];
    
    [self.navigationController pushViewController:vc1 animated:YES];
}

- (void)doStep3InvestSuccess
{
    BaseDetailViewController *vc1 = [[BaseDetailViewController alloc] init];
    
    __weak BaseDetailViewController *weakVC = vc1;
    
    [vc1 setImage:HTImage(@"client_invest_success") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        [weakVC alertViewWithButtonsBlock:^NSArray *{
            return _step2AlertButtons;
            
        } andHandleBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
            
            // 消失
                [weakVC dismissViewController:^{
                    
                }];
                
                
        } andMessage:_step2AlertMsg];
    }];
    
    [self.navigationController pushViewController:vc1 animated:YES];
}

@end
