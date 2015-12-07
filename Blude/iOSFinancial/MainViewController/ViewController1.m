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


- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:HTImage(@"dongtaihead") forBarMetrics:UIBarMetricsDefault];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weakSelf;

    [self setImage:HTImage(@"dongtai") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        BaseDetailViewController *detail9 = [[BaseDetailViewController alloc] init];
        detail9.title = @"商城";
        
        [detail9 setImage:HTImage(@"shangchengjifen") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            
            
            BaseDetailViewController *detail9 = [[BaseDetailViewController alloc] init];
            detail9.title = @"免费送玫瑰";
            
            [detail9 setImage:HTImage(@"mianfeishengji2") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                CloudTabbarController *VC = [[CloudTabbarController alloc]init];
                [VC changeMessageWith:@"恭喜您已获得blued至尊会员，可免费享用至尊会员的全部服务，请返回查看。"];
                VC.selectedIndex = 1;
                [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
                [weakSelf.navigationController popToViewController:weakSelf.navigationController.viewControllers[0] animated:NO];
            }];
            
            [weakSelf.navigationController pushViewController:detail9 animated:YES];
            
        }];
        
        detail9.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detail9 animated:YES];

        
    }];
    
}

@end
