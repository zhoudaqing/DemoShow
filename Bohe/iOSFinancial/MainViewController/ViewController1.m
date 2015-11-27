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
    self.title = @"工具";
    __weakSelf;
    [self setImage:HTImage(@"lvxingfuwu") WithTouchBlock:^(NSIndexPath *indexPath) {
        
                CloudTabbarController *VC = [[CloudTabbarController alloc]init];
                [VC showPromptView];
                [weakSelf.navigationController presentViewController:VC animated:YES completion:nil];
        
        
        }];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
@end
