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
    self.title = @"订单";
    __weakSelf;
    [self setImage:HTImage(@"dingdan") WithTouchBlock:^(NSIndexPath *indexPath) {
        BaseDetailViewController *detail8 = [[BaseDetailViewController alloc] init];
        detail8.title = @"订单详情";
        __weak BaseDetailViewController *weakbase = detail8;
        [detail8 setImage:HTImage(@"dingdanxiangqing") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *detail9 = [[BaseDetailViewController alloc] init];
            detail9.title = @"100金融活动说明";
            
            [detail9 setImage:HTImage(@"dingdanhuodongshuoming") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                CloudTabbarController *VC = [[CloudTabbarController alloc]init];
               
                [VC changeMessageWith:@"恭喜您已获得楼下100的20元返现，返回“我的余额”查看。"];
                VC.selectedIndex = 1;
                [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
                [weakSelf.navigationController popToViewController:weakSelf.navigationController.viewControllers[1] animated:NO];
                
                [weakbase refreshView:HTImage(@"dingdanxiangqingback")];
            }];
            
            
            [weakSelf.navigationController pushViewController:detail9 animated:YES];
            
        }];
        
        [weakSelf.navigationController pushViewController:detail8 animated:YES];
        
    }];
    
}

@end
