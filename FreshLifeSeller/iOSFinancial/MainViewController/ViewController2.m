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
    
    self.navigationController.navigationBar.hidden = YES;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    [imageView setImage:HTImage(@"mine")];
    
    [self.view addSubview:imageView];
    
}
@end
