//
//  FindViewController.m
//  XianLife
//
//  Created by Mr.Yan on 15/10/13.
//  Copyright © 2015年 Mr.Yan. All rights reserved.
//

#import "FindViewController.h"
#import "CloudTabbarController.h"


@interface FindViewController ()

@end

@implementation FindViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self setNeedsStatusBarAppearanceUpdate];

    [self.navigationController.navigationBar setBarTintColor:HTWhiteColor];
    [self.navigationController.navigationBar setTintColor:[UIColor jt_barTintColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor],NSFontAttributeName : [UIFont systemFontOfSize:18]}];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"寻鲜";
    
    //  购物车页面
    [self setImage:HTImage(@"freshImage") WithTouchBlock:^(NSIndexPath *indexPath) {
        
    }];
    
}


@end
