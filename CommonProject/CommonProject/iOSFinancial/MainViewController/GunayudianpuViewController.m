//
//  GunayudianpuViewController.m
//  FreshLife
//
//  Created by Mr.Yan on 15/10/16.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "GunayudianpuViewController.h"

@interface GunayudianpuViewController ()

@end

@implementation GunayudianpuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, -64, self.view.width, [UIScreen mainScreen].bounds.size.height)];
    [image setImage:[UIImage imageNamed:@"guanyuhuojia"]];
    [self.view addSubview:image];
    
    self.title = @"关于升级店铺";
    
    [self.navigationController.navigationBar setBarTintColor:HTWhiteColor];
    [self.navigationController.navigationBar setTintColor:[UIColor jt_barTintColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor],NSFontAttributeName : [UIFont systemFontOfSize:18]}];
    
    
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
