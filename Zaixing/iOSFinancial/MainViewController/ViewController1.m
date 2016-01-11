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
#import "ViewController3.h"

@interface ViewController1 ()

@end

@implementation ViewController1


- (void)viewDidLoad {
    [super viewDidLoad];
    __weakSelf;
    [self setImage:HTImage(@"ThirdImage") WithTouchBlock:^(NSIndexPath *indexPath) {
        BaseDetailViewController *detailN = [[BaseDetailViewController alloc] init];
        detailN.isHidnBar = YES;
        detailN.btnFrame = CGRectMake(0, 60, APPScreenWidth*.5, 180);
        [detailN setImage:HTImage(@"woyaozu") WithTouchBlock:^(NSIndexPath *indexPath) {
            
            ViewController3 *detailN = [[ViewController3 alloc] init];
            int btnY;
            if (is55Inch) {
                btnY = APPScreenHeight-100;
            }else
            {
                btnY = APPScreenHeight - 30;
            }
            detailN.btnFrame = CGRectMake(0, btnY, APPScreenWidth*.5, 60);
            detailN.isHidnBar = YES;
            [weakSelf.navigationController pushViewController:detailN animated:YES];
            
        }];
        detailN.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detailN animated:YES];

    }];
    
    self.tableView.frame = CGRectMake(0, -20, APPScreenWidth, APPScreenHeight+40);
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    
}
@end
