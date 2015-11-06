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
    [self setImage:HTImage(@"shequ") WithTouchBlock:^(NSIndexPath *indexPath) {
        BaseDetailViewController *detail8 = [[BaseDetailViewController alloc] init];
        detail8.title = @"高铁商城";
        
        
        [detail8 setViewDidLoadBlock:^(UIViewController *viewController) {
            UIBarButtonItem *item = [UIBarButtonExtern buttonWithTitle:@"签到" target:viewController andSelector:@selector(invested)];
            [item setTintColor:[UIColor whiteColor]];
            weakSelf.navigationController.navigationBar.tintColor = [UIColor whiteColor];
            [viewController.navigationItem setRightBarButtonItem:item];

        }];
        
        
        [detail8 setImage:HTImage(@"zhekoujiamo") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *detail9 = [[BaseDetailViewController alloc] init];
            detail9.title = @"高铁管家金融活动说明";
            
            [detail9 setImage:HTImage(@"zhekoujiamo") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                CloudTabbarController *VC = [[CloudTabbarController alloc]init];
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
