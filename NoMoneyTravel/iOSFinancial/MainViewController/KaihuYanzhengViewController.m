//
//  KaihuYanzhengViewController.m
//  SelectFood
//
//  Created by Mr.Yan on 15/10/20.
//  Copyright © 2015年 Mr.Yang. All rights reserved.
//

#import "KaihuYanzhengViewController.h"

@interface KaihuYanzhengViewController ()
@property (nonatomic)UITapGestureRecognizer *tap;
@end

@implementation KaihuYanzhengViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: [UIColor orangeColor],
                                                                    UITextAttributeFont : [UIFont boldSystemFontOfSize:18]};
    self.title = @"开户验证";
    
    [self.navigationController.navigationBar setTintColor:[UIColor redColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor orangeColor],NSFontAttributeName : [UIFont systemFontOfSize:18]}];
    
    UIImageView *backImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, APPScreenWidth, APPScreenHeight)];
    [backImage setImage:HTImage(@"tiyanshiming")];
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
    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"注册成功" message:@"恭喜获得免邮券提交订单马上使用" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    alter.delegate = self;
    [alter show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //创建通知
    NSNotification *notification =[NSNotification notificationWithName:@"huodongtongzhi" object:nil userInfo:nil];
    //通过通知中心发送通知
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
