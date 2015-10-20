//
//  ZhuanPanViewController.m
//  SelectFood
//
//  Created by Mr.Yan on 15/10/20.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "ZhuanPanViewController.h"

@interface ZhuanPanViewController ()<UIAlertViewDelegate>
@property (nonatomic)UITapGestureRecognizer *tap;
@end

@implementation ZhuanPanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"活动转盘";
    
    UIImageView *backImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, APPScreenWidth, APPScreenHeight)];
    [backImage setImage:HTImage(@"dazhuanpan")];
    [self.view addSubview:backImage];
    backImage.userInteractionEnabled = YES;
    [backImage addGestureRecognizer:self.tap];
    
}

- (UITapGestureRecognizer *)tap
{
    if (!_tap) {
        _tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showgoodsList)];
    }
    return _tap;
}

-(void)showgoodsList
{
    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"" message:@"请完善信息" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    alter.delegate = self;
    [alter show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
}

@end
