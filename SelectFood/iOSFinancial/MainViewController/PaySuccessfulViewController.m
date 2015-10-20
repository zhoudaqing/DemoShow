//
//  PaySuccessfulViewController.m
//  SelectFood
//
//  Created by Mr.Yan on 15/10/20.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "PaySuccessfulViewController.h"
#import "PackingViewController.h"

@interface PaySuccessfulViewController ()
{
    UIImageView *_backImage;
}

@end

@implementation PaySuccessfulViewController

- (void)viewDidLoad {
    self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: [UIColor orangeColor],
                                                                    UITextAttributeFont : [UIFont boldSystemFontOfSize:18]};
    self.title = @"支付信息";
    
    [self.navigationController.navigationBar setTintColor:[UIColor redColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor orangeColor],NSFontAttributeName : [UIFont systemFontOfSize:18]}];
    
    _backImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, APPScreenWidth, APPScreenHeight - 40)];
    [_backImage setImage:HTImage(@"zhifuchenggong")];
    [self.view addSubview:_backImage];
    _backImage.userInteractionEnabled = YES;
    
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(40,210, 96, 44)];
    [leftBtn addTarget:self action:@selector(clickLeftBtn) forControlEvents:UIControlEventTouchUpInside];
    [_backImage addSubview:leftBtn];
    
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(APPScreenWidth - 40-96, 210, 96, 44)];
    [rightBtn addTarget:self action:@selector(clickRightBtn) forControlEvents:UIControlEventTouchUpInside];
    [_backImage addSubview:rightBtn];
    
    
    UIButton *bottomBtn = [[UIButton alloc]initWithFrame:CGRectMake(60, 310, APPScreenWidth - 120, 44)];
    [bottomBtn addTarget:self action:@selector(clickBottomBtn) forControlEvents:UIControlEventTouchUpInside];
    [_backImage addSubview:bottomBtn];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tongzhi) name:@"Paytongzhi" object:nil];

}


- (void)clickLeftBtn
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)clickRightBtn
{
    
}

- (void)clickBottomBtn
{
    PackingViewController *pack = [[PackingViewController alloc]init];
    [self.navigationController pushViewController:pack animated:YES];
}
- (void)tongzhi
{
    [_backImage setImage:HTImage(@"zhifuchengonglingqu")];

}
@end
