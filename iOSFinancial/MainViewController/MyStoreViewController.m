//
//  MineViewController.m
//  XianLife
//
//  Created by Mr.Yan on 15/10/13.
//  Copyright © 2015年 Mr.Yan. All rights reserved.
//

#import "MyStoreViewController.h"


@interface MyStoreViewController ()<UINavigationControllerDelegate>
{
    UIImageView *_backImage;
}

@end

@implementation MyStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
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
    lable.text = @"当前货架数量：50个";
    lable.font = [UIFont systemFontOfSize:13.0];
    [_backImage addSubview:lable];
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(238, 251, 120, 20)];
    btn.backgroundColor = [UIColor redColor];
    [btn.layer setMasksToBounds:YES];
    [btn.layer setCornerRadius:5.0];
    
    [btn setTitle:@"免费升级店铺" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13.0];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_backImage addSubview:btn];
    
    [btn addTarget:self action:@selector(pushYanshiDemo) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(0, 291, [UIScreen mainScreen].bounds.size.width, 44)];
    btn2.backgroundColor = [UIColor clearColor];
    [_backImage addSubview:btn2];
    [btn2 addTarget:self action:@selector(pushYanshiDemo) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)pushYanshiDemo
{
    
    NSLog(@"~~~~~~~");
    
}

@end
