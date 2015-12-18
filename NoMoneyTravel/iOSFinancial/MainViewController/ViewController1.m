//
//  ViewController1.m
//  NoMoneyTravel
//
//  Created by Mr.Yan on 15/11/3.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setBackgroundImage:HTImage(@"shequStatus") forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //换图  理财
    __weakSelf;
    [self setImage:HTImage(@"shequ") WithTouchBlock:^(NSIndexPath *indexPath) {
        
     
            
            BaseDetailViewController *detail6 = [[BaseDetailViewController alloc] init];
            detail6.isHidnBar = YES;
            [detail6 setImage:HTImage(@"shequlicai") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                [weakSelf.navigationController popToRootViewControllerAnimated:YES];
                
            }];
            [weakSelf.navigationController pushViewController:detail6 animated:YES];
            
        
    }];
    
}

@end
