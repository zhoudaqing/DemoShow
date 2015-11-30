//
//  RandianWeixin.m
//  Randian
//
//  Created by Mr.Yan on 15/11/29.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "RandianWeixin.h"

@interface RandianWeixin ()

@end

@implementation RandianWeixin

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:HTImage(@"Randian")];
    [self.view addSubview:imageView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
}

@end
