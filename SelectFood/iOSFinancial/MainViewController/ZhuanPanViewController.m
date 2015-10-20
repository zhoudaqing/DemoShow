//
//  ZhuanPanViewController.m
//  SelectFood
//
//  Created by Mr.Yan on 15/10/20.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "ZhuanPanViewController.h"
#import "KaihuYanzhengViewController.h"

@interface ZhuanPanViewController ()<UIAlertViewDelegate>
@property (nonatomic)UITapGestureRecognizer *tap;
@property (nonatomic , copy) NSString *notice;
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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tongzhi) name:@"huodongtongzhi" object:nil];
    self.notice = @"先去完成实名认证";

}
- (void)tongzhi
{
    self.notice = @"恭喜您获得50元优惠券~！";
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
    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"" message:self.notice delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    alter.delegate = self;
    [alter show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    KaihuYanzhengViewController *shouye1 = [[KaihuYanzhengViewController alloc]init];
    shouye1.hidesBottomBarWhenPushed  = YES;
    if ([self.notice isEqualToString:@"先去完成实名认证"]) {
        [self.navigationController pushViewController:shouye1 animated:YES];

    }else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }

}

@end
