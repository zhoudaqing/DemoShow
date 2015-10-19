//
//  FanyingbiliViewController.m
//  FreshLife
//
//  Created by Mr.Yan on 15/10/16.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "FanyingbiliViewController.h"
#import "ShengjidianpuViewController.h"

@interface FanyingbiliViewController ()

@end

@implementation FanyingbiliViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, -64, self.view.width, [UIScreen mainScreen].bounds.size.height)];
    [image setImage:[UIImage imageNamed:@"yongjinfanbi"]];
    [self.view addSubview:image];
    
    self.title = @"关于反佣比例";
    
    [self.navigationController.navigationBar setBarTintColor:HTWhiteColor];
    [self.navigationController.navigationBar setTintColor:[UIColor jt_barTintColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor],NSFontAttributeName : [UIFont systemFontOfSize:18]}];
    
    
    image.userInteractionEnabled = YES;
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(35,image.height - 105 , image.width - 70 , 30)];
    btn.backgroundColor = [UIColor redColor];
    [btn.layer setMasksToBounds:YES];
    [btn.layer setCornerRadius:5.0];
    
    [btn setTitle:@"免费升级店铺" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13.0];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [image addSubview:btn];
    [btn addTarget:self action:@selector(pushYanshiDemo) forControlEvents:UIControlEventTouchUpInside];


}

- (void)pushYanshiDemo
{
    ShengjidianpuViewController *vc = [[ShengjidianpuViewController alloc]init];
    
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
