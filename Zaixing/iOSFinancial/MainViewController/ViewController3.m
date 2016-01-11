//
//  ViewController3.m
//  Dakapaimai
//
//  Created by Mr.Yan on 15/11/12.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "ViewController3.h"
#import "CloudTabbarController.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息";
    __weakSelf;
    [self setImage:HTImage(@"woyaozuhuodongshuoming") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        //  验证真实姓名
        BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
        regedit.title = @"验证真实姓名";
        regedit.btnFrame = CGRectMake(0, 205, APPScreenWidth, 58);
        [regedit setImage:HTImage(@"validateUserName") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            //  设置密码
            BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
            regedit.title = @"设置密码";
            regedit.btnFrame = CGRectMake(0, 243, APPScreenWidth, 58);
            [regedit setImage:HTImage(@"setPass") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                //  绑定银行卡
                BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                regedit.title = @"绑定银行卡";
                regedit.btnFrame = CGRectMake(0, 256, APPScreenWidth, 58);
                [regedit setImage:HTImage(@"setAccount") WithTouchBlock:^(NSIndexPath *indexPath) {
                    
                    BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                    regedit.title = @"存入金额";
                    regedit.btnFrame = CGRectMake(0, 268, APPScreenWidth, 58);
                    [regedit setImage:HTImage(@"buyStep1") WithTouchBlock:^(NSIndexPath *indexPath) {
                        
                        BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                        regedit.title = @"输入验证码";
                        regedit.btnFrame = CGRectMake(0, 118, APPScreenWidth, 58);
                        [regedit setImage:HTImage(@"buyStep2") WithTouchBlock:^(NSIndexPath *indexPath) {
                            
                            BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                            regedit.title = @"输入完成";
                            [regedit setImage:HTImage(@"buyStep3") WithTouchBlock:^(NSIndexPath *indexPath) {
                                
                                [weakSelf.navigationController popToViewController:weakSelf.navigationController.viewControllers[2] animated:YES];
                            }];
                            
                            [weakSelf.navigationController pushViewController:regedit animated:YES];
                        }];
                        
                        [weakSelf.navigationController pushViewController:regedit animated:YES];
                        
                    }];
                    
                    [weakSelf.navigationController pushViewController:regedit animated:YES];
                    
                }];
                
                [weakSelf.navigationController pushViewController:regedit animated:YES];
                
            }];
            
            [weakSelf.navigationController pushViewController:regedit animated:YES];
            
        }];
        
        [weakSelf.navigationController pushViewController:regedit animated:YES];

    }];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(APPScreenWidth*.6, 165, 60, 60)];
    
    [btn addTarget:self action:@selector(lastIncome) forControlEvents:UIControlEventTouchUpInside];
    
    [self.tableView addSubview:btn];

}

- (void)lastIncome
{
    __weakSelf;

    //  验证真实姓名
    BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
    regedit.isHidnBar = YES;
    int btnY;
    if (is55Inch) {
        btnY = APPScreenHeight-100;
    }else
    {
        btnY = APPScreenHeight - 30;
    }
    regedit.btnFrame = CGRectMake(0, btnY, APPScreenWidth*.5, 60);    [regedit setImage:HTImage(@"woyaozuhuodongshuoming1") WithTouchBlock:^(NSIndexPath *indexPath) {
        //  验证真实姓名
        BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
        regedit.title = @"验证真实姓名";
        regedit.btnFrame = CGRectMake(0, 205, APPScreenWidth, 58);
        [regedit setImage:HTImage(@"validateUserName") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            //  设置密码
            BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
            regedit.title = @"设置密码";
            regedit.btnFrame = CGRectMake(0, 243, APPScreenWidth, 58);
            [regedit setImage:HTImage(@"setPass") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                //  绑定银行卡
                BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                regedit.title = @"绑定银行卡";
                regedit.btnFrame = CGRectMake(0, 256, APPScreenWidth, 58);
                [regedit setImage:HTImage(@"setAccount") WithTouchBlock:^(NSIndexPath *indexPath) {
                    
                    BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                    regedit.title = @"存入金额";
                    regedit.btnFrame = CGRectMake(0, 268, APPScreenWidth, 58);
                    [regedit setImage:HTImage(@"buyStep1") WithTouchBlock:^(NSIndexPath *indexPath) {
                        
                        BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                        regedit.title = @"输入验证码";
                        regedit.btnFrame = CGRectMake(0, 118, APPScreenWidth, 58);
                        [regedit setImage:HTImage(@"buyStep2") WithTouchBlock:^(NSIndexPath *indexPath) {
                            
                            BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                            regedit.title = @"输入完成";
                            [regedit setImage:HTImage(@"buyStep3") WithTouchBlock:^(NSIndexPath *indexPath) {
                                
                                [weakSelf.navigationController popToViewController:weakSelf.navigationController.viewControllers[2] animated:YES];
                            }];
                            
                            [weakSelf.navigationController pushViewController:regedit animated:YES];
                        }];
                        
                        [weakSelf.navigationController pushViewController:regedit animated:YES];
                        
                    }];
                    
                    [weakSelf.navigationController pushViewController:regedit animated:YES];
                    
                }];
                
                [weakSelf.navigationController pushViewController:regedit animated:YES];
                
            }];
            
            [weakSelf.navigationController pushViewController:regedit animated:YES];
            
        }];
        
        [weakSelf.navigationController pushViewController:regedit animated:YES];

        
    }];
    
    [weakSelf.navigationController pushViewController:regedit animated:YES];
}

@end
