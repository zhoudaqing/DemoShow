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
    self.title = @"社团";
    [self setImage:HTImage(@"zhibo") WithTouchBlock:^(NSIndexPath *indexPath) {
            
    }];
    self.tableView.frame = CGRectMake(0, -20, APPScreenWidth, APPScreenHeight+40);
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
@end
