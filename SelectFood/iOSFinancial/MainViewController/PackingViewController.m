//
//  PackingViewController.m
//  SelectFood
//
//  Created by Mr.Yan on 15/10/20.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "PackingViewController.h"

@interface PackingViewController ()

@end

@implementation PackingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setImage:HTImage(@"background") WithTouchBlock:^(NSIndexPath *indexPath) {
        
    }];
}

@end
