//
//  CartViewController.m
//  XianLife
//
//  Created by Mr.Yan on 15/10/13.
//  Copyright © 2015年 Mr.Yan. All rights reserved.
//

#import "CartViewController.h"
#import "CloudTabbarController.h"


@interface CartViewController ()

@property (nonatomic, strong)   CloudTabbarController *controller;

@end

@implementation CartViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBarTintColor:HTWhiteColor];
    [self.navigationController.navigationBar setTintColor:[UIColor jt_barTintColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor],NSFontAttributeName : [UIFont systemFontOfSize:18]}];

}

- (CloudTabbarController *)controller
{
    if (!_controller) {
        _controller = [[CloudTabbarController alloc] init];
    }

    return _controller;
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
            
            BaseDetailViewController *paySuccess = [[BaseDetailViewController alloc] init];
            paySuccess.title = @"订单支付";
            [paySuccess setImage:HTImage(@"paySuccess") WithTouchBlock:^(NSIndexPath *indexPath) {
                /*
                [weakSelf.navigationController popToRootViewControllerAnimated:NO];
                weakSelf.navigationController.tabBarController.selectedIndex = 0;
                [weakSelf presentViewController:weakSelf.controller animated:YES completion:^{
                 
                }];
                */
                
            }];
            
            paySuccess.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:paySuccess animated:YES];
            
        }];
        
        detail.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detail animated:YES];
        
    }];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tongzhi) name:@"huodongtongzhi" object:nil];

}

-(void)tongzhi
{
    [self setImageBaoyouhuodong:[UIImage imageNamed:@"mycar1t"]];
}


@end
