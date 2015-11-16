//
//  ViewController.m
//  NoMoneyTravel
//
//  Created by Mr.Yang on 15/11/3.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "ViewController.h"
#import "CustomInvestGuideViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"蛋糕";
    [self setImage:HTImage(@"dangao") WithTouchBlock:^(NSIndexPath *indexPath) {
        
          }];
    
    
}


@end
