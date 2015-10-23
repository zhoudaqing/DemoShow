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
            paySuccess.title = @"订单结算";
            [weakSelf setAlerConten:@"激活鲜life金融服务即可参加抽奖" withLeftBtn:@"好的" rightBtn:nil isPush:YES];
            [weakSelf setImage:HTImage(@"paySuccess") WithTouchBlock:^(NSIndexPath *indexPath) {
            
                BaseDetailViewController *paySuccess1 = [[BaseDetailViewController alloc] init];
                paySuccess1.title = @"鲜life金融活动说明";
                [paySuccess1 setImage:HTImage(@"xianLifehuodongshuoming") WithTouchBlock:^(NSIndexPath *indexPath) {
                    
                    BaseDetailViewController *paySuccess2 = [[BaseDetailViewController alloc] init];
                    paySuccess2.title = @"实名认证";
                    [paySuccess2 setImage:HTImage(@"tiyanshiming") WithTouchBlock:^(NSIndexPath *indexPath) {
                        [weakSelf setAlerConten:@"恭喜您已获得鲜life满69元即可免运费的资格，提交订单即可使用" withLeftBtn:@"我知道了" rightBtn:nil isPush:NO];
                        
                    }];
                    [weakSelf.navigationController pushViewController:paySuccess2 animated:YES];
                    
                }];
                [weakSelf.navigationController pushViewController:paySuccess1 animated:YES];
                
            }];
            
            
        }];
        
        detail.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detail animated:YES];
        
    }];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(200, 0, 180, 44)];
    btn.backgroundColor = [UIColor clearColor];
    [self.tableView addSubview:btn];
    [btn addTarget:self action:@selector(baoyouhuodong) forControlEvents:UIControlEventTouchUpInside];

    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(0, APPScreenHeight - 88 -50, APPScreenWidth, 44)];
    btn1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(jiesuan) forControlEvents:UIControlEventTouchUpInside];
}

-(void)baoyouhuodong
{
    
    __weakSelf;
    
  
    BaseDetailViewController *paySuccess1 = [[BaseDetailViewController alloc] init];
    paySuccess1.title = @"鲜life金融活动说明";
    [paySuccess1 setImage:HTImage(@"xianLifehuodongshuoming") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        BaseDetailViewController *paySuccess2 = [[BaseDetailViewController alloc] init];
        paySuccess2.title = @"实名认证";
        [paySuccess2 setImage:HTImage(@"tiyanshiming") WithTouchBlock:^(NSIndexPath *indexPath) {
            [weakSelf setAlerConten:@"恭喜您已获得鲜life满69元即可免运费的资格，提交订单即可使用" withLeftBtn:@"我知道了" rightBtn:nil isPush:NO];
            
        }];
        [weakSelf.navigationController pushViewController:paySuccess2 animated:YES];
        
    }];
    [weakSelf.navigationController pushViewController:paySuccess1 animated:YES];
    

}

- (void)jiesuan
{
    
    __weakSelf;

        BaseDetailViewController *paySuccess2 = [[BaseDetailViewController alloc] init];
        paySuccess2.title = @"订单支付";
        [paySuccess2 setImage:HTImage(@"paySuccess") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            BaseDetailViewController *paySuccess3 = [[BaseDetailViewController alloc] init];
            paySuccess3.title = @"鲜life金融活动说明";
            [paySuccess3 setImage:HTImage(@"xianLifehuodongshuoming") WithTouchBlock:^(NSIndexPath *indexPath) {
                
                BaseDetailViewController *paySuccess4 = [[BaseDetailViewController alloc] init];
                paySuccess4.title = @"授权页";
                [paySuccess4 shouquanWith:@"恭喜授权成功"];
                [paySuccess4 setImage:HTImage(@"shouquanye") WithTouchBlock:^(NSIndexPath *indexPath) {
                    
                    BaseDetailViewController *paySuccess5 = [[BaseDetailViewController alloc] init];
                    paySuccess5.title = @"关联银行卡";
                    
                    [paySuccess5 setImage:HTImage(@"jiesuanbangka") WithTouchBlock:^(NSIndexPath *indexPath) {
                        
                        [weakSelf setAlerConten:@"恭喜您已获得鲜life满69元即可免运费的资格，继续完成投资即可活动20元优惠券" withLeftBtn:@"给钱也不要" rightBtn:@"领取20元优惠券" isPush:YES];

                        
                    }];
                    [weakSelf.navigationController pushViewController:paySuccess5 animated:YES];
                    
                }];
                [weakSelf.navigationController pushViewController:paySuccess4 animated:YES];
                
            }];
            [weakSelf.navigationController pushViewController:paySuccess3 animated:YES];
            
        }];
        paySuccess2.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:paySuccess2 animated:YES];
        

    

}




@end
