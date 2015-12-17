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
//    __weakSelf;
    [self setImage:HTImage(@"yishupin") WithTouchBlock:^(NSIndexPath *indexPath) {
//        BaseDetailViewController *detail8 = [[BaseDetailViewController alloc] init];
//        detail8.title = @"高铁商城";
//        
//        [detail8 setImage:HTImage(@"jifenfangsong") WithTouchBlock:^(NSIndexPath *indexPath) {
//            
//            BaseDetailViewController *detail9 = [[BaseDetailViewController alloc] init];
//            detail9.title = @"高铁管家金融活动说明";
//            
//            [detail9 setImage:HTImage(@"shangchengjifen") WithTouchBlock:^(NSIndexPath *indexPath) {
//                
//                CloudTabbarController *VC = [[CloudTabbarController alloc]init];
//                [VC changeMessageWith:@"恭喜您已获得高铁管家1000积分，可用于兑换高铁商城礼品"];
//                VC.selectedIndex = 1;
//                [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
//                [weakSelf.navigationController popToViewController:weakSelf.navigationController.viewControllers[1] animated:NO];
//                
//            }];
//            
//            
//            [weakSelf.navigationController pushViewController:detail9 animated:YES];
//            
//        }];
//        
//        [weakSelf.navigationController pushViewController:detail8 animated:YES];
        
    }];

    self.tableView.frame = CGRectMake(0, -20, APPScreenWidth, APPScreenHeight+40);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

@end
