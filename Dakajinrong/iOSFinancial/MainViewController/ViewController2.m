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
    __weakSelf;
    
    [self setImage:HTImage(@"mine") WithTouchBlock:^(NSIndexPath *indexPath) {
        
    BaseDetailViewController *buy = [[BaseDetailViewController alloc] init];
    buy.isHidnBar = YES;
    buy.btnFrame = CGRectMake(0, 425, APPScreenWidth, 60);
    [buy setImage:HTImage(@"buyStep0") WithTouchBlock:^(NSIndexPath *indexPath) {
        BaseDetailViewController *buy = [[BaseDetailViewController alloc] init];
        buy.isHidnBar = YES;
        buy.btnFrame = CGRectMake(APPScreenWidth*.5, APPScreenHeight-40, APPScreenWidth*.5, 60);
        [buy setImage:HTImage(@"buyStep01") WithTouchBlock:^(NSIndexPath *indexPath) {
            
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
                        regedit.title = @"买入金额";
                        regedit.btnFrame = CGRectMake(0, 268, APPScreenWidth, 58);
                        [regedit setImage:HTImage(@"buyStep1") WithTouchBlock:^(NSIndexPath *indexPath) {
                           
                            BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                            regedit.title = @"请输入验证码";
                            regedit.btnFrame = CGRectMake(0, 118, APPScreenWidth, 58);
                            [regedit setImage:HTImage(@"buyStep2") WithTouchBlock:^(NSIndexPath *indexPath) {
                                
                                BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                                regedit.title = @"支付完成";
                                [regedit setImage:HTImage(@"buyStep3") WithTouchBlock:^(NSIndexPath *indexPath) {
                                    
                                    [weakSelf.navigationController popToViewController:weakSelf.navigationController.viewControllers[1] animated:YES];
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
        
        buy.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:buy animated:YES];
        
    }];
        buy.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:buy animated:YES];
        
    }];
    self.tableView.frame = CGRectMake(0, -20, APPScreenWidth, APPScreenHeight+40);
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
@end
