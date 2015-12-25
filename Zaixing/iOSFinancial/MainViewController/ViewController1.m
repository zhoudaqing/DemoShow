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
    __weakSelf;
    [self setImage:HTImage(@"ThirdImage") WithTouchBlock:^(NSIndexPath *indexPath) {
        BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
        detailN.isHidnBar = YES;
        [detailN setImage:HTImage(@"woyaozu") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
            detailN.isHidnBar = YES;
            [detailN setImage:HTImage(@"woyaozuhuodongshuoming") WithTouchBlock:^(NSIndexPath *indexPath) {
             
                //  验证真实姓名
                BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                regedit.title = @"验证真实姓名";
                [regedit setImage:HTImage(@"validateUserName") WithTouchBlock:^(NSIndexPath *indexPath) {
                    
                    //  设置密码
                    BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                    regedit.title = @"设置密码";
                    [regedit setImage:HTImage(@"setPass") WithTouchBlock:^(NSIndexPath *indexPath) {
                        
                        //  绑定银行卡
                        BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                        regedit.title = @"绑定银行卡";
                        [regedit setImage:HTImage(@"setAccount") WithTouchBlock:^(NSIndexPath *indexPath) {
                            
                            BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                            regedit.title = @"存入金额";
                            [regedit setImage:HTImage(@"buyStep1") WithTouchBlock:^(NSIndexPath *indexPath) {
                                
                                BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
                                regedit.title = @"输入验证码";
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
            detailN.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:detailN animated:YES];
            
        }];
        detailN.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detailN animated:YES];

    }];
    
    self.tableView.frame = CGRectMake(0, -20, APPScreenWidth, APPScreenHeight+40);
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    
}
@end
