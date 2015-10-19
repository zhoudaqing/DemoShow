//
//  MineViewController.m
//  XianLife
//
//  Created by Mr.Yan on 15/10/13.
//  Copyright © 2015年 Mr.Yan. All rights reserved.
//

#import "MyStoreViewController.h"
#import "FanyingbiliViewController.h"
#import "BaseDetailViewController.h"
#import "GunayudianpuViewController.h"
#import "ShengjidianpuViewController.h"
#import "CloudTabbarController.h"

@interface MyStoreViewController ()<UINavigationControllerDelegate>
{
    UIImageView *_backImage;
}

@end

@implementation MyStoreViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.isStyleLight = YES;
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView removeFromSuperview];
    _backImage = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [_backImage setImage:[UIImage imageNamed:@"wodedian.PNG"]];
    [self.view addSubview:_backImage];
    _backImage.userInteractionEnabled = YES;
    
    [self addsubViews];
}

- (void)addsubViews
{
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(20, 251, 120, 20)];
    lable.textColor = [UIColor whiteColor];
    lable.text = @"";
    lable.font = [UIFont systemFontOfSize:13.0];
    [_backImage addSubview:lable];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(lable.right - 20, lable.origin.y - 5, 80, 20)];
    [btn setTitle:@"" forState:UIControlStateNormal];
    [_backImage addSubview:btn];
    
    [btn addTarget:self action:@selector(pushYanshiDemo1) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *aboutBtn = [[UIButton alloc]initWithFrame:CGRectMake(lable.right + 60, lable.origin.y - 5, 80, 20)];
    [aboutBtn setTitle:@"" forState:UIControlStateNormal];
    [_backImage addSubview:aboutBtn];
    [aboutBtn addTarget:self action:@selector(pushYanshiDemo) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 291, [UIScreen mainScreen].bounds.size.width, 44)];
    btn2.backgroundColor = [UIColor clearColor];
    [_backImage addSubview:btn2];
    [btn2 addTarget:self action:@selector(fanyingbili) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *middleImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 344, self.view.width, 200)];
    [middleImage setImage:[UIImage imageNamed:@"wodedian1"]];
    [self.view addSubview:middleImage];
    
    UIButton *btn3 = [[UIButton alloc]initWithFrame:CGRectMake(0, middleImage.bottom+20, self.view.width, 60)];
    [_backImage addSubview:btn3];
    [btn3 addTarget:self action:@selector(pushYanshiDemo) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *btn4 = [[UIButton alloc]initWithFrame:CGRectMake(lable.right + 146, lable.origin.y - 120, 80, 20)];
    [btn4 setTitle:@"" forState:UIControlStateNormal];
    [_backImage addSubview:btn4];
    
    [btn4 addTarget:self action:@selector(pushYanshiDemoC) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)pushYanshiDemo
{
    ShengjidianpuViewController *vc = [[ShengjidianpuViewController alloc]init];
    
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)pushYanshiDemo1
{
    GunayudianpuViewController *vc = [[GunayudianpuViewController alloc]init];
    
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (void)fanyingbili
{
    FanyingbiliViewController *vc = [[FanyingbiliViewController alloc]init];
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)pushYanshiDemoC
{
    CloudTabbarController *VC = [[CloudTabbarController alloc]init];
    [self.navigationController presentViewController:VC animated:YES completion:nil];
    
}


@end