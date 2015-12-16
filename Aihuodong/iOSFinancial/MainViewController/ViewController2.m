    //
//  ViewController2.m
//  NoMoneyTravel
//
//  Created by Mr.Yan on 15/11/3.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController1.h"
#import "UIBarButtonExtern.h"

@interface ViewController2 ()


@end

@implementation ViewController2


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [UIBarButtonExtern buttonWithTitle:@"" target:self andSelector:@selector(psuhView1)];
    __weakSelf;
    [self setImage:HTImage(@"ForthImage") WithTouchBlock:^(NSIndexPath *indexPath) {
        ViewController1 *view1 = [[ViewController1 alloc]init];
        view1.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:view1 animated:YES];
        }];
    
   

    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:HTImage(@"FourthHead") forBarMetrics:UIBarMetricsDefault];

}

- (void)psuhView1
{
    ViewController1 *view1 = [[ViewController1 alloc]init];
    view1.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:view1 animated:YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}


@end
