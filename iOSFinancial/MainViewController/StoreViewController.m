//
//  StoreViewController.m
//  XianLife
//
//  Created by Mr.Yan on 15/10/13.
//  Copyright © 2015年 Mr.Yan. All rights reserved.
//

#import "StoreViewController.h"
#import "HTSeparateView.h"
#import "LocalStoreViewController.h"
#import "GlobleViewController.h"
#import "NewProductViewController.h"


@interface StoreViewController ()

@end

@implementation StoreViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:HTImage(@"statusBar") forBarMetrics:UIBarMetricsDefault];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.separateView.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setBackgroundImage:HTImage(@"statusBar") forBarMetrics:UIBarMetricsDefault];
    

    
}

- (NSArray *)functionTitles
{
    if (!_functionTitles) {
        _functionTitles = @[@"商城", @"全球甄选", @"新品上市"];
    }
    
    return _functionTitles;
}

- (NSArray *)selectionControllers
{
    NSMutableArray *array = [@[]mutableCopy];
    
    if (!_selectionControllers) {
        LocalStoreViewController *investController = [[LocalStoreViewController alloc] init];
        [array addObject:investController];
        
        LocalStoreViewController *toInvest = [[LocalStoreViewController alloc] init];
        [array addObject:toInvest];
        
        LocalStoreViewController *finish = [[LocalStoreViewController alloc] init];
        [array addObject:finish];
        
        _selectionControllers = array;
    }
    
    return _selectionControllers;
}


@end
