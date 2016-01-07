//
//  ViewController3.m
//  Dakapaimai
//
//  Created by Mr.Yan on 15/11/12.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "ViewController3.h"
#import "CloudTabbarController.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"艺术品";
    [self setImage:HTImage(@"yishupin") WithTouchBlock:^(NSIndexPath *indexPath) {
        
    }];

    self.tableView.frame = CGRectMake(0, -20, APPScreenWidth, APPScreenHeight+40);
    }

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

@end
