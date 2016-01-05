    //
//  ViewController2.m
//  NoMoneyTravel
//
//  Created by Mr.Yan on 15/11/3.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "ViewController2.h"
#import "CloudTabbarController.h"
@interface ViewController2 ()

@end

@implementation ViewController2


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setImage:HTImage(@"ForthImage") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        
        
        }];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 338, APPScreenWidth, 44)];
    [self.tableView addSubview:btn];
    [btn addTarget:self action:@selector(jindouSDK) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)jindouSDK
{
    __weakSelf;

    CloudTabbarController *VC = [[CloudTabbarController alloc]init];
    [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:HTImage(@"FourthHead") forBarMetrics:UIBarMetricsDefault];
}

@end
