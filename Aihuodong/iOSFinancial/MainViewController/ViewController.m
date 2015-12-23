//
//  ViewController.m
//  NoMoneyTravel
//
//  Created by Mr.Yang on 15/11/3.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "ViewController.h"
#import "CustomInvestGuideViewController.h"
#import "CloudTabbarController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:HTImage(@"SecondHead") forBarMetrics:UIBarMetricsDefault];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    __weakSelf;
    [self setImage:HTImage(@"SecondImage") WithTouchBlock:^(NSIndexPath *indexPath) {
        
            
            BaseDetailViewController *detail4 = [[BaseDetailViewController alloc] init];
            detail4.isHidnBar = YES;
            [detail4 setImage:HTImage(@"SecondsonImage") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                
                    
                
                
            }];
            detail4.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:detail4 animated:YES];
            
        }];
    
    
    
}

@end
