//
//  CartViewController.m
//  XianLife
//
//  Created by Mr.Yan on 15/10/13.
//  Copyright © 2015年 Mr.Yan. All rights reserved.
//

#import "CartViewController.h"

@interface CartViewController ()

@end

@implementation CartViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBarTintColor:HTWhiteColor];
    [self.navigationController.navigationBar setTintColor:[UIColor jt_barTintColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor],NSFontAttributeName : [UIFont systemFontOfSize:18]}];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"购物车";
    
    __weakSelf;
    
    //  购物车页面
    [self setImage:HTImage(@"mycart") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        //  结算页面
        BaseDetailViewController *detail = [[BaseDetailViewController alloc] init];
        detail.title = @"订单结算";
        [detail setImage:HTImage(@"payMoney") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            
        }];
        
        detail.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detail animated:YES];
        
    }];


}


@end
