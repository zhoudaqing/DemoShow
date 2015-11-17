//
//  ViewController1.m
//  NoMoneyTravel
//
//  Created by Mr.Yan on 15/11/3.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "ViewController1.h"
#import "CloudTabbarController.h"
#import "UIBarButtonExtern.h"

@interface ViewController1 ()

@end

@implementation ViewController1


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"琴行介绍";
    [self setImage:HTImage(@"qinhangjieshao-mendian") WithTouchBlock:^(NSIndexPath *indexPath) {
            
    }];
    self.tableView.frame = CGRectMake(0, -20, APPScreenWidth, APPScreenHeight+40);
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 25, 129, 44)];
    leftBtn.backgroundColor = [UIColor redColor];
    [self.tableView addSubview:leftBtn];
    
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(leftBtn.right +25, 25, 129, 44)];
    rightBtn.backgroundColor = [UIColor redColor];
    [self.tableView addSubview:rightBtn];
}







- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    self.navigationController.navigationController.navigationBarHidden = NO;
}
@end
