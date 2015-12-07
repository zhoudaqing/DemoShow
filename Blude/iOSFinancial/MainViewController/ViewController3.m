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
    __weakSelf;
    [self setImage:HTImage(@"yishupin") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        CloudTabbarController *VC = [[CloudTabbarController alloc]init];
        [VC showPromptView];
        [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
        
        
    }];

    self.tableView.frame = CGRectMake(0, -20, APPScreenWidth, APPScreenHeight);
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

@end
