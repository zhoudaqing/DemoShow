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
    self.title = @"旅行服务";
    __weakSelf;
    [self setImage:HTImage(@"lvxingfuwu") WithTouchBlock:^(NSIndexPath *indexPath) {
        BaseDetailViewController *detail8 = [[BaseDetailViewController alloc] init];
        detail8.title = @"高铁商城";
        
        
        [detail8 setViewDidLoadBlock:^(UIViewController *viewController) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.titleLabel.font = [UIFont systemFontOfSize:16.0f];
            [button setTitle:@"签到" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setTitleShadowColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setTitleShadowColor:[UIColor jt_lightBlackTextColor] forState:UIControlStateHighlighted];
            [button addTarget:weakSelf action:@selector(invested) forControlEvents:UIControlEventTouchUpInside];
            [button sizeToFit];
            
            UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];

            [viewController.navigationItem setRightBarButtonItem:item];

        }];
        
        
        [detail8 setImage:HTImage(@"jifenfangsong") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *detail9 = [[BaseDetailViewController alloc] init];
            detail9.title = @"高铁管家金融活动说明";
            
            [detail9 setImage:HTImage(@"shangchengjifen") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                CloudTabbarController *VC = [[CloudTabbarController alloc]init];
                [VC changeMessageWith:@"恭喜您已获得高铁管家1000积分，可用于兑换高铁商城礼品"];
                VC.selectedIndex = 1;
                [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
                [weakSelf.navigationController popToViewController:weakSelf.navigationController.viewControllers[1] animated:NO];
                
            }];
            detail9.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:detail9 animated:YES];
            
        }];
        detail8.hidesBottomBarWhenPushed = YES;
        
        
        [weakSelf.navigationController pushViewController:detail8 animated:YES];
        


        
    }];
    
}

@end
