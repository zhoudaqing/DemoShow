//
//  GoodDetailViewController.m
//  FreshLife
//
//  Created by Mr.Yang on 15/10/15.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "GoodDetailViewController.h"
#import "UIView+BorderColor.h"


@interface GoodDetailViewController ()

@property (nonatomic, strong) UIImageView *bottomView;

@end

@implementation GoodDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    __weakSelf;
    [self setImage:HTImage(@"goodDetail") WithTouchBlock:^(NSIndexPath *indexPath) {
        
        
    }];
    
    [self.view addSubview:self.bottomView];
    self.bottomView.bottom = self.view.bottom;
    
    UIButton *cartButton = [self button];
    cartButton.tag = 1000;
    [cartButton borderRandamColor];
    cartButton.frame = CGRectMake(0, 0, 58, 44);
    
    UIButton *addCard = [self button];
    addCard.tag = 1001;
    [addCard borderRandamColor];
    addCard.frame = CGRectMake(APPScreenWidth - 140, 0, 140, 44);
    
    [self.bottomView addSubview:cartButton];
    [self.bottomView addSubview:addCard];
    
}

- (void)buttonClicked:(UIButton *)button
{
    if (button.tag == 1000) {
        //  购物车
        self.tabBarController.selectedIndex = 1;
    }else {
        
    }
}

- (UIButton *)button
{
    UIButton *cartButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cartButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return cartButton;
}

- (void)viewWillLayoutSubviews
{
    self.bottomView.bottom = self.view.bottom;
}

- (UIImageView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APPScreenWidth, 44)];
        _bottomView.image = HTImage(@"bottomBar");
        _bottomView.userInteractionEnabled = YES;
    }

    return _bottomView;
}

- (NSString *)title
{
    return @"商品列表";
}

@end
