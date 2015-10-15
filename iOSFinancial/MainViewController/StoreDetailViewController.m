//
//  StoreDetailViewController.m
//  FreshLife
//
//  Created by Mr.Yang on 15/10/15.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "StoreDetailViewController.h"
#import "GoodDetailViewController.h"

@interface StoreDetailViewController ()

@end

@implementation StoreDetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:0];
    [[UINavigationBar appearance] setBarTintColor:[UIColor jt_barTintColor]];
    

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    __weakSelf;
    [self setImage:HTImage(@"goods") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        GoodDetailViewController *detail = [[GoodDetailViewController alloc] init];
        detail.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detail animated:YES];
        
    }];
}

- (NSString *)title
{
    return @"商品列表";
}

@end
