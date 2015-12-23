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
    __weakSelf;
    
    [self setImage:HTImage(@"mine") WithTouchBlock:^(NSIndexPath *indexPath) {
//        CloudTabbarController *VC = [[CloudTabbarController alloc]init];
//        [VC showPromptView];
//        [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
        
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.tableView.frame = CGRectMake(0, -20, APPScreenWidth, self.view.height+20);
}
@end
