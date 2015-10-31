//
//  PackingViewController.m
//  SelectFood
//
//  Created by Mr.Yan on 15/10/20.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "PackingViewController.h"

@interface PackingViewController ()

@end

@implementation PackingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: [UIColor orangeColor],
                                                                    UITextAttributeFont : [UIFont boldSystemFontOfSize:18]};
    self.title = @"挑食金融活动说明";
    
    [self.navigationController.navigationBar setTintColor:[UIColor redColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor orangeColor],NSFontAttributeName : [UIFont systemFontOfSize:18]}];
    
    __weakSelf;

    [self setImage:HTImage(@"PayYanzhen") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        [weakSelf addsubViewC];
        
    }];
}

- (void)addsubViewC
{
    __weakSelf;
    
        //  验证真实姓名
        BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
        regedit.title = @"验证真实姓名";
        regedit.view.frame = CGRectMake(0, -120, APPScreenWidth, APPScreenHeight);
        [regedit setImage:HTImage(@"timing") WithTouchBlock:^(NSIndexPath *indexPath) {
            //  设置密码
            BaseDetailViewController *regedit = [[BaseDetailViewController alloc] init];
            regedit.title = @"关联银行卡";
            regedit.alertContent = @"精品羊肉券已放入您的挑食账户中，可供下次购买使用";
            [regedit setImage:HTImage(@"jiesuanbangka") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                        
            //创建通知
            NSNotification *notification =[NSNotification notificationWithName:@"Paytongzhi" object:nil userInfo:nil];
            //通过通知中心发送通知
            [[NSNotificationCenter defaultCenter] postNotification:notification];
            [weakSelf.navigationController popToViewController:weakSelf.navigationController.viewControllers[2] animated:YES];
                            
                
                
            }];
            
            [weakSelf.navigationController pushViewController:regedit animated:YES];
            
        }];
        
        [weakSelf.navigationController pushViewController:regedit animated:YES];
        
    


}

@end
